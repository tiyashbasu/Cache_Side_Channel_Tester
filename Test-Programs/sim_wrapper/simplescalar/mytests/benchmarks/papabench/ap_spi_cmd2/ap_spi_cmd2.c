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


/** avr/include/avr/sfr_defs.h */
#define __SFR_OFFSET 0x20
#define _SFR_IO8(io_addr) ((io_addr) + __SFR_OFFSET)
#define _SFR_IO_ADDR(sfr) ((sfr) - __SFR_OFFSET)
#define _SFR_MEM_ADDR(sfr) (sfr)
#define _SFR_IO_REG_P(sfr) ((sfr) < 0x40 + __SFR_OFFSET)
#define _SFR_ADDR(sfr) _SFR_MEM_ADDR(sfr)
#define _BV(bit) (1 << (bit))
#define _MMIO_BYTE(mem_addr) (*(volatile uint8_t *)(mem_addr))
#define _SFR_BYTE(sfr) _MMIO_BYTE(_SFR_ADDR(sfr))
#define _VECTOR(N) __vector_ ## N

/** \def bit_is_set
    \ingroup avr_sfr
    \code #include <avr/io.h>\endcode
    Test whether bit \c bit in IO register \c sfr is set. 
    This will return a 0 if the bit is clear, and non-zero
    if the bit is set. */
#define bit_is_set(sfr, bit) (_SFR_BYTE(sfr) & _BV(bit))

/** sw/include/std.h */
#define sbi(sfr, bit) (_SFR_BYTE(sfr) |= _BV(bit))

/** autopilot/downlink.h */
#define STX  0x05
#define ETX  0x06

/** var/include/messages.h */
#define DL_ID 0
#define DL_BOOT 1
#define DL_CALIB_START 2
#define DL_CALIB_CONTRAST 3
#define DL_TAKEOFF 4
#define DL_RAD_OF_IR 5
#define DL_ATTITUDE 6
#define DL_ADC 7
#define DL_GPS 8
#define DL_NAVIGATION_REF 9
#define DL_NAVIGATION 10
#define DL_PPRZ_MODE 11
#define DL_BAT 12
#define DL_DEBUG 13
#define DL_CLIMB_PID 14
#define DL_DOWNLINK_STATUS 15
#define DL_MODEM_STATUS 16
#define DL_SETTINGS 17
#define DL_DESIRED 18
#define DL_WIND 19
#define DL_IMU 20
#define DL_RAW_IMU 21
#define DL_KALMAN 22
#define DL_MSG_NB 23

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

/** avr/include/avr/iom128.h */
#define EIFR      _SFR_IO8(0x38)
#define EIMSK     _SFR_IO8(0x39)
#define SIG_INTERRUPT0          _VECTOR(1)
#define SIG_INTERRUPT1          _VECTOR(2)
#define SIG_INTERRUPT2          _VECTOR(3)
#define SIG_INTERRUPT3          _VECTOR(4)
#define SIG_INTERRUPT4          _VECTOR(5)
#define SIG_INTERRUPT5          _VECTOR(6)
#define SIG_INTERRUPT6          _VECTOR(7)
#define SIG_INTERRUPT7          _VECTOR(8)
#define    INT7         7
#define    INT6         6
#define    INT5         5
#define    INT4         4
#define    INT3         3
#define    INT2         2
#define    INT1         1
#define    INT0         0
#define    INTF7        7
#define    INTF6        6
#define    INTF5        5
#define    INTF4        4
#define    INTF3        3
#define    INTF2        2
#define    INTF1        1
#define    INTF0        0

/** autopilot/modem.h */
#define TX_BUF_SIZE     255
#define MODEM_CLK_INT   INT0

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

/** autopilot/modem.c */
uint8_t tx_buf[ TX_BUF_SIZE ];
uint8_t tx_byte;
uint8_t tx_byte_idx;
uint8_t ck_a, ck_b;


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
/** Delay between @@@@@ A FIXER @@@@@ */
#define EVENT_DELAY 20
void EventUpdate( uint16_t _cpt, bool_t _cond, bool_t _event )
{
  if (_cond)
  {
    if (_cpt < EVENT_DELAY)
    {
      _cpt++;
      if (_cpt == EVENT_DELAY)
        _event = TRUE;
    }
  }
  else
  {
    _cpt = 0;
    _event = FALSE;
  }
}

#define EventPos(_cpt, _channel, _event) EventUpdate(_cpt, (inflight_calib_mode==IF_CALIB_MODE_NONE && from_fbw.channels[_channel]>(int)(0.75*MAX_PPRZ)), _event)
#define EventNeg(_cpt, _channel, _event) EventUpdate(_cpt, (inflight_calib_mode==IF_CALIB_MODE_NONE && from_fbw.channels[_channel]<(int)(-0.75*MAX_PPRZ)), _event)



