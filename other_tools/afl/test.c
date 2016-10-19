#include <stdio.h>
#include <string.h>
#include <stdlib.h>

int main(int argc, char** argv)
{
	char* buff1[256];
	strcpy(buff1, "cat ");
	strcat(buff1, argv[1]);
	strcat(buff1, " >> ./afl-inputs");
	system(buff1);
}
