#include <iomanip>
#include "optimal_data_finder.h"

int read_config_file(std::string config_filename, std::string* prog_path, std::string* prog_name, std::string* results_filename, int* no_of_params, int* counts, int* exec_times, double* t_init, double* t_final, double* alpha, int* max_trials) {
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
        else if (line.find("results_filename") == 0) {
            stream >> param_name;
            stream >> *results_filename;
        }
        else if (line.find("no_of_params") == 0) {
            stream >> param_name;
            stream >> *no_of_params;
        }
        else if (line.find("counts") == 0) {
            stream >> param_name;
            for (int i = 0; i < *no_of_params; i++)
                stream >> *(counts + i);
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
	if (argc != 2) {
		std::cout << "Usage example: ./thesisdev config.txt\n";
		return 1;
	}
	
    int no_of_params = 16;
    int counts[no_of_params];
    for (int i = 0; i < no_of_params; i++)
        counts[i] = 5;
    int exec_times = 80;
    std::string program_path = "./aessim";
    std::string program_name = "aessim";
    std::string results = "./aessim/output/aessim-results.log";

    double t_init = 2.0, t_final = 0.01, alpha = 0.9;
    int max_trials = 5;

    int status = read_config_file(argv[1], &program_path, &program_name, &results, &no_of_params, counts, &exec_times, &t_init, &t_final, &alpha, &max_trials);
    if (!status) {
        thesis::optimal_data_finder data_finder(no_of_params, counts, program_path, program_name, exec_times, results);
        data_finder.sim_ann(t_init, t_final, alpha, max_trials);
    }

}
