//-------------
// Module: ppm
//-------------


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
uint16_t ICR1;  // Timer 1
uint8_t TCNT2;  // Timer 2


/** fly_by_wire/link_autopilot.h */
typedef int16_t pprz_t; // type of commands
#define CLOCK	 16
#define MAX_PPRZ (600 * CLOCK)
#define MIN_PPRZ -MAX_PPRZ
#define TRESHOLD_MANUAL_PPRZ (MIN_PPRZ / 2)


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


/** fly_by_wire/servo.c */
#define _4017_NB_CHANNELS 10

/* Following macro is required since the compiler does not solve at
   compile-time indexation in a known array with a known index */
#define SERVO_NEUTRAL_(i) SERVOS_NEUTRALS_ ## i
#define SERVO_NEUTRAL(i) (SERVO_NEUTRAL_(i)*CLOCK)
#define SERVO_MIN (SERVO_MIN_US*CLOCK)
#define SERVO_MAX (SERVO_MAX_US*CLOCK)
#define ChopServo(x) ((x) < SERVO_MIN ? SERVO_MIN : ((x) > SERVO_MAX ? SERVO_MAX : (x)))


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
#define PPM_FREQ     40 // 25ms
#define PPM_NB_PULSES RADIO_CTL_NB
#define MODE_MANUAL   0
#define MODE_AUTO     1
#define MODE_OF_PPRZ(mode) ((mode) < TRESHOLD_MANUAL_PPRZ ? MODE_MANUAL : MODE_AUTO)

/** fly_by_wire/ppm.c */
#define AVERAGING_PERIOD (PPM_FREQ/4)

/** fly_by_wire/main.c */
#define STALLED_TIME        30  // 500ms with a 60Hz timer
#define REALLY_STALLED_TIME 300 // 5s with a 60Hz timer



// VARIABLES CONTROLLED IN THIS MODULE

/** fly_by_wire/main.c */
bool_t radio_ok, radio_really_lost;


// VARIABLES WITH SHARED CONTROL

/** fly_by_wire/servo.c */
/* holds the servo pulses width in clock ticks */
static uint16_t servo_widths[_4017_NB_CHANNELS];

/** fly_by_wire/ppm.c */
pprz_t last_radio[ PPM_NB_PULSES ];
pprz_t avg_last_radio[ PPM_NB_PULSES ];
bool_t last_radio_contains_avg_channels = FALSE;
volatile bool_t ppm_valid;

/** fly_by_wire/main.c */
uint8_t mode;
static uint16_t time_since_last_ppm;
static uint8_t ppm_cpt;


// LOCAL COPIES OF VARIABLES ACCESSED BY THIS MODULE

/** fly_by_wire/ppm.c */
uint16_t ppm_pulses[ PPM_NB_PULSES ];



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
    (int16_t)((2 * values[RADIO_GAIN1])*SERVO_MOTOR_LEFT_TRAVEL);
  servo_widths[SERVO_MOTOR_LEFT] = ChopServo(servo_value);

  servo_value = SERVO_NEUTRAL(SERVO_MOTOR_RIGHT) + 
    (int16_t)((2 * values[RADIO_THROTTLE])*SERVO_MOTOR_RIGHT_TRAVEL);
  servo_widths[SERVO_MOTOR_RIGHT] = ChopServo(servo_value);

  servo_value = SERVO_NEUTRAL(SERVO_ELEVATOR) + 
    (int16_t)((values[RADIO_PITCH])*SERVO_ELEVATOR_TRAVEL);
  servo_widths[SERVO_ELEVATOR] = ChopServo(servo_value);

  _var_roll = values[RADIO_ROLL];
  servo_value = SERVO_NEUTRAL(SERVO_AILERON_LEFT) + 
    (int16_t)(((_var_roll > 0 ? 1 : AILERON_DIFF) * _var_roll)*SERVO_AILERON_LEFT_TRAVEL);
  servo_widths[SERVO_AILERON_LEFT] = ChopServo(servo_value);

  servo_value = SERVO_NEUTRAL(SERVO_AILERON_RIGHT) + 
    (int16_t)(((_var_roll > 0 ? AILERON_DIFF : 1) * _var_roll)*SERVO_AILERON_RIGHT_TRAVEL);
  servo_widths[SERVO_AILERON_RIGHT] = ChopServo(servo_value);

  servo_value = SERVO_NEUTRAL(SERVO_RUDDER) + 
    (int16_t)((values[RADIO_YAW] + values[RADIO_ROLL]*COMBI_SWITCH)*SERVO_RUDDER_TRAVEL);
  servo_widths[SERVO_RUDDER] = ChopServo(servo_value);
}


