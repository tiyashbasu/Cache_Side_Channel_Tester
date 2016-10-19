rm -f ./aes-keys.csv
./afl-g++ -o ./aes-native/afl-aes.o ./aes-native/aes.c
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_SKIP_CPUFREQ=1
#export AFL_SKIP_CRASHES=1
export AFL_HARDEN=1
./afl-fuzz -i ./aes-native/afl-in -o ./aes-native/afl-out -f ./aes-native/afl-mutations ./aes-native/afl-aes.o @@
