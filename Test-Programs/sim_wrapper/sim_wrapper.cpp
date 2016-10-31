#include <cstdlib>
#include <fstream>
#include <iostream>
#include <chrono>
#include <string.h>
#include <thread>

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
    int i, params[PARAM_LEN];
    long da, lm, sm, dm;

    /*creating execution folder*/
    strcat(strcpy(cmd, "mkdir ./temp/"), ms_ch);
    int status = system(cmd);
    while (status) {
        std::this_thread::sleep_for(std::chrono::milliseconds(10));
        ms_str = std::to_string(std::chrono::duration_cast<std::chrono::nanoseconds>(std::chrono::system_clock::now().time_since_epoch()).count());
        ms_ch = ms_str.data();
        status = system(cmd);
    }

    /*fetching and sanitizing params*/
    for (i = 1; i <= PARAM_LEN; i++)
        params[i - 1] = strtoi(argv[i]);

    /*preparing aes.c source file*/
    strcat(strcat(strcpy(filename, "./cde-package/cde-root/src/"), ms_ch), ".c");
    std::ofstream source_file(filename, std::ios::out);
    source_file << prefix << params[0];
    for (i = 1; i < PARAM_LEN; ) {
        source_file << "," << params[i++];
    }
    source_file << suffix;
    source_file.close();

    /*cross compiling aes.c*/
    strcat(strcat(strcat(strcat(strcpy(cmd, "./cde-package/sslittle-na-sstrix-gcc.cde -o "), ms_ch), ".o src/"), ms_ch), ".c");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "mv -f ./cde-package/cde-root/src/"), ms_ch), ".c ./temp/"), ms_ch), "/aes.c");
    system(cmd);
    strcat(strcat(strcat(strcat(strcpy(cmd, "mv -f ./cde-package/cde-root/"), ms_ch), ".o ./temp/"), ms_ch), "/aes.o");
    system(cmd);

    /*getting cache miss outputs*/
    strcat(strcat(strcpy(cmd, "./simplescalar/sim-outorder -config ./simplescalar/processor.config ./temp/"), ms_ch), "/aes.o 2>stderr.log");
    FILE *fp = popen(cmd, "r");
    getline(&line, &len, fp);
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
    fclose(fp);
    strcat(strcpy(cmd, "rm -rf ./temp/"), ms_ch);
    system(cmd);
    return 0;
}
