#include <iostream>
#include <fstream>

int main() {
    std::string edited_filename = "./aes-part2.c";
    std::string results_filename = "./sim-results.txt";
    std::string log_filename = "./sim-cache.log";

    std::ofstream edited_file;
    std::ofstream results_file;
    int num = 1;
    int keys[16], misses[2] = {0};
    int i, j, k, l;

    results_file.open(results_filename);
    if (!results_file.is_open())
        return 3;
    results_file << "key[0]\tkey[1]\tkey[2]\tkey[3]\tkey[4]\tkey[5]\tkey[6]\tkey[7]\tkey[8]\tkey[9]\tkey[10]\tkey[11]\tkey[12]\tkey[13]\tkey[14]\tkey[15]\tlm\t\tsm\n";
    results_file << "--------------------------------------------------------------------------------------------------------------------------------------------\n";
    int count = 0;

    for (i = 0; i < 16; i++) //each byte
        for (j = 0; j < 256; j++) //each value from 0-255
            for (k = 0; k < num; k++) { //for num keys
//                std::cout << ++count << std::endl;
                edited_file.open(edited_filename);
                for (l = 0; l < 16; l++) {
                    keys[l] = (l == i) ? j : (rand() % 256);
                    results_file << keys[l] << "\t\t";
                    edited_file << "\tkey[" << l << "]=" << keys[l] << ";\n";
                }
                edited_file.close();
                system("cat aes-part1.c aes-part2.c aes-part3.c > aes-new.c");
//                system("mv aes.c ../../ss-src");
                system("sslittle-na-sstrix-gcc.cde -o aes.o aes-new.c");
//                std::string commandstr = "sim-outorder.cde -config processor.config aes.o 2> " + log_filename;
                system("sim-outorder.cde -config processor.config aes.o >& aes.log");
		system("grep -inr \"effective data access\" aes.log > temp_data");	
		system("grep -inr \"effective load miss\" aes.log > temp_load_miss");	
		system("grep -inr \"effective store miss\" aes.log > temp_store_miss");	
		system("cut -f10 -d\" \" temp_data > ndata.txt");
		system("cut -f12 -d\" \" temp_load_miss > nlmiss.txt");
		system("cut -f11 -d\" \" temp_store_miss > nsmiss.txt");
                results_file << misses[0] << "\t\t" << misses[1] << "\n";
            }
    results_file.close();

    return 0;
};
