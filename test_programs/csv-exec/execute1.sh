export MAX_EXECS=3000
export CPU=1

./csvexec_s ../cache_misses openssl_aes radamsa_generated_inputs16.csv rad-nopenssl_aes-output.txt rad-nopenssl_aes-report.log 20

./csvexec_s ../cache_misses openssl_des radamsa_generated_inputs8.csv rad-nopenssl_des-output.txt rad-nopenssl_des-report.log 20

# ./csvexec_s ../cache_misses openssl_des afl-openssl_des.csv afl-nopenssl_des-output.txt rad-nopenssl_des-report.log 20

./csvexec_s ../cache_misses openssl_rc4 radamsa_generated_inputs10.csv rad-nopenssl_rc4-output.txt rad-nopenssl_rc4-report.log 20
