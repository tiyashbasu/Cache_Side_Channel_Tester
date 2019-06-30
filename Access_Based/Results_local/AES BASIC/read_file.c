#include <stdio.h>
#include <stdlib.h>

long val_high_record[1024] = {0}; 
long val_low_record[1024] = {0};
int observation_count = 0;

int found(long val_high, long val_low) {

		int i, j;
		
		for (i = 0; i < 1024; i++) {
			if (val_high_record[i] == val_high)
				break;		
		}
		for (j = 0; j < 1024; j++) {
			if (val_low_record[j] == val_low)
				break;		
		}
		if (i == 1024) {
			val_high_record[observation_count] = val_high;			
			return 0;
		}
		if (j == 1024) {
			val_low_record[observation_count] = val_low;			
			return 0;
		}

		return 1;
}


int main(int argc, char* argv[]) {

    FILE* fp = fopen(argv[1], "r");
		long val_high, val_low;
		int index = 1;

		if (!fp) {
			fprintf(stdout, "file not found\n");
			exit(-1);
		}
    
		fscanf(fp, "%ld\t%ld", &val_high, &val_low);
	
		while(!feof(fp) && index <= 300)
    {
        fscanf(fp, "%ld\t%ld", &val_high, &val_low);
        //printf("%ld\t%ld\n", val_high, val_low);
				if (!found(val_high, val_low)) {
					observation_count++;
				}
				printf("%d %d\n", index, observation_count);
				index++;
    }

		fclose(fp);

}
