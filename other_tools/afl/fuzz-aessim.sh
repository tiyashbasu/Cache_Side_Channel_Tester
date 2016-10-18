export AFL_CC='./aessim/cde-package/sslittle-na-sstrix-gcc.cde'
./afl-gcc -o aes.o src/aes.c
mv ./aessim/cde-package/cde-root/aes.o ./aessim
export AFL_I_DONT_CARE_ABOUT_MISSING_CRASHES=1
export AFL_SKIP_CRASHES=1
export AFL_SKIP_CPUFREQ=1
./afl-fuzz -i ./aessim/in -o ./aessim-out -f ./aessim/mutated_inputs ./aessim/aes.o
