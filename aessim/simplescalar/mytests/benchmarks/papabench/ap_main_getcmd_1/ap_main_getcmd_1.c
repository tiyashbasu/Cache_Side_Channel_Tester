//-----------------------
// Module: stabilisation
//-----------------------


/** include/inttypes.h */
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long uint32_t;
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int32_t;

/** include/std.h */
typedef uint8_t bool_t; // Boolean values
#define FALSE 0
#define TRUE (!FALSE)


/** fly_by_wire/link_autopilot.h */
typedef int16_t pprz_t; // type of commands
#define CLOCK	 16
#define MAX_PPRZ (600 * CLOCK)
#define MIN_PPRZ -MAX_PPRZ

/** autopilot/autopilot.h */
#define IR_ESTIM_MODE_OFF        0
#define IR_ESTIM_MODE_ON         1
#define TRIM_PPRZ(pprz) (pprz <  MIN_PPRZ ? MIN_PPRZ : (pprz >  MAX_PPRZ ? MAX_PPRZ : pprz))

/** autopilot/adc.h */
#define AV_NB_SAMPLE 0x20

/** var/include/airframe.h */
#define IR_ROLL_NEUTRAL_DEFAULT -915
#define IR_PITCH_NEUTRAL_DEFAULT 110
#define IR_DEFAULT_CONTRAST 200
#define IR_RAD_OF_IR_CONTRAST 0.75
#define IR_RollOfIrs(x1,x2) (-1*(x1)+ -1*(x2))
#define IR_PitchOfIrs(x1,x2) (-1*(x1)+ 1*(x2))
#define ROLL_PGAIN 10000.
#define PITCH_OF_ROLL 0.0
#define PITCH_PGAIN 15000.

/** autopilot/estimator.c */
#define EstimatorIrGainIsCorrect() (TRUE)

/** var/include/radio.h */
#define RADIO_CTL_NB 9
#define RADIO_CTL_D 0
#define RADIO_THROTTLE RADIO_CTL_D
#define RADIO_CTL_C 1
#define RADIO_ROLL RADIO_CTL_C
#define RADIO_CTL_B 2
#define RADIO_PITCH RADIO_CTL_B
#define RADIO_CTL_A 3
#define RADIO_YAW RADIO_CTL_A
#define RADIO_CTL_G 4
#define RADIO_MODE RADIO_CTL_G
#define RADIO_CTL_E 5
#define RADIO_GAIN1 RADIO_CTL_E
#define RADIO_CTL_F 6
#define RADIO_GAIN2 RADIO_CTL_F
#define RADIO_CTL_H 7
#define RADIO_LLS RADIO_CTL_H
#define RADIO_CTL_I 8
#define RADIO_CALIB RADIO_CTL_I


/* fly_by_wire/link_autopilot.h */
struct inter_mcu_msg {
  int16_t channels[RADIO_CTL_NB];  
  uint8_t ppm_cpt;
  uint8_t status;
  uint8_t nb_err;
  uint8_t vsupply; /* 1e-1 V */
};

/** autopilot/adc.h */
struct adc_buf {
  uint16_t sum;
  uint16_t values[AV_NB_SAMPLE];
  uint8_t  head;
};


// VARIABLES CONTROLLED IN THIS MODULE

/** autopilot/estimator.c */
float estimator_phi;
float estimator_theta;


// VARIABLES WITH SHARED CONTROL

/** autopilot/link_fbw.c */
struct inter_mcu_msg to_fbw;

/** autopilot/pid.c */
int16_t desired_gaz, desired_aileron, desired_elevator;
float pitch_of_roll = PITCH_OF_ROLL;

/** autopilot/infrared.c */
int16_t ir_roll;
int16_t ir_pitch;


// LOCAL COPIES OF VARIABLES ACCESSED BY THIS MODULE

/** autopilot/pid.c */
float desired_roll = 0.;
float desired_pitch = 0.;
float roll_pgain = ROLL_PGAIN;
float pitch_pgain = PITCH_PGAIN;

/** autopilot/infrared.c */
int16_t ir_roll_neutral  = IR_ROLL_NEUTRAL_DEFAULT;
int16_t ir_pitch_neutral = IR_PITCH_NEUTRAL_DEFAULT;
float ir_rad_of_ir = IR_RAD_OF_IR_CONTRAST / IR_DEFAULT_CONTRAST;
static struct adc_buf buf_ir1;
static struct adc_buf buf_ir2;

/** autopilot/main.c */
uint8_t ir_estim_mode = IR_ESTIM_MODE_ON;

/** autopilot/estimator.c */
float estimator_rad_of_ir;

/** autopilot/gps_ubx.c */
volatile int16_t simul_ir_roll;
volatile int16_t simul_ir_pitch;


/** autopilot/infrared.c */
void ir_update(void)
{
#ifndef SIMUL
  int16_t x1_mean = buf_ir1.sum/AV_NB_SAMPLE;
  int16_t x2_mean = buf_ir2.sum/AV_NB_SAMPLE;
  ir_roll = IR_RollOfIrs(x1_mean, x2_mean) - ir_roll_neutral;
  ir_pitch = IR_PitchOfIrs(x1_mean, x2_mean) - ir_pitch_neutral;
#else
  extern volatile int16_t simul_ir_roll, simul_ir_pitch;
  ir_roll = simul_ir_roll -  ir_roll_neutral; 
  ir_pitch = simul_ir_pitch - ir_pitch_neutral;  
#endif
}


/** autopilot/estimator.c */
void estimator_update_state_infrared( void )
{
  float rad_of_ir = (ir_estim_mode == IR_ESTIM_MODE_ON && EstimatorIrGainIsCorrect()) ? 
    estimator_rad_of_ir : ir_rad_of_ir;
  estimator_phi  = rad_of_ir * ir_roll;

  estimator_theta = rad_of_ir * ir_pitch;
}


/** autopilot/pid.c */
/** \brief Computes ::desired_aileron and ::desired_elevator from attitude estimation and expected attitude. */
void roll_pitch_pid_run( void )
{
  float err =  estimator_phi - desired_roll;
  desired_aileron = TRIM_PPRZ(roll_pgain * err);
  if (pitch_of_roll <0.)
    pitch_of_roll = 0.;
  err = -(estimator_theta - desired_pitch - pitch_of_roll * fabs(estimator_phi));
  desired_elevator = TRIM_PPRZ(pitch_pgain * err);
}


//#include "mpi.h"


/** autopilot/main.c */
// void stabilisation_task(void)
int main()
{
  //MPI_Comm intercomm1, intercomm2;
  char str[256];
	int i;

  //if( MPI_Irecv(str, 1, MPI_CHAR, 1, 0, intercomm1, NULL) == MPI_SUCCESS
  //&& str[0] == 'A' )
	for(i = 0; i < 10; i++)
  {

    ir_update();
    estimator_update_state_infrared();
    roll_pitch_pid_run(); // Set  desired_aileron & desired_elevator
    to_fbw.channels[RADIO_THROTTLE] = desired_gaz; // desired_gaz is set upon GPS message reception
    to_fbw.channels[RADIO_ROLL] = desired_aileron;
#ifndef ANTON_T7
    to_fbw.channels[RADIO_PITCH] = desired_elevator;
#endif
    
    // Code for camera stabilization, FIXME put that elsewhere
    to_fbw.channels[RADIO_GAIN1] = TRIM_PPRZ(MAX_PPRZ/0.75*(-estimator_phi));


    // to autopilot spi
    str[0] = 'S';
    str[1] = '\0';
    //MPI_Isend(str, 1, MPI_CHAR, 1, 0, intercomm2, NULL);

  }
}

