/*
 * Copyright 1995-2016 The OpenSSL Project Authors. All Rights Reserved.
 *
 * Licensed under the OpenSSL license (the "License").  You may not use
 * this file except in compliance with the License.  You can obtain a copy
 * in the file LICENSE in the source distribution or at
 * https://www.openssl.org/source/license.html
 */
#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <unistd.h>
#include <linux/perf_event.h>
#include <linux/hw_breakpoint.h>
#include <sys/ioctl.h>
#include <asm/unistd.h>
#include <openssl/crypto.h>
//#include "des_locl.h" - start
/*
 * Copyright 1995-2016 The OpenSSL Project Authors. All Rights Reserved.
 *
 * Licensed under the OpenSSL license (the "License").  You may not use
 * this file except in compliance with the License.  You can obtain a copy
 * in the file LICENSE in the source distribution or at
 * https://www.openssl.org/source/license.html
 */

#ifndef HEADER_DES_LOCL_H
# define HEADER_DES_LOCL_H

# include <openssl/e_os2.h>

# include <stdio.h>
//# include <stdlib.h>
//# include <string.h>

# include <openssl/des.h>

# ifdef OPENSSL_BUILD_SHLIBCRYPTO
#  undef OPENSSL_EXTERN
#  define OPENSSL_EXTERN OPENSSL_EXPORT
# endif

# define ITERATIONS 16
# define HALF_ITERATIONS 8

/* used in des_read and des_write */
# define MAXWRITE        (1024*16)
# define BSIZE           (MAXWRITE+4)

# define c2l(c,l)        (l =((DES_LONG)(*((c)++)))    , \n                         l|=((DES_LONG)(*((c)++)))<< 8L, \n                         l|=((DES_LONG)(*((c)++)))<<16L, \n                         l|=((DES_LONG)(*((c)++)))<<24L)

/* NOTE - c is not incremented as per c2l */
# define c2ln(c,l1,l2,n) { \n                        c+=n; \n                        l1=l2=0; \n                        switch (n) { \n                        case 8: l2 =((DES_LONG)(*(--(c))))<<24L; \n                        case 7: l2|=((DES_LONG)(*(--(c))))<<16L; \n                        case 6: l2|=((DES_LONG)(*(--(c))))<< 8L; \n                        case 5: l2|=((DES_LONG)(*(--(c))));     \n                        case 4: l1 =((DES_LONG)(*(--(c))))<<24L; \n                        case 3: l1|=((DES_LONG)(*(--(c))))<<16L; \n                        case 2: l1|=((DES_LONG)(*(--(c))))<< 8L; \n                        case 1: l1|=((DES_LONG)(*(--(c))));     \n                                } \n                        }

# define l2c(l,c)        (*((c)++)=(unsigned char)(((l)     )&0xff), \n                         *((c)++)=(unsigned char)(((l)>> 8L)&0xff), \n                         *((c)++)=(unsigned char)(((l)>>16L)&0xff), \n                         *((c)++)=(unsigned char)(((l)>>24L)&0xff))

/*
 * replacements for htonl and ntohl since I have no idea what to do when
 * faced with machines with 8 byte longs.
 */
# define HDRSIZE 4

# define n2l(c,l)        (l =((DES_LONG)(*((c)++)))<<24L, \n                         l|=((DES_LONG)(*((c)++)))<<16L, \n                         l|=((DES_LONG)(*((c)++)))<< 8L, \n                         l|=((DES_LONG)(*((c)++))))

# define l2n(l,c)        (*((c)++)=(unsigned char)(((l)>>24L)&0xff), \n                         *((c)++)=(unsigned char)(((l)>>16L)&0xff), \n                         *((c)++)=(unsigned char)(((l)>> 8L)&0xff), \n                         *((c)++)=(unsigned char)(((l)     )&0xff))

/* NOTE - c is not incremented as per l2c */
# define l2cn(l1,l2,c,n) { \n                        c+=n; \n                        switch (n) { \n                        case 8: *(--(c))=(unsigned char)(((l2)>>24L)&0xff); \n                        case 7: *(--(c))=(unsigned char)(((l2)>>16L)&0xff); \n                        case 6: *(--(c))=(unsigned char)(((l2)>> 8L)&0xff); \n                        case 5: *(--(c))=(unsigned char)(((l2)     )&0xff); \n                        case 4: *(--(c))=(unsigned char)(((l1)>>24L)&0xff); \n                        case 3: *(--(c))=(unsigned char)(((l1)>>16L)&0xff); \n                        case 2: *(--(c))=(unsigned char)(((l1)>> 8L)&0xff); \n                        case 1: *(--(c))=(unsigned char)(((l1)     )&0xff); \n                                } \n                        }

# if (defined(OPENSSL_SYS_WIN32) && defined(_MSC_VER))
#  define ROTATE(a,n)     (_lrotr(a,n))
# elif defined(__ICC)
#  define ROTATE(a,n)     (_rotr(a,n))
# elif defined(__GNUC__) && __GNUC__>=2 && !defined(__STRICT_ANSI__) && !defined(OPENSSL_NO_ASM) && !defined(OPENSSL_NO_INLINE_ASM) && !defined(PEDANTIC)
#  if defined(__i386) || defined(__i386__) || defined(__x86_64) || defined(__x86_64__)
#   define ROTATE(a,n)   ({ register unsigned int ret;   \n                                asm ("rorl %1,%0"       \n                                        : "=r"(ret)     \n                                        : "I"(n),"0"(a) \n                                        : "cc");        \n                           ret;                         \n                        })
#  endif
# endif
# ifndef ROTATE
#  define ROTATE(a,n)     (((a)>>(n))+((a)<<(32-(n))))
# endif

/*
 * Don't worry about the LOAD_DATA() stuff, that is used by fcrypt() to add
 * it's little bit to the front
 */

# ifdef DES_FCRYPT

#  define LOAD_DATA_tmp(R,S,u,t,E0,E1) \n        { DES_LONG tmp; LOAD_DATA(R,S,u,t,E0,E1,tmp); }

#  define LOAD_DATA(R,S,u,t,E0,E1,tmp) \n        t=R^(R>>16L); \n        u=t&E0; t&=E1; \n        tmp=(u<<16); u^=R^s[S  ]; u^=tmp; \n        tmp=(t<<16); t^=R^s[S+1]; t^=tmp
# else
#  define LOAD_DATA_tmp(a,b,c,d,e,f) LOAD_DATA(a,b,c,d,e,f,g)
#  define LOAD_DATA(R,S,u,t,E0,E1,tmp) \n        u=R^s[S  ]; \n        t=R^s[S+1]
# endif

