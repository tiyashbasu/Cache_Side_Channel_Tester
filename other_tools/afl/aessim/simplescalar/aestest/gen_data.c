#include <stdio.h>
#include <assert.h>
#include <time.h>
#include <stdlib.h>


/* sudiptac: a crude hard-coded C program to generate data for different keys in AES program */

int main() {
	int i,j,k,m;
	FILE* fpd = fopen("miss_data_one_round.txt", "w");
	int random_value[16];
	int num = 5;

	assert(fpd && "data file opening failed");

	/* print the tags */
	for (k = 0; k < 16; k++)
		fprintf(fpd, "k%d\t ", k+1);
	fprintf(fpd, "#nd\t #lm\t #sm\t ");
	fprintf(fpd,"\n");
	for (k = 0; k < 80; k++)
		fprintf(fpd,"==");
	fprintf(fpd,"\n\n");

	fclose(fpd);
	
	/* iterating over all key bytes */
	for (i = 0; i < 16; i++) {
		printf("Byte: %d.\n", i + 1);
		/* iterating over all values of a byte */
		for (j = 0x00; j <= 0xFF; j++) {
			printf("  Value: %d.\n", j);
			/* iterating over some random values for other bytes */
			for (m = 0; m < num; m++) {
				FILE* fp = fopen("new_key.txt", "w");
				assert(fp && "secret key file opening error");
				fpd = fopen("key.txt", "w");
				assert(fpd && "data file opening error");

				fprintf(fp, "\t uchar key[16] = { ");
				/* print the prelude before "i" */
				for (k = 0; k < i; k++) {
					random_value[k] = rand() % 256; 
					fprintf(fp, "%d,", random_value[k]);
				}
				/* print the value at i-th index */
				if (i < 15)
					fprintf(fp, "%d,", j);	
				else {
					fprintf(fp, "%d};", j);	
				}
				/* print the rest */
				for (k = i+1; k < 15; k++) {
					random_value[k] = rand() % 256;
					fprintf(fp, "%d,", random_value[k]);
				}
				/* special handling for the last */
				if (i < 15) {
					random_value[15] = rand() % 256;
					fprintf(fp, "%d};", random_value[15]);
				}
			
				fclose(fp);

				system("cat aes.c.prefix new_key.txt aes.c.suffix > aes_new.c");
				system("sslittle-na-sstrix-gcc.cde -o aes_new.o aes_new.c");
				system("/home/tiyashbasu/Dev/simplescalar/simplescalar/sim-outorder -config processor.config aes_new.o >& aes.log");
				system("grep -inr \"effective data access\" aes.log > temp_data");	
				system("grep -inr \"effective load miss\" aes.log > temp_load_miss");	
				system("grep -inr \"effective store miss\" aes.log > temp_store_miss");	
				system("cut -f10 -d\" \" temp_data > ndata.txt");
				system("cut -f12 -d\" \" temp_load_miss > nlmiss.txt");
				system("cut -f11 -d\" \" temp_store_miss > nsmiss.txt");

				for (k = 0; k < 16; k++) {
					if (k == i)
						fprintf(fpd, "%d\t ", j);
					else
						fprintf(fpd, "%d\t ", random_value[k]);
				}
				fclose(fpd);
	
				/* paste key value and hit/miss data side-by-side */
				system("paste key.txt ndata.txt nlmiss.txt nsmiss.txt >> miss_data_one_round.txt");
			}
		}
	}
}
