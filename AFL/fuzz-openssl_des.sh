rm -f ./openssl_des.csv
./afl-g++ -o ./test_sources/openssl_des ./test_sources/openssl_des.c
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_SKIP_CPUFREQ=1
#export AFL_SKIP_CRASHES=1
export AFL_HARDEN=1
./afl-fuzz -i ./test_sources/des-in -o ./test_sources/des-out -f ./test_sources/afl-mutations ./test_sources/openssl_des @@
