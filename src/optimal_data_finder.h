#ifndef OPTIMAL_DATA_FINDER
#define OPTIMAL_DATA_FINDER

#include <cmath>
#include <set>
#include <iomanip>
#include <iostream>
#include <fstream>
#include <random>
#include <thread>
#include <cstring>
#include <algorithm>

#include "flipper.h"
#include "sort.h"

#ifndef MAX_THREADS
#define MAX_THREADS 30
#endif

namespace thesis {
    std::mt19937_64 seed(time(NULL));
    std::uniform_int_distribution<int> rand1000(0, 1000);

    class optimal_data_finder {
    private:
        std::vector<int> *dataset;
        std::vector<int> *bkp_dataset;
        int *counts;
        int no_of_params;
        std::string target_dir;
        std::string target_name;
        std::string single_run_results_filename;
        unsigned long execution_rounds;
        int **params;
        int *outputs;
        int output_offset;

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

        void read_dataset_from_file(std::string filename) {
            int i, j;
            int data;
            std::ifstream file_fp(filename, std::ios::in);
            std::string line;
            std::istringstream line_stream;
            for (i = 0; i < no_of_params; i++) {
                file_fp >> line;
                std::replace(line.begin(), line.end(), ',', ' ');
                line_stream.str(line);
                for (j = 0; j < counts[i]; j++) {
                    line_stream >> data;
                    dataset[i][j] = data;
                }
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
            std::ifstream src(single_run_results_filename, std::ios::in);
            std::ofstream dest(filename, std::ios::out);
            dest << src.rdbuf();
            dest.close();
            src.close();
        }

        void append_results_to_file(std::string filename) {
            std::ifstream src(single_run_results_filename, std::ios::in);
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
            char output_ch[20] = {0};
            char* offset_line;
            size_t offset_len = 0;
            char cmd[256] = {0};
            int i, temp_rand;
            FILE* in;

            /*keep on trying to execute with a random input until success*/
            while (true) {
                /*preparing input and command*/
                strcpy(cmd, program);
                for (i = 0; i < no_of_params; i++) {
                    temp_rand = dataset[i][rand1000(seed) % counts[i]];
                    strcat(strcat(cmd, " "), std::to_string(temp_rand).data());
                    params[round_num][i] = temp_rand;
                }
//                std::cout << std::string(cmd) << std::endl;

                /*executing target*/
                in = popen(cmd, "r");

                /*skipping all lines marked till output_offset*/
                for (i = 0; i < output_offset; i++)
                    getline(&offset_line, &offset_len, in);

                /*breaking if target does not report failure*/
                output_ch[0] = (char)fgetc(in);
                if (output_ch[0] == 'F')
                    pclose(in);
                else
                    break;
            }

            /*recording rest of the results character by character into a string (this is faster than getline or fgets)*/
            i = 1;
            while (!feof(in)) {
                output_ch[i++] = (char)fgetc(in);
            }
            if(i > 0)
                output_ch[--i] = 0; //replace -1 at the array's end with null character
            pclose(in);

            /*finally, converting the output string to an integer*/
            outputs[round_num] = std::atoi(output_ch);

            return;
        }

        void run_program() {
            int i, j;
            int total_executions = 0;
            std::string path = "cd " + target_dir + " && ./" + target_name;

#if defined PARALLEL
            std::thread *execution_threads = new std::thread[MAX_THREADS];
#endif

            while (total_executions < execution_rounds) {

#if defined SERIAL
                run_thread(path.data(), total_executions);
                total_executions++;

#elif defined PARALLEL
                /*spawning a batch of threads to execute target*/
                for (i = 0; i < MAX_THREADS && total_executions < execution_rounds; i++) {
                    execution_threads[i] = std::thread(&optimal_data_finder::run_thread, this, path.data(), total_executions);
                    std::this_thread::sleep_for(std::chrono::milliseconds(10));
                    total_executions++;
                }

                /*waiting for the batch of threads to exit.*/
                for (j = 0; j < i; j++) {
                    execution_threads[j].join();
                }
#endif
            }

            /*writing results to output file.*/
            int datax;
            std::ofstream temp_results_fp(single_run_results_filename, std::ios::out);
            for (i = 0; i < execution_rounds; i++) {
                for (j = 0; j < no_of_params; j++) {
                    datax = params[i][j];
                    temp_results_fp << params[i][j] << '\t';
                }
                datax = outputs[i];
                temp_results_fp << outputs[i] << '\n';
            }
            temp_results_fp.close();

            /*cleanup and exit*/
#if defined PARALLEL
            delete [] execution_threads;
#endif
            return;
        }

        unsigned long get_objective(std::string results_filename, long no_of_lines) {
            std::ifstream out_file;
            int i, j;
            long data;
            out_file.open(results_filename, std::ios::in);

            /*if no_of_lines < 0, count number of lines in output file*/
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

            /*reading output values into array*/
            long output[no_of_lines];
            unsigned long unique_count = 1;
            for (i = 0; i < no_of_lines; i++) {
                for (j = 0; j < no_of_params; j++)
                    out_file >> data;
                out_file >> output[i];
            }

            /*sorting the array*/
            thesis::array_sorter<long> sorter;
            sorter.sort(output, (unsigned long)no_of_lines);

            /*counting unique values in the array*/
            for (i = 1; i < no_of_lines; i++) {
                if (output[i] != output[i - 1])
                    unique_count++;
            }

            /*cleanup and exit*/
            out_file.close();
            return unique_count;
        }

        void init_start_simann(const std::string report_filename, long* obj, const bool quiet) {

            /*removing previous execution result*/
            std::remove("data/all-results.log");

            if (!quiet) {
                std::cout << "Initializing..." << std::flush;
            }

            /*execute the target to get an initial value to begin search*/
            run_program();
            *obj = get_objective(single_run_results_filename, execution_rounds);

            /*save initial results to files*/
            write_dataset_to_file("data/best-dataset.csv");
            write_results_to_file("data/best-results.log");
            append_results_to_file("data/all-results.log");

            /*logging headers*/
            std::ofstream report_fp(report_filename, std::ios::out);
            report_fp << "Initial objective: " << *obj << std::endl;
            report_fp << "------------------------------------------------------------------\n";
            report_fp << "Elapsed Time\tTemperature\tEpoch\tTrial\tObjective\tAcceptance\n";
            report_fp << "------------------------------------------------------------------\n";
            report_fp.close();
            if (!quiet) {
                std::cout << "Initial objective: " << *obj << std::endl;
                std::cout << "--------------------------------------------------------------------------\n";
                std::cout << "Elapsed Time\tTemperature\tEpoch\tTrial\tObjective\tAcceptance\n";
                std::cout << "--------------------------------------------------------------------------\n";
            }

            /*cleanup and exit*/
            return;
        }

        void init_resume_simann(const std::string report_filename, long* obj, double* t_init, const double alpha, int* usable_flipper_size, const double reduc_fact, int* epoch, int* start_trial, const int max_trials, long *elapsed_time) {
            std::ifstream report_fp(report_filename, std::ios::in);
            int lines = 0;
            std::string line;
            long start;
            std::getline(report_fp, line);
            start = (int)(line.find(":") + 1);

            *obj = stol(line.substr(start, line.length()));
            while (!report_fp.eof()) {
                std::getline(report_fp, line);
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
            report_fp.clear();
            report_fp.seekg(0, std::ios::beg);

            int i;
            for (i = 0; i < lines; i++)
                std::getline(report_fp, line);

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
            //epoch
            start = (int)(line.find("\t", start) + 1);
            *epoch = stoi(line.substr(start, line.length())) - 1;
            //start_trial
            start = (int)(line.find("\t", start) + 1);
            *start_trial = stoi(line.substr(start, line.length()));

            if (*start_trial == max_trials) {
                *start_trial = 0;
                *t_init *= alpha;
                (*epoch)++;
            }

            read_dataset_from_file("./data/best-dataset.csv");
            report_fp.close();
            return;
        }

        void logger(std::string report_filename, const long elapsed_time, const double temp, const int iteration, const int total_iterations, const int trial_num, const int max_trials, const long new_obj, const bool is_accepted, const bool quiet) {
            std::ofstream report_fp(report_filename, std::ios::app);
            report_fp << std::setw(12) << format_time(elapsed_time) << '\t';
            report_fp << std::fixed << std::setprecision(6) << std::setw(11) << temp << '\t';
            report_fp << std::setw(2) << iteration << '/' << total_iterations << '\t';
            report_fp << std::setw(2) << trial_num + 1 << '/' << max_trials << '\t';
            report_fp << std::setw(9) << new_obj << '\t';
            report_fp << std::setw(10) << (is_accepted? 'Y' : 'N') << std::endl;
            report_fp.close();

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

            /*for each target parameter*/
            for (i = 0; i < no_of_params; i++) {

                /*for each position in its set*/
                for (j = 0; j < counts[i]; j++) {

                    /*get a unique value*/
                    not_unique = true;
                    while(not_unique) {
                        temp_rand = rand1000(seed) % 256;
                        for (k = 0; k < j; k++)
                            if (temp_rand == dataset[i][k])
                                break;
                        not_unique = (k != j);
                    }
                    dataset[i].push_back(temp_rand);

                    /*and back it up as well*/
                    bkp_dataset[i].push_back(temp_rand);
                }
            }
        }

        virtual void mutate_dataset(int factor, int size) {
            int i, j;
            bool do_mutation;
            int flipper_index;

            /*for each target parameter*/
            for (i = 0; i < no_of_params; i++) {

                /*for each position in its set*/
                for (j = 0; j < counts[i]; j++) {

                    /*check randomly if it should be mutated or not*/
                    do_mutation = (bool)(rand1000(seed) % factor);

                    /*mutate the data*/
                    if (!do_mutation) {
                        flipper_index = rand1000(seed) % size;
                        dataset[i][j] ^= thesis::flipper[flipper_index];
                    }
                }
            }
        }

    public:
        optimal_data_finder(int no_of_params, int* counts, std::string target_dir, std::string target_name, unsigned long execution_rounds) {
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
            this->target_dir = target_dir;
            this->target_name = target_name;
            this->single_run_results_filename = "./data/temp-results.log";
            this->execution_rounds = execution_rounds;
            this->outputs = new int[execution_rounds];
            this->params = new int*[execution_rounds];
            for (int i = 0; i < execution_rounds; i++) {
                this->params[i] = new int[no_of_params];
            }
            this->output_offset = 0;
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

        long sim_ann(double t_init, double t_final, double alpha, int max_trials, std::string report_filename, bool resume, bool quiet) {
            bool is_accepted;
            long double acceptance_prob = 0;
//            double delta_avg = 0;
            int trial_num, trial_start_index = 0;
            double current_temperature;
            long new_obj, obj;
            double obj_avg = 0;
            int total_epochs = (int)((std::log(t_final) - std::log(t_init)) / std::log(alpha)) + 1;
            int epoch = 0, acceptance_count = 0;
            double flipper_reduction_factor = std::exp((std::log(8) - std::log(thesis::flipper_size)) / total_epochs); //exponential reducer
            int flipper_size = thesis::flipper_size;
            auto now = std::chrono::system_clock::now();
            long start_time, elapsed_time;
            std::thread logger_thread;

            /*Initialization when execution is starting for the first time and not resuming*/
            if (!resume) {
                init_start_simann(report_filename, &obj, quiet);
                obj_avg = obj;
                now = std::chrono::system_clock::now();
                start_time = (std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch())).count();
            }
            /*Initialization when execution is resuming from a previous incomplete run*/
            else {
                init_resume_simann(report_filename, &obj, &t_init, alpha, &flipper_size, flipper_reduction_factor, &epoch, &trial_start_index, max_trials, &elapsed_time);
                now = std::chrono::system_clock::now();
                start_time = (std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch())).count() - elapsed_time;
            }

            /*Starting simulated annealing process*/
            try {
                for (current_temperature = t_init; current_temperature >= t_final; current_temperature *= alpha) {
                    ++epoch;
                    flipper_size = 50;//override neighbourhood reduction for now

                    for (trial_num = trial_start_index; trial_num < max_trials; trial_num++) {

                        //mutate dataset, execute target and get objective value
                        mutate_dataset(2, flipper_size);
                        run_program();
                        if (logger_thread.joinable())
                            logger_thread.join();
                        new_obj = get_objective(single_run_results_filename, execution_rounds);
                        append_results_to_file("data/all-results.log");

                        //Record time interval
                        now = std::chrono::system_clock::now();
                        elapsed_time = (std::chrono::duration_cast<std::chrono::milliseconds>(now.time_since_epoch())).count() - start_time;

                        //Check acceptance
                        is_accepted = new_obj >= obj;
                        if (new_obj < obj) {
                            if (!acceptance_count)
//                                delta_avg = obj - new_obj;
//                            acceptance_prob = std::exp((new_obj - obj)/ (current_temperature * delta_avg));
                            acceptance_prob = std::exp((new_obj - obj) * 20 / (current_temperature * obj_avg));
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

                        logger_thread = std::thread(&optimal_data_finder::logger, this, report_filename, elapsed_time, current_temperature, epoch, total_epochs, trial_num, max_trials, new_obj, is_accepted, quiet);

                    }
                    logger_thread.join();
                    trial_start_index = 0;
                    flipper_size *= flipper_reduction_factor; //exponential reduction in neighbourhood size
                }
            }
            catch(const char* msg) {
                std::cout << "\nAn exception occurred.\n" << msg << std::endl;
                return -1;
            }

            /*cleanup and exit*/
//            report_fp.close();
            std::remove(single_run_results_filename.c_str());//removing previous execution current_temperature result
            return obj;
        }
    };
}

#endif //THESISDEV_EXECUTOR_H
