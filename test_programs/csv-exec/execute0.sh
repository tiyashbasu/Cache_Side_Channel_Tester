cset proc -s cpu0 -e ./csvexec_s ../cache_misses basic_aes afl-aes.csv afl-aes-output.txt afl-aes-report.log 20

cset proc -s cpu0 -e ./csvexec_s ../cache_misses gdklib_name afl-gdklib_name.csv afl-gdklib_name-output.txt afl-gdklib_name-report.log 20

cset proc -s cpu0 -e ./csvexec_s ../cache_misses gdklib_uni afl-gdklib_uni.csv afl-gdklib_uni-output.txt afl-gdklib_uni-report.log 20
