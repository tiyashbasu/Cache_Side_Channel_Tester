#include <algorithm>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <thread>
#include <csignal>
#include <set>

#ifndef MAX_EXECS
#define MAX_EXECS 500000
#endif

std::string program;
std::string input_filename;
std::string output_filename;
std::string report_filename;

int thread_count;
std::thread* execution_threads;
int* output_values;
std::set<int> output_set;

std::ifstream input_fp;
std::ofstream output_fp;
std::ofstream report_fp;

void escapify(std::string* str, std::string to_escape) {
    int pos = (int)(*str).find(to_escape);
    while (pos >= 0) {
        (*str).replace(pos, 1, "\\" + to_escape);
        pos = (int)(*str).find(to_escape, pos + to_escape.length() + 1);
    }
    return;
}

void sanitize(std::string* str) {
    std::replace((*str).begin(), (*str).end(), ',', ' ');
    escapify(str, "\\");
    escapify(str, "\"");
    escapify(str, "'");
    escapify(str, "|");
    escapify(str, "`");
    escapify(str, "(");
    escapify(str, ")");
    escapify(str, "{");
    escapify(str, "}");
    escapify(str, "[");
    escapify(str, "]");
    escapify(str, ">");
    escapify(str, "<");
    escapify(str, "&");
    escapify(str, "$");
    escapify(str, "#");
    escapify(str, ";");
    return;
}

void run_thread(std::string param_list, int index) {
    char output_ch[256] = {0};
    int i = 0;
    FILE *in = popen((program + " " + param_list).c_str(), "r");

    /*read first character and return if target fails*/
    output_ch[0] = (char)fgetc(in);
    if (output_ch[0] == 'F') {
        output_values[index] = -1;
        pclose(in);
        return;
    }

    /*if target does not fail, continue reading 'in'*/
    i = 1;
    while (!feof(in)) {
        output_ch[i++] = (char)fgetc(in);
    }
    if(i > 0)
        output_ch[--i] = 0; //replace -1 at the array's end with null character
    output_values[index] = atoi(output_ch);

    /*cleanup and return*/
    pclose(in);
    return;
}

void run_program() { //parallel execution using threads
    long i, j;
    std::string line;
    unsigned long total_execution_count;

    /*open input and out file streams*/
    input_fp.open(input_filename, std::ios::in);

//    for (i = 0; i < 116100; i++)
//        std::getline(input_fp, line);

    /*process all inputs of input file*/
    total_execution_count = 0;
    while (!input_fp.eof() && total_execution_count < MAX_EXECS) {
        for (i = 0; i < thread_count; i++) {
            /*read input into string and sanitize it*/
            std::getline(input_fp, line);
            sanitize(&line);

//            std::cout << i << ": " << line << std::flush;
//            run_thread(line, i);
//            std::cout << ": " << output_values[i] << std::endl;

            execution_threads[i] = std::thread(run_thread, line, i);
            std::this_thread::sleep_for(std::chrono::milliseconds(10));

            if (input_fp.eof())
                break;
        }

        /*join threads and write results to file*/
        output_fp.open(output_filename, std::ios::app);
        for (j = 0; j < i; j++) {
            execution_threads[j].join();
            output_fp << output_values[j] << '\n';
        }
        output_fp.close();

        total_execution_count += i;
        for (j = 1; j < i; j++) {
            output_set.insert(output_values[j]);
        }
        output_set.erase(-1);

        report_fp.open(report_filename, std::ios::app);
        report_fp << std::setw(20) << total_execution_count << '\t' << std::setw(14) << output_set.size() << std::endl;
        report_fp.close();
        std::cout << std::setw(20) << total_execution_count << '\t' << std::setw(14) << output_set.size() << std::endl;
    }

    /*cleanup and exit*/
    input_fp.close();
    return;
}

void handle_signal(int signum) {
    output_fp.close();
    report_fp.close();
    input_fp.close();
    exit(3);
}

int main(int argc, char *argv[]) {
    signal(SIGINT, handle_signal);
    signal(SIGTERM, handle_signal);

	if (argc < 7) {
		std::cout << "Usage: csv-exec <executable directory> <executable name> <input csv file> <output_values file> <report file> <rounds per run>" << std::endl;
		return 1;
	}

    /*initializing global variables*/
    program = "cd " + std::string(argv[1]) + " && ./" + std::string(argv[2]);
    input_filename = argv[3];
    output_filename = argv[4];
    report_filename = argv[5];
    thread_count = atoi(argv[6]);
    output_values = new int[thread_count];
    execution_threads = new std::thread[thread_count];

    /*removing existing files*/
    std::remove(report_filename.data());
    std::remove(output_filename.data());

    /*printing headers to report file*/
    report_fp.open(report_filename, std::ios::out);
    report_fp << "--------------------------------------" << '\n';
    report_fp << "Executions completed\tUnique Outputs" << '\n';
    report_fp << "--------------------------------------" << std::endl;
    report_fp.close();
    std::cout << "--------------------------------------" << '\n';
    std::cout << "Executions completed\tUnique Outputs" << '\n';
    std::cout << "--------------------------------------" << std::endl;

    /*starting threaded execution process*/
    run_program();

    /*cleanup and exit*/
    delete [] output_values;
    delete [] execution_threads;
    return 0;
}