/** fly_by_wire/ppm.c */
/* Copy from the ppm receiving buffer to the buffer sent to mcu0 */
void last_radio_from_ppm()
{
  // LastRadioFromPpm()
  static uint8_t avg_cpt = 0; /* Counter for averaging */
  int16_t tmp_radio;
  tmp_radio = ppm_pulses[RADIO_THROTTLE] - (CLOCK*1000);
  last_radio[RADIO_THROTTLE] = tmp_radio * (MAX_PPRZ / 1 / (float)(CLOCK*(2200-1000)));
  if (last_radio[RADIO_THROTTLE] > MAX_PPRZ)
    last_radio[RADIO_THROTTLE] = MAX_PPRZ;
  else if (last_radio[RADIO_THROTTLE] < 0)
    last_radio[RADIO_THROTTLE] = 0;

  tmp_radio = ppm_pulses[RADIO_ROLL] - (CLOCK*1600);
  last_radio[RADIO_ROLL] = tmp_radio *
    (tmp_radio >=0 ? (MAX_PPRZ/1/(float)(CLOCK*(2200-1600))) : (MIN_PPRZ/1/(float)(CLOCK*(1000-1600))));
  if (last_radio[RADIO_ROLL] > MAX_PPRZ) 
    last_radio[RADIO_ROLL] = MAX_PPRZ;
  else if (last_radio[RADIO_ROLL] < MIN_PPRZ) 
    last_radio[RADIO_ROLL] = MIN_PPRZ;

  tmp_radio = ppm_pulses[RADIO_PITCH] - (CLOCK*1600);
  last_radio[RADIO_PITCH] = tmp_radio * 
    (tmp_radio >=0 ? (MAX_PPRZ/1/(float)(CLOCK*(2200-1600))) : (MIN_PPRZ/1/(float)(CLOCK*(1000-1600))));
  if (last_radio[RADIO_PITCH] > MAX_PPRZ) 
    last_radio[RADIO_PITCH] = MAX_PPRZ;
  else if (last_radio[RADIO_PITCH] < MIN_PPRZ) 
    last_radio[RADIO_PITCH] = MIN_PPRZ;

  tmp_radio = ppm_pulses[RADIO_YAW] - (CLOCK*1600);
  last_radio[RADIO_YAW] = tmp_radio * 
    (tmp_radio >=0 ? (MAX_PPRZ/1/(float)(CLOCK*(2200-1600))) : (MIN_PPRZ/1/(float)(CLOCK*(1000-1600))));
  if (last_radio[RADIO_YAW] > MAX_PPRZ) 
    last_radio[RADIO_YAW] = MAX_PPRZ;
  else if (last_radio[RADIO_YAW] < MIN_PPRZ) 
    last_radio[RADIO_YAW] = MIN_PPRZ;

  tmp_radio = ppm_pulses[RADIO_MODE] - (CLOCK*1600);
  avg_last_radio[RADIO_MODE] += tmp_radio * 
    (tmp_radio >=0 ? (MAX_PPRZ/AVERAGING_PERIOD/(float)(CLOCK*(2200-1600))) : (MIN_PPRZ/AVERAGING_PERIOD/(float)(CLOCK*(1000-1600))));
  tmp_radio = ppm_pulses[RADIO_GAIN1] - (CLOCK*1600);
  avg_last_radio[RADIO_GAIN1] += tmp_radio * 
    (tmp_radio >=0 ? (MAX_PPRZ/AVERAGING_PERIOD/(float)(CLOCK*(2200-1600))) : (MIN_PPRZ/AVERAGING_PERIOD/(float)(CLOCK*(1000-1600))));
  tmp_radio = ppm_pulses[RADIO_GAIN2] - (CLOCK*1600);
  avg_last_radio[RADIO_GAIN2] += tmp_radio * 
    (tmp_radio >=0 ? (MAX_PPRZ/AVERAGING_PERIOD/(float)(CLOCK*(2200-1600))) : (MIN_PPRZ/AVERAGING_PERIOD/(float)(CLOCK*(1000-1600))));
  tmp_radio = ppm_pulses[RADIO_LLS] - (CLOCK*1600);
  avg_last_radio[RADIO_LLS] += tmp_radio * 
    (tmp_radio >=0 ? (MAX_PPRZ/AVERAGING_PERIOD/(float)(CLOCK*(2200-1600))) : (MIN_PPRZ/AVERAGING_PERIOD/(float)(CLOCK*(1000-1600))));
  tmp_radio = ppm_pulses[RADIO_CALIB] - (CLOCK*1600);
  avg_last_radio[RADIO_CALIB] += tmp_radio * 
    (tmp_radio >=0 ? (MAX_PPRZ/AVERAGING_PERIOD/(float)(CLOCK*(2200-1600))) : (MIN_PPRZ/AVERAGING_PERIOD/(float)(CLOCK*(1000-1600))));

  avg_cpt++;
  if (avg_cpt == AVERAGING_PERIOD)
  {
    avg_cpt = 0;
    last_radio[RADIO_MODE] = avg_last_radio[RADIO_MODE];
    avg_last_radio[RADIO_MODE] = 0;
    if (last_radio[RADIO_MODE] > MAX_PPRZ) last_radio[RADIO_MODE] = MAX_PPRZ;
    else if (last_radio[RADIO_MODE] < MIN_PPRZ) last_radio[RADIO_MODE] = MIN_PPRZ;

    last_radio[RADIO_GAIN1] = avg_last_radio[RADIO_GAIN1];
    avg_last_radio[RADIO_GAIN1] = 0;
    if (last_radio[RADIO_GAIN1] > MAX_PPRZ) last_radio[RADIO_GAIN1] = MAX_PPRZ;
    else if (last_radio[RADIO_GAIN1] < MIN_PPRZ) last_radio[RADIO_GAIN1] = MIN_PPRZ;

    last_radio[RADIO_GAIN2] = avg_last_radio[RADIO_GAIN2];
    avg_last_radio[RADIO_GAIN2] = 0;
    if (last_radio[RADIO_GAIN2] > MAX_PPRZ) last_radio[RADIO_GAIN2] = MAX_PPRZ;
    else if (last_radio[RADIO_GAIN2] < MIN_PPRZ) last_radio[RADIO_GAIN2] = MIN_PPRZ;

    last_radio[RADIO_LLS] = avg_last_radio[RADIO_LLS];
    avg_last_radio[RADIO_LLS] = 0;
    if (last_radio[RADIO_LLS] > MAX_PPRZ) last_radio[RADIO_LLS] = MAX_PPRZ;
    else if (last_radio[RADIO_LLS] < MIN_PPRZ) last_radio[RADIO_LLS] = MIN_PPRZ;

    last_radio[RADIO_CALIB] = avg_last_radio[RADIO_CALIB];
    avg_last_radio[RADIO_CALIB] = 0;
    if (last_radio[RADIO_CALIB] > MAX_PPRZ) last_radio[RADIO_CALIB] = MAX_PPRZ;
    else if (last_radio[RADIO_CALIB] < MIN_PPRZ) last_radio[RADIO_CALIB] = MIN_PPRZ;

    last_radio_contains_avg_channels = TRUE;
  }
}


