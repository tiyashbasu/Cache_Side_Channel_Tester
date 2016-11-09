#include <cstdlib>
#include <fstream>
#include <iostream>
#include <future>
#include <chrono>
#include <string.h>
#include <thread>
#include <unistd.h>
#include <signal.h>

#define READ 0
#define WRITE 1
#define L1_CACHE_SIZE 1000000000

#if defined AES
    #include "aessim.h"
#elif defined GDKLIB_NAME
    #include "gdklibname.h"
#elif defined GDKLIB_UNI
    #include "gdklibuni.h"
#elif defined OPENSSL_AES
    #include "openssl_aessim.h"
#elif defined OPENSSL_DES
    #include "openssl_dessim.h"
#elif defined OPENSSL_RC4
    #include "openssl_rc4sim.h"
#endif

int l1_flusher() {
//    long flusher_size = L1_CACHE_SIZE;// / sizeof(int);
//    int flusher[flusher_size] = {0};
//    int sum = 0;
//    for (long i = 0; i < flusher_size; i++)
//        sum += flusher[i];
    system("insmod ./wbinvdk/wbinvdk.ko && rmmod wbinvdk");
    return 0;
}

pid_t pipe_read(char* cmd, FILE** fp) {
    pid_t pid;
    int fd[2];
    if (pipe(fd) < 0)
        return -1;
    pid = fork();
    if (pid < 0)
        return -1;
    else if (pid == 0) {
        close(fd[READ]);
        dup2(fd[WRITE], WRITE);
        execl("/bin/sh", "sh", "-c", cmd, NULL);
        perror("execl");
        return 0;
    }
    else if (pid > 0) {
        close(fd[WRITE]);
        *fp = fdopen(fd[READ], "r");
        return pid;
    }
}

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
    int a = sizeof(char);
    std::chrono::nanoseconds ms = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch());
    std::string ms_str = std::to_string(ms.count());
    const char* ms_ch = ms_str.data();
    char cmd[256], filename[256], l1_clearer[50] = {0};
    char *line;
    size_t len = 0;
    FILE *fp = nullptr;
    int i, params[PARAM_LEN];
    long da, lm, sm, dm;
    strcpy(l1_clearer, "insmod ./wbinvdk/wbinvdk.ko && rmmod wbinvdk");

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

    /*creating perf command*/
    std::string perf_events = "L1-dcache-loads";
    perf_events += ",L1-dcache-load-misses";
//    perf_events += ",L1-dcache-stores";
//    perf_events += ",L1-dcache-store-misses";
//    perf_events += ",L1-icache-loads";
//    perf_events += ",L1-icache-load-misses";
//    perf_events += ",cache-misses";
//    perf_events += ",cache-references";
//    perf_events += ",cpu-cycles";

//    strcat(strcat(strcat(strcat(strcpy(cmd, "perf stat -B -e "), perf_events.data()), " ./temp/"), ms_ch), "/binary.o 100000");
//    strcat(strcat(strcat(strcat(strcpy(cmd, "perf stat -e "), perf_events.data()), " ./temp/"), ms_ch), "/binary.o");
    strcat(strcat(strcpy(cmd, "valgrind --tool=cachegrind ./temp/"), ms_ch), "/binary.o");

//    system(l1_clearer);
    system(cmd);

//    pid_t pid = pipe_read(cmd, &fp);
//    pclose(fp);
    strcat(strcpy(cmd, "rm -rf ./temp/"), ms_ch);
    system(cmd);
    return 0;
}
