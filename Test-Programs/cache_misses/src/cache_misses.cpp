#include <cstdlib>
#include <cstring>
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
#define L1_CACHE_SIZE 131072

#if defined AES
    #include "aes.h"
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

    std::chrono::nanoseconds ms = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch());
    std::string ms_str = std::to_string(ms.count());
    const char* ms_ch = ms_str.data();
    char cmd[256], filename[256], l1_flusher_cmd[50] = {0};
    int i, params[PARAM_LEN];
    strcpy(l1_flusher_cmd, "insmod ./wbinvdk/wbinvdk.ko && rmmod wbinvdk");

    char src[L1_CACHE_SIZE], dest[L1_CACHE_SIZE] = {0};

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

    /*start of section - execution with cpu isolation using cset*//*
    strcat(strcat(strcpy(cmd, "cset shield -e ./temp/"), ms_ch), "/binary.o");
    system("cset shield -c 0");
    system("cset shield -k on");
    system(l1_flusher_cmd);
    for (i = 0; i < max_exec; i++) {
        std::memcpy(dest, src, L1_CACHE_SIZE);
        system(cmd);
    }
    system("cset shield --reset");
    /*end of section*/

    /*start of section - execution with cpu isolation using isolcpu*/
    int max_exec = 10;
    long sum = 0;
    FILE *fp;
    char* line;
    size_t len = 0;
    std::remove("op.log");
    strcat(strcat(strcpy(cmd, "taskset -c 0 /bin/sh -c \"./temp/"), ms_ch), "/binary.o\"");
    for (i = 0; i < max_exec; i++) {
//        system(l1_flusher_cmd);
        std::memcpy(dest, src, L1_CACHE_SIZE);
        system(cmd);
//        fp = popen(cmd, "r");
//        getline(&line, &len, fp);
//        sum += std::stoi(line);
//        pclose(fp);
    }
//    std::cout << sum << std::endl;
    /*end of section*/

    strcat(strcpy(cmd, "rm -rf ./temp/"), ms_ch);
    system(cmd);
    return 0;
}
