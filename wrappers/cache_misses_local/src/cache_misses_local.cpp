#include <cstring>
#include <fstream>
#include <iostream>
#include <future>
#include <signal.h>
#include "sort.h"

#define L1_CACHE_SIZE 1310720
#define MAX_EXECS_FALLBACK 1000
#define CPU_NO_FALLBACK 0

#if defined BASIC_AES
    #include "basic_aes.h"
#elif defined GDKLIB_NAME
    #include "gdklib_name.h"
#elif defined GDKLIB_UNI
    #include "gdklib_uni.h"
#elif defined OPENSSL_AES
    #include "openssl_aes.h"
#elif defined OPENSSL_DES
    #include "openssl_des.h"
#elif defined OPENSSL_RC4
    #include "openssl_rc4.h"
#endif

void sigint_handler(int sigint) {
    exit(3);
}

int main(int argc, char *argv[]) {
    signal(SIGINT, sigint_handler);

    /*checking argument sanity*/
    if (argc <= param_len) {
        std::cout << "Failure: Incorrect number of parameters. Should be  " << param_len << ", but found " << argc - 1 << "." << std::endl;
        return 1;
    }

    std::chrono::nanoseconds ms = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch());
    std::string ms_str = std::to_string(ms.count());
    const char* ms_ch = ms_str.data();

    char cmd[256], filename[256];
    int i, params[param_len];
    char src[L1_CACHE_SIZE], dest[L1_CACHE_SIZE];

    FILE *fp;
    char* line;
    size_t len = 0;

    /*getting environment variables*/
    char* max_execs_ch = getenv("MAX_EXECS");
    long max_execs = (max_execs_ch != NULL) ? std::stol(max_execs_ch) : MAX_EXECS_FALLBACK;
//    delete [] max_execs_ch;

    char* cpu_no_ch = getenv("CPU_NO");
    int cpu_no = (cpu_no_ch != NULL) ? std::stoi(cpu_no_ch) : CPU_NO_FALLBACK;
//    delete [] cpu_no_ch;


    long accesses[max_execs], misses[max_execs];

    /*creating execution folder*/
    strcat(strcat(strcpy(cmd, "mkdir ./temp/"), ms_ch), ">mkdir.log 2>&1");
    int status = system(cmd);
    while (status) {
        std::this_thread::sleep_for(std::chrono::microseconds(100));
        ms_str = std::to_string(std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch()).count());
        strcat(strcat(strcpy(cmd, "mkdir ./temp/"), ms_ch), ">mkdir.log 2>&1");
        status = system(cmd);
    }

    /*fetching and sanitizing params*/
    for (i = 1; i <= param_len; i++)
        params[i - 1] = (unsigned char)atoi(argv[i]);

    /*preparing source.c source file*/
    strcat(strcat(strcpy(filename, "./temp/"), ms_ch), "/source.c");
    std::ofstream source_file(filename, std::ios::out);
    source_file << prefix << params[0];
    for (i = 1; i < param_len; ) {
        source_file << "," << params[i++];
    }
    source_file << suffix;
    source_file.close();

    /*compiling source.c*/
    strcat(strcat(strcat(strcat(strcpy(cmd, "gcc -o ./temp/"), ms_ch), "/binary.o ./temp/"), ms_ch), "/source.c");
    system(cmd);

    /*building execution command*/
    if (cpu_no == -1)
        strcpy(cmd, ("./temp/" + ms_str + "/binary.o").data());
    else
        strcpy(cmd, ("taskset -c " + std::to_string(cpu_no) + " ./temp/" + ms_str + "/binary.o").data());

    /*executing max_execs times*/
    for (i = 0; i < max_execs; i++) {
        /*cache flushing (loosely termed)*/
//        system("insmod ./wbinvdk/wbinvdk.ko && rmmod wbinvdk");
        std::memcpy(dest, src, L1_CACHE_SIZE);

        /*open execution pipe*/
        fp = popen(cmd, "r");

        /*read L1 accesses*/
        getline(&line, &len, fp);
//        *(accesses + i) = (std::stoi(line));

        /*read L1 misses*/
        getline(&line, &len, fp);
        *(misses + i) = (std::stol(line));

        /*when done, close execution pipe*/
        pclose(fp);
    }

    /*sorting the output array*/
    thesis::array_sorter<long> sorter;
    sorter.sort(misses, max_execs);

    /*reporting final output*/
    std::cout << misses[max_execs / 2] << '\n';

    /*end of section*/
    strcat(strcpy(cmd, "rm -rf ./temp/"), ms_ch);
    system(cmd);
    return 0;
}
