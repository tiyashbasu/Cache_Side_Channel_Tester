# Set environment variables for executables in cache_misses_local directory
export max_execs=3000
export CPU_NO=0
echo max_execs=$max_execs
echo CPU_NO=$CPU_NO

#program----directory-------------executable----csv file--------------------------------output file-----------------------------report file-----------------------------# of tests to run---reporting frequency

./csvexec_s ../cache_misses_local basic_aes		afl/afl-aes.csv 						afl/afl-openssl_aes-output.txt			afl/afl-openssl_aes-report.log         	8000				20
./csvexec_s ../cache_misses_local gdkib_name 	afl/afl-gdklib_name.csv 				afl/afl-gdklib_name-output.txt			afl/afl-gdklib_name-report.log         	8000				20
./csvexec_s ../cache_misses_local gdklib_uni 	afl/afl-gdklib_uni.csv 					afl/afl-gdklib_uni-output.txt			afl/afl-gdklib_uni-report.log         	8000				20
./csvexec_s ../cache_misses_local openssl_aes 	afl/afl-openssl_aes.csv 				afl/afl-openssl_aes-output.txt			afl/afl-openssl_aes-report.log         	8000				20
./csvexec_s ../cache_misses_local openssl_des 	afl/afl-openssl_des.csv 				afl/afl-openssl_des-output.txt			fl/afl-openssl_des-report.log         	8000				20
./csvexec_s ../cache_misses_local openssl_rc4 	afl/afl openssl_rc4.csv 				afl/afl-openssl_rc4-output.txt			afl/afl-openssl_rc4-report.log         	8000				20

./csvexec_s ../cache_misses_local basic_aes   	radamsa/radamsa_generated_inputs16.csv 	radamsa/radamsa-openssl_aes-output.txt 	radamsa/radamsa-openssl_aes-report.log 	8000				20
./csvexec_s ../cache_misses_local gdkib_name  	radamsa/radamsa_generated_inputs1.csv  	radamsa/radamsa-gdklib_name-output.txt 	radamsa/radamsa-gdklib_name-report.log 	8000				20
./csvexec_s ../cache_misses_local gdkib_uni   	radamsa/radamsa_generated_inputs1.csv  	radamsa/radamsa-gdklib_uni-output.txt 	radamsa/radamsa-gdklib_uni-report.log  	8000				20
./csvexec_s ../cache_misses_local openssl_aes 	radamsa/radamsa_generated_inputs16.csv 	radamsa/radamsa-openssl_aes-output.txt	radamsa/radamsa-openssl_aes-report.log 	8000				20
./csvexec_s ../cache_misses_local openssl_des 	radamsa/radamsa_generated_inputs8.csv  	radamsa/radamsa-openssl_des-output.txt 	radamsa/radamsa-openssl_des-report.log 	8000				20
./csvexec_s ../cache_misses_local openssl_rc4 	radamsa/radamsa_generated_inputs10.csv 	radamsa/radamsa-openssl_rc4-output.txt 	radamsa/radamsa-openssl_rc4-report.log 	8000				20