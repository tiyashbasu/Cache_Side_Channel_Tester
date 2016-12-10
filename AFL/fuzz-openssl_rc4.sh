rm -f ./openssl_rc4.csv
./afl-g++ -o ./test_sources/openssl_rc4 ./test_sources/openssl_rc4.c
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_SKIP_CPUFREQ=1
#export AFL_SKIP_CRASHES=1
export AFL_HARDEN=1
./afl-fuzz -i ./test_sources/rc4-in -o ./test_sources/rc4-out -f ./test_sources/afl-mutations ./test_sources/openssl_rc4 @@
