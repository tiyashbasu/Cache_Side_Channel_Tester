//-----------------------
// Module: radio_control 
//-----------------------


/** include/inttypes.h */
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long uint32_t;
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int32_t;

/** sw/include/std.h */
typedef uint8_t bool_t; // Boolean values
#define FALSE 0
#define TRUE (!FALSE)


/** avr/include/avr/sfr_defs.h */
#define _SFR_MEM_ADDR(sfr) (sfr)
#define _SFR_ADDR(sfr) _SFR_MEM_ADDR(sfr)
#define _BV(bit) (1 << (bit))
#define _MMIO_BYTE(mem_addr) (*(volatile uint8_t *)(mem_addr))
#define _SFR_BYTE(sfr) _MMIO_BYTE(_SFR_ADDR(sfr))

/** \def bit_is_set
    \ingroup avr_sfr
    \code #include <avr/io.h>\endcode
    Test whether bit \c bit in IO register \c sfr is set. 
    This will return a 0 if the bit is clear, and non-zero
    if the bit is set. */
#define bit_is_set(sfr, bit) (_SFR_BYTE(sfr) & _BV(bit))


/** autopilot/main.c */
#define NO_CALIB               0	/**< \enum No calibration state */
#define WAITING_CALIB_CONTRAST 1	/**< \enum Waiting calibration contrast state */
#define CALIB_DONE             2	/**< \enum Calibration done state */
#define MAX_DELAY_FOR_CALIBRATION 10

/** fly_by_wire/link_autopilot.h */
typedef int16_t pprz_t; // type of commands
#define CLOCK	 16
#define MAX_PPRZ (600 * CLOCK)
#define MIN_PPRZ -MAX_PPRZ
#define STATUS_RADIO_OK 0
#define RADIO_REALLY_LOST 1
#define AVERAGED_CHANNELS_SENT 2
#define MASK_FBW_CHANGED 0x3
#define TRESHOLD_MANUAL_PPRZ (MIN_PPRZ / 2)

/** autopilot/autopilot.h */
#define TRESHOLD1 TRESHOLD_MANUAL_PPRZ
#define TRESHOLD2 200 * CLOCK
#define PPRZ_MODE_MANUAL   0
#define PPRZ_MODE_AUTO1    1
#define PPRZ_MODE_AUTO2    2
#define PPRZ_MODE_HOME     3
#define PPRZ_MODE_NB       4
#define VERTICAL_MODE_MANUAL      0
#define VERTICAL_MODE_AUTO_GAZ    1
#define VERTICAL_MODE_AUTO_CLIMB  2
#define VERTICAL_MODE_AUTO_ALT    3
#define VERTICAL_MODE_NB          4


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

/** var/include/airframe.h */
#define IR_ROLL_NEUTRAL_DEFAULT -915
#define IR_PITCH_NEUTRAL_DEFAULT 110
#define IR_DEFAULT_CONTRAST 200
#define IR_RAD_OF_IR_CONTRAST 0.75
#define IR_RAD_OF_IR_MAX_VAL 0.0045
#define IR_RAD_OF_IR_MIN_VAL 0.00075
#define ROLL_PGAIN 10000.
#define PITCH_OF_ROLL 0.0
#define PITCH_PGAIN 15000.
#define MAX_ROLL 0.35
#define MAX_PITCH 0.35
#define MIN_PITCH -0.35
#define COURSE_PGAIN -0.2


/** autopilot/autopilot.h */
#define IR_ESTIM_MODE_OFF        0
#define IR_ESTIM_MODE_ON         1

/** autopilot/if_calib.h */
#define IF_CALIB_MODE_NONE      0
#define IF_CALIB_MODE_DOWN      1
#define IF_CALIB_MODE_UP        2


/* fly_by_wire/link_autopilot.h */
struct inter_mcu_msg {
  int16_t channels[RADIO_CTL_NB];  
  uint8_t ppm_cpt;
  uint8_t status;
  uint8_t nb_err;
  uint8_t vsupply; /* 1e-1 V */
};


