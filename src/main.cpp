#include <iomanip>
#include <csignal>
#include "optimal_data_finder.h"

int read_config_file(std::string config_filename, std::string* prog_path, std::string* prog_name, int* no_of_params, int** counts, unsigned long* exec_times, double* t_init, double* t_final, double* alpha, int* max_trials) {
    std::ifstream config_file;
    std::string line;
    config_file.open(config_filename, std::ios::in);
    if (!config_file.is_open())
        return 1;
    while (!config_file.eof()) {
        std::getline(config_file, line);
        if (line.empty() || line[0] == '#')
            continue;
        std::istringstream stream(line);
        std::string param_name;
        if (line.find("program_path") == 0) {
            stream >> param_name;
            stream >> *prog_path;
        }
        else if (line.find("program_name") == 0) {
            stream >> param_name;
            stream >> *prog_name;
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
    return 0;
}

int main(int argc, char *argv[]) {
    signal(SIGINT, SIG_IGN);
    signal(SIGTSTP, SIG_IGN);

	if (argc < 3) {
		std::cout << "Usage: thesisdev <config file> <log file> OR thesisdev <config file> <log file> resume\n"
            "Examples:\n\t./thesisdev config.txt execution.log\n\t./thesisdev config.txt execution.log resume\n";
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

    int status = read_config_file(argv[1], &program_path, &program_name, &no_of_params, &counts, &exec_times, &t_init, &t_final, &alpha, &max_trials);
    if (!status) {
        thesis::optimal_data_finder data_finder(no_of_params, counts, program_path, program_name, exec_times);
        obj = data_finder.sim_ann(t_init, t_final, alpha, max_trials, argv[2], (argc == 4 && !std::string("resume").compare(argv[3])));
        if (obj >= 0) {
            std::cout << "\nDone. Final objective: " << obj << "\n";
            std::ofstream logfile(argv[2], std::ios::app);
            logfile << "Final objective: " << obj;
            logfile.close();
        }
        else
            std::cout << "Execution log file is either not present or is invalid." << std::endl;
    }
    else {
        std::cout << "Configuration file is either not present or is invalid." << std::endl;
    }
    delete [] counts;
    return 0;
}
