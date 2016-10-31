//---------------
// Module: rcvap
//---------------


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


/** vivy */
// C variables to simulate special function registers
uint8_t PINB;
uint8_t DDRB;
uint8_t SPCR;


/** fly_by_wire/link_autopilot.h */
typedef int16_t pprz_t; // type of commands

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

/** fly_by_wire/ppm.h */
#define  MODE_MANUAL   0
#define  MODE_AUTO     1


/** avr/include/avr/sfr_defs.h */
/** \def _BV
    \ingroup avr_sfr
    \code #include <avr/io.h>\endcode
    Converts a bit number into a byte value.
    \note The bit shift is performed by the compiler which then inserts the
    result into the code. Thus, there is no run-time overhead when using
    _BV(). */
#define _BV(bit) (1 << (bit))

/** \def bit_is_clear
    \ingroup avr_sfr
    \code #include <avr/io.h>\endcode
    Test whether bit \c bit in IO register \c sfr is clear. 
    This will return non-zero if the bit is clear, and a 0
    if the bit is set. */
// vivy: registers changed to C variables
// #define bit_is_clear(sfr, bit) (!(_SFR_BYTE(sfr) & _BV(bit)))
#define bit_is_clear(sfr, bit) (!(sfr & _BV(bit)))

/** avr/include/avr/iom8.h */
/* SPCR */
#define SPIE	7
#define SPE	6
#define DORD	5
#define MSTR	4
#define CPOL	3
#define CPHA	2
#define SPR1	1
#define SPR0	0

/** fly_by_wire/spi.h */
#define SPI_PIN    PINB
#define SPI_SS_PIN 2
#define SpiIsSelected() (bit_is_clear(SPI_PIN, SPI_SS_PIN))

/** fly_by_wire/spi.c */
#define SPI_DDR  DDRB
#define SPI_MOSI_PIN 3
#define SPI_MISO_PIN 4
#define SPI_SCK_PIN  5


/** var/include/airframe.h */
#define SERVO_MOTOR_LEFT 3
#define SERVO_MOTOR_LEFT_TRAVEL 0.833333333333
#define SERVOS_NEUTRALS_3 1000
#define SERVO_MOTOR_RIGHT 9
#define SERVO_MOTOR_RIGHT_TRAVEL 0.833333333333
#define SERVOS_NEUTRALS_9 1000
#define SERVO_AILERON_LEFT 0
#define SERVO_AILERON_LEFT_TRAVEL -0.55
#define SERVOS_NEUTRALS_0 1600
#define SERVO_AILERON_RIGHT 2
#define SERVO_AILERON_RIGHT_TRAVEL -0.520833333333
#define SERVOS_NEUTRALS_2 1650
#define SERVO_ELEVATOR 6
#define SERVO_ELEVATOR_TRAVEL 0.496666666667
#define SERVOS_NEUTRALS_6 1530
#define SERVO_RUDDER 7
#define SERVO_RUDDER_TRAVEL -0.483333333333
#define SERVOS_NEUTRALS_7 1450
#define SERVOS_MINS {1850,1000,2000,1000,1000,1000,1220,1850,1000,1000}
#define SERVOS_NEUTRALS {1600,1500,1650,1000,1500,1500,1530,1450,1500,1000}
#define SERVOS_MAXS {1190,2000,1375,2000,2000,2000,1816,1270,2000,2000}
#define SERVO_MIN_US 1000ul
#define SERVO_MAX_US 2000ul
#define AILERON_DIFF 0.66
#define COMBI_SWITCH 1.0

/** fly_by_wire/link_autopilot.h */
#define CLOCK	 16

/** fly_by_wire/servo.c */
#define _4017_NB_CHANNELS 10

/* Following macro is required since the compiler does not solve at
   compile-time indexation in a known array with a known index */
#define SERVO_NEUTRAL_(i) SERVOS_NEUTRALS_ ## i
#define SERVO_NEUTRAL(i) (SERVO_NEUTRAL_(i)*CLOCK)
#define SERVO_MIN (SERVO_MIN_US*CLOCK)
#define SERVO_MAX (SERVO_MAX_US*CLOCK)
#define ChopServo(x) ((x) < SERVO_MIN ? SERVO_MIN : ((x) > SERVO_MAX ? SERVO_MAX : (x)))


