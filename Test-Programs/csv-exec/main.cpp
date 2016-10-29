#include <algorithm>
#include <iostream>
#include <fstream>
#include <thread>
#include <chrono>

std::string path;
std::string program;
std::string results_filename;
std::string input_file;

void escapify(std::string* str, std::string to_escape) {
    int pos = (*str).find(to_escape);
    while (pos >= 0) {
        (*str).replace(pos, 1, "\\" + to_escape);
        pos = (*str).find(to_escape, pos + to_escape.length() + 1);
    }
    return;
}

void sanitize(std::string* str) {
    std::replace((*str).begin(), (*str).end(), ',', ' ');
    escapify(str, "\"");
    escapify(str, "'");
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

void run_thread(std::string param_list) {
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
    results_fp.open(results_filename, std::ios::app);
//    results_fp << param_list << " " << std::string(output) << "\n";
    results_fp << std::string(output) << "\n";
    results_fp.close();
    return;
}

void run_program() { //parallel execution using threads
    int i;
    std::string line;
    std::ifstream input_fp(input_file, std::ios::in);
    int line_count = -1;
    while(!input_fp.eof()) {
        std::getline(input_fp, line);
        line_count++;
    }
    input_fp.clear();
    input_fp.seekg(std::ios::beg);
    std::thread *execution_threads = new std::thread[line_count];
    std::string param_list[line_count];
    for (i = 0; i < line_count; i++) {
        std::getline(input_fp, line);
        sanitize(&line);
        param_list[i] = line;
//        std::cout << i + 1 << ": " << param_list[i] << std::endl;
//        run_thread(param_list[i]);
        execution_threads[i] = std::thread(run_thread, param_list[i]);
        std::this_thread::sleep_for(std::chrono::milliseconds(30));
    }
    for (i = 0; i < line_count; i++) {
        execution_threads[i].join();
    }
    delete [] execution_threads;
    return;
}

int main(int argc, char *argv[]) {
    path = "cd ";
    path += argv[1];
    path += " && ./";
    program = argv[2];
    input_file = argv[3];
    results_filename = "./temp_output.log";
    std::remove("./temp_output.log");
    run_program();
    system("echo \"Unique Output: \" `expr $(cat ./temp_output.log | sort | uniq | wc -l) - 1`");
    return 0;
}
