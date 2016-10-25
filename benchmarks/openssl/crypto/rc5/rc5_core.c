/*
 * Copyright 1995-2016 The OpenSSL Project Authors. All Rights Reserved.
 *
 * Licensed under the OpenSSL license (the "License").  You may not use
 * this file except in compliance with the License.  You can obtain a copy
 * in the file LICENSE in the source distribution or at
 * https://www.openssl.org/source/license.html
 */

#include <stdio.h>
#include <openssl/rc5.h>
#include "rc5_locl.h"

static unsigned char RC5plain[5][8] = {
    {0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00},
    {0x21, 0xA5, 0xDB, 0xEE, 0x15, 0x4B, 0x8F, 0x6D},
    {0xF7, 0xC0, 0x13, 0xAC, 0x5B, 0x2B, 0x89, 0x52},
    {0x2F, 0x42, 0xB3, 0xB7, 0x03, 0x69, 0xFC, 0x92},
    {0x65, 0xC1, 0x78, 0xB2, 0x84, 0xD1, 0x97, 0xCC},
};

void RC5_32_cbc_encrypt(const unsigned char *in, unsigned char *out,
                        long length, RC5_32_KEY *ks, unsigned char *iv,
                        int encrypt)
{
    register unsigned long tin0, tin1;
    register unsigned long tout0, tout1, xor0, xor1;
    register long l = length;
    unsigned long tin[2];

    if (encrypt) {
        c2l(iv, tout0);
        c2l(iv, tout1);
        iv -= 8;
        for (l -= 8; l >= 0; l -= 8) {
            c2l(in, tin0);
            c2l(in, tin1);
            tin0 ^= tout0;
            tin1 ^= tout1;
            tin[0] = tin0;
            tin[1] = tin1;
            RC5_32_encrypt(tin, ks);
            tout0 = tin[0];
            l2c(tout0, out);
            tout1 = tin[1];
            l2c(tout1, out);
        }
        if (l != -8) {
            c2ln(in, tin0, tin1, l + 8);
            tin0 ^= tout0;
            tin1 ^= tout1;
            tin[0] = tin0;
            tin[1] = tin1;
            RC5_32_encrypt(tin, ks);
            tout0 = tin[0];
            l2c(tout0, out);
            tout1 = tin[1];
            l2c(tout1, out);
        }
        l2c(tout0, iv);
        l2c(tout1, iv);
    } else {
        c2l(iv, xor0);
        c2l(iv, xor1);
        iv -= 8;
        for (l -= 8; l >= 0; l -= 8) {
            c2l(in, tin0);
            tin[0] = tin0;
            c2l(in, tin1);
            tin[1] = tin1;
            RC5_32_decrypt(tin, ks);
            tout0 = tin[0] ^ xor0;
            tout1 = tin[1] ^ xor1;
            l2c(tout0, out);
            l2c(tout1, out);
            xor0 = tin0;
            xor1 = tin1;
        }
        if (l != -8) {
            c2l(in, tin0);
            tin[0] = tin0;
            c2l(in, tin1);
            tin[1] = tin1;
            RC5_32_decrypt(tin, ks);
            tout0 = tin[0] ^ xor0;
            tout1 = tin[1] ^ xor1;
            l2cn(tout0, tout1, out, l + 8);
            xor0 = tin0;
            xor1 = tin1;
        }
        l2c(xor0, iv);
        l2c(xor1, iv);
    }
    tin0 = tin1 = tout0 = tout1 = xor0 = xor1 = 0;
    tin[0] = tin[1] = 0;
}

void RC5_32_encrypt(unsigned long *d, RC5_32_KEY *key)
{
    RC5_32_INT a, b, *s;

    s = key->data;

    a = d[0] + s[0];
    b = d[1] + s[1];
    E_RC5_32(a, b, s, 2);
    E_RC5_32(a, b, s, 4);
    E_RC5_32(a, b, s, 6);
    E_RC5_32(a, b, s, 8);
    E_RC5_32(a, b, s, 10);
    E_RC5_32(a, b, s, 12);
    E_RC5_32(a, b, s, 14);
    E_RC5_32(a, b, s, 16);
    if (key->rounds == 12) {
        E_RC5_32(a, b, s, 18);
        E_RC5_32(a, b, s, 20);
        E_RC5_32(a, b, s, 22);
        E_RC5_32(a, b, s, 24);
    } else if (key->rounds == 16) {
        /* Do a full expansion to avoid a jump */
        E_RC5_32(a, b, s, 18);
        E_RC5_32(a, b, s, 20);
        E_RC5_32(a, b, s, 22);
        E_RC5_32(a, b, s, 24);
        E_RC5_32(a, b, s, 26);
        E_RC5_32(a, b, s, 28);
        E_RC5_32(a, b, s, 30);
        E_RC5_32(a, b, s, 32);
    }
    d[0] = a;
    d[1] = b;
}