/*
 * It recently occurred to me that 0^0^0^0^0^0^0 == 0, so there is no reason
 * to not xor all the sub items together.  This potentially saves a register
 * since things can be xored directly into L
 */

# define D_ENCRYPT(LL,R,S) { \n        LOAD_DATA_tmp(R,S,u,t,E0,E1); \n        t=ROTATE(t,4); \n        LL^= \n            DES_SPtrans[0][(u>> 2L)&0x3f]^ \n            DES_SPtrans[2][(u>>10L)&0x3f]^ \n            DES_SPtrans[4][(u>>18L)&0x3f]^ \n            DES_SPtrans[6][(u>>26L)&0x3f]^ \n            DES_SPtrans[1][(t>> 2L)&0x3f]^ \n            DES_SPtrans[3][(t>>10L)&0x3f]^ \n            DES_SPtrans[5][(t>>18L)&0x3f]^ \n            DES_SPtrans[7][(t>>26L)&0x3f]; }

        /*-
         * IP and FP
         * The problem is more of a geometric problem that random bit fiddling.
         0  1  2  3  4  5  6  7      62 54 46 38 30 22 14  6
         8  9 10 11 12 13 14 15      60 52 44 36 28 20 12  4
        16 17 18 19 20 21 22 23      58 50 42 34 26 18 10  2
        24 25 26 27 28 29 30 31  to  56 48 40 32 24 16  8  0

        32 33 34 35 36 37 38 39      63 55 47 39 31 23 15  7
        40 41 42 43 44 45 46 47      61 53 45 37 29 21 13  5
        48 49 50 51 52 53 54 55      59 51 43 35 27 19 11  3
        56 57 58 59 60 61 62 63      57 49 41 33 25 17  9  1

        The output has been subject to swaps of the form
        0 1 -> 3 1 but the odd and even bits have been put into
        2 3    2 0
        different words.  The main trick is to remember that
        t=((l>>size)^r)&(mask);
        r^=t;
        l^=(t<<size);
        can be used to swap and move bits between words.

        So l =  0  1  2  3  r = 16 17 18 19
                4  5  6  7      20 21 22 23
                8  9 10 11      24 25 26 27
               12 13 14 15      28 29 30 31
        becomes (for size == 2 and mask == 0x3333)
           t =   2^16  3^17 -- --   l =  0  1 16 17  r =  2  3 18 19
                 6^20  7^21 -- --        4  5 20 21       6  7 22 23
                10^24 11^25 -- --        8  9 24 25      10 11 24 25
                14^28 15^29 -- --       12 13 28 29      14 15 28 29

        Thanks for hints from Richard Outerbridge - he told me IP&FP
        could be done in 15 xor, 10 shifts and 5 ands.
        When I finally started to think of the problem in 2D
        I first got ~42 operations without xors.  When I remembered
        how to use xors :-) I got it to its final state.
        */
# define PERM_OP(a,b,t,n,m) ((t)=((((a)>>(n))^(b))&(m)),\n        (b)^=(t),\n        (a)^=((t)<<(n)))

# define IP(l,r) \n        { \n        register DES_LONG tt; \n        PERM_OP(r,l,tt, 4,0x0f0f0f0fL); \n        PERM_OP(l,r,tt,16,0x0000ffffL); \n        PERM_OP(r,l,tt, 2,0x33333333L); \n        PERM_OP(l,r,tt, 8,0x00ff00ffL); \n        PERM_OP(r,l,tt, 1,0x55555555L); \n        }

# define FP(l,r) \n        { \n        register DES_LONG tt; \n        PERM_OP(l,r,tt, 1,0x55555555L); \n        PERM_OP(r,l,tt, 8,0x00ff00ffL); \n        PERM_OP(l,r,tt, 2,0x33333333L); \n        PERM_OP(r,l,tt,16,0x0000ffffL); \n        PERM_OP(l,r,tt, 4,0x0f0f0f0fL); \n        }

extern const DES_LONG DES_SPtrans[8][64];

void fcrypt_body(DES_LONG *out, DES_key_schedule *ks,
                 DES_LONG Eswap0, DES_LONG Eswap1);

#endif
//#include "des_locl.h" - end
//#include "spr.h" - start
/*
 * Copyright 1995-2016 The OpenSSL Project Authors. All Rights Reserved.
 *
 * Licensed under the OpenSSL license (the "License").  You may not use
 * this file except in compliance with the License.  You can obtain a copy
 * in the file LICENSE in the source distribution or at
 * https://www.openssl.org/source/license.html
 */