// VARIABLES CONTROLLED IN THIS MODULE

/** autopilot/pid.c */
float desired_roll = 0.;
float desired_pitch = 0.;
int16_t desired_gaz;
float roll_pgain = ROLL_PGAIN;
float pitch_pgain = PITCH_PGAIN;

/** autopilot/estimator.c */
float estimator_rad_of_ir;


// VARIABLES WITH SHARED CONTROL

/** autopilot/link_fbw.c */
struct inter_mcu_msg to_fbw;

/** autopilot/main.c */
uint8_t pprz_mode = PPRZ_MODE_MANUAL;
uint8_t vsupply;
static uint8_t  mcu1_ppm_cpt;
float slider_1_val, slider_2_val;
bool_t launch = FALSE;

/** autopilot/if_calib.c */
static int16_t slider1_init, slider2_init;

/** autopilot/infrared.c */
int16_t ir_contrast     = IR_DEFAULT_CONTRAST;
int16_t ir_roll_neutral  = IR_ROLL_NEUTRAL_DEFAULT;
int16_t ir_pitch_neutral = IR_PITCH_NEUTRAL_DEFAULT;
float ir_rad_of_ir = IR_RAD_OF_IR_CONTRAST / IR_DEFAULT_CONTRAST;

/** autopilot/pid.c */
float course_pgain = COURSE_PGAIN;
float max_roll = MAX_ROLL;

/** autopilot/modem.c */
uint8_t           modem_nb_ovrn;
uint8_t           tx_head;
volatile uint8_t  tx_tail;


// LOCAL COPIES OF VARIABLES ACCESSED BY THIS MODULE

/** autopilot/link_fbw.c */
struct inter_mcu_msg from_fbw;
volatile uint8_t link_fbw_receive_valid = FALSE;

/** autopilot/main.c */
uint8_t vertical_mode = VERTICAL_MODE_MANUAL;
uint8_t ir_estim_mode = IR_ESTIM_MODE_ON;
bool_t rc_event_1, rc_event_2;
static uint8_t  mcu1_status;
static uint16_t cputime = 0;

/** autopilot/nav.c */
bool_t too_far_from_home;

/** autopilot/if_calib.c */
uint8_t inflight_calib_mode = IF_CALIB_MODE_NONE;

/** autopilot/estimator.c */
float estimator_ir, estimator_rad;
uint16_t estimator_flight_time; 

/** autopilot/infrared.c */
int16_t ir_pitch;

/** autopilot/modem.c */
uint8_t           tx_head;
volatile uint8_t  tx_tail;



/** autopilot/autopilot.h */
#define STICK_PUSHED(pprz) (pprz < TRESHOLD1 || pprz > TRESHOLD2)
#define PPRZ_MODE_OF_PULSE(pprz, mega8_status) (pprz > TRESHOLD2 ? PPRZ_MODE_AUTO2 : (pprz > TRESHOLD1 ? PPRZ_MODE_AUTO1 : PPRZ_MODE_MANUAL))
#define IR_ESTIM_MODE_OF_PULSE(pprz) (pprz < TRESHOLD2 ? IR_ESTIM_MODE_OFF: IR_ESTIM_MODE_ON)
#define FLOAT_OF_PPRZ(pprz, center, travel) ((float)pprz / (float)MAX_PPRZ * travel + center)
#define GAZ_THRESHOLD_TAKEOFF (pprz_t)(MAX_PPRZ * 0.9)
#define CheckEvent(_event) (_event ? _event = FALSE, TRUE : FALSE)
#define ModeUpdate(_mode, _value) { uint8_t new_mode = _value; if (_mode != new_mode) { _mode = new_mode; return TRUE; } return FALSE; }

