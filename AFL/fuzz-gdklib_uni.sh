rm -f ./gdklib_uni.csv
./afl-g++ -o ./test_sources/gdklib_uni ./test_sources/gdklib_uni.c
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_SKIP_CPUFREQ=1
#export AFL_SKIP_CRASHES=1
export AFL_HARDEN=1
./afl-fuzz -i ./test_sources/gdklib-in -o ./test_sources/gdklib-out -f ./test_sources/gdklib-name-mutations ./test_sources/gdklib_uni @@