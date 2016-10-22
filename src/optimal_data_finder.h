#ifndef OPTIMAL_DATA_FINDER
#define OPTIMAL_DATA_FINDER

#include <cmath>
#include <iostream>
#include <fstream>
#include <random>
#include <thread>
#include "flipper.h"
//#include <unistd.h> //required for fork()
//#include <wait.h> //required for waitpid()

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
        unsigned long execution_rounds;

        inline void swap(long* a, long* b) {
            long temp;
            temp = *a;
            *a=  *b;
            *b= temp;
        }

        long pivot(long* arr, long start, long end) {
            long p = arr[end];
            unsigned long i = start;
            for (unsigned long j = start; j < end; j++) {
                if (arr[j] < p) {
                    swap(arr + i, arr + j);
                    i++;
                }
            }
            swap(arr + i, arr + end);
            return i;
        }

        void quick_sort(long* arr, long start, long end) {
            if (start < end) {
                long p = pivot(arr, start, end);
                quick_sort(arr, start, p - 1);
                quick_sort(arr, p + 1, end);
            }
        }

        void sort(long* arr, unsigned long size) {
            quick_sort(arr, 0, size - 1);
        }

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

        void run_thread(std::string path, std::string param_list) {
            char output[10] = {0};
            int i = 0;
            FILE *in = popen((path + program + " " + param_list).c_str(), "r");
            while (!feof(in)) {
                output[i++] = fgetc(in);
            }
            if(i > 0)
                output[--i] = 0; //replace -1 at the array's end with null character
            pclose(in);
            //save the results
            std::ofstream results_fp;
            results_fp.open(results_filename, std::ios::app);
            results_fp << param_list << " " << output << "\n";
            results_fp.close();
            return;
        }

        void run_program() { //parallel execution using threads
            int j, i;
            int temp;
            std::thread *execution_threads = new std::thread[execution_rounds];
            std::string path = "cd " + program_path + " && ./";
            std::string param_list;
            for (i = 0; i < execution_rounds; i++) {
                temp = dataset[0][rand1000(seed) % counts[0]];
                param_list = std::to_string(temp);
                for (j = 1; j < no_of_params; j++) {
                    temp = dataset[j][rand1000(seed) % counts[j]];
                    param_list += " " + std::to_string(temp);
                }
//                run_thread(path, param_list);
                execution_threads[i] = std::thread(&optimal_data_finder::run_thread, this, path, param_list);
                std::this_thread::sleep_for(std::chrono::milliseconds(10));
            }
            int status;
            for (i = 0; i < execution_rounds; i++) {
                execution_threads[i].join();
            }
            delete [] execution_threads;
            std::remove(results_filename.c_str());//removing previous execution temp result
            return;
        }