OPENSSL_GLOBAL const DES_LONG DES_SPtrans[8][64] = {
    {
        /* nibble 0 */
        0x02080800L, 0x00080000L, 0x02000002L, 0x02080802L,
        0x02000000L, 0x00080802L, 0x00080002L, 0x02000002L,
        0x00080802L, 0x02080800L, 0x02080000L, 0x00000802L,
        0x02000802L, 0x02000000L, 0x00000000L, 0x00080002L,
        0x00080000L, 0x00000002L, 0x02000800L, 0x00080800L,
        0x02080802L, 0x02080000L, 0x00000802L, 0x02000800L,
        0x00000002L, 0x00000800L, 0x00080800L, 0x02080002L,
        0x00000800L, 0x02000802L, 0x02080002L, 0x00000000L,
        0x00000000L, 0x02080802L, 0x02000800L, 0x00080002L,
        0x02080800L, 0x00080000L, 0x00000802L, 0x02000800L,
        0x02080002L, 0x00000800L, 0x00080800L, 0x02000002L,
        0x00080802L, 0x00000002L, 0x02000002L, 0x02080000L,
        0x02080802L, 0x00080800L, 0x02080000L, 0x02000802L,
        0x02000000L, 0x00000802L, 0x00080002L, 0x00000000L,
        0x00080000L, 0x02000000L, 0x02000802L, 0x02080800L,
        0x00000002L, 0x02080002L, 0x00000800L, 0x00080802L,
    },
    {
        /* nibble 1 */
        0x40108010L, 0x00000000L, 0x00108000L, 0x40100000L,
        0x40000010L, 0x00008010L, 0x40008000L, 0x00108000L,
        0x00008000L, 0x40100010L, 0x00000010L, 0x40008000L,
        0x00100010L, 0x40108000L, 0x40100000L, 0x00000010L,
        0x00100000L, 0x40008010L, 0x40100010L, 0x00008000L,
        0x00108010L, 0x40000000L, 0x00000000L, 0x00100010L,
        0x40008010L, 0x00108010L, 0x40108000L, 0x40000010L,
        0x40000000L, 0x00100000L, 0x00008010L, 0x40108010L,
        0x00100010L, 0x40108000L, 0x40008000L, 0x00108010L,
        0x40108010L, 0x00100010L, 0x40000010L, 0x00000000L,
        0x40000000L, 0x00008010L, 0x00100000L, 0x40100010L,
        0x00008000L, 0x40000000L, 0x00108010L, 0x40008010L,
        0x40108000L, 0x00008000L, 0x00000000L, 0x40000010L,
        0x00000010L, 0x40108010L, 0x00108000L, 0x40100000L,
        0x40100010L, 0x00100000L, 0x00008010L, 0x40008000L,
        0x40008010L, 0x00000010L, 0x40100000L, 0x00108000L,
    },
    {
        /* nibble 2 */
        0x04000001L, 0x04040100L, 0x00000100L, 0x04000101L,
        0x00040001L, 0x04000000L, 0x04000101L, 0x00040100L,
        0x04000100L, 0x00040000L, 0x04040000L, 0x00000001L,
        0x04040101L, 0x00000101L, 0x00000001L, 0x04040001L,
        0x00000000L, 0x00040001L, 0x04040100L, 0x00000100L,
        0x00000101L, 0x04040101L, 0x00040000L, 0x04000001L,
        0x04040001L, 0x04000100L, 0x00040101L, 0x04040000L,
        0x00040100L, 0x00000000L, 0x04000000L, 0x00040101L,
        0x04040100L, 0x00000100L, 0x00000001L, 0x00040000L,
        0x00000101L, 0x00040001L, 0x04040000L, 0x04000101L,
        0x00000000L, 0x04040100L, 0x00040100L, 0x04040001L,
        0x00040001L, 0x04000000L, 0x04040101L, 0x00000001L,
        0x00040101L, 0x04000001L, 0x04000000L, 0x04040101L,
        0x00040000L, 0x04000100L, 0x04000101L, 0x00040100L,
        0x04000100L, 0x00000000L, 0x04040001L, 0x00000101L,
        0x04000001L, 0x00040101L, 0x00000100L, 0x04040000L,
    },
    {
        /* nibble 3 */
        0x00401008L, 0x10001000L, 0x00000008L, 0x10401008L,
        0x00000000L, 0x10400000L, 0x10001008L, 0x00400008L,
        0x10401000L, 0x10000008L, 0x10000000L, 0x00001008L,
        0x10000008L, 0x00401008L, 0x00400000L, 0x10000000L,
        0x10400008L, 0x00401000L, 0x00001000L, 0x00000008L,
        0x00401000L, 0x10001008L, 0x10400000L, 0x00001000L,
        0x00001008L, 0x00000000L, 0x00400008L, 0x10401000L,
        0x10001000L, 0x10400008L, 0x10401008L, 0x00400000L,
        0x10400008L, 0x00001008L, 0x00400000L, 0x10000008L,
        0x00401000L, 0x10001000L, 0x00000008L, 0x10400000L,
        0x10001008L, 0x00000000L, 0x00001000L, 0x00400008L,
        0x00000000L, 0x10400008L, 0x10401000L, 0x00001000L,
        0x10000000L, 0x10401008L, 0x00401008L, 0x00400000L,
        0x10401008L, 0x00000008L, 0x10001000L, 0x00401008L,
        0x00400008L, 0x00401000L, 0x10400000L, 0x10001008L,
        0x00001008L, 0x10000000L, 0x10000008L, 0x10401000L,
    },
    {
        /* nibble 4 */
        0x08000000L, 0x00010000L, 0x00000400L, 0x08010420L,
        0x08010020L, 0x08000400L, 0x00010420L, 0x08010000L,
        0x00010000L, 0x00000020L, 0x08000020L, 0x00010400L,
        0x08000420L, 0x08010020L, 0x08010400L, 0x00000000L,
        0x00010400L, 0x08000000L, 0x00010020L, 0x00000420L,
        0x08000400L, 0x00010420L, 0x00000000L, 0x08000020L,
        0x00000020L, 0x08000420L, 0x08010420L, 0x00010020L,
        0x08010000L, 0x00000400L, 0x00000420L, 0x08010400L,
        0x08010400L, 0x08000420L, 0x00010020L, 0x08010000L,
        0x00010000L, 0x00000020L, 0x08000020L, 0x08000400L,
        0x08000000L, 0x00010400L, 0x08010420L, 0x00000000L,
        0x00010420L, 0x08000000L, 0x00000400L, 0x00010020L,
        0x08000420L, 0x00000400L, 0x00000000L, 0x08010420L,
        0x08010020L, 0x08010400L, 0x00000420L, 0x00010000L,
        0x00010400L, 0x08010020L, 0x08000400L, 0x00000420L,
        0x00000020L, 0x00010420L, 0x08010000L, 0x08000020L,
    },
    {
        /* nibble 5 */
        0x80000040L, 0x00200040L, 0x00000000L, 0x80202000L,
        0x00200040L, 0x00002000L, 0x80002040L, 0x00200000L,
        0x00002040L, 0x80202040L, 0x00202000L, 0x80000000L,
        0x80002000L, 0x80000040L, 0x80200000L, 0x00202040L,
        0x00200000L, 0x80002040L, 0x80200040L, 0x00000000L,
        0x00002000L, 0x00000040L, 0x80202000L, 0x80200040L,
        0x80202040L, 0x80200000L, 0x80000000L, 0x00002040L,
        0x00000040L, 0x00202000L, 0x00202040L, 0x80002000L,
        0x00002040L, 0x80000000L, 0x80002000L, 0x00202040L,
        0x80202000L, 0x00200040L, 0x00000000L, 0x80002000L,
        0x80000000L, 0x00002000L, 0x80200040L, 0x00200000L,
        0x00200040L, 0x80202040L, 0x00202000L, 0x00000040L,
        0x80202040L, 0x00202000L, 0x00200000L, 0x80002040L,
        0x80000040L, 0x80200000L, 0x00202040L, 0x00000000L,
        0x00002000L, 0x80000040L, 0x80002040L, 0x80202000L,
        0x80200000L, 0x00002040L, 0x00000040L, 0x80200040L,
    },
    {
        /* nibble 6 */
        0x00004000L, 0x00000200L, 0x01000200L, 0x01000004L,
        0x01004204L, 0x00004004L, 0x00004200L, 0x00000000L,
        0x01000000L, 0x01000204L, 0x00000204L, 0x01004000L,
        0x00000004L, 0x01004200L, 0x01004000L, 0x00000204L,
        0x01000204L, 0x00004000L, 0x00004004L, 0x01004204L,
        0x00000000L, 0x01000200L, 0x01000004L, 0x00004200L,
        0x01004004L, 0x00004204L, 0x01004200L, 0x00000004L,
        0x00004204L, 0x01004004L, 0x00000200L, 0x01000000L,
        0x00004204L, 0x01004000L, 0x01004004L, 0x00000204L,
        0x00004000L, 0x00000200L, 0x01000000L, 0x01004004L,
        0x01000204L, 0x00004204L, 0x00004200L, 0x00000000L,
        0x00000200L, 0x01000004L, 0x00000004L, 0x01000200L,
        0x00000000L, 0x01000204L, 0x01000200L, 0x00004200L,
        0x00000204L, 0x00004000L, 0x01004204L, 0x01000000L,
        0x01004200L, 0x00000004L, 0x00004004L, 0x01004204L,
        0x01000004L, 0x01004200L, 0x01004000L, 0x00004004L,
    },
    {
        /* nibble 7 */
        0x20800080L, 0x20820000L, 0x00020080L, 0x00000000L,
        0x20020000L, 0x00800080L, 0x20800000L, 0x20820080L,
        0x00000080L, 0x20000000L, 0x00820000L, 0x00020080L,
        0x00820080L, 0x20020080L, 0x20000080L, 0x20800000L,
        0x00020000L, 0x00820080L, 0x00800080L, 0x20020000L,
        0x20820080L, 0x20000080L, 0x00000000L, 0x00820000L,
        0x20000000L, 0x00800000L, 0x20020080L, 0x20800080L,
        0x00800000L, 0x00020000L, 0x20820000L, 0x00000080L,
        0x00800000L, 0x00020000L, 0x20000080L, 0x20820080L,
        0x00020080L, 0x20000000L, 0x00000000L, 0x00820000L,
        0x20800080L, 0x20020080L, 0x20020000L, 0x00800080L,
        0x20820000L, 0x00000080L, 0x00800080L, 0x20020000L,
        0x20820080L, 0x00800000L, 0x20800000L, 0x20000080L,
        0x00820000L, 0x00020080L, 0x20020080L, 0x20800000L,
        0x00000080L, 0x20820000L, 0x00820080L, 0x00000000L,
        0x20000000L, 0x20800080L, 0x00020000L, 0x00820080L,
    }
};
//#include "spr.h" - end
#define NUM_TESTS 34

