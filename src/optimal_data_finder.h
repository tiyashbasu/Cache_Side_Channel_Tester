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
        std::string results_filename;
        unsigned long execution_rounds;
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

        void run_thread(std::string path, std::string param_list) {
            char output[100] = {0};
            int i = 0;
            FILE *in = popen((path + program + " " + param_list).c_str(), "r");
            while (!feof(in)) {
                output[i++] = (char)fgetc(in);
            }
            if(i > 0)
                output[--i] = 0; //replace -1 at the array's end with null character
            pclose(in);
            //save the results
            std::ofstream results_fp;
            std::lock_guard<std::mutex> guard(mtx);
            results_fp.open(results_filename, std::ios::app | std::ios::out);
            if (!strcmp(output, ""))
                std::cout << '*' << std::flush;
            results_fp << param_list << " " << output << std::flush;
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
                std::this_thread::sleep_for(std::chrono::milliseconds(50));
            }
            int status;
            for (i = 0; i < execution_rounds; i++) {
                execution_threads[i].join();
            }
            delete [] execution_threads;
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
                    results_fp << param_list << " " << output << std::flush;
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

        void augment_datasets() {
            std::ifstream results_file;
            unsigned long unique_count = 1;
            long i, j;
            //get number of lines in all-results file
            results_file.open("data/all-results.log", std::ios::in);
            long no_of_lines = -1;
            std::string line;
            while(!results_file.eof()) {
                std::getline(results_file, line);
                no_of_lines++;
            }
            results_file.clear();
            results_file.seekg(std::ios::beg);
            //get data and output in all-results file
            std::vector<int> *data = new std::vector<int>[no_of_lines];
            std::vector<long> output;
            int val_in;
            long val_out;
            for (i = 0; i < no_of_lines; i++) {
                for (j = 0; j < no_of_params; j++) {
                    results_file >> val_in;
                    data[i].push_back(val_in);
                }
                results_file >> val_out;
                output.push_back(val_out);
            }
            results_file.close();
            //set objective value
            std::set<long> output_set(output.begin(), output.end());

            //augment dataset with inputs of extra outputs
            bool is_not_in;
            std::set<int> data_col;
            for (i = 0; i < no_of_params; i++) {
                data_col.clear();
                for (j = 0; j < no_of_lines; j++)
                    data_col.insert(data[j][i]);
                for (int val : data_col) {
                    is_not_in = std::find(dataset[i].begin(), dataset[i].end(), val) == dataset[i].end();
                    if (is_not_in) {
                        dataset[i].push_back(val);
                        counts[i]++;
                    }
                }
            }
            backup_dataset();

            //augment best-results with extra outputs
            //get actual outputs in a set
            results_file.open(results_filename, std::ios::in);
            std::set<long> actual_output;
            for (i = 0; i < execution_rounds; i++) {
                for (j = 0; j < no_of_params; j++) {
                    results_file >> val_in;
                }
                results_file >> val_out;
                actual_output.insert(val_out);
            }
            results_file.close();
            //for extra outputs not in actual outputs, add their inputs to results file
            std::ofstream out_file(results_filename, std::ios::app);
            output_set.clear();
            for (i = 0; i < output.size(); i++) {
                val_out = output[i];
                is_not_in = std::find(actual_output.begin(), actual_output.end(), val_out) == actual_output.end() && std::find(output_set.begin(), output_set.end(), val_out) == output_set.end();
                if (is_not_in) {
                    for (j = 0; j < no_of_params; j++)
                        out_file << data[i][j] << " ";
                    out_file << val_out << std::endl;
                    output_set.insert(val_out);
                }
            }
            out_file.close();
            delete [] data;
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
            sort(output, no_of_lines);
            for (i = 1; i < no_of_lines; i++) {
                if (output[i] != output[i - 1])
                    unique_count++;
            }
            out_file.close();
            return unique_count;
//            //set insert method
//            std::set<long> output;
//            for (i = 0; i < no_of_lines; i++) {
//                for (j = 0; j < no_of_params; j++)
//                    out_file >> data;
//                out_file >> data;
//                output.insert(data);
//            }
//            out_file.close();
//            return output.size();
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
            dataset = new std::vector<int>[no_of_params];
            bkp_dataset = new std::vector<int>[no_of_params];
            for (int i = 0; i < no_of_params; i++) {
                if (counts[i] > 256)
                    this->counts[i] = 256;
                else
                    this->counts[i] = counts[i];
            }
            this->program_path = program_path;
            this->program = program;
            this->results_filename = "./data/temp-results.log";
            this->execution_rounds = execution_rounds;
            init_datasets();
        }

        ~optimal_data_finder() {
            delete [] dataset;
            delete [] bkp_dataset;
            delete [] counts;
        }

        long sim_ann(double t_init, double t_final, double alpha, int max_trials, std::string logfilename, bool resume, bool quiet) {
            std::ofstream logfile;
            bool acceptable;
            long double acceptance_prob;
            int trial_num, start_trial = 0;
            double temp;
            long new_obj, obj;
            int total_iterations= (int)((std::log(t_final) - std::log(t_init)) / std::log(alpha)) + 1;
            int iteration = 0, acceptance_count = 0;
//            double reduc_fact = (double)thesis::flipper_size / (double)total_iterations; //linear reducer
            double reduc_fact = (double)(std::exp((std::log(8) - std::log(thesis::flipper_size)) / total_iterations)); //exponential reducer
            int usable_flipper_size = thesis::flipper_size;
            auto now = std::chrono::system_clock::now();
            long start_time, elapsed_time;
            double delta_avg = 0;

            /*Initialization when execution is starting for the first time and not resuming*/
            if (!resume) {
                logfile.open(logfilename, std::ios::out);
                std::remove(results_filename.c_str());//removing previous execution temp result
                std::remove("data/all-results.log");
                run_program();
                obj = get_objective(results_filename, execution_rounds);
                write_dataset_to_file("data/best-dataset.csv");
                write_results_to_file("data/best-results.log");
                append_results_to_file("data/all-results.log");
                std::remove(results_filename.c_str());//removing temp result
                logfile << "Initial objective: " << obj << std::endl;
                logfile << "------------------------------------------------------------------\n";
                logfile << "Elapsed Time\tTemperature\tEpoch\tTrial\tObjective\tAcceptance\n";
                logfile << "------------------------------------------------------------------\n";
                if (!quiet) {
                    std::cout << "Initial objective: " << obj << std::endl;
                    std::cout << "--------------------------------------------------------------------------\n";
                    std::cout << "Elapsed Time\tTemperature\tEpoch\tTrial\tObjective\tAcceptance\n";
                    std::cout << "--------------------------------------------------------------------------\n";
                }
                now = std::chrono::system_clock::now();
                start_time = (std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch())).count();
            }
            /*Initialization when execution is resuming from a previous incomplete run*/
            else {
                std::ifstream logfile_in(logfilename, std::ios::in);
                int lines = 0;
                std::string line;
                int start;
                std::getline(logfile_in, line);
                start = (int)(line.find(":") + 1);
                if (!start) {
                    return -1;
                }
                obj = stol(line.substr(start, line.length()));
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
                        obj = stol(line.substr(start, line.length()));
                    }
                    lines++;
                }
                logfile_in.clear();
                logfile_in.seekg(0, std::ios::beg);
                int i;
                for (i = 0; i < lines; i++)
                    std::getline(logfile_in, line);
                char ch;
                i = 0;
                start = 0;
                //timestamp
                elapsed_time = 0;
                elapsed_time += stoi(line.substr(start, line.length())) * 3600000;//hrs*60*60*1000*1000
                start = (int)(line.find(":") + 1);
                elapsed_time += stoi(line.substr(start, line.length())) * 60000;
                start = (int)(line.find(":", start) + 1);
                elapsed_time += (stod(line.substr(start, line.length())) * 1000);
                //temperature and usable flipper size
                start = (int)(line.find("\t", start) + 1);
                double t_initx = stod(line.substr(start, line.length()));
                double temp = t_initx;
                while (temp <= t_init) {
                    temp /= alpha;
                    usable_flipper_size *= reduc_fact;
                }
                t_init = t_initx;
                //iteration
                start = (int)(line.find("\t", start) + 1);
                iteration = stoi(line.substr(start, line.length())) - 1;
                //start_trial
                start = (int)(line.find("\t", start) + 1);
                start_trial = stoi(line.substr(start, line.length()));
                logfile_in.close();
                logfile.open(logfilename, std::ios::app);
                //start time
                start_time = (std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch())).count() - elapsed_time;
            }

            /*Starting simulated annealing process*/
            try {
                for (temp = t_init; temp >= t_final; temp *= alpha) {
                    ++iteration;
                    usable_flipper_size *= reduc_fact; //exponential reduction in neighbourhood size

                    for (trial_num = start_trial; trial_num < max_trials; trial_num++) {
                        //mutate, execute and get objective value
                        mutate_dataset(2, usable_flipper_size);
                        run_program();
                        new_obj = get_objective(results_filename, execution_rounds);
                        append_results_to_file("data/all-results.log");

                        //Update execution log
                        now = std::chrono::system_clock::now();
                        elapsed_time = (std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch())).count() - start_time;
                        logfile << std::setw(12) << format_time(elapsed_time) << '\t';
                        logfile << std::setprecision(8) << std::setw(11) << temp << '\t';
                        logfile << std::setw(1) << iteration << '/' << total_iterations << '\t';
                        logfile << std::setw(1) << trial_num + 1 << '/' << max_trials << '\t';
                        logfile << std::setw(6) << new_obj << '\t';
                        if (!quiet) {
                            std::cout << std::setw(12) << format_time(elapsed_time) << '\t';
                            std::cout << std::setprecision(8) << std::setw(11) << temp << '\t';
                            std::cout << std::setw(1) << iteration << '/' << total_iterations << '\t';
                            std::cout << std::setw(1) << trial_num + 1 << '/' << max_trials << '\t';
                            std::cout << std::setw(6) << new_obj << '\t';
                        }

                        //Check acceptance
                        acceptable = new_obj > obj;
                        if (new_obj < obj) {
                            if (!acceptance_count)
                                delta_avg = obj - new_obj;
                            acceptance_prob = std::exp((new_obj - obj)/ (temp * delta_avg));
                            acceptable = acceptance_prob > ((double) rand1000(seed) / 1000.0);
                        }
//                        else {//new_obj >= obj
//                            augment_datasets();
//                            write_dataset_to_file("data/best-dataset.csv");
//                            write_results_to_file("data/best-results.log");
//                        }

                        //If new objective value has been accepted, update best results and log
                        if (acceptable) {
                            acceptance_count++;
                            write_dataset_to_file("data/best-dataset.csv");
                            write_results_to_file("data/best-results.log");
                            backup_dataset();
                            obj = new_obj;
                            if (new_obj > obj)
                                delta_avg = (delta_avg * (acceptance_count - 1) + new_obj - obj) / acceptance_count;
                            else
                                delta_avg = (delta_avg * (acceptance_count - 1) + obj - new_obj) / acceptance_count;
                            logfile << std::setw(10) << "Y";
                            if (!quiet)
                                std::cout << std::setw(13) << "Y";
                        }
                        //If new objective value has not been accepted, update log
                        else {
                            restore_dataset();
                            logfile << std::setw(10) << "N";
                            if (!quiet)
                                std::cout << std::setw(13) << "N";
                        }
                        logfile << std::endl;
                        if (!quiet)
                            std::cout << std::endl;
						std::remove(results_filename.c_str());//removing previous execution temp result
                    }
                    start_trial = 0;
                }
            }
            catch(const char* msg) {
                std::cout << "\nAn exception occurred.\n" << msg << std::endl;
                return -1;
            }
            logfile.close();
            return obj;
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
            std::ifstream src(results_filename, std::ios::in);
            std::ofstream dest(filename, std::ios::out);
            dest << src.rdbuf();
            dest.close();
            src.close();
        }

        void append_results_to_file(std::string filename) {
            std::ifstream src(results_filename, std::ios::in);
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
            ms_str << std::setprecision(4) << ms;
            return (std::to_string(h) + ":" + std::to_string(m) + ":" + std::to_string(s) + "." + ms_str.str());
        }
    };
}

#endif //THESISDEV_EXECUTOR_H
