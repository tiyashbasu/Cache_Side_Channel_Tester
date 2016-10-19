#ifndef THESISDEV_EXECUTOR_H
#define THESISDEV_EXECUTOR_H

#include <cmath>
#include <cstdlib>
#include <iosfwd>
#include <iostream>
#include <fstream>
#include <random>
#include <thread>
#include <unistd.h>
#include <stdlib.h>
#include <pthread.h>

namespace thesis {
    std::mt19937_64 seed(time(NULL));
    std::uniform_int_distribution<int> rand1000(0, 1000);

    class optimal_data_finder {
    private:
        int **dataset;
        int **bkp_dataset;
        int *counts;
        int no_of_params;
        std::string program_path;
        std::string program;
        std::string results_filename;
        int execution_rounds;

        void backup_dataset() {
            int i, j;
            for (i = 0; i < no_of_params; i++)
                for (j = 0; j < counts[i]; j++)
                    bkp_dataset[i][j] = dataset[i][j];
        }

        void restore_dataset() {
            int i, j;
            for (i = 0; i < no_of_params; i++)
                for (j = 0; j < counts[i]; j++)
                    dataset[i][j] = bkp_dataset[i][j];
        }

        void run_program() {
            int j, i;
            int temp;
            std::string command;
            //removing previous execution results
            std::remove(results_filename.c_str());
            std::string path = "cd " + program_path + " && ./";
            std::string param_list;
            for (i = 0; i < execution_rounds; i++) {
                temp = dataset[0][rand1000(seed) % counts[0]];
                param_list = std::to_string(temp);
                for (j = 1; j < no_of_params; j++) {
                    temp = dataset[j][rand1000(seed) % counts[j]];
                    param_list += " " + std::to_string(temp);
                }
                //execute the target program
                char temp_char = ' ';
                std::string temp_result = "";
                FILE *in = popen((path + program + " " + param_list).c_str(), "r");
                while(true) {
                    temp_char = fgetc(in);
                    if (temp_char < 0 || temp_char > 255)
                        break;
                    temp_result += temp_char;
                }
                pclose(in);
                //save the results
                std::ofstream results_fp;
                results_fp.open(results_filename, std::ios::app);
                results_fp << param_list << " " << temp_result << "\n";
                results_fp.close();
            }
        }

        long get_objective(std::string results_filename) {
            std::ifstream out_file;
            long unique_count = 0;
            int i, j;
            long data[execution_rounds][no_of_params], output[execution_rounds];
            out_file.open(results_filename, std::ios::in);
            for (i = 0; i < execution_rounds; i++) {
                for (j = 0; j < no_of_params; j++)
                    out_file >> data[i][j];
                out_file >> output[i];
                for (j = 0; j < i; j++)
                    if (output[i] == output[j])
                        break;
                if (j == i)
                    unique_count++;
            }
            return unique_count;
        }

    protected:
        virtual void randomize_dataset() {
            int i, j, k;
            int temp_rand = 0;
            bool not_unique;
            for (i = 0; i < no_of_params; i++) {
                for (j = 0; j < counts[i]; j++) {
                    not_unique = true;
                    while(not_unique) {
                        temp_rand = rand1000(seed) % 256;
                        for (k = 0; k < j; k++)
                            if (temp_rand == dataset[i][k])
                                break;
                        not_unique = (k != j);
                    }
                    dataset[i][j] = temp_rand;
                }
            }
        }

        virtual void mutate_dataset_bit_flip(int factor) {
            int i, j;
            int flipper[] = {1, 2, 4, 8, 16, 32, 64, 128};
            int mutate_data;
            int mutate_bit;
            for (i = 0; i < no_of_params; i++) {
                for (j = 0; j < counts[i]; j++) {
                    mutate_data = rand1000(seed) % factor;
                    if (!mutate_data) {
                        mutate_bit = rand1000(seed) % 8;
                        dataset[i][j] ^= flipper[mutate_bit];
                    }
                }
            }
        }

        virtual void mutate_dataset(int factor) {
            int i, j;
            int flipper[256];
            for (i = 0; i < 256; i++)
                flipper[i] = i + 1;
            bool mutate_data;
            int mutate_byte;
            for (i = 0; i < no_of_params; i++) {
                for (j = 0; j < counts[i]; j++) {
                    mutate_data = (bool)(rand1000(seed) % factor);
                    if (!mutate_data) {
                        mutate_byte = rand1000(seed) % 256;
                        dataset[i][j] ^= flipper[mutate_byte];
                    }
                }
            }
        }

    public:
        optimal_data_finder(int no_of_params, int* counts, std::string program_path, std::string program, int execution_rounds, std::string results_filename) {
            this->no_of_params = no_of_params;
            this->counts = new int[no_of_params];
            dataset = new int*[no_of_params];
            bkp_dataset = new int*[no_of_params];
            for (int i = 0; i < no_of_params; i++) {
                this->counts[i] = counts[i];
                dataset[i] = new int[counts[i]];
                bkp_dataset[i] = new int[counts[i]];
            }
            this->program_path = program_path;
            this->program = program;
            this->results_filename = results_filename;
            this->execution_rounds = execution_rounds;
            randomize_dataset();
            backup_dataset();
        }

        ~optimal_data_finder() {
            for (int i = 0; i < no_of_params; i++) {
                delete(dataset[i]);
            }
            delete(counts);
        }

        void sim_ann(double t_init, double t_final, double alpha, int max_trials) {
            bool acceptable;
            double acceptance_prob;
            int trial;
            double t;
            long new_obj;
            std::string saveresults = "cp ";
            saveresults += results_filename + " data/best-results.dat";

            std::cout << "Initializing..." << std::flush;
            run_program();
            dataset_to_file("data/best-dataset.csv");
            system(saveresults.data());
            long obj = get_objective(results_filename);
            std::cout << "Initial objective: " << obj << std::endl;
            for (t = t_init; t >= t_final; t *= alpha) {
                std::cout << "Temperature: " << t << std::endl;
                for (trial = 0; trial < max_trials; trial++) {
                    std::cout << "Trial #" << trial + 1 << ". " << std::flush;
                    mutate_dataset(5);
                    run_program();
                    new_obj = get_objective(results_filename);
                    std::cout << "Objective: " << new_obj;
                    acceptable = new_obj > obj;
                    if (!acceptable && new_obj != obj) {
                        acceptance_prob = std::exp((new_obj - obj) / t);
                        acceptable = acceptance_prob > ((double)rand1000(seed) / 1000.0);
                    }
                    if (acceptable) {
                        dataset_to_file("data/best-dataset.csv");
                        system(saveresults.data());
                        backup_dataset();
                        obj = new_obj;
                        std::cout << " - Accepted";
                    }
                    else {
                        restore_dataset();
                    }
                    std::cout << std::endl;
                }
            }
        }

        void dataset_to_file(std::string filename) {
            int i, j;
            std::ofstream file;
            file.open(filename, std::ios::out);
            for (i = 0; i < no_of_params; i++) {
                file << dataset[i][0];
                for (j = 1; j < counts[i]; j++) {
                    file << "," << dataset[i][j];
                }
                file << "\n";
            }
            file.close();
        }
    };
}

#endif //THESISDEV_EXECUTOR_H