static unsigned char plain_data[NUM_TESTS][8] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
    {0x10, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x01},
    {0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11},
    {0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11, 0x11},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0x01, 0xA1, 0xD6, 0xD0, 0x39, 0x77, 0x67, 0x42},
    {0x5C, 0xD5, 0x4C, 0xA8, 0x3D, 0xEF, 0x57, 0xDA},
    {0x02, 0x48, 0xD4, 0x38, 0x06, 0xF6, 0x71, 0x72},
    {0x51, 0x45, 0x4B, 0x58, 0x2D, 0xDF, 0x44, 0x0A},
    {0x42, 0xFD, 0x44, 0x30, 0x59, 0x57, 0x7F, 0xA2},
    {0x05, 0x9B, 0x5E, 0x08, 0x51, 0xCF, 0x14, 0x3A},
    {0x07, 0x56, 0xD8, 0xE0, 0x77, 0x47, 0x61, 0xD2},
    {0x76, 0x25, 0x14, 0xB8, 0x29, 0xBF, 0x48, 0x6A},
    {0x3B, 0xDD, 0x11, 0x90, 0x49, 0x37, 0x28, 0x02},
    {0x26, 0x95, 0x5F, 0x68, 0x35, 0xAF, 0x60, 0x9A},
    {0x16, 0x4D, 0x5E, 0x40, 0x4F, 0x27, 0x52, 0x32},
    {0x6B, 0x05, 0x6E, 0x18, 0x75, 0x9F, 0x5C, 0xCA},
    {0x00, 0x4B, 0xD6, 0xEF, 0x09, 0x17, 0x60, 0x62},
    {0x48, 0x0D, 0x39, 0x00, 0x6E, 0xE7, 0x62, 0xF2},
    {0x43, 0x75, 0x40, 0xC8, 0x69, 0x8F, 0x3C, 0xFA},
    {0x07, 0x2D, 0x43, 0xA0, 0x77, 0x07, 0x52, 0x92},
    {0x02, 0xFE, 0x55, 0x77, 0x81, 0x17, 0xF1, 0x2A},
    {0x1D, 0x9D, 0x5C, 0x50, 0x18, 0xF7, 0x28, 0xC2},
    {0x30, 0x55, 0x32, 0x28, 0x6D, 0x6F, 0x29, 0x5A},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0x01, 0x23, 0x45, 0x67, 0x89, 0xAB, 0xCD, 0xEF},
    {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF, 0xFF}
};

void DES_encrypt1(DES_LONG *data, DES_key_schedule *ks, int enc)
{
    register DES_LONG l, r, t, u;
    register DES_LONG *s;

    r = data[0];
    l = data[1];

    IP(r, l);
    /*
     * Things have been modified so that the initial rotate is done outside
     * the loop.  This required the DES_SPtrans values in sp.h to be rotated
     * 1 bit to the right. One perl script later and things have a 5% speed
     * up on a sparc2. Thanks to Richard Outerbridge
     * <71755.204@CompuServe.COM> for pointing this out.
     */
    /* clear the top bits on machines with 8byte longs */
    /* shift left by 2 */
    r = ROTATE(r, 29) & 0xffffffffL;
    l = ROTATE(l, 29) & 0xffffffffL;

    s = ks->ks->deslong;
    /*
     * I don't know if it is worth the effort of loop unrolling the inner
     * loop
     */
    if (enc) {
        D_ENCRYPT(l, r, 0);     /* 1 */
        D_ENCRYPT(r, l, 2);     /* 2 */
        D_ENCRYPT(l, r, 4);     /* 3 */
        D_ENCRYPT(r, l, 6);     /* 4 */
        D_ENCRYPT(l, r, 8);     /* 5 */
        D_ENCRYPT(r, l, 10);    /* 6 */
        D_ENCRYPT(l, r, 12);    /* 7 */
        D_ENCRYPT(r, l, 14);    /* 8 */
        D_ENCRYPT(l, r, 16);    /* 9 */
        D_ENCRYPT(r, l, 18);    /* 10 */
        D_ENCRYPT(l, r, 20);    /* 11 */
        D_ENCRYPT(r, l, 22);    /* 12 */
        D_ENCRYPT(l, r, 24);    /* 13 */
        D_ENCRYPT(r, l, 26);    /* 14 */
        D_ENCRYPT(l, r, 28);    /* 15 */
        D_ENCRYPT(r, l, 30);    /* 16 */
    } else {
        D_ENCRYPT(l, r, 30);    /* 16 */
        D_ENCRYPT(r, l, 28);    /* 15 */
        D_ENCRYPT(l, r, 26);    /* 14 */
        D_ENCRYPT(r, l, 24);    /* 13 */
        D_ENCRYPT(l, r, 22);    /* 12 */
        D_ENCRYPT(r, l, 20);    /* 11 */
        D_ENCRYPT(l, r, 18);    /* 10 */
        D_ENCRYPT(r, l, 16);    /* 9 */
        D_ENCRYPT(l, r, 14);    /* 8 */
        D_ENCRYPT(r, l, 12);    /* 7 */
        D_ENCRYPT(l, r, 10);    /* 6 */
        D_ENCRYPT(r, l, 8);     /* 5 */
        D_ENCRYPT(l, r, 6);     /* 4 */
        D_ENCRYPT(r, l, 4);     /* 3 */
        D_ENCRYPT(l, r, 2);     /* 2 */
        D_ENCRYPT(r, l, 0);     /* 1 */
    }

    /* rotate and clear the top bits on machines with 8byte longs */
    l = ROTATE(l, 3) & 0xffffffffL;
    r = ROTATE(r, 3) & 0xffffffffL;

    FP(r, l);
    data[0] = l;
    data[1] = r;
    l = r = t = u = 0;
}

