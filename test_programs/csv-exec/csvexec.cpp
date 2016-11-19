#include <algorithm>
#include <iostream>
#include <iomanip>
#include <fstream>
#include <thread>
#include <csignal>
#include <set>
#include <map>
#include <cstring>
#include <sys/stat.h>

#ifndef MAX_THREADS
#define MAX_THREADS 100
#endif

#ifndef THREAD_SLEEP_PERIOD
#define THREAD_SLEEP_PERIOD 10
#endif

std::string program;
std::string input_filename;
std::string output_filename;
std::string report_filename;

int reporting_freq;
int max_execs;
int max_threads;
std::thread* execution_threads;
int* output_values;
std::set<long> output_set;

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

void run_program(bool resume) { //parallel execution using threads
    long i, j;
    std::string line;
    unsigned long total_execution_count = 0;
    unsigned long round_exec_count;
    std::map<std::string, long> iomap;
    std::map<std::string, long>::iterator io_finder;

    /*open input and out file streams*/
    input_fp.open(input_filename, std::ios::in);

    if (resume) {

        std::ifstream output_fp(output_filename, std::ios::in);
        std::string ip_line, op_line;

        round_exec_count = 0;

        while (!output_fp.eof()) {

            std::getline(output_fp, op_line);
            if (op_line == "")
                break;
            std::getline(input_fp, ip_line);
            if (!op_line.length())
                break;
            long op = atol(op_line.data());

#if defined SERIAL
            if (iomap.find(ip_line) == iomap.end()) {
                output_set.insert(op);
                iomap.insert(std::pair<std::string, long>(ip_line, op));
            }
#elif defined PARALLEL
            output_set.insert(op);
#endif

            round_exec_count++;
            total_execution_count++;

            if (round_exec_count == reporting_freq) {
                report_fp.open(report_filename, std::ios::app);
                report_fp << std::setw(20) << total_execution_count << '\t' << std::setw(14) << output_set.size() << std::endl;
                report_fp.close();
                round_exec_count = 0;
            }
        }
        output_fp.close();
        output_set.erase(-1);
    }

    while (!input_fp.eof() && total_execution_count < max_execs) {

        round_exec_count = 0;

        while (!input_fp.eof() && round_exec_count < reporting_freq && total_execution_count < max_execs) {

#if defined SERIAL
            std::getline(input_fp, line);
            sanitize(&line);
            io_finder = iomap.find(line);

            if (io_finder == iomap.end()) {
                run_thread(line, round_exec_count);
                iomap.insert(std::pair<std::string, long>(line, output_values[round_exec_count]));
            } else {
                output_values[round_exec_count] = io_finder->second;
            }

            round_exec_count++;
            total_execution_count++;

#elif defined PARALLEL
            round_exec_count = 0;

            for (i = 0; i < max_threads && !input_fp.eof() && total_execution_count < max_execs; i++, round_exec_count++, total_execution_count++) {
                std::getline(input_fp, line);
                sanitize(&line);

                execution_threads[i] = std::thread(run_thread, line, round_exec_count);
                std::this_thread::sleep_for(std::chrono::milliseconds(THREAD_SLEEP_PERIOD));
            }

            for (j = 0; j < i; j++) {
                if (execution_threads[j].joinable())
                    execution_threads[j].join();
            }
#endif
        }

        output_fp.open(output_filename, std::ios::app);
        for (i = 0; i < round_exec_count; i++) {
            output_fp << output_values[i] << '\n';
            output_set.insert(output_values[i]);
        }
        output_fp.close();
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
		std::cout << "Usage: csvexec <executable directory> <executable name> <input csv file> <output_values file> <report file> <total executions> <reporting frequency>" << std::endl;
		return 1;
	}

    /*initializing global variables*/
    program = "cd " + std::string(argv[1]) + " && ./" + std::string(argv[2]);
    input_filename = argv[3];
    output_filename = argv[4];
    report_filename = argv[5];
    max_execs = atol(argv[6]);
    reporting_freq = atoi(argv[7]);
    output_values = new int[reporting_freq];
    bool resume = false;


#if defined PARALLEL
    max_threads = (MAX_THREADS < reporting_freq) ? MAX_THREADS : reporting_freq;
    execution_threads = new std::thread[max_threads];
#endif

    struct stat buffer;
    resume = (stat (output_filename.c_str(), &buffer) == 0);

    /*removing existing files*/
    std::remove(report_filename.data());
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
    run_program(resume);

    /*cleanup and exit*/
    delete [] output_values;

#if defined PARALLEL
    delete [] execution_threads;
#endif

    return 0;
}
