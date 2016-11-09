gcc -o perf_L1D_READ_ACCESS_MISS perf_L1D_READ_ACCESS_MISS.c

max=20;
for i in `seq 1 $max`
do
    echo 'Round ' $i
    ./perf_L1D_READ_ACCESS_MISS
    echo '--------'
done
