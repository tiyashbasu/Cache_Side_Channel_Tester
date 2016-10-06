//-----------------------
// Module: navigation
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

/** sw/var/include/ubx_protocol.h */
#define UBX_SYNC1 0xB5
#define UBX_SYNC2 0x62


/** autopilot/gps_ubx.c */
float gps_ftow;
float gps_falt;
float gps_fspeed;
float gps_fclimb;
float gps_fcourse;
int32_t gps_utm_east, gps_utm_north;
float gps_east, gps_north;
uint8_t gps_mode;
volatile bool_t gps_msg_received;
bool_t gps_pos_available;

#define UBX_MAX_PAYLOAD 255
static uint8_t  ubx_msg_buf[UBX_MAX_PAYLOAD];

#define RadianOfDeg(d) ((d)/180.*3.1415927)

//#ifdef SIMUL
//#include "infrared.h"
#define IR_START    0xA1  /* simulator/mc.ml */
volatile int16_t simul_ir_roll;
volatile int16_t simul_ir_pitch;
//#endif

#define UNINIT        0
#define GOT_SYNC1     1
#define GOT_SYNC2     2
#define GOT_CLASS     3
#define GOT_ID        4
#define GOT_LEN1      5
#define GOT_LEN2      6
#define GOT_PAYLOAD   7
#define GOT_CHECKSUM1 8
#ifdef SIMUL
#define GOT_IR_START  20
#define GOT_IR1 21
#define GOT_IR2 22
#define GOT_IR3 23
#endif

static uint8_t  ubx_status;
static uint16_t ubx_len;
static uint8_t  ubx_msg_idx;
static uint8_t ck_a, ck_b, ubx_id, ubx_class;


uint8_t gps_nb_ovrn;


/** autopilot/gps_ubx.c */
// void parse_ubx_static( uint8_t c )
int main()
{
  uint8_t c;

  if (ubx_status < GOT_PAYLOAD) {
    ck_a += c;
    ck_b += ck_a;
  }
  switch (ubx_status) {
  case UNINIT:
    if (c == UBX_SYNC1)
      ubx_status++;
    break;
  case GOT_SYNC1:
    if (c != UBX_SYNC2)
      goto error;
    ck_a = 0;
    ck_b = 0;
    ubx_status++;
    break;
  case GOT_SYNC2:
    if (gps_msg_received) {
      /* Previous message has not yet been parsed: discard this one */
      gps_nb_ovrn++;
      goto error;
    }
    ubx_class = c;
    ubx_status++;
    break;
  case GOT_CLASS:
    ubx_id = c;
    ubx_status++;
    break;    
  case GOT_ID:
    ubx_len = c;
    ubx_status++;
    break;
  case GOT_LEN1:
    ubx_len |= (c<<8);
    if (ubx_len > UBX_MAX_PAYLOAD)
      goto error;
    ubx_msg_idx = 0;
    ubx_status++;
    break;
  case GOT_LEN2:
    ubx_msg_buf[ubx_msg_idx] = c;
    ubx_msg_idx++;
    if (ubx_msg_idx >= ubx_len) {
      ubx_status++;
    }
    break;
  case GOT_PAYLOAD:
    if (c != ck_a)
      goto error;
    ubx_status++;
    break;
  case GOT_CHECKSUM1:
    if (c != ck_b)
      goto error;
    gps_msg_received = TRUE;
    goto restart;
    break;
  }
  return;
 error:  
 restart:
  ubx_status = UNINIT;
  return;
}