/** fly_by_wire/main.c */
#define STALLED_TIME        30  // 500ms with a 60Hz timer
#define REALLY_STALLED_TIME 300 // 5s with a 60Hz timer



/* fly_by_wire/link_autopilot.h */
struct inter_mcu_msg {
  int16_t channels[RADIO_CTL_NB];  
  uint8_t ppm_cpt;
  uint8_t status;
  uint8_t nb_err;
  uint8_t vsupply; /* 1e-1 V */
};


// VARIABLES CONTROLLED IN THIS MODULE

/** fly_by_wire/main.c */
bool_t mega128_ok;


// VARIABLES WITH SHARED CONTROL

/** fly_by_wire/servo.c */
/* holds the servo pulses width in clock ticks */
static uint16_t servo_widths[_4017_NB_CHANNELS];

/** fly_by_wire/main.c */
static uint8_t time_since_last_mega128;


// LOCAL COPIES OF VARIABLES ACCESSED BY THIS MODULE

/** fly_by_wire/main.c */
uint8_t mode;

/** fly_by_wire/spi.c */
struct inter_mcu_msg from_mega128;
//struct inter_mcu_msg to_mega128;
volatile bool_t mega128_receive_valid = FALSE;
volatile bool_t spi_was_interrupted = FALSE;



/** fly_by_wire/servo.c */
/**
 * defines how servos react to radio control or autopilot channels
 */
void servo_set(const pprz_t values[])
{
  // ServoSet(values); /*Generated from airframe.xml */
  uint16_t servo_value;
  int16_t _var_roll;
  servo_value = SERVO_NEUTRAL(SERVO_MOTOR_LEFT) +
    (int16_t)((2 * values[RADIO_GAIN1]) * SERVO_MOTOR_LEFT_TRAVEL);
  servo_widths[SERVO_MOTOR_LEFT] = ChopServo(servo_value);

  servo_value = SERVO_NEUTRAL(SERVO_MOTOR_RIGHT) + 
    (int16_t)((2 * values[RADIO_THROTTLE]) * SERVO_MOTOR_RIGHT_TRAVEL);
  servo_widths[SERVO_MOTOR_RIGHT] = ChopServo(servo_value);

  servo_value = SERVO_NEUTRAL(SERVO_ELEVATOR) + 
    (int16_t)((values[RADIO_PITCH]) * SERVO_ELEVATOR_TRAVEL);
  servo_widths[SERVO_ELEVATOR] = ChopServo(servo_value);

  _var_roll = values[RADIO_ROLL];
  servo_value = SERVO_NEUTRAL(SERVO_AILERON_LEFT) + 
    (int16_t)(((_var_roll > 0 ? 1 : AILERON_DIFF) * _var_roll) * SERVO_AILERON_LEFT_TRAVEL);
  servo_widths[SERVO_AILERON_LEFT] = ChopServo(servo_value);

  servo_value = SERVO_NEUTRAL(SERVO_AILERON_RIGHT) + 
    (int16_t)(((_var_roll > 0 ? AILERON_DIFF : 1) * _var_roll) * SERVO_AILERON_RIGHT_TRAVEL);
  servo_widths[SERVO_AILERON_RIGHT] = ChopServo(servo_value);

  servo_value = SERVO_NEUTRAL(SERVO_RUDDER) + 
    (int16_t)((values[RADIO_YAW] + values[RADIO_ROLL] * COMBI_SWITCH) * SERVO_RUDDER_TRAVEL);
  servo_widths[SERVO_RUDDER] = ChopServo(servo_value);
}


//#include "mpi.h"


/** fly_by_wire/main.c */
// void check_mega128_values_task(void)
int main()
{
  if ( !SpiIsSelected() && spi_was_interrupted ) 
  {
    if (mega128_receive_valid)
    {
      time_since_last_mega128 = 0;
      mega128_ok = TRUE;
      if (mode == MODE_AUTO)
	servo_set(from_mega128.channels);
    }
  }
  if (time_since_last_mega128 == STALLED_TIME)
  {
    mega128_ok = FALSE;
  }

  {
    //MPI_Comm intercomm;
    char str[256];

    str[0] = 'S';
    str[1] = '\0';
    //MPI_Isend(str, 1, MPI_CHAR, 1, 0, intercomm, NULL);

  }
}

