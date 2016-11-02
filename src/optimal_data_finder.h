#ifndef OPTIMAL_DATA_FINDER
#define OPTIMAL_DATA_FINDER

#include <cmath>
#include <set>
#include <mutex>
#include <iostream>
#include <fstream>
#include <random>
#include <thread>
#include <cstring>
#include <algorithm>
#include "flipper.h"
//#include <unistd.h> //required for fork()
//#include <wait.h> //required for waitpid()

namespace thesis {
    std::mt19937_64 seed(time(NULL));
    std::uniform_int_distribution<int> rand1000(0, 1000);

    class optimal_data_finder {
    private:
        std::vector<int> *dataset;
        std::vector<int> *bkp_dataset;
        int *counts;
        int no_of_params;
        std::string program_path;
        std::string program;
        std::string temp_results_file;
        unsigned long execution_rounds;
        int **params;
        int *outputs;
        std::mutex mtx;

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
            for (i = 0; i < no_of_params; i++) {
                bkp_dataset[i].clear();
                for (j = 0; j < counts[i]; j++)
                    bkp_dataset[i].push_back(dataset[i][j]);
            }
        }

        void restore_dataset() {
            int i, j;
            for (i = 0; i < no_of_params; i++) {
                dataset[i].clear();
                for (j = 0; j < counts[i]; j++)
                    dataset[i].push_back(bkp_dataset[i][j]);
            }
        }

