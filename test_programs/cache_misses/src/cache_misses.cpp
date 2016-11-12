#include <cstdlib>
#include <cstring>
#include <fstream>
#include <iostream>
#include <future>
#include <cmath>
#include <signal.h>
#include <set>
#include "sort.h"

#define L1_CACHE_SIZE 1310720
#define MAX_EXECS 2000

#if defined AES
    #include "aes.h"
#elif defined GDKLIB_NAME
    #include "gdklibname.h"
#elif defined GDKLIB_UNI
    #include "gdklibuni.h"
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
    if (argc <= PARAM_LEN) {
        std::cout << "Failure: Incorrect number of parameters. Should be  " << PARAM_LEN << ", but found " << argc - 1 << "." << std::endl;
        return 1;
    }

    std::chrono::nanoseconds ms = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch());
    std::string ms_str = std::to_string(ms.count());
    const char* ms_ch = ms_str.data();

    char cmd[256], filename[256];
    int i, params[PARAM_LEN];

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
    for (i = 1; i <= PARAM_LEN; i++)
        params[i - 1] = (unsigned char)atoi(argv[i]);

    /*preparing source.c source file*/
    strcat(strcat(strcpy(filename, "./temp/"), ms_ch), "/source.c");
    std::ofstream source_file(filename, std::ios::out);
    source_file << prefix << params[0];
    for (i = 1; i < PARAM_LEN; ) {
        source_file << "," << params[i++];
    }
    source_file << suffix;
    source_file.close();

    /*compiling source.c*/
    strcat(strcat(strcat(strcat(strcpy(cmd, "gcc -o ./temp/"), ms_ch), "/binary.o ./temp/"), ms_ch), "/source.c");
    system(cmd);

    /*start of section - execution with cpu isolation using*/
//    double m_avg = 0, a_avg = 0;
    double accesses[MAX_EXECS], misses[MAX_EXECS];
    FILE *fp;
    char* line;
    size_t len = 0;
    char src[L1_CACHE_SIZE], dest[L1_CACHE_SIZE];

    strcat(strcat(strcpy(cmd, "./temp/"), ms_ch), "/binary.o");
    std::memcpy(dest, src, L1_CACHE_SIZE);
    for (i = 0; i < MAX_EXECS; i++) {
//        system(insmod ./wbinvdk/wbinvdk.ko && rmmod wbinvdk);
        fp = popen(cmd, "r");
        getline(&line, &len, fp);
        *(accesses + i) = (std::stoi(line));
//        a_avg += *(accesses + i);
        getline(&line, &len, fp);
        *(misses + i) = (std::stoi(line));
//        m_avg += *(misses + i);
        pclose(fp);
    }

//    a_avg /= MAX_EXECS;
//    m_avg /= MAX_EXECS;

    thesis::array_sorter<double> sorter;
    sorter.sort(accesses, MAX_EXECS);
    sorter.sort(misses, MAX_EXECS);

//    std::cout << "Average L1 Data Accesses: " << a_avg << '\n';
//    std::cout << "Average L1 Data Misses: " << m_avg << '\n';
//    std::cout << "Average miss percentage: " << (m_avg * 100 / a_avg) << "%\n\n";
//    std::cout << "Median L1 Data Accesses: " << accesses[MAX_EXECS / 2] << '\n';
//    std::cout << "Median L1 Data Misses: " << misses[MAX_EXECS / 2] << '\n';
//    std::cout << "Median miss percentage: " << (misses[MAX_EXECS / 2] * 100 / accesses[MAX_EXECS / 2]) << "\%\n";
    std::cout << misses[MAX_EXECS / 2] << '\n';

    /*end of section*/
    strcat(strcpy(cmd, "rm -rf ./temp/"), ms_ch);
    system(cmd);
    return 0;
}