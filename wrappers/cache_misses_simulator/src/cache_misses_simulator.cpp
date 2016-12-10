#include <cstdlib>
#include <fstream>
#include <iostream>
#include <future>
#include <chrono>
#include <string.h>
#include <thread>
#include <unistd.h>
#include <signal.h>

#ifndef TIMEOUT
#define TIMEOUT 2
#endif

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

int strtoi(std::string str) {
    bool alphanumeric;
    for (char c : str) {
        alphanumeric = (c < 48 || c > 57);
        if (alphanumeric)
            break;
    }
    if (!alphanumeric)
        return std::stoi(str) % 256;
    return str[0];
}

int main(int argc, char *argv[]) {
    /*checking argument sanity*/
    if (argc <= param_len) {
        std::cout << "Failure: Incorrect number of parameters. Found " << (argc - 1) << " instead of " << param_len << "." << std::endl;
        return 1;
    }

    std::chrono::nanoseconds ms = std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch());
    std::string ms_str = std::to_string(ms.count());
    const char* ms_charr = ms_str.data();
    char cmd[256], source_filename[256];
    char pre[33];//do not touch this
    char *line;
    size_t len = 0;
    FILE *fp = nullptr;
    int i, params[param_len];
    long da, lm, sm, dm;

    /*creating execution folder*/
    strcat(strcat(strcpy(cmd, "mkdir ./temp/"), ms_charr), ">mkdir.log 2>&1");
    int status = system(cmd);
    while (status) {
        std::this_thread::sleep_for(std::chrono::microseconds(100));
        ms_str = std::to_string(std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch()).count());
        strcat(strcat(strcpy(cmd, "mkdir ./temp/"), ms_charr), ">mkdir.log 2>&1");
        status = system(cmd);
    }

    /*fetching and sanitizing params*/
    if (argc > param_len)
        for (i = 1; i <= param_len; i++)
            params[i - 1] = (unsigned char)atoi(argv[i]);
//    else
//        for (i = 0; i < param_len; i++) {
//            std::string in;
//            std::cin >> in;
//            params[i] = (unsigned char) atoi(in.data());
//        }

    /*preparing source.c source file*/
    strcat(strcat(strcpy(source_filename, "./cde-package/cde-root/src/"), ms_charr), ".c");
    std::ofstream source_fp(source_filename, std::ios::out);
    source_fp << prefix << params[0];
    for (i = 1; i < param_len; ) {
        source_fp << "," << params[i++];
    }
    source_fp << suffix;
    source_fp.close();

    /*cross compiling source.c*/
    strcat(strcat(strcat(strcat(strcpy(cmd, "./cde-package/sslittle-na-sstrix-gcc.cde -o "), ms_charr), ".o src/"), ms_charr), ".c >> cross-compile.log 2>&1");
    status = system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "mv -f ./cde-package/cde-root/src/"), ms_charr), ".c ./temp/"), ms_charr), "/source.c");
    system(cmd);
    if (status) {
        std::cout << "Failure: could not cross-compile source." << std::endl;
        pclose(fp);
        system(strcat(strcpy(cmd, "rm -rf ./temp/"), ms_charr));
        return -1;
    }
    strcat(strcat(strcat(strcat(strcpy(cmd, "mv -f ./cde-package/cde-root/"), ms_charr), ".o ./temp/"), ms_charr), "/binary.o");
    system(cmd);

    /*getting cache miss outputs via forked process*/
    strcat(strcat(strcpy(cmd, "./simplescalar/sim-outorder -config ./simplescalar/processor.config ./temp/"), ms_charr), "/binary.o 2>stderr.log");
    fp = popen(cmd, "r");

    /*Fetching first line in 'async' mode to detect timeout in pipe_read function*/
    std::future<long>* sim_thread = new std::future<long>(std::async(std::launch::async, getline, &line, &len, fp));

    /*check until timeout*/
    std::future_status sim_status = sim_thread->wait_for(std::chrono::seconds(TIMEOUT));

    /*if timeout ooccurs*/
    if (sim_status == std::future_status::timeout) {
        std::cout << "Failure: Simulation timed out." << std::endl;

        /*get this process's pid*/
        std::string this_pid = std::to_string(getpid());

        /*get the child process's pid and kill it*/
        std::string kill_command = "ch_pid=$(ps -ef | grep " + this_pid + " | cut -d' ' -f2- | cut -c-11 | grep " + this_pid + "$ | cut -c-5 | head -1)";
        kill_command += " && kill -9 $(ps -ef | grep $ch_pid | cut -d' ' -f2- | cut -c-11 | grep $ch_pid$ | cut -c-5)";
        system(kill_command.data());

        pclose(fp);

        strcat(strcpy(cmd, "rm -rf ./temp/"), ms_charr);
        system(cmd);
        return -2;
    }

    /*if timeout does not occur, check existence of output*/
    else if (!line[0]) {
        std::cout << "Failure: Simulation did not produce results." << std::endl;
        pclose(fp);
        system(strcat(strcpy(cmd, "rm -rf ./temp/"), ms_charr));
        return -3;
    }

    /*if an output exists, go ahead*/
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
    for (i = 0; i < param_len; i++)
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
    strcat(strcpy(cmd, "rm -rf ./temp/"), ms_charr);
    system(cmd);
    return 0;
}