void DES_encrypt2(DES_LONG *data, DES_key_schedule *ks, int enc)
{
    register DES_LONG l, r, t, u;
    register DES_LONG *s;

    r = data[0];
    l = data[1];

    /*
     * Things have been modified so that the initial rotate is done outside
     * the loop.  This required the DES_SPtrans values in sp.h to be rotated
     * 1 bit to the right. One perl script later and things have a 5% speed
     * up on a sparc2. Thanks to Richard Outerbridge
     * <71755.204@CompuServe.COM> for pointing this out.
     */
    /* clear the top bits on machines with 8byte longs */
    r = ROTATE(r, 29) & 0xffffffffL;
    l = ROTATE(l, 29) & 0xffffffffL;

    s = ks->ks->deslong;
    /*
     * I don't know if it is worth the effort of loop unrolling the inner
     * loop
     */
    if (enc) {
        D_ENCRYPT(l, r, 0);     /* 1 */
        D_ENCRYPT(r, l, 2);     /* 2 */
        D_ENCRYPT(l, r, 4);     /* 3 */
        D_ENCRYPT(r, l, 6);     /* 4 */
        D_ENCRYPT(l, r, 8);     /* 5 */
        D_ENCRYPT(r, l, 10);    /* 6 */
        D_ENCRYPT(l, r, 12);    /* 7 */
        D_ENCRYPT(r, l, 14);    /* 8 */
        D_ENCRYPT(l, r, 16);    /* 9 */
        D_ENCRYPT(r, l, 18);    /* 10 */
        D_ENCRYPT(l, r, 20);    /* 11 */
        D_ENCRYPT(r, l, 22);    /* 12 */
        D_ENCRYPT(l, r, 24);    /* 13 */
        D_ENCRYPT(r, l, 26);    /* 14 */
        D_ENCRYPT(l, r, 28);    /* 15 */
        D_ENCRYPT(r, l, 30);    /* 16 */
    } else {
        D_ENCRYPT(l, r, 30);    /* 16 */
        D_ENCRYPT(r, l, 28);    /* 15 */
        D_ENCRYPT(l, r, 26);    /* 14 */
        D_ENCRYPT(r, l, 24);    /* 13 */
        D_ENCRYPT(l, r, 22);    /* 12 */
        D_ENCRYPT(r, l, 20);    /* 11 */
        D_ENCRYPT(l, r, 18);    /* 10 */
        D_ENCRYPT(r, l, 16);    /* 9 */
        D_ENCRYPT(l, r, 14);    /* 8 */
        D_ENCRYPT(r, l, 12);    /* 7 */
        D_ENCRYPT(l, r, 10);    /* 6 */
        D_ENCRYPT(r, l, 8);     /* 5 */
        D_ENCRYPT(l, r, 6);     /* 4 */
        D_ENCRYPT(r, l, 4);     /* 3 */
        D_ENCRYPT(l, r, 2);     /* 2 */
        D_ENCRYPT(r, l, 0);     /* 1 */
    }
    /* rotate and clear the top bits on machines with 8byte longs */
    data[0] = ROTATE(l, 3) & 0xffffffffL;
    data[1] = ROTATE(r, 3) & 0xffffffffL;
    l = r = t = u = 0;
}

void DES_encrypt3(DES_LONG *data, DES_key_schedule *ks1,
                  DES_key_schedule *ks2, DES_key_schedule *ks3)
{
    register DES_LONG l, r;

    l = data[0];
    r = data[1];
    IP(l, r);
    data[0] = l;
    data[1] = r;
    DES_encrypt2((DES_LONG *)data, ks1, DES_ENCRYPT);
    DES_encrypt2((DES_LONG *)data, ks2, DES_DECRYPT);
    DES_encrypt2((DES_LONG *)data, ks3, DES_ENCRYPT);
    l = data[0];
    r = data[1];
    FP(r, l);
    data[0] = l;
    data[1] = r;
}

void DES_decrypt3(DES_LONG *data, DES_key_schedule *ks1,
                  DES_key_schedule *ks2, DES_key_schedule *ks3)
{
    register DES_LONG l, r;

    l = data[0];
    r = data[1];
    IP(l, r);
    data[0] = l;
    data[1] = r;
    DES_encrypt2((DES_LONG *)data, ks3, DES_DECRYPT);
    DES_encrypt2((DES_LONG *)data, ks2, DES_ENCRYPT);
    DES_encrypt2((DES_LONG *)data, ks1, DES_DECRYPT);
    l = data[0];
    r = data[1];
    FP(r, l);
    data[0] = l;
    data[1] = r;
}

#if 1 /* sudiptac: copied set key functionality from the respective file */

/*-
 * Weak and semi week keys as take from
 * %A D.W. Davies
 * %A W.L. Price
 * %T Security for Computer Networks
 * %I John Wiley & Sons
 * %D 1984
 * Many thanks to smb@ulysses.att.com (Steven Bellovin) for the reference
 * (and actual cblock values).
 */
