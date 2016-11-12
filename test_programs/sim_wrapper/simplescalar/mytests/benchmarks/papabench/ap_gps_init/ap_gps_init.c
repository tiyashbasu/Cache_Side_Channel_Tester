//--------------
// Module: main
//--------------


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

// vivy: registers changed to C variables
#define cbi(sfr, bit) ((sfr) &= ~_BV(bit))
#define sbi(sfr, bit) ((sfr) |= _BV(bit))


/** src/avr/include/avr/sfr_defs.h */
#define _BV(bit) (1 << (bit))

/** avr/include/avr/iom128.h */
/* USART Register C (generic) */
#define    UMSEL        6
#define    UPM1         5
#define    UPM0         4
#define    USBS         3
#define    UCSZ1        2
#define    UCSZ0        1
#define    UCPOL        0
/* USART Control Register B (generic) */
#define    RXCIE        7
#define    TXCIE        6
#define    UDRIE        5
#define    RXEN         4
#define    TXEN         3
#define    UCSZ         2
#define    UCSZ2        2  // new name in datasheet (2467E-AVR-05/02)
#define    RXB8         1
#define    TXB8         0


/** src/sw/var/include/airframe.h */
#define IR_ROLL_NEUTRAL_DEFAULT -915
#define IR_PITCH_NEUTRAL_DEFAULT 110
#define IR_DEFAULT_CONTRAST 200

/** autopilot/infrared.c */
int16_t ir_contrast     = IR_DEFAULT_CONTRAST;
int16_t ir_roll_neutral  = IR_ROLL_NEUTRAL_DEFAULT;
int16_t ir_pitch_neutral = IR_PITCH_NEUTRAL_DEFAULT;


/** variables */
int UBRR0H;
int UBRR0L;
int UCSR0A; 
int UCSR0B;
int UCSR0C;

/** autopilot/uart.c */
void uart0_init( void )
{
  // Baudrate is 38.4k
  UBRR0H = 0; 
  UBRR0L = 25; // 38.4
  // UBRR0L = 103; //9600
  // single speed
  UCSR0A = 0; 
  // Enable receiver and transmitter 
  UCSR0B = _BV(RXEN) | _BV(TXEN);
  // Set frame format: 8data, 1stop bit
  UCSR0C = _BV(UCSZ1) | _BV(UCSZ0);
  // Enable uart receive interrupt
  sbi(UCSR0B, RXCIE ); 
}


/** autopilot/gps_ubx.c */
#define UNINIT        0
#define GOT_SYNC1     1
#define GOT_SYNC2     2
#define GOT_CLASS     3
#define GOT_ID        4
#define GOT_LEN1      5
#define GOT_LEN2      6
#define GOT_PAYLOAD   7
#define GOT_CHECKSUM1 8

volatile int16_t simul_ir_roll;
volatile int16_t simul_ir_pitch;
static uint8_t  ubx_status;

void gps_init( void )
{
  // Enable uart
  //#ifdef SIMUL
  uart0_init();
  simul_ir_roll = ir_roll_neutral;
  simul_ir_pitch = ir_pitch_neutral;
  //#else
  //uart1_init();
  //#endif
  ubx_status = UNINIT;
}


//#include "mpi.h"


/** autopilot/mainloop.c */
int main( void ) 
{
  while( 1 )
  {
    //MPI_Comm intercomm;
    char str[256];

    //if( MPI_Irecv(str, 1, MPI_CHAR, 1, 0, intercomm, NULL) == MPI_SUCCESS
    //&& str[0] == 'G' )
    {
      gps_init();
      break;
    }
  }
  return 0;
}