/** fly_by_wire/ppm.c */
#define RestartPpmCycle() { state = 0;  sync_start = TCNT2; return; }


//#include "mpi.h"


/** fly_by_wire/main.c */
// void test_ppm_task(void)
int main()
{
  int i;
  ppm_valid = 1;

	for(i = 0; i < 1000; i++)
	{
    if( ppm_valid ) 
    {
      ppm_valid = FALSE;
      ppm_cpt++;
      radio_ok = TRUE;
      radio_really_lost = FALSE;
      time_since_last_ppm = 0;
      last_radio_from_ppm();
      if (last_radio_contains_avg_channels) 
      {
	mode = MODE_OF_PPRZ(last_radio[RADIO_MODE]);
      }
      if (mode == MODE_MANUAL) 
      {
	servo_set(last_radio);
      }

      {
	//MPI_Comm intercomm;
	char str[256];

	str[0] = 'R';
	str[1] = '\0';
	//MPI_Isend(str, 1, MPI_CHAR, 1, 0, intercomm, NULL);
      }
    } 
    else if (mode == MODE_MANUAL && radio_really_lost) 
    {
      mode = MODE_AUTO;
    }
    if (time_since_last_ppm >= STALLED_TIME) 
    {
      radio_ok = FALSE;
    }
    if (time_since_last_ppm >= REALLY_STALLED_TIME) 
    {
      radio_really_lost = TRUE;
    }
	}	
}