#define NUM_WEAK_KEY    16
static const DES_cblock weak_keys[NUM_WEAK_KEY] = {
    /* weak keys */
    {0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01, 0x01},
    {0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE, 0xFE},
    {0x1F, 0x1F, 0x1F, 0x1F, 0x0E, 0x0E, 0x0E, 0x0E},
    {0xE0, 0xE0, 0xE0, 0xE0, 0xF1, 0xF1, 0xF1, 0xF1},
    /* semi-weak keys */
    {0x01, 0xFE, 0x01, 0xFE, 0x01, 0xFE, 0x01, 0xFE},
    {0xFE, 0x01, 0xFE, 0x01, 0xFE, 0x01, 0xFE, 0x01},
    {0x1F, 0xE0, 0x1F, 0xE0, 0x0E, 0xF1, 0x0E, 0xF1},
    {0xE0, 0x1F, 0xE0, 0x1F, 0xF1, 0x0E, 0xF1, 0x0E},
    {0x01, 0xE0, 0x01, 0xE0, 0x01, 0xF1, 0x01, 0xF1},
    {0xE0, 0x01, 0xE0, 0x01, 0xF1, 0x01, 0xF1, 0x01},
    {0x1F, 0xFE, 0x1F, 0xFE, 0x0E, 0xFE, 0x0E, 0xFE},
    {0xFE, 0x1F, 0xFE, 0x1F, 0xFE, 0x0E, 0xFE, 0x0E},
    {0x01, 0x1F, 0x01, 0x1F, 0x01, 0x0E, 0x01, 0x0E},
    {0x1F, 0x01, 0x1F, 0x01, 0x0E, 0x01, 0x0E, 0x01},
    {0xE0, 0xFE, 0xE0, 0xFE, 0xF1, 0xFE, 0xF1, 0xFE},
    {0xFE, 0xE0, 0xFE, 0xE0, 0xFE, 0xF1, 0xFE, 0xF1}
};

int DES_is_weak_key(const_DES_cblock *key)
{
    int i;

    for (i = 0; i < NUM_WEAK_KEY; i++)
        /*
         * Added == 0 to comparison, I obviously don't run this section very
         * often :-(, thanks to engineering@MorningStar.Com for the fix eay
         * 93/06/29 Another problem, I was comparing only the first 4 bytes,
         * 97/03/18
         */
        if (memcmp(weak_keys[i], key, sizeof(DES_cblock)) == 0)
            return (1);
    return (0);
}

/*-
 * NOW DEFINED IN des_local.h
 * See ecb_encrypt.c for a pseudo description of these macros.
 * #define PERM_OP(a,b,t,n,m) ((t)=((((a)>>(n))^(b))&(m)),\n *      (b)^=(t),\n *      (a)=((a)^((t)<<(n))))
 */

#define HPERM_OP(a,t,n,m) ((t)=((((a)<<(16-(n)))^(a))&(m)),\n        (a)=(a)^(t)^(t>>(16-(n))))

