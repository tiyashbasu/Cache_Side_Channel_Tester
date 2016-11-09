#ifndef THESISDEV_SORT_H
#define THESISDEV_SORT_H

namespace thesis {

    class array_sorter {

    private:

        inline void swap(long *a, long *b) {
            long temp;
            temp = *a;
            *a = *b;
            *b = temp;
        }

        long pivot(long *arr, long start, long end) {
            long p = arr[end];
            unsigned long i = start;
            for (unsigned long j = start; j < end; j++) {
                if (arr[j] < p) {
                    swap(arr + i, arr + j);
                    i++;
                }
            }
            swap(arr + i, arr + end);
            return i;
        }

        void quick_sort(long *arr, long start, long end) {
            if (start < end) {
                long p = pivot(arr, start, end);
                quick_sort(arr, start, p - 1);
                quick_sort(arr, p + 1, end);
            }
        }

    public:

        void sort(long *arr, unsigned long size) {
            quick_sort(arr, 0, size - 1);
        }
    };

}

#endif //THESISDEV_SORT_H