        void write_dataset_to_file(std::string filename) {
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

        void write_results_to_file(std::string filename) {
            std::ifstream src(temp_results_file, std::ios::in);
            std::ofstream dest(filename, std::ios::out);
            dest << src.rdbuf();
            dest.close();
            src.close();
        }

        void append_results_to_file(std::string filename) {
            std::ifstream src(temp_results_file, std::ios::in);
            std::ofstream dest(filename, std::ios::out | std::ios::app);
            dest << src.rdbuf();
            dest.close();
            src.close();
        }

        std::string format_time(long milliseconds) {
            long s = milliseconds / 1000;
            int ms = (int)(milliseconds % 1000);
            long m = s / 60;
            s %= 60;
            long h = m / 60;
            m %= 60;
            std::ostringstream ms_str;
            ms_str << std::fixed << std::setprecision(4) << ms;
            return (std::to_string(h) + ":" + std::to_string(m) + ":" + std::to_string(s) + "." + ms_str.str());
        }

        void run_thread(const char* program, int round_num) {
            char output_ch[100] = {0};
            char cmd[256] = {0};
            int i, temp_rand;
            int test[10] = {154, 209, 252, 199, 232 ,139, 140 ,85 ,99 ,63};
            FILE* in;

            //preparing command
            strcpy(cmd, program);

            while (1) {
                //preparing input
                for (i = 0; i < no_of_params; i++) {
                    temp_rand = dataset[i][rand1000(seed) % counts[i]];
                    temp_rand = test[i];
                    strcat(strcat(cmd, " "), std::to_string(temp_rand).data());
                    params[round_num][i] = temp_rand;
                }

                //executing target and recording results in output_ch
                in = popen(cmd, "r");
                output_ch[0] = (char)fgetc(in);
                if (output_ch[0] == 'S')
                    pclose(in);
                else
                    break;
            }

            i = 1;
            while (!feof(in)) {
                output_ch[i++] = (char)fgetc(in);
            }

            if(i > 0)
                output_ch[--i] = 0; //replace -1 at the array's end with null character
            pclose(in);
            outputs[round_num] = std::atoi(output_ch);

            return;
        }

        void run_program() { //parallel execution using threads
            int i, j;
            int temp;

            std::thread *execution_threads = new std::thread[execution_rounds];
            std::string path = "cd " + program_path + " && ./" + program;

            std::string param_list;
            for (i = 0; i < execution_rounds; i++) {
//                run_thread(path.data(), i);
                execution_threads[i] = std::thread(&optimal_data_finder::run_thread, this, path.data(), i);
                std::this_thread::sleep_for(std::chrono::milliseconds(10));
            }

            std::ofstream out_file(temp_results_file, std::ios::app);
            for (i = 0; i < execution_rounds; i++) {
                execution_threads[i].join();
                for (j = 0; j < no_of_params; j++)
                    out_file << params[i][j] << '\t';
                out_file << outputs[i] << '\n';
            }
            out_file.close();

            delete [] execution_threads;
            return;
        }

        unsigned long get_objective(std::string results_filename, long no_of_lines) {
            std::ifstream out_file;
            int i, j;
            long data;
            out_file.open(results_filename, std::ios::in);
            if (no_of_lines <= 0) {
                no_of_lines = -1;
                std::string line;
                while(!out_file.eof()) {
                    std::getline(out_file, line);
                    no_of_lines++;
                }
                out_file.clear();
                out_file.seekg(std::ios::beg);
            }
            //array sort method
            long output[no_of_lines];
            unsigned long unique_count = 1;
            for (i = 0; i < no_of_lines; i++) {
                for (j = 0; j < no_of_params; j++)
                    out_file >> data;
                out_file >> output[i];
            }
            sort(output, (unsigned long)no_of_lines);
            for (i = 1; i < no_of_lines; i++) {
                if (output[i] != output[i - 1])
                    unique_count++;
            }
            out_file.close();
            return unique_count;
        }

        void init_start_simann(const std::string logfilename, long* obj, const bool quiet) {
            std::ofstream logfile(logfilename, std::ios::out);
            std::remove(temp_results_file.c_str());//removing previous execution temp result
            std::remove("data/all-results.log");
            if (!quiet) {
                std::cout << "Initializing..." << std::flush;
            }
            run_program();
            *obj = get_objective(temp_results_file, execution_rounds);
            write_dataset_to_file("data/best-dataset.csv");
            write_results_to_file("data/best-results.log");
            append_results_to_file("data/all-results.log");
            std::remove(temp_results_file.c_str());//removing temp result
            logfile << "Done. Initial objective: " << *obj << std::endl;
            logfile << "------------------------------------------------------------------\n";
            logfile << "Elapsed Time\tTemperature\tEpoch\tTrial\tObjective\tAcceptance\n";
            logfile << "------------------------------------------------------------------\n";
            if (!quiet) {
                std::cout << "Initial objective: " << *obj << std::endl;
                std::cout << "--------------------------------------------------------------------------\n";
                std::cout << "Elapsed Time\tTemperature\tEpoch\tTrial\tObjective\tAcceptance\n";
                std::cout << "--------------------------------------------------------------------------\n";
            }
            logfile.close();
            return;
        }

        void init_resume_simann(const std::string logfilename, long* obj, double* t_init, const double alpha, int* usable_flipper_size, const double reduc_fact, int* iteration, int* start_trial, long *elapsed_time) {
            std::ifstream logfile_in(logfilename, std::ios::in);
            int lines = 0;
            std::string line;
            unsigned long start;
            std::getline(logfile_in, line);
            start = (int)(line.find(":") + 1);

            *obj = stol(line.substr(start, line.length()));
            while (!logfile_in.eof()) {
                std::getline(logfile_in, line);
                start = 0;
                start = (int)(line.find("Y", start));
                if (start > 0) {
                    start = (int)(line.find(":", start) + 1);
                    start = (int)(line.find(":", start) + 1);
                    start = (int)(line.find("\t", start) + 1);
                    start = (int)(line.find("\t", start) + 1);
                    start = (int)(line.find("/", start) + 1);
                    start = (int)(line.find("\t", start) + 1);
                    start = (int)(line.find("/", start) + 1);
                    start = (int)(line.find("\t", start) + 1);
                    *obj = stol(line.substr(start, line.length()));
                }
                lines++;
            }
            logfile_in.clear();
            logfile_in.seekg(0, std::ios::beg);
            int i;
            for (i = 0; i < lines; i++)
                std::getline(logfile_in, line);
            char ch;
            start = 0;
            //timestamp
            *elapsed_time = 0;
            *elapsed_time += stol(line.substr(start, line.length())) * 3600000;//hrs*60*60*1000*1000
            start = (int)(line.find(":") + 1);
            *elapsed_time += stol(line.substr(start, line.length())) * 60000;
            start = (int)(line.find(":", start) + 1);
            *elapsed_time += (stod(line.substr(start, line.length())) * 1000);
            //temperature and usable flipper size
            start = (int)(line.find("\t", start) + 1);
            double t_initx = stod(line.substr(start, line.length()));
            double tmp = t_initx;
            while (tmp <= *t_init) {
                tmp /= alpha;
                *usable_flipper_size *= reduc_fact;
            }
            *t_init = t_initx;
            //iteration
            start = (int)(line.find("\t", start) + 1);
            *iteration = stoi(line.substr(start, line.length())) - 1;
            //start_trial
            start = (int)(line.find("\t", start) + 1);
            *start_trial = stoi(line.substr(start, line.length()));
            logfile_in.close();
            std::ofstream logfile_out(logfilename, std::ios::app);
            logfile_out.close();
            return;
        }

        void logger(std::string logfilename, const long elapsed_time, const double temp, const int iteration, const int total_iterations, const int trial_num, const int max_trials, const long new_obj, const bool is_accepted, const bool quiet) {
            std::ofstream logfile(logfilename, std::ios::app);

            logfile << std::setw(12) << format_time(elapsed_time) << '\t';
            logfile << std::fixed << std::setprecision(6) << std::setw(11) << temp << '\t';
            logfile << std::setw(2) << iteration << '/' << total_iterations << '\t';
            logfile << std::setw(2) << trial_num + 1 << '/' << max_trials << '\t';
            logfile << std::setw(9) << new_obj << '\t';
            logfile << std::setw(10) << (is_accepted? 'Y' : 'N') << std::endl;
            logfile.close();

            if (!quiet) {
                std::cout << std::setw(12) << format_time(elapsed_time) << '\t';
                std::cout << std::fixed << std::setprecision(6) << std::setw(11) << temp << '\t';
                std::cout << std::setw(2) << iteration << '/' << total_iterations << '\t';
                std::cout << std::setw(2) << trial_num + 1 << '/' << max_trials << '\t';
                std::cout << std::setw(9) << new_obj << '\t';
                std::cout << std::setw(10) << (is_accepted? 'Y' : 'N') << std::endl;
            }

            return;
        }

    protected:
        virtual void init_datasets() {
            int i, j, k;
            int temp_rand = 0;
            bool not_unique;
            int len;
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
                    dataset[i].push_back(temp_rand);
                    bkp_dataset[i].push_back(temp_rand);
                }
            }
        }

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
            for (int i = 0; i < no_of_params; i++) {
                if (counts[i] > 256)
                    this->counts[i] = 256;
                else
                    this->counts[i] = counts[i];
            }
            dataset = new std::vector<int>[no_of_params];
            bkp_dataset = new std::vector<int>[no_of_params];
            init_datasets();
            this->program_path = program_path;
            this->program = program;
            this->temp_results_file = "./data/temp-results.log";
            this->execution_rounds = execution_rounds;
            this->outputs = new int[execution_rounds];
            this->params = new int*[execution_rounds];
            for (int i = 0; i < execution_rounds; i++) {
                this->params[i] = new int[no_of_params];
            }
        }

        ~optimal_data_finder() {
            delete [] dataset;
            delete [] bkp_dataset;
            delete [] counts;
            for (int i = 0; i < execution_rounds; i++)
                delete [] params[i];
            delete [] params;
            delete [] outputs;
        }

        long sim_ann(double t_init, double t_final, double alpha, int max_trials, std::string logfilename, bool resume, bool quiet) {
            std::ofstream logfile;
            bool is_accepted;
            long double acceptance_prob;
            double delta_avg = 0, obj_avg = 0;
            int trial_num, start_trial = 0;
            double temp;
            long new_obj, obj;
            int total_iterations= (int)((std::log(t_final) - std::log(t_init)) / std::log(alpha)) + 1;
            int iteration = 0, acceptance_count = 0;
            double reduc_fact = std::exp((std::log(8) - std::log(thesis::flipper_size)) / total_iterations); //exponential reducer
            int usable_flipper_size = thesis::flipper_size;
            auto now = std::chrono::system_clock::now();
            long start_time, elapsed_time;
            std::thread logger_thread;

            /*Initialization when execution is starting for the first time and not resuming*/
            if (!resume) {
                init_start_simann(logfilename, &obj, quiet);
                obj_avg = obj;
                now = std::chrono::system_clock::now();
                start_time = (std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch())).count();
            }
            /*Initialization when execution is resuming from a previous incomplete run*/
            else {
                init_resume_simann(logfilename, &obj, &t_init, alpha, &usable_flipper_size, reduc_fact, &iteration, &start_trial, &elapsed_time);
                now = std::chrono::system_clock::now();
                start_time = (std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch())).count() - elapsed_time;
            }

            /*Starting simulated annealing process*/
            try {
                for (temp = t_init; temp >= t_final; temp *= alpha) {
                    ++iteration;

                    for (trial_num = start_trial; trial_num < max_trials; trial_num++) {
                        //mutate, execute and get objective value
                        mutate_dataset(2, usable_flipper_size);
                        run_program();
                        if (logger_thread.joinable())
                            logger_thread.join();
                        new_obj = get_objective(temp_results_file, execution_rounds);
                        append_results_to_file("data/all-results.log");

                        //Record time interval
                        now = std::chrono::system_clock::now();
                        elapsed_time = (std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch())).count() - start_time;

                        //Check acceptance
                        is_accepted = new_obj > obj;
                        if (new_obj < obj) {
                            if (!acceptance_count)
                                delta_avg = obj - new_obj;
//                            acceptance_prob = std::exp((new_obj - obj)/ (temp * delta_avg));
                            acceptance_prob = std::exp((new_obj - obj) * 30 / (temp * obj_avg));
                            is_accepted = acceptance_prob > ((double) rand1000(seed) / 1000.0);
                        }

                        //If new objective value has been accepted, update best results and log
                        if (is_accepted) {
                            acceptance_count++;
                            write_dataset_to_file("data/best-dataset.csv");
                            write_results_to_file("data/best-results.log");
                            backup_dataset();
//                            if (new_obj > obj)
//                                delta_avg = (delta_avg * (acceptance_count - 1) + new_obj - obj) / acceptance_count;
//                            else
//                                delta_avg = (delta_avg * (acceptance_count - 1) + obj - new_obj) / acceptance_count;
                            obj_avg = (obj_avg * (acceptance_count - 1) + new_obj) / acceptance_count;
                            obj = new_obj;
                        }
                        //If new objective value has not been accepted, update log
                        else {
                            restore_dataset();
                        }

                        logger_thread = std::thread(&optimal_data_finder::logger, this, logfilename, elapsed_time, temp, iteration, total_iterations, trial_num, max_trials, new_obj, is_accepted, quiet);

						std::remove(temp_results_file.c_str());//removing previous execution temp result
                    }
                    logger_thread.join();
                    start_trial = 0;
                    usable_flipper_size *= reduc_fact; //exponential reduction in neighbourhood size
                }
            }
            catch(const char* msg) {
                std::cout << "\nAn exception occurred.\n" << msg << std::endl;
                return -1;
            }
            logfile.close();
            return obj;
        }
    };
}

#endif //THESISDEV_EXECUTOR_H