static const DES_LONG des_skb[8][64] = {
    {
     /* for C bits (numbered as per FIPS 46) 1 2 3 4 5 6 */
     0x00000000L, 0x00000010L, 0x20000000L, 0x20000010L,
     0x00010000L, 0x00010010L, 0x20010000L, 0x20010010L,
     0x00000800L, 0x00000810L, 0x20000800L, 0x20000810L,
     0x00010800L, 0x00010810L, 0x20010800L, 0x20010810L,
     0x00000020L, 0x00000030L, 0x20000020L, 0x20000030L,
     0x00010020L, 0x00010030L, 0x20010020L, 0x20010030L,
     0x00000820L, 0x00000830L, 0x20000820L, 0x20000830L,
     0x00010820L, 0x00010830L, 0x20010820L, 0x20010830L,
     0x00080000L, 0x00080010L, 0x20080000L, 0x20080010L,
     0x00090000L, 0x00090010L, 0x20090000L, 0x20090010L,
     0x00080800L, 0x00080810L, 0x20080800L, 0x20080810L,
     0x00090800L, 0x00090810L, 0x20090800L, 0x20090810L,
     0x00080020L, 0x00080030L, 0x20080020L, 0x20080030L,
     0x00090020L, 0x00090030L, 0x20090020L, 0x20090030L,
     0x00080820L, 0x00080830L, 0x20080820L, 0x20080830L,
     0x00090820L, 0x00090830L, 0x20090820L, 0x20090830L,
     },
    {
     /* for C bits (numbered as per FIPS 46) 7 8 10 11 12 13 */
     0x00000000L, 0x02000000L, 0x00002000L, 0x02002000L,
     0x00200000L, 0x02200000L, 0x00202000L, 0x02202000L,
     0x00000004L, 0x02000004L, 0x00002004L, 0x02002004L,
     0x00200004L, 0x02200004L, 0x00202004L, 0x02202004L,
     0x00000400L, 0x02000400L, 0x00002400L, 0x02002400L,
     0x00200400L, 0x02200400L, 0x00202400L, 0x02202400L,
     0x00000404L, 0x02000404L, 0x00002404L, 0x02002404L,
     0x00200404L, 0x02200404L, 0x00202404L, 0x02202404L,
     0x10000000L, 0x12000000L, 0x10002000L, 0x12002000L,
     0x10200000L, 0x12200000L, 0x10202000L, 0x12202000L,
     0x10000004L, 0x12000004L, 0x10002004L, 0x12002004L,
     0x10200004L, 0x12200004L, 0x10202004L, 0x12202004L,
     0x10000400L, 0x12000400L, 0x10002400L, 0x12002400L,
     0x10200400L, 0x12200400L, 0x10202400L, 0x12202400L,
     0x10000404L, 0x12000404L, 0x10002404L, 0x12002404L,
     0x10200404L, 0x12200404L, 0x10202404L, 0x12202404L,
     },
    {
     /* for C bits (numbered as per FIPS 46) 14 15 16 17 19 20 */
     0x00000000L, 0x00000001L, 0x00040000L, 0x00040001L,
     0x01000000L, 0x01000001L, 0x01040000L, 0x01040001L,
     0x00000002L, 0x00000003L, 0x00040002L, 0x00040003L,
     0x01000002L, 0x01000003L, 0x01040002L, 0x01040003L,
     0x00000200L, 0x00000201L, 0x00040200L, 0x00040201L,
     0x01000200L, 0x01000201L, 0x01040200L, 0x01040201L,
     0x00000202L, 0x00000203L, 0x00040202L, 0x00040203L,
     0x01000202L, 0x01000203L, 0x01040202L, 0x01040203L,
     0x08000000L, 0x08000001L, 0x08040000L, 0x08040001L,
     0x09000000L, 0x09000001L, 0x09040000L, 0x09040001L,
     0x08000002L, 0x08000003L, 0x08040002L, 0x08040003L,
     0x09000002L, 0x09000003L, 0x09040002L, 0x09040003L,
     0x08000200L, 0x08000201L, 0x08040200L, 0x08040201L,
     0x09000200L, 0x09000201L, 0x09040200L, 0x09040201L,
     0x08000202L, 0x08000203L, 0x08040202L, 0x08040203L,
     0x09000202L, 0x09000203L, 0x09040202L, 0x09040203L,
     },
    {
     /* for C bits (numbered as per FIPS 46) 21 23 24 26 27 28 */
     0x00000000L, 0x00100000L, 0x00000100L, 0x00100100L,
     0x00000008L, 0x00100008L, 0x00000108L, 0x00100108L,
     0x00001000L, 0x00101000L, 0x00001100L, 0x00101100L,
     0x00001008L, 0x00101008L, 0x00001108L, 0x00101108L,
     0x04000000L, 0x04100000L, 0x04000100L, 0x04100100L,
     0x04000008L, 0x04100008L, 0x04000108L, 0x04100108L,
     0x04001000L, 0x04101000L, 0x04001100L, 0x04101100L,
     0x04001008L, 0x04101008L, 0x04001108L, 0x04101108L,
     0x00020000L, 0x00120000L, 0x00020100L, 0x00120100L,
     0x00020008L, 0x00120008L, 0x00020108L, 0x00120108L,
     0x00021000L, 0x00121000L, 0x00021100L, 0x00121100L,
     0x00021008L, 0x00121008L, 0x00021108L, 0x00121108L,
     0x04020000L, 0x04120000L, 0x04020100L, 0x04120100L,
     0x04020008L, 0x04120008L, 0x04020108L, 0x04120108L,
     0x04021000L, 0x04121000L, 0x04021100L, 0x04121100L,
     0x04021008L, 0x04121008L, 0x04021108L, 0x04121108L,
     },
    {
     /* for D bits (numbered as per FIPS 46) 1 2 3 4 5 6 */
     0x00000000L, 0x10000000L, 0x00010000L, 0x10010000L,
     0x00000004L, 0x10000004L, 0x00010004L, 0x10010004L,
     0x20000000L, 0x30000000L, 0x20010000L, 0x30010000L,
     0x20000004L, 0x30000004L, 0x20010004L, 0x30010004L,
     0x00100000L, 0x10100000L, 0x00110000L, 0x10110000L,
     0x00100004L, 0x10100004L, 0x00110004L, 0x10110004L,
     0x20100000L, 0x30100000L, 0x20110000L, 0x30110000L,
     0x20100004L, 0x30100004L, 0x20110004L, 0x30110004L,
     0x00001000L, 0x10001000L, 0x00011000L, 0x10011000L,
     0x00001004L, 0x10001004L, 0x00011004L, 0x10011004L,
     0x20001000L, 0x30001000L, 0x20011000L, 0x30011000L,
     0x20001004L, 0x30001004L, 0x20011004L, 0x30011004L,
     0x00101000L, 0x10101000L, 0x00111000L, 0x10111000L,
     0x00101004L, 0x10101004L, 0x00111004L, 0x10111004L,
     0x20101000L, 0x30101000L, 0x20111000L, 0x30111000L,
     0x20101004L, 0x30101004L, 0x20111004L, 0x30111004L,
     },
    {
     /* for D bits (numbered as per FIPS 46) 8 9 11 12 13 14 */
     0x00000000L, 0x08000000L, 0x00000008L, 0x08000008L,
     0x00000400L, 0x08000400L, 0x00000408L, 0x08000408L,
     0x00020000L, 0x08020000L, 0x00020008L, 0x08020008L,
     0x00020400L, 0x08020400L, 0x00020408L, 0x08020408L,
     0x00000001L, 0x08000001L, 0x00000009L, 0x08000009L,
     0x00000401L, 0x08000401L, 0x00000409L, 0x08000409L,
     0x00020001L, 0x08020001L, 0x00020009L, 0x08020009L,
     0x00020401L, 0x08020401L, 0x00020409L, 0x08020409L,
     0x02000000L, 0x0A000000L, 0x02000008L, 0x0A000008L,
     0x02000400L, 0x0A000400L, 0x02000408L, 0x0A000408L,
     0x02020000L, 0x0A020000L, 0x02020008L, 0x0A020008L,
     0x02020400L, 0x0A020400L, 0x02020408L, 0x0A020408L,
     0x02000001L, 0x0A000001L, 0x02000009L, 0x0A000009L,
     0x02000401L, 0x0A000401L, 0x02000409L, 0x0A000409L,
     0x02020001L, 0x0A020001L, 0x02020009L, 0x0A020009L,
     0x02020401L, 0x0A020401L, 0x02020409L, 0x0A020409L,
     },
    {
     /* for D bits (numbered as per FIPS 46) 16 17 18 19 20 21 */
     0x00000000L, 0x00000100L, 0x00080000L, 0x00080100L,
     0x01000000L, 0x01000100L, 0x01080000L, 0x01080100L,
     0x00000010L, 0x00000110L, 0x00080010L, 0x00080110L,
     0x01000010L, 0x01000110L, 0x01080010L, 0x01080110L,
     0x00200000L, 0x00200100L, 0x00280000L, 0x00280100L,
     0x01200000L, 0x01200100L, 0x01280000L, 0x01280100L,
     0x00200010L, 0x00200110L, 0x00280010L, 0x00280110L,
     0x01200010L, 0x01200110L, 0x01280010L, 0x01280110L,
     0x00000200L, 0x00000300L, 0x00080200L, 0x00080300L,
     0x01000200L, 0x01000300L, 0x01080200L, 0x01080300L,
     0x00000210L, 0x00000310L, 0x00080210L, 0x00080310L,
     0x01000210L, 0x01000310L, 0x01080210L, 0x01080310L,
     0x00200200L, 0x00200300L, 0x00280200L, 0x00280300L,
     0x01200200L, 0x01200300L, 0x01280200L, 0x01280300L,
     0x00200210L, 0x00200310L, 0x00280210L, 0x00280310L,
     0x01200210L, 0x01200310L, 0x01280210L, 0x01280310L,
     },
    {
     /* for D bits (numbered as per FIPS 46) 22 23 24 25 27 28 */
     0x00000000L, 0x04000000L, 0x00040000L, 0x04040000L,
     0x00000002L, 0x04000002L, 0x00040002L, 0x04040002L,
     0x00002000L, 0x04002000L, 0x00042000L, 0x04042000L,
     0x00002002L, 0x04002002L, 0x00042002L, 0x04042002L,
     0x00000020L, 0x04000020L, 0x00040020L, 0x04040020L,
     0x00000022L, 0x04000022L, 0x00040022L, 0x04040022L,
     0x00002020L, 0x04002020L, 0x00042020L, 0x04042020L,
     0x00002022L, 0x04002022L, 0x00042022L, 0x04042022L,
     0x00000800L, 0x04000800L, 0x00040800L, 0x04040800L,
     0x00000802L, 0x04000802L, 0x00040802L, 0x04040802L,
     0x00002800L, 0x04002800L, 0x00042800L, 0x04042800L,
     0x00002802L, 0x04002802L, 0x00042802L, 0x04042802L,
     0x00000820L, 0x04000820L, 0x00040820L, 0x04040820L,
     0x00000822L, 0x04000822L, 0x00040822L, 0x04040822L,
     0x00002820L, 0x04002820L, 0x00042820L, 0x04042820L,
     0x00002822L, 0x04002822L, 0x00042822L, 0x04042822L,
     }
};

