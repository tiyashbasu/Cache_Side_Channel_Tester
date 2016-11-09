#include <iostream>
#include <cstring>
#include <fstream>

void escapify(std::string* str, std::string to_escape) {
    int pos = (*str).find(to_escape);
    while (pos >= 0) {
        (*str).replace(pos, 1, "\\" + to_escape);
        pos = (*str).find(to_escape, pos + to_escape.length() + 1);
    }
    return;
}

int main(int argc, char* argv[])
{
    if (argc < 3) {
        std::cout << "Usage: fomatter prefix_filename suffix_filename output_filename\n";
        return -1;
    }
    std::string pre_filename = argv[1];
    std::string suf_filename = argv[2];
    std::string outfilename = argv[3];
    std::ofstream outfile(outfilename, std::ios::out);
    outfile << "char* prefix = ";
    
    std::ifstream infile(pre_filename, std::ios::in);
    std::string line;
    while(!infile.eof())
    {
        std::getline(infile, line);
        escapify(&line, "\"");
        escapify(&line, "\\n");
        line = "\"" + line + "\\n\"\n";
        outfile << line;
    }
    infile.close();
    
    outfile << ";\nchar* suffix = ";
    infile.open(suf_filename, std::ios::in);
    while(!infile.eof())
    {
        std::getline(infile, line);
        escapify(&line, "\"");
        line = "\"" + line + "\\n\"\n";
        outfile << line;
    }
    infile.close();
    outfile << ";";
    outfile.close();
}
