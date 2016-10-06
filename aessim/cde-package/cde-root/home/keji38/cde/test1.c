#include <stdio.h>
int main(void){
    int i,a[10];
    for(i=0;i<=9;i++)
        a[i]=i;
    for(i=9;i>=0;i--)
        printf("%d ",a[i]);
    return 0;
}
