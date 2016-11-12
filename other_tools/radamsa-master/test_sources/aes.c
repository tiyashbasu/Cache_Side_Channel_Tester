#include <stdio.h>

int main (void)
{
    unsigned char key[16];
    int i;
    printf("Enter inputs: \n");
    for (i = 0; i < 16; i++)
    {
        scanf("%u", key + i);
    }
    printf("\nprinting inputs: \n");
    for (i = 0; i < 16; i++)
    {
        printf("%u ", key[i]);
    }
    printf("\n");
}
