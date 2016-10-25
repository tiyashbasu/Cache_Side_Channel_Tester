/*
 * Copyright 1995-2016 The OpenSSL Project Authors. All Rights Reserved.
 *
 * Licensed under the OpenSSL license (the "License").  You may not use
 * this file except in compliance with the License.  You can obtain a copy
 * in the file LICENSE in the source distribution or at
 * https://www.openssl.org/source/license.html
 */

/*
 * NOTE: this file was auto generated by the mkerr.pl script: any changes
 * made to it will be overwritten when the script next updates this file,
 * only reason strings will be preserved.
 */

#include <stdio.h>
#include <openssl/err.h>
#include <openssl/rand.h>

/* BEGIN ERROR CODES */
#ifndef OPENSSL_NO_ERR

# define ERR_FUNC(func) ERR_PACK(ERR_LIB_RAND,func,0)
# define ERR_REASON(reason) ERR_PACK(ERR_LIB_RAND,0,reason)

static ERR_STRING_DATA RAND_str_functs[] = {
    {ERR_FUNC(RAND_F_FIPS_RAND), "FIPS_RAND"},
    {ERR_FUNC(RAND_F_FIPS_RAND_SET_DT), "FIPS_RAND_SET_DT"},
    {ERR_FUNC(RAND_F_FIPS_SET_PRNG_SEED), "FIPS_SET_PRNG_SEED"},
    {ERR_FUNC(RAND_F_FIPS_SET_TEST_MODE), "FIPS_SET_TEST_MODE"},
    {ERR_FUNC(RAND_F_FIPS_X931_SET_DT), "FIPS_x931_set_dt"},
    {ERR_FUNC(RAND_F_RAND_BYTES), "RAND_bytes"},
    {ERR_FUNC(RAND_F_RAND_GET_RAND_METHOD), "RAND_get_rand_method"},
    {0, NULL}
};

static ERR_STRING_DATA RAND_str_reasons[] = {
    {ERR_REASON(RAND_R_NOT_IN_TEST_MODE), "not in test mode"},
    {ERR_REASON(RAND_R_NO_KEY_SET), "no key set"},
    {ERR_REASON(RAND_R_PRNG_ERROR), "prng error"},
    {ERR_REASON(RAND_R_PRNG_KEYED), "prng keyed"},
    {ERR_REASON(RAND_R_PRNG_NOT_SEEDED), "PRNG not seeded"},
    {ERR_REASON(RAND_R_PRNG_SEED_MUST_NOT_MATCH_KEY),
     "prng seed must not match key"},
    {ERR_REASON(RAND_R_PRNG_STUCK), "prng stuck"},
    {0, NULL}
};

#endif

void ERR_load_RAND_strings(void)
{
#ifndef OPENSSL_NO_ERR

    if (ERR_func_error_string(RAND_str_functs[0].error) == NULL) {
        ERR_load_strings(0, RAND_str_functs);
        ERR_load_strings(0, RAND_str_reasons);
    }
#endif
}