/** autopilot/infrared.c */
/**
 * Contrast measurement
 */
void ir_gain_calib(void)   // Plane nose down
{
  /* plane nose down -> negativ value */
  ir_contrast = - ir_pitch;
  RadOfIrFromConstrast(ir_contrast);
}


//#include "mpi.h"


/** autopilot/main.c */
/** \fn  void ground_calibrate( void )
 *  \brief Calibrate contrast if paparazzi mode is
 * set to auto1 before MAX_DELAY_FOR_CALIBRATION secondes */
/**User must put verticaly the uav (nose bottom) and push
 * radio roll stick to get new calibration
 * If not, the default calibration is used.
 */
void ground_calibrate( void )
{
  //MPI_Comm intercomm;
  char str[256];

  static uint8_t calib_status = NO_CALIB;
  switch (calib_status)
  {
    case NO_CALIB:
      if (cputime < MAX_DELAY_FOR_CALIBRATION && pprz_mode == PPRZ_MODE_AUTO1 )
      {
	calib_status = WAITING_CALIB_CONTRAST;
	// DOWNLINK_SEND_CALIB_START();
	str[0] = 'M';
	str[1] = '\0';
	str[2] = 'S';
	str[3] = '\0';
	//MPI_Isend(str, 1, MPI_CHAR, 1, 0, intercomm, NULL);

      }
      break;
    case WAITING_CALIB_CONTRAST:
      if (STICK_PUSHED(from_fbw.channels[RADIO_ROLL]))
      {
	ir_gain_calib();
	estimator_rad_of_ir = ir_rad_of_ir;
	//DOWNLINK_SEND_RAD_OF_IR(&estimator_ir, &estimator_rad, &estimator_rad_of_ir, &ir_roll_neutral, &ir_pitch_neutral);
	calib_status = CALIB_DONE;
	//DOWNLINK_SEND_CALIB_CONTRAST(&ir_contrast);

	str[0] = 'M';
	str[1] = '\0';
	str[2] = 'C';
	str[3] = '\0';

	// encoding???
	str[4] = (char) estimator_ir;
	str[5] = (char) estimator_rad;
	str[6] = (char) estimator_rad_of_ir;
	str[7] = (char) ir_roll_neutral;
	str[8] = (char) ir_pitch_neutral;
	str[9] = (char) ir_contrast;

	//MPI_Isend(str, 1, MPI_CHAR, 1, 0, intercomm, NULL);
      }
      break;
    case CALIB_DONE:
      break;
  }
}


/** autopilot/main.c */
static void events_update( void )
{
  static uint16_t event1_cpt = 0;
  static uint16_t event2_cpt = 0;
  EventPos(event1_cpt, RADIO_GAIN1, rc_event_1);
  EventNeg(event2_cpt, RADIO_GAIN1, rc_event_2);
}


/** autopilot/main.c */
/** \fn  void radio_control_task( void )
 *  \brief @@@@@ A FIXER @@@@@
 */
// void radio_control_task( void )
int main()
{
  //if (link_fbw_receive_valid)
  //{
    if (pprz_mode == PPRZ_MODE_AUTO1)
    {
      desired_roll = FLOAT_OF_PPRZ(from_fbw.channels[RADIO_ROLL], 0., -0.6);
      desired_pitch = FLOAT_OF_PPRZ(from_fbw.channels[RADIO_PITCH], 0., 0.5);
    } // else asynchronously set by course_pid_run()
    if (pprz_mode == PPRZ_MODE_MANUAL || pprz_mode == PPRZ_MODE_AUTO1)
    {
      desired_gaz = from_fbw.channels[RADIO_THROTTLE];
#ifdef ANTON_MAGICAL_MISTERY_GAINS     
      roll_pgain = ROLL_PGAIN * (1 - 5. / 7. * from_fbw.channels[RADIO_THROTTLE] / MAX_PPRZ);
      pitch_pgain = PITCH_PGAIN * ( 1 - 1. / 3. * from_fbw.channels[RADIO_THROTTLE] / MAX_PPRZ);
#endif /* ANTON_MAGICAL_MISTERY_GAINS */
    }
    // else asynchronously set by climb_pid_run();

    mcu1_ppm_cpt = from_fbw.ppm_cpt;
    vsupply = from_fbw.vsupply;

    events_update();

    if (!estimator_flight_time)
    {
      ground_calibrate();
    }
  //}
}