void DES_set_key_unchecked(const_DES_cblock *key, DES_key_schedule *schedule)
{
    static const int shifts2[16] =
        { 0, 0, 1, 1, 1, 1, 1, 1, 0, 1, 1, 1, 1, 1, 1, 0 };
    register DES_LONG c, d, t, s, t2;
    register const unsigned char *in;
    register DES_LONG *k;
    register int i;

#ifdef OPENBSD_DEV_CRYPTO
    memcpy(schedule->key, key, sizeof schedule->key);
    schedule->session = NULL;
#endif
    k = &schedule->ks->deslong[0];
    in = &(*key)[0];

    c2l(in, c);
    c2l(in, d);

    /*
     * do PC1 in 47 simple operations :-) Thanks to John Fletcher
     * (john_fletcher@lccmail.ocf.llnl.gov) for the inspiration. :-)
     */
    PERM_OP(d, c, t, 4, 0x0f0f0f0fL);
    HPERM_OP(c, t, -2, 0xcccc0000L);
    HPERM_OP(d, t, -2, 0xcccc0000L);
    PERM_OP(d, c, t, 1, 0x55555555L);
    PERM_OP(c, d, t, 8, 0x00ff00ffL);
    PERM_OP(d, c, t, 1, 0x55555555L);
    d = (((d & 0x000000ffL) << 16L) | (d & 0x0000ff00L) |
         ((d & 0x00ff0000L) >> 16L) | ((c & 0xf0000000L) >> 4L));
    c &= 0x0fffffffL;

    for (i = 0; i < ITERATIONS; i++) {
        if (shifts2[i]) {
            c = ((c >> 2L) | (c << 26L));
            d = ((d >> 2L) | (d << 26L));
        } else {
            c = ((c >> 1L) | (c << 27L));
            d = ((d >> 1L) | (d << 27L));
        }
        c &= 0x0fffffffL;
        d &= 0x0fffffffL;
        /*
         * could be a few less shifts but I am to lazy at this point in time
         * to investigate
         */
        s = des_skb[0][(c) & 0x3f] |
            des_skb[1][((c >> 6L) & 0x03) | ((c >> 7L) & 0x3c)] |
            des_skb[2][((c >> 13L) & 0x0f) | ((c >> 14L) & 0x30)] |
            des_skb[3][((c >> 20L) & 0x01) | ((c >> 21L) & 0x06) |
                       ((c >> 22L) & 0x38)];
        t = des_skb[4][(d) & 0x3f] |
            des_skb[5][((d >> 7L) & 0x03) | ((d >> 8L) & 0x3c)] |
            des_skb[6][(d >> 15L) & 0x3f] |
            des_skb[7][((d >> 21L) & 0x0f) | ((d >> 22L) & 0x30)];

        /* table contained 0213 4657 */
        t2 = ((t << 16L) | (s & 0x0000ffffL)) & 0xffffffffL;
        *(k++) = ROTATE(t2, 30) & 0xffffffffL;

        t2 = ((s >> 16L) | (t & 0xffff0000L));
        *(k++) = ROTATE(t2, 26) & 0xffffffffL;
    }
}

#endif

/* sudiptac: end copy of set key functionality */


/* sudiptac: copied ECB functionality from the respective file */
void DES_ecb_encrypt(const_DES_cblock *input, DES_cblock *output,
                     DES_key_schedule *ks, int enc)
{
    register DES_LONG l;
    DES_LONG ll[2];
    const unsigned char *in = &(*input)[0];
    unsigned char *out = &(*output)[0];

    c2l(in, l);
    ll[0] = l;
    c2l(in, l);
    ll[1] = l;
    DES_encrypt1(ll, ks, enc);
    l = ll[0];
    l2c(l, out);
    l = ll[1];
    l2c(l, out);
    l = ll[0] = ll[1] = 0;
}

/* sudiptac: adding a main function for DES testing */

int main(int argc, char *argv[])
{
    int j, err = 0;
    unsigned int i;
    DES_cblock in, out;
    DES_key_schedule ks;
    /* DES key */
    unsigned char key_data[8] = {5,5,5,5,5,5,5,5};

    long a_fd, m_fd;
    long long accesses, misses;


    /*initializing and starting perf*/
    struct perf_event_attr pe;
    memset(&pe, 0, sizeof(struct perf_event_attr));

    /*group*/
    pe.type = PERF_TYPE_HW_CACHE;
    pe.size = sizeof(struct perf_event_attr);
    pe.config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_ACCESS << 16);
    pe.disabled = 1;
    pe.exclude_kernel = 1;
    pe.exclude_hv = 1;
    a_fd = syscall(__NR_perf_event_open, &pe, 0, -1, -1, 0);
    if (a_fd < 0)
        return -1;
    
    /*child*/
    pe.disabled = 0;
    pe.config = PERF_COUNT_HW_CACHE_L1D | (PERF_COUNT_HW_CACHE_OP_READ << 8) | (PERF_COUNT_HW_CACHE_RESULT_MISS << 16);
    m_fd = syscall(__NR_perf_event_open, &pe, 0, -1, a_fd, 0);

    /*enable and start perf*/
    ioctl(a_fd, PERF_EVENT_IOC_RESET, 0);
    ioctl(a_fd, PERF_EVENT_IOC_ENABLE, 0);

    /*start of section - activity to measure*/
    DES_set_key_unchecked(&key_data, &ks);
    memcpy(in, plain_data[0], 8);
   	DES_ecb_encrypt(&in, &out, &ks, DES_ENCRYPT);
    /*end of section - activity to measure*/

    /*stopping perf*/
    ioctl(m_fd, PERF_EVENT_IOC_DISABLE, 0);
    
    /*reading outputs and printing them*/
    read(m_fd, &misses, sizeof(long long));
    read(a_fd, &accesses, sizeof(long long));
    printf("%lld\n", accesses);
    printf("%lld\n", misses);

    /*cleanup and exit*/
    close(m_fd);
    close(a_fd);
    return 0;
}