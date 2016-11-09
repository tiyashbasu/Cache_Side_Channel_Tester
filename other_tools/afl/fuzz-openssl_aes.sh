rm -f ./openssl_aes.csv
./afl-g++ -o ./test_sources/openssl_aes ./test_sources/openssl_aes.c
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_SKIP_CPUFREQ=1
#export AFL_SKIP_CRASHES=1
export AFL_HARDEN=1
./afl-fuzz -i ./test_sources/afl-in -o ./test_sources/afl-out -f ./test_sources/openssl_aes-mutations ./test_sources/openssl_aes @@
