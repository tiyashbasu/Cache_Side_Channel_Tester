rm -f ./aessim aessim-results.log
./afl-g++ -o ./aessim/afl-aessim-file -D FILES ./aessim/aessim.cpp
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_SKIP_CPUFREQ=1
#export AFL_SKIP_CRASHES=1
./afl-fuzz -i ./aessim/afl-in -o ./aessim/afl-out -f ./aessim/afl-mutations ./aessim/afl-aessim-file @@
