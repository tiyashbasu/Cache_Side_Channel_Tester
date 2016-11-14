cset proc -s cpu1 -e ./csvexec_s ../cache_misses openssl_aes afl-openssl_aes.csv afl-openssl_aes-output.txt afl-openssl_aes-report.log 20

cset proc -s cpu1 -e ./csvexec_s ../cache_misses openssl_des afl-openssl_des.csv afl-openssl_des-output.txt afl-openssl_des-report.log 20

cset proc -s cpu1 -e ./csvexec_s ../cache_misses openssl_rc4 afl-openssl_rc4.csv afl-openssl_rc4-output.txt afl-openssl_rc4-report.log 20
