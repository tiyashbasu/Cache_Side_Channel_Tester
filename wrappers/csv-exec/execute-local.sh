# Set environment variables for executables in cache_misses_local directory
export max_execs=3000
export CPU_NO=0
echo max_execs=$max_execs
echo CPU_NO=$CPU_NO

#program----directory-------------executable----csv file--------------------------------output file-----------------------------report file-----------------------------# of tests to run---reporting frequency

./csvexec_s ../cache_misses_local basic_aes		afl/afl-aes.csv 						afl/local_basic_aes_afl.txt				afl/local_basic_aes_afl.log         	8000				20
./csvexec_s ../cache_misses_local gdkib_name 	afl/afl-gdklib_name.csv 				afl/local_gdklib_name_afl.txt			afl/local_gdklib_name_afl.log         	8000				20
./csvexec_s ../cache_misses_local gdklib_uni 	afl/afl-gdklib_uni.csv 					afl/local_gdklib_uni_afl.txt			afl/local_gdklib_uni_afl.log         	8000				20
./csvexec_s ../cache_misses_local openssl_aes 	afl/afl-openssl_aes.csv 				afl/local_openssl_aes_afl.txt			afl/local_openssl_aes_afl.log         	8000				20
./csvexec_s ../cache_misses_local openssl_des 	afl/afl-openssl_des.csv 				afl/local_openssl_des_afl.txt			afl/local_openssl_des_afl.log         	8000				20
./csvexec_s ../cache_misses_local openssl_rc4 	afl/afl openssl_rc4.csv 				afl/local_openssl_rc4_afl.txt			afl/local_openssl_rc4_afl.log         	8000				20

./csvexec_s ../cache_misses_local basic_aes   	radamsa/radamsa_generated_inputs16.csv 	radamsa/local_basic_aes_radamsa.txt 	radamsa/local_basic_aes_radamsa.log 	8000				20
./csvexec_s ../cache_misses_local gdkib_name  	radamsa/radamsa_generated_inputs1.csv  	radamsa/local_gdklib_name_radamsa.txt 	radamsa/local_gdklib_name_radamsa.log 	8000				20
./csvexec_s ../cache_misses_local gdkib_uni   	radamsa/radamsa_generated_inputs1.csv  	radamsa/local_gdklib_uni_radamsa.txt 	radamsa/local_gdklib_uni_radamsa.log  	8000				20
./csvexec_s ../cache_misses_local openssl_aes 	radamsa/radamsa_generated_inputs16.csv 	radamsa/local_openssl_aes_radamsa.txt	radamsa/local_openssl_aes_radamsa.log 	8000				20
./csvexec_s ../cache_misses_local openssl_des 	radamsa/radamsa_generated_inputs8.csv  	radamsa/local_openssl_des_radamsa.txt 	radamsa/local_openssl_des_radamsa.log 	8000				20
./csvexec_s ../cache_misses_local openssl_rc4 	radamsa/radamsa_generated_inputs10.csv 	radamsa/local_openssl_rc4_radamsa.txt 	radamsa/local_openssl_rc4_radamsa.log 	8000				20