void RC5_32_decrypt(unsigned long *d, RC5_32_KEY *key)
{
    RC5_32_INT a, b, *s;

    s = key->data;

    a = d[0];
    b = d[1];
    if (key->rounds == 16) {
        D_RC5_32(a, b, s, 32);
        D_RC5_32(a, b, s, 30);
        D_RC5_32(a, b, s, 28);
        D_RC5_32(a, b, s, 26);
        /* Do a full expansion to avoid a jump */
        D_RC5_32(a, b, s, 24);
        D_RC5_32(a, b, s, 22);
        D_RC5_32(a, b, s, 20);
        D_RC5_32(a, b, s, 18);
    } else if (key->rounds == 12) {
        D_RC5_32(a, b, s, 24);
        D_RC5_32(a, b, s, 22);
        D_RC5_32(a, b, s, 20);
        D_RC5_32(a, b, s, 18);
    }
    D_RC5_32(a, b, s, 16);
    D_RC5_32(a, b, s, 14);
    D_RC5_32(a, b, s, 12);
    D_RC5_32(a, b, s, 10);
    D_RC5_32(a, b, s, 8);
    D_RC5_32(a, b, s, 6);
    D_RC5_32(a, b, s, 4);
    D_RC5_32(a, b, s, 2);
    d[0] = a - s[0];
    d[1] = b - s[1];
}

/* sudiptac: copied RC5_ecb functionality from the respective file */
void RC5_32_ecb_encrypt(const unsigned char *in, unsigned char *out,
                        RC5_32_KEY *ks, int encrypt)
{
    unsigned long l, d[2];

    c2l(in, l);
    d[0] = l;
    c2l(in, l);
    d[1] = l;
    if (encrypt)
        RC5_32_encrypt(d, ks);
    else
        RC5_32_decrypt(d, ks);
    l = d[0];
    l2c(l, out);
    l = d[1];
    l2c(l, out);
    l = d[0] = d[1] = 0;
}

/* sudiptac: copied RC5 set-key functionality from the respective file */
void RC5_32_set_key(RC5_32_KEY *key, int len, const unsigned char *data,
                    int rounds)
{
    RC5_32_INT L[64], l, ll, A, B, *S, k;
    int i, j, m, c, t, ii, jj;

    if ((rounds != RC5_16_ROUNDS) &&
        (rounds != RC5_12_ROUNDS) && (rounds != RC5_8_ROUNDS))
        rounds = RC5_16_ROUNDS;

    key->rounds = rounds;
    S = &(key->data[0]);
    j = 0;
    for (i = 0; i <= (len - 8); i += 8) {
        c2l(data, l);
        L[j++] = l;
        c2l(data, l);
        L[j++] = l;
    }
    ii = len - i;
    if (ii) {
        k = len & 0x07;
        c2ln(data, l, ll, k);
        L[j + 0] = l;
        L[j + 1] = ll;
    }

    c = (len + 3) / 4;
    t = (rounds + 1) * 2;
    S[0] = RC5_32_P;
    for (i = 1; i < t; i++)
        S[i] = (S[i - 1] + RC5_32_Q) & RC5_32_MASK;

    j = (t > c) ? t : c;
    j *= 3;
    ii = jj = 0;
    A = B = 0;
    for (i = 0; i < j; i++) {
        k = (S[ii] + A + B) & RC5_32_MASK;
        A = S[ii] = ROTATE_l32(k, 3);
        m = (int)(A + B);
        k = (L[jj] + A + B) & RC5_32_MASK;
        B = L[jj] = ROTATE_l32(k, m);
        if (++ii >= t)
            ii = 0;
        if (++jj >= c)
            jj = 0;
    }
}

/* sudiptac: RC5 main function for testing */
int main(int argc, char *argv[])
{
    int i, n, err = 0;
    RC5_32_KEY key;
    unsigned char buf[8], buf2[8], ivb[8];
		unsigned char RC5key[16];

		klee_make_symbolic(RC5key, 16 * sizeof(RC5key[0]), "RC5key");
        
		RC5_32_set_key(&key, 16, &(RC5key[0]), 12);

    RC5_32_ecb_encrypt(&(RC5plain[0][0]), buf, &key, RC5_ENCRYPT);


		return err;
}		
