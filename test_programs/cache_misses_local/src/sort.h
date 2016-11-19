#ifndef THESISDEV_SORT_H
#define THESISDEV_SORT_H

namespace thesis {
    template <class T>
    class array_sorter {

    private:

        inline void swap(T *a, T *b) {
            T temp;
            temp = *a;
            *a = *b;
            *b = temp;
        }

        long pivot(T *arr, long start, long end) {
            T p = *(arr + end);
            long i = start;
            for (long j = start; j < end; j++) {
                if (*(arr + j) < p) {
                    swap(arr + i++, arr + j);
                }
            }
            swap(arr + i, arr + end);
            return i;
        }

        void quick_sort(T *arr, long start, long end) {
            if (start < end) {
                long p = pivot(arr, start, end);
                quick_sort(arr, start, p - 1);
                quick_sort(arr, p + 1, end);
            }
        }

    public:

        void sort(T *arr, unsigned long size) {
            quick_sort(arr, 0, size - 1);
        }
    };

}

#endif //THESISDEV_SORT_H
