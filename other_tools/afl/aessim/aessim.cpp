#include <cstdlib>
#include <fstream>
#include <iostream>

int main(int argc, char *argv[]) {
    /*checking argument sanity*/
    if (argc < 2) {
        std::cout << "Usage: aessim-<file/all/lm/sm/dm> <csv file>\nExample #1: aessim-file key.csv\n";
        return 1;
    }

    /*preparing aes.c source file*/
    std::string command = "cat ./data/aes.c.prefix ";
    command += argv[1];
    command += " ./data/aes.c.suffix > ./data/aes.c";
    system(command.data());

    /*cross compiling aes.c*/
    system("cp ./data/aes.c ./cde-package/cde-root/src");
    system("./cde-package/sslittle-na-sstrix-gcc.cde -o aes.o src/aes.c");
    system("mv -f ./cde-package/cde-root/aes.o ./data");

    /*getting cache miss outputs*/
    system("./simplescalar/sim-outorder -config ./simplescalar/processor.config ./data/aes.o > ./data/sim-outorder.log 2>&1");
#if defined FILES
	system("grep \'data accesses\' ./data/sim-outorder.log | cut -d\" \" -f10 > ./data/da.log");
	system("grep \'load misses\' ./data/sim-outorder.log | cut -d\" \" -f12 > ./data/lm.log");
	system("grep \'store misses\' ./data/sim-outorder.log | cut -d\" \" -f11 > ./data/sm.log");
	system("grep \'dcache misses\' ./data/sim-outorder.log | cut -d\" \" -f10 > ./data/dm.log");
    command = "sed 's/,/\\t/g' ";
    command += argv[1];
    command += " > ./data/keys.txt";
	system(command.data());
	system("paste ./data/keys.txt ./data/da.log ./data/lm.log ./data/sm.log ./data/dm.log >> aessim-results.log");
#elif defined ALL
	system("grep \'data accesses\' ./data/sim-outorder.log | cut -d\" \" -f10 > ./data/da.log");
	system("grep \'load misses\' ./data/sim-outorder.log | cut -d\" \" -f12 > ./data/lm.log");
	system("grep \'store misses\' ./data/sim-outorder.log | cut -d\" \" -f11 > ./data/sm.log");
	system("grep \'dcache misses\' ./data/sim-outorder.log | cut -d\" \" -f10 > ./data/dm.log");
    system("paste ./data/da.log ./data/lm.log ./data/sm.log ./data/dm.log");
#elif defined DM
	system("grep \'dcache misses\' ./data/sim-outorder.log | cut -d\" \" -f10");
#elif defined LM
	system("grep \'load misses\' ./data/sim-outorder.log | cut -d\" \" -f12");
#elif defined SM
	system("grep \'store misses\' ./data/sim-outorder.log | cut -d\" \" -f11");
#endif
	system("rm ./data/sim-outorder.log");
    return 0;
}
