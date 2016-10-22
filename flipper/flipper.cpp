#include <iostream>
#include <fstream>

#define SIZE 255

void swap(int* a, int* b) {
    int temp;
    temp = *a;
    *a=  *b;
    *b= temp;
}

int pivot(int* arr, int* idx, int start, int end) {
    int p = arr[end];
    int i = start;
    for (int j = start; j < end; j++) {
        if (arr[j] < p) {
            swap(arr + i, arr + j);
            swap(idx + i, idx + j);
            i++;
        }
    }
    swap(arr + i, arr + end);
    swap(idx + i, idx + end);
    return i;
}

void quicksort(int* arr, int* idx, int start, int end) {
    if (start < end) {
        int p = pivot(arr, idx, start, end);
        quicksort(arr, idx, start, p - 1);
        quicksort(arr, idx, p + 1, end);
    }
}

void sort(int* arr, int* idx) {
    quicksort(arr, idx, 0, SIZE - 1);
}

int main() {
    int arr[SIZE], sum[SIZE];
    int bit_indicator[8] = {1,2,4,8,16,32,64,128};
    int i, j;
    for (i = 0; i < SIZE; i++) {
        arr[i] = i + 1;
        sum[i] = 0;
        for (j = 1; j <= 8; j++) {
            sum[i] += (arr[i] & bit_indicator[j - 1]) >> (j - 1);
        }
    }
    sort(sum, arr);
    std::ofstream file;
    file.open("flipper.h", std::ios::out);
    file << "namespace thesis {\n\tint flipper[255] = {" << arr[0];
    for (i = 1; i < SIZE; i++) {
        file << ", " << arr[i];
    }
    file << "};\n\tint flipper_size = " << SIZE << ";\n}";
    file.close();
    return 0;
}
