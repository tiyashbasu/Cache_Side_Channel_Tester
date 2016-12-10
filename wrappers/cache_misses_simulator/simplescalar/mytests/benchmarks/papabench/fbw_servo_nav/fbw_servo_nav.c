//------------------------
// Module: servo_transmit
//------------------------


/** include/inttypes.h */
typedef unsigned char uint8_t;
typedef unsigned short uint16_t;
typedef unsigned long uint32_t;
typedef signed char int8_t;
typedef signed short int16_t;
typedef signed long int32_t;


/** vivy */
// C variables to simulate special function registers
uint8_t UBRRH;
uint8_t UBRRL;
uint8_t UCSRA;
uint8_t UCSRB;
uint8_t UCSRC;
uint8_t UDR;
uint8_t PORTD;
uint8_t DDRD;
uint8_t PORTB;
uint8_t DDRB;
uint8_t TCCR1A;
uint8_t TIFR;
uint8_t TIMSK;
uint16_t OCR1A;


/** avr/include/avr/sfr_defs.h */
/** \def _BV
    \ingroup avr_sfr
    \code #include <avr/io.h>\endcode
    Converts a bit number into a byte value.
    \note The bit shift is performed by the compiler which then inserts the
    result into the code. Thus, there is no run-time overhead when using
    _BV(). */
#define _BV(bit) (1 << (bit))

/** sw/include/std.h */
// vivy: registers changed to C variables
#define cbi(sfr, bit) ((sfr) &= ~_BV(bit))
#define sbi(sfr, bit) ((sfr) |= _BV(bit))


/** avr/include/avr/iom8.h */
/* TIMSK */
#define OCIE2	7
#define TOIE2	6
#define TICIE1	5
#define OCIE1A	4
#define OCIE1B	3
#define TOIE1	2
// bit 1 reserved (OCIE0?)
#define TOIE0	0
/* TIFR */
#define OCF2	7
#define TOV2	6
#define ICF1	5
#define OCF1A	4
#define OCF1B	3
#define TOV1	2
// bit 1 reserved (OCF0?)
#define TOV0	0
/* TCCR1A */
#define COM1A1	7
#define COM1A0	6
#define COM1B1	5
#define COM1B0	4
#define FOC1A	3
#define FOC1B	2
#define WGM11	1
#define WGM10	0
/* UCSRC */
#define URSEL	7
#define UMSEL	6
#define UPM1	5
#define UPM0	4
#define USBS	3
#define UCSZ1	2
#define UCSZ0	1
#define UCPOL	0
/* PORTB */
#define PB7	7
#define PB6	6
#define PB5	5
#define PB4	4
#define PB3	3
#define PB2	2
#define PB1	1
#define PB0	0
/* UCSRB */
#define RXCIE	7
#define TXCIE	6
#define UDRIE	5
#define RXEN	4
#define	TXEN	3
#define UCSZ2	2
#define RXB8	1
#define TXB8	0

/** fly_by_wire/link_autopilot.h */
#define CLOCK	 16

/** var/include/airframe.h */
#define SERVO_MIN_US 1000ul
#define SERVO_MAX_US 2000ul

/** fly_by_wire/servo.c */
#define _4017_NB_CHANNELS 10
#define _4017_RESET_PORT        PORTD
#define _4017_RESET_DDR         DDRD
#define _4017_RESET_PIN         7
#define _4017_CLOCK_PORT        PORTB
#define _4017_CLOCK_DDR         DDRB
#define _4017_CLOCK_PIN         PB1
#define SERVO_OCR		OCR1A
#define SERVO_ENABLE		OCIE1A
#define SERVO_FLAG		OCF1A
#define SERVO_FORCE		FOC1A
#define SERVO_COM0		COM1A0
#define SERVO_COM1		COM1A1
#define SERVO_MIN (SERVO_MIN_US*CLOCK)
#define SERVO_MAX (SERVO_MAX_US*CLOCK)



// VARIABLES CONTROLLED IN THIS MODULE

/** fly_by_wire/uart.c */
#define TX_BUF_SIZE      256
static uint8_t           tx_buf[ TX_BUF_SIZE ];


// VARIABLES WITH SHARED CONTROL

/** fly_by_wire/uart.c */
static uint8_t           tx_head; /* next free in buf */


// LOCAL COPIES OF VARIABLES ACCESSED BY THIS MODULE

/** fly_by_wire/uart.c */
static volatile uint8_t  tx_tail; /* next char to send */

/** fly_by_wire/servo.c */
/* holds the servo pulses width in clock ticks */
static uint16_t servo_widths[_4017_NB_CHANNELS];



/** fly_by_wire/uart.c */
void uart_transmit( unsigned char data )
{
  if (UCSRB & _BV(TXCIE))
  {
    /* we are waiting for the last char to be sent : buffering */
    if (tx_tail == tx_head + 1)  /* BUF_SIZE = 256 */
    {
      /* Buffer is full (almost, but tx_head = tx_tail means "empty" */
      return;
    }
    tx_buf[tx_head] = data;
    tx_head++; /* BUF_SIZE = 256 */
  }
  else  /* Channel is free: just send */
  {
    UDR = data;
    // sbi(UCSRB, TXCIE);
  }
}


//#include "mpi.h"


/** fly_by_wire/servo.c */
// void servo_transmit(void)
int main()
{
  uint8_t servo;

    //MPI_Comm intercomm;
    char str[256];
		int i;

    //if( MPI_Irecv(str, 1, MPI_CHAR, 1, 0, intercomm, NULL) == MPI_SUCCESS
    //&& str[0] == 'V' )
		for(i = 0; i < 10; i++)
    {
      uart_transmit((uint8_t)0); uart_transmit((uint8_t)0);

      for(servo = 0; servo < _4017_NB_CHANNELS; servo++)
      {
	uart_transmit((uint8_t)(servo_widths[servo] >> 8));
	uart_transmit((uint8_t)(servo_widths[servo] & 0xff));
      }
      uart_transmit((uint8_t)'\n');

    }
}

