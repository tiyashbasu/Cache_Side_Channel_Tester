#include <iomanip>
#include <csignal>
#include <sys/stat.h>
#include "optimal_data_finder.h"

int read_config_file(std::string config_filename, std::string* target_dir, std::string* target_name, int* no_of_params, int** counts, unsigned long* exec_times, double* t_init, double* t_final, double* alpha, int* max_trials) {
    std::ifstream config_file;
    std::string line;
    config_file.open(config_filename, std::ios::in);
    if (!config_file.is_open())
        return -2;
    while (!config_file.eof()) {
        std::getline(config_file, line);
        if (line.empty() || line[0] == '#')
            continue;
        std::istringstream stream(line);
        std::string param_name;
        if (line.find("target_dir") == 0) {
            stream >> param_name;
            stream >> *target_dir;
        }
        else if (line.find("program_name") == 0) {
            stream >> param_name;
            stream >> *target_name;
//            std::getline(stream, *target_name, '\n');
        }
        else if (line.find("no_of_params") == 0) {
            stream >> param_name;
            stream >> *no_of_params;
        }
        else if (line.find("counts") == 0) {
            stream >> param_name;
            *counts = new int[*no_of_params];
            for (int i = 0; i < *no_of_params; i++) {
                stream >> (*counts)[i];
            }
        }
        else if (line.find("exec_times") == 0) {
            stream >> param_name;
            stream >> *exec_times;
        }
        else if (line.find("t_init") == 0) {
            stream >> param_name;
            stream >> *t_init;
        }
        else if (line.find("t_final") == 0) {
            stream >> param_name;
            stream >> *t_final;
        }
        else if (line.find("alpha") == 0) {
            stream >> param_name;
            stream >> *alpha;
        }
        else if (line.find("max_trials") == 0) {
            stream >> param_name;
            stream >> *max_trials;
        }
    }
    config_file.close();
    struct stat buffer;
    return (stat ((*target_dir + "/" + *target_name).c_str(), &buffer));
}

int main(int argc, char *argv[]) {
    signal(SIGINT, SIG_IGN);
    signal(SIGTSTP, SIG_IGN);

	if (argc < 3) {
		std::cout << "Usage: thesisdev config_file log_file <resume> <quiet> (parameters in <> are optional)\n"
            "Examples:\n\t./thesisdev config.txt execution.log quiet\n\t./thesisdev config.txt execution.log resume\n";
		return 1;
	}

    int no_of_params;
    int *counts= nullptr;
    unsigned long exec_times;
    std::string program_path;
    std::string program_name;

    double t_init, t_final, alpha;
    int max_trials;
    long obj;
    bool resume = false;
    bool quiet = false;
    if (argc == 4) {
        resume = !(std::string("resume").compare(argv[3]));
        quiet = !(std::string("quiet").compare(argv[3]));
    }
    if (argc == 5) {
        resume = !(std::string("resume").compare(argv[3]));
        quiet = !(std::string("quiet").compare(argv[4]));
    }

    int status = read_config_file(argv[1], &program_path, &program_name, &no_of_params, &counts, &exec_times, &t_init, &t_final, &alpha, &max_trials);
    if (!status) {
        thesis::optimal_data_finder data_finder(no_of_params, counts, program_path, program_name, exec_times);
        obj = data_finder.sim_ann(t_init, t_final, alpha, max_trials, argv[2], resume, quiet);
        if (obj >= 0) {
            std::ofstream logfile(argv[2], std::ios::app);
            logfile << "Final objective: " << obj;
            if (!quiet)
                std::cout << "Final objective: " << obj << "\n";
            logfile.close();
        }
        else
            std::cout << "Execution log file is either not present or is invalid." << std::endl;
    }
    else if (status == -1)
        std::cout << "Target " << program_name << " could not be found." << std::endl;
    else if (status == 2)
        std::cout << "Configuration file is either absent or invalid." << std::endl;
    delete [] counts;
    return 0;
}