/* parallel execution using fork and wait
        void run_program() { //parallel execution using fork & wait
            int j, i;
            int temp;
            std::string command;
            pid_t pid[execution_rounds];
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
                //fork and execute the target program
                pid[i] = fork();
                if (pid[i] == 0) {
                    char output[10] = {0};
                    int i = 0;
                    FILE *in = popen((path + program + " " + param_list).c_str(), "r");
                    while (!feof(in)) {
                        output[i++] = fgetc(in);
                    }
                    if(i > 0)
                        output[--i] = 0; //replace -1 at the array's end with null character
                    pclose(in);
                    //save the results
                    std::ofstream results_fp;
                    results_fp.open(results_filename, std::ios::app);
                    results_fp << param_list << " " << output << "\n";
                    results_fp.close();
                    std::exit(3);
                }
                std::this_thread::sleep_for(std::chrono::milliseconds(10));
            }
            int status;
            for (i = 0; i < execution_rounds; i++) {
                waitpid(pid[i], &status, 0);
            }
        }
*/

        unsigned long get_objective(std::string results_filename) {
            std::ifstream out_file;
            unsigned long unique_count = 1;
            int i, j;
            long data[execution_rounds][no_of_params], output[execution_rounds];
            out_file.open(results_filename, std::ios::in);
            for (i = 0; i < execution_rounds; i++) {
                for (j = 0; j < no_of_params; j++)
                    out_file >> data[i][j];
                out_file >> output[i];
            }
            sort(output, execution_rounds);
            for (i = 1; i < execution_rounds; i++) {
                if (output[i] != output[i - 1])
                    unique_count++;
            }
            out_file.close();
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

/* mutating only one bit at a time
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
*/

        virtual void mutate_dataset(int factor, int size) {
            int i, j;
            bool mutate_data;
            int mutate_byte;
            for (i = 0; i < no_of_params; i++) {
                for (j = 0; j < counts[i]; j++) {
                    mutate_data = (bool)(rand1000(seed) % factor);
                    if (!mutate_data) {
                        mutate_byte = rand1000(seed) % size;
                        dataset[i][j] ^= thesis::flipper[mutate_byte];
                    }
                }
            }
        }

    public:
        optimal_data_finder(int no_of_params, int* counts, std::string program_path, std::string program, unsigned long execution_rounds) {
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
            this->results_filename = "./data/temp-results.log";
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

        long sim_ann(double t_init, double t_final, double alpha, int max_trials) {
            bool acceptable;
            long double acceptance_prob;
            int trial_num;
            double temp;
            long obj, new_obj;
            int total_iterations= (int)((std::log(t_final) - std::log(t_init)) / std::log(alpha)) + 1;
            int iteration = 0;
//            double reduc_fact = (double)thesis::flipper_size / (double)total_iterations; //linear reducer
            double reduc_fact = (double)(std::exp((std::log(8) - std::log(thesis::flipper_size)) / total_iterations)); //exponential reducer
            int usable_flipper_size = thesis::flipper_size;

            std::cout << "Initializing..." << std::flush;
            run_program();
            save_dataset_to_file("data/best-dataset.csv");
            save_results_to_file("data/best-results.log");
            obj = get_objective(results_filename);
            std::cout << "Done\nInitial objective: " << obj << std::endl;
            std::cout << "------------------------------------------------------------------\n";
            std::cout << "Elapsed Time\tTemperature\tEpoch\tObjective\tAcceptance\n";
            std::cout << "------------------------------------------------------------------\n";
            auto now = std::chrono::system_clock::now();
            long start_time = (std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch())).count();
            long elapsed_time;
            try {
                for (temp = t_init; temp >= t_final; temp *= alpha) {
                    ++iteration;
                    usable_flipper_size *= reduc_fact; //exponential reduction in neighbourhood size

                    for (trial_num = 0; trial_num < max_trials; trial_num++) {
                        mutate_dataset(2, usable_flipper_size);
                        run_program();
                        new_obj = get_objective(results_filename);

                        now = std::chrono::system_clock::now();
                        elapsed_time = (std::chrono::duration_cast<std::chrono::milliseconds>(
                                now.time_since_epoch())).count() - start_time;
                        std::cout << std::setw(12) << format_time(elapsed_time) << '\t';
                        std::cout << std::setprecision(8) << std::setw(11) << temp << '\t';
                        std::cout << std::setw(1) << iteration << '/' << total_iterations << '\t';
                        std::cout << std::setw(6) << new_obj << '\t';

                        acceptable = new_obj > obj;
                        if (!acceptable && new_obj != obj) {
                            acceptance_prob = std::exp((new_obj - obj) / temp);
                            acceptable = acceptance_prob > ((double) rand1000(seed) / 1000.0);
                        }

                        if (acceptable) {
                            save_dataset_to_file("data/best-dataset.csv");
                            save_results_to_file("data/best-results.log");
                            backup_dataset();
                            obj = new_obj;
                            std::cout << std::setw(10) << "Y";
                        } else {
                            restore_dataset();
                            std::cout << std::setw(10) << "N";
                        }

                        std::cout << std::endl;
                    }
                }
            }
            catch(const char* msg) {
                std::cout << "\nAn exception occurred.\n" << msg << std::endl;
                return -1;
            }
            return obj;
        }

        void save_dataset_to_file(std::string filename) {
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

        void save_results_to_file(std::string filename) {
            std::ifstream src(results_filename, std::ios::binary);
            std::ofstream dest(filename, std::ios::binary);
            dest << src.rdbuf();
            dest.close();
            src.close();
        }

        std::string format_time(long milliseconds) {
            long s = milliseconds / 1000;
            int ms = milliseconds % 1000;
            long m = s / 60;
            s %= 60;
            long h = m / 60;
            m %= 60;
            std::ostringstream ms_str;
            ms_str << std::setprecision(4) << ms;
            return (std::to_string(h) + ":" + std::to_string(m) + ":" + std::to_string(s) + "." + ms_str.str());
        }
    };
}

#endif //THESISDEV_EXECUTOR_H