/** autopilot/infrared.c */
#define RadOfIrFromConstrast(c) ir_rad_of_ir = IR_RAD_OF_IR_CONTRAST / c;

/** autopilot/if_calib.h */
#ifdef ANTON_T7
#define IF_CALIB_MODE_OF_PULSE(pprz) (pprz < TRESHOLD1 ? IF_CALIB_MODE_UP : IF_CALIB_MODE_NONE)
#else
#define IF_CALIB_MODE_OF_PULSE(pprz) (pprz < TRESHOLD1 ? IF_CALIB_MODE_UP : (pprz < TRESHOLD2 ? IF_CALIB_MODE_NONE : IF_CALIB_MODE_DOWN))
#endif /* ANTON_T7 */

/** var/include/if_calib.c */
#define ParamValInt16(param_init_val, param_travel, cur_pulse, init_pulse) (param_init_val + (int16_t)(((float)(cur_pulse - init_pulse)) * param_travel / (float)MAX_PPRZ))
#define ParamValFloat(param_init_val, param_travel, cur_pulse, init_pulse) (param_init_val + ((float)(cur_pulse - init_pulse)) * param_travel / (float)MAX_PPRZ)



/** autopilot/main.c */
/** \fn  uint8_t pprz_mode_update( void )
 *  \brief Update paparazzi mode
 */
uint8_t pprz_mode_update( void )
{
  /** We remain in home mode until explicit reset from the RC */
  if (pprz_mode != PPRZ_MODE_HOME || CheckEvent(rc_event_1))
  {
    ModeUpdate(pprz_mode, PPRZ_MODE_OF_PULSE(from_fbw.channels[RADIO_MODE], from_fbw.status));
  }
  else
    return FALSE;
}


/** autopilot/main.c */
#ifdef RADIO_LLS
/** \fn  uint8_t ir_estim_mode_update( void )
 *  \brief update ir estimation if RADIO_LLS is true \n
 */
uint8_t ir_estim_mode_update( void )
{
  ModeUpdate(ir_estim_mode, IR_ESTIM_MODE_OF_PULSE(from_fbw.channels[RADIO_LLS]));
}
#endif


/** autopilot/main.c */
uint8_t mcu1_status_update( void )
{
  uint8_t new_mode = from_fbw.status;
  if (mcu1_status != new_mode)
  {
    bool_t changed = ((mcu1_status&MASK_FBW_CHANGED) != (new_mode&MASK_FBW_CHANGED));
    mcu1_status = new_mode;
    return changed;
  }
  return FALSE;
}


/** autopilot/main.c */
uint8_t inflight_calib_mode_update( void )
{
  ModeUpdate(inflight_calib_mode, IF_CALIB_MODE_OF_PULSE(from_fbw.channels[RADIO_CALIB]));
}


/** var/include/inflight_calib.h */
void inflight_calib(bool_t mode_changed)
{
  if (pprz_mode == PPRZ_MODE_AUTO1)
  {
    if (inflight_calib_mode == IF_CALIB_MODE_UP)
    {
      static int16_t ir_pitch_neutral_init;
      if (mode_changed)
      {
        ir_pitch_neutral_init = ir_pitch_neutral;
        slider1_init = from_fbw.channels[RADIO_GAIN1];
      }
      ir_pitch_neutral = ParamValInt16(ir_pitch_neutral_init, 60.000000, from_fbw.channels[RADIO_GAIN1], slider1_init);
      slider_1_val = (float)ir_pitch_neutral;
    }
    if (inflight_calib_mode == IF_CALIB_MODE_UP)
    {
      static int16_t ir_roll_neutral_init;
      if (mode_changed)
      {
        ir_roll_neutral_init = ir_roll_neutral;
        slider2_init = from_fbw.channels[RADIO_GAIN2];
      }
      ir_roll_neutral = ParamValInt16(ir_roll_neutral_init, -60.000000, from_fbw.channels[RADIO_GAIN2], slider2_init);
      slider_2_val = (float)ir_roll_neutral;
    }
  }
  if (pprz_mode == PPRZ_MODE_AUTO2)
  {
    if (inflight_calib_mode == IF_CALIB_MODE_UP)
    {
      static float course_pgain_init;
      if (mode_changed)
      {
        course_pgain_init = course_pgain;
        slider1_init = from_fbw.channels[RADIO_GAIN1];
      }
      course_pgain = ParamValFloat(course_pgain_init, 0.100000, from_fbw.channels[RADIO_GAIN1], slider1_init);
      slider_1_val = (float)course_pgain;
    }
    if (inflight_calib_mode == IF_CALIB_MODE_UP)
    {
      static float max_roll_init;
      if (mode_changed)
      {
        max_roll_init = max_roll;
        slider2_init = from_fbw.channels[RADIO_GAIN2];
      }
      max_roll = ParamValFloat(max_roll_init, -0.200000, from_fbw.channels[RADIO_GAIN2], slider2_init);
      slider_2_val = (float)max_roll;
    }
  }
}


/** autopilot/main.c */
/** \fn  void copy_from_to_fbw ( void )
 *  \brief Send back uncontrolled channels (only rudder)
 */
 void copy_from_to_fbw ( void )
{
  to_fbw.channels[RADIO_YAW] = from_fbw.channels[RADIO_YAW];
#ifdef ANTON_T7
  to_fbw.channels[RADIO_PITCH] = from_fbw.channels[RADIO_PITCH];
#endif
  to_fbw.status = 0;
}


//#include "mpi.h"


/** autopilot/main.c */
/** \fn  void radio_control_task( void )
 *  \brief @@@@@ A FIXER @@@@@
 */
// void radio_control_task( void )
int main()
{
  //MPI_Comm intercomm1, intercomm2;
  char str[256];
  int i;  
  //if( MPI_Irecv(str, 1, MPI_CHAR, 1, 0, intercomm1, NULL) == MPI_SUCCESS
  //&& str[0] == 'S' )
	//for(i = 0; i < 1000; i++)
	for(i = 0; i < 1000; i++)
  {

    bool_t calib_mode_changed;
    //if (link_fbw_receive_valid)
    //{
      uint8_t mode_changed = FALSE;
      copy_from_to_fbw();
      if ((bit_is_set(&(from_fbw.status), RADIO_REALLY_LOST)
	   && (pprz_mode == PPRZ_MODE_AUTO1 || pprz_mode == PPRZ_MODE_MANUAL)) || too_far_from_home)
      {
	pprz_mode = PPRZ_MODE_HOME;
	mode_changed = TRUE;
      }
      if (bit_is_set(&(from_fbw.status), AVERAGED_CHANNELS_SENT))
      {
	bool_t pprz_mode_changed = pprz_mode_update();
	mode_changed |= pprz_mode_changed;
	//#ifdef RADIO_LLS
	mode_changed |= ir_estim_mode_update();
	//#endif
	//#ifdef RADIO_CALIB
	calib_mode_changed = inflight_calib_mode_update();
	inflight_calib(calib_mode_changed || pprz_mode_changed);
	mode_changed |= calib_mode_changed;
	//#endif
      }
      mode_changed |= mcu1_status_update();
      if ( mode_changed )
      {
	// DOWNLINK_SEND_PPRZ_MODE(&pprz_mode, &vertical_mode, &inflight_calib_mode, &mcu1_status, &ir_estim_mode);
	str[0] = 'M';
	str[1] = '\0';

	// encoding ???
	str[2] = (char) pprz_mode;
	str[3] = (char) vertical_mode;
	str[4] = (char) inflight_calib_mode;
	str[5] = (char) mcu1_status;
	str[6] = (char) ir_estim_mode;

	//MPI_Isend(str, 1, MPI_CHAR, 1, 0, intercomm2, NULL);
      }

      //}
  } // end rcv
}


