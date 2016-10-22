#include <cstdlib>
#include <fstream>
#include <iostream>
#include <chrono>
#include <string.h>
#include <thread>

int strtoi(std::string str) {
    bool alphanumeric;
    for (char c : str) {
        alphanumeric = (c < 48 || c > 57);
        if (alphanumeric)
            break;
    }
    if (!alphanumeric)
        return std::stoi(str) % 256;
    return str[str.length() - 1];
}

int main(int argc, char *argv[]) {
    /*checking argument sanity*/
    if (argc < 17) {
        std::cerr << "Usage: aessim-<file/all/lm/sm/dm> <key bytes>\nExample #1: aessim-file 1 2 3 4 1 2 3 4 1 2 3 4 1 2 3 4\n";
        return 1;
    }
    std::chrono::microseconds ms = std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch());
    std::string ms_str = std::to_string(ms.count());
    const char* ms_ch = ms_str.data();
    char cmd[255];

    /*creating execution folder*/
    std::remove("mkdir.log");
    strcat(strcat(strcpy(cmd, "mkdir ./data/"), ms_ch), ">>mkdir.log 2>&1");
    int status = system(cmd);
    if (status) {
        std::this_thread::sleep_for(std::chrono::milliseconds(30));
        ms_str = std::to_string(std::chrono::duration_cast<std::chrono::microseconds>(std::chrono::system_clock::now().time_since_epoch()).count());
        ms_ch = ms_str.data();
        status = system(strcat(strcpy(cmd, "mkdir ./data/"), ms_ch));
        if (status) {
            std::cout << "\nUnable to create " + ms_str << " directory.\n";
            return 0;
        }
    }

    /*preparing aes.c source file*/
    std::ofstream keys_file;
    std::string key_filename = "./data/"+ms_str+"/key.csv";
    keys_file.open(key_filename, std::ios::out);
    keys_file << std::to_string(strtoi(argv[1]));
    for (int i = 2; i < 17; i++)
        keys_file << "," << std::to_string(strtoi(argv[i]));
    keys_file.close();
    strcat(strcat(strcat(strcat(strcpy(cmd, "cat ./data/aes.c.prefix ./data/"), ms_ch), "/key.csv ./data/aes.c.suffix > ./data/"), ms_ch), "/aes.c");
    system(cmd);
    /*cross compiling aes.c*/
    strcat(strcat(strcat(strcat(strcpy(cmd, "cp ./data/"), ms_ch), "/aes.c ./cde-package/cde-root/src/"), ms_ch), ".c");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "./cde-package/sslittle-na-sstrix-gcc.cde -o "), ms_ch), ".o src/"), ms_ch), ".c");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "mv -f ./cde-package/cde-root/"), ms_ch), ".o ./data/"), ms_ch), "/aes.o");
    system(cmd);

    /*getting cache miss outputs*/
    strcat(strcat(strcat(strcat(strcpy(cmd, "./simplescalar/sim-outorder -config ./simplescalar/processor.config ./data/"), ms_ch), "/aes.o > ./data/"), ms_ch), "/sim-outorder.log 2>&1");
    system(cmd);
#if defined FILES
    strcat(strcat(strcat(strcat(strcpy(cmd, "grep \'data accesses\' ./data/"), ms_ch), "/sim-outorder.log | cut -d\" \" -f10 > ./data/"), ms_ch), "/da.log");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "grep \'load misses\' ./data/"), ms_ch), "/sim-outorder.log | cut -d\" \" -f12 > ./data/"), ms_ch), "/lm.log");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "grep \'store misses\' ./data/"), ms_ch), "/sim-outorder.log | cut -d\" \" -f11 > ./data/"), ms_ch), "/sm.log");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "grep \'dcache misses\' ./data/"), ms_ch), "/sim-outorder.log | cut -d\" \" -f10 > ./data/"), ms_ch), "/dm.log");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "sed 's/,/'\\\\t'/g' ./data/"), ms_ch), "/key.csv > ./data/"), ms_ch), "/keys.txt");
    system(cmd);
    strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcpy(cmd, "paste ./data/"), ms_ch), "/keys.txt ./data/"), ms_ch), "/da.log ./data/"), ms_ch), "/lm.log ./data/"), ms_ch), "/sm.log ./data/"), ms_ch), "/dm.log >> aessim-results.log");
    system(cmd);
#elif defined ALL
    strcat(strcat(strcat(strcat(strcpy(cmd, "grep \'data accesses\' ./data/"), ms_ch), "/sim-outorder.log | cut -d\" \" -f10 > ./data/"), ms_ch), "/da.log");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "grep \'load misses\' ./data/"), ms_ch), "/sim-outorder.log | cut -d\" \" -f12 > ./data/"), ms_ch), "/lm.log");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "grep \'store misses\' ./data/"), ms_ch), "/sim-outorder.log | cut -d\" \" -f11 > ./data/"), ms_ch), "/sm.log");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "grep \'dcache misses\' ./data/"), ms_ch), "/sim-outorder.log | cut -d\" \" -f10 > ./data/"), ms_ch), "/dm.log");
    system(cmd);
    strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcat(strcpy(cmd, "paste ./data/"), ms_ch), "/da.log ./data/"), ms_ch), "/lm.log ./data/"), ms_ch), "/sm.log ./data/"), ms_ch), "/dm.log");
    system(cmd);
#elif defined DM
    strcat(strcat(strcpy(cmd, "grep \'dcache misses\' ./data/"), ms_ch), "/sim-outorder.log | cut -d\" \" -f10");
    system(cmd);
#elif defined LM
    strcat(strcat(strcpy(cmd, "grep \'load misses\' ./data/"), ms_ch), "/sim-outorder.log | cut -d\" \" -f12");
    system(cmd);
#elif defined SM
    strcat(strcat(strcpy(cmd, "grep \'store misses\' ./data/"), ms_ch), "/sim-outorder.log | cut -d\" \" -f11");
    system(cmd);
#endif
    strcat(strcat(strcpy(cmd, "rm -f ./cde-package/cde-root/src/"), ms_ch), ".c");
    system(cmd);
    strcat(strcpy(cmd, "rm -rf ./data/"), ms_ch);
    system(cmd);
    return 0;
}
