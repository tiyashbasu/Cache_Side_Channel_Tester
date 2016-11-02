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

FILE* pipe_read(char* cmd, pid_t* pid) {
    FILE* fp = NULL;
    int fd[2];
    pipe(fd);
    *pid = fork();
    if (*pid == 0) {
        close(fd[READ]);
        dup2(fd[WRITE], WRITE);
        execl("/bin/sh", "sh", "-c", cmd, NULL);
        perror("execl");
        exit(0);
    }
    else if (pid > 0) {
        close(fd[WRITE]);
        fp = fdopen(fd[READ], "r");
    }
    return fp;
}

int main(int argc, char *argv[]) {
    /*checking argument sanity*/
    if (argc <= PARAM_LEN) {
        return 1;
    }
    std::chrono::nanoseconds ms = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch());
    std::string ms_str = std::to_string(ms.count());
    const char* ms_ch = ms_str.data();
    char cmd[256], filename[256], pre[33];
    char *line = NULL;
    size_t len = 0;
    pid_t p_pid;
    int i, params[PARAM_LEN];
    long da, lm, sm, dm;

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
        params[i - 1] = strtoi(argv[i]);

    /*preparing source.c source file*/
    strcat(strcat(strcpy(filename, "./cde-package/cde-root/src/"), ms_ch), ".c");
    std::ofstream source_file(filename, std::ios::out);
    source_file << prefix << params[0];
    for (i = 1; i < PARAM_LEN; ) {
        source_file << "," << params[i++];
    }
    source_file << suffix;
    source_file.close();

    /*cross compiling source.c*/
    strcat(strcat(strcat(strcat(strcpy(cmd, "./cde-package/sslittle-na-sstrix-gcc.cde -o "), ms_ch), ".o src/"), ms_ch), ".c");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "mv -f ./cde-package/cde-root/src/"), ms_ch), ".c ./temp/"), ms_ch), "/source.c");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "mv -f ./cde-package/cde-root/"), ms_ch), ".o ./temp/"), ms_ch), "/source.o");
    system(cmd);

    /*getting cache miss outputs*/
    strcat(strcat(strcpy(cmd, "./simplescalar/sim-outorder -config ./simplescalar/processor.config ./temp/"), ms_ch), "/source.o 2>stderr.log");
    FILE* fp = pipe_read(cmd, &p_pid);
    /*Fetching first line in 'async' mode to detect timeout in pipe_read function*/
    std::future<long>* sim_thread = new std::future<long>(std::async(std::launch::async, getline, &line, &len, fp));
    /*check until timeout*/
    std::future_status sim_status = sim_thread->wait_for(std::chrono::seconds(1));
    if (sim_status == std::future_status::timeout) {
        kill(p_pid, 2);
//        fclose(fp);
        strcat(strcpy(cmd, "rm -rf ./temp/"), ms_ch);
        system(cmd);
        std::cout << "Failure: Simulation timed out.\n";
        return -1;
    }
    /*check existence of output*/
    else if (!line[0]) {
        fclose(fp);
        strcat(strcpy(cmd, "rm -rf ./temp/"), ms_ch);
        system(cmd);
        std::cout << "Failure: Simulation did not produce results.\n";
        return -2;
    }
    getline(&line, &len, fp);
#if defined FILES
    //data accesses
    fgets(pre, sizeof(pre), fp);
    getline(&line, &len, fp);
    da = std::stoi(line);
    //load misses
    fgets(pre, sizeof(pre), fp);
    getline(&line, &len, fp);
    lm = std::stoi(line);
    //store misses
    fgets(pre, sizeof(pre), fp);
    getline(&line, &len, fp);
    sm = std::stoi(line);
    //dcache misses
    fgets(pre, sizeof(pre), fp);
    getline(&line, &len, fp);
    dm = std::stoi(line);
    std::ofstream outfile("results.log", std::ios::app);
    for (i = 0; i < PARAM_LEN; i++)
        outfile << params[i] << '\t';
    outfile << da << '\t' << lm << '\t' << sm << '\t' << dm << '\n';
    outfile.close();
#elif defined ALL
    //data accesses
    fgets(pre, sizeof(pre), fp);
    getline(&line, &len, fp);
    da = std::stoi(line);
    //load misses
    fgets(pre, sizeof(pre), fp);
    getline(&line, &len, fp);
    lm = std::stoi(line);
    //store misses
    fgets(pre, sizeof(pre), fp);
    getline(&line, &len, fp);
    sm = std::stoi(line);
    //dcache misses
    fgets(pre, sizeof(pre), fp);
    getline(&line, &len, fp);
    dm = std::stoi(line);
    std::cout << da << '\t' << lm << '\t' << sm << '\t' << dm << '\n';
#elif defined LM
    getline(&line, &len, fp);
    fgets(pre, sizeof(pre), fp);
    getline(&line, &len, fp);
    lm = std::stoi(line);
    std::cout << lm << '\n';
#elif defined SM
    getline(&line, &len, fp);
    getline(&line, &len, fp);
    fgets(pre, sizeof(pre), fp);
    getline(&line, &len, fp);
    sm = std::stoi(line);
    std::cout << sm << '\n';
#elif defined DM
    getline(&line, &len, fp);
    getline(&line, &len, fp);
    getline(&line, &len, fp);
    fgets(pre, sizeof(pre), fp);
    getline(&line, &len, fp);
    dm = std::stoi(line);
    std::cout << dm << '\n';
#endif
    pclose(fp);
    strcat(strcpy(cmd, "rm -rf ./temp/"), ms_ch);
    system(cmd);
    return 0;
}
