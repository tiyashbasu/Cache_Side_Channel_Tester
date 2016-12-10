#program----directory-----------------executable--------csv file--------------------------------output file-------------------------report file-----------------------------# of tests to run---reporting frequency

./csvexec_p ../cache_misses_simulator basic_aes_lm		afl/afl-aes.csv							afl/sim_basic_aes_afl.txt			afl/sim_basic_aes_afl.log				500000				1000
./csvexec_p ../cache_misses_simulator gdkib_name_lm		afl/afl-gdklib_name.csv 				afl/sim_gdklib_name_afl.txt			afl/sim_gdklib_name_afl.log				500000				1000
./csvexec_p ../cache_misses_simulator gdklib_uni_lm		afl/afl-gdklib_uni.csv 					afl/sim_gdklib_uni_afl.txt			afl/sim_gdklib_uni_afl.log				500000				1000
./csvexec_p ../cache_misses_simulator openssl_aes_lm	afl/afl-openssl_aes.csv 				afl/sim_openssl_aes_afl.txt			afl/sim_openssl_aes_afl.log				500000				1000
./csvexec_p ../cache_misses_simulator openssl_des_lm	afl/afl-openssl_des.csv 				afl/sim_openssl_des_afl.txt			afl/sim_openssl_des_afl.log				500000				1000
./csvexec_p ../cache_misses_simulator openssl_rc4_lm	afl/afl openssl_rc4.csv 				afl/sim_openssl_rc4_afl.txt			afl/sim_openssl_rc4_afl.log				500000				1000

./csvexec_p ../cache_misses_simulator basic_aes_lm		radamsa/radamsa_generated_inputs16.csv 	radamsa/sim_basic_aes_radamsa.txt 	radamsa/sim_basic_aes_radamsa.log 		500000				1000
./csvexec_p ../cache_misses_simulator gdkib_name_lm		radamsa/radamsa_generated_inputs1.csv  	radamsa/sim_gdklib_name_radamsa.txt radamsa/sim_gdklib_name_radamsa.log 	500000				1000
./csvexec_p ../cache_misses_simulator gdkib_uni_lm		radamsa/radamsa_generated_inputs1.csv  	radamsa/sim_gdklib_uni_radamsa.txt 	radamsa/sim_gdklib_uni_radamsa.log  	500000				1000
./csvexec_p ../cache_misses_simulator openssl_aes_lm	radamsa/radamsa_generated_inputs16.csv 	radamsa/sim_openssl_aes_radamsa.txt	radamsa/sim_openssl_aes_radamsa.log 	500000				1000
./csvexec_p ../cache_misses_simulator openssl_des_lm	radamsa/radamsa_generated_inputs8.csv  	radamsa/sim_openssl_des_radamsa.txt radamsa/sim_openssl_des_radamsa.log 	500000				1000
./csvexec_p ../cache_misses_simulator openssl_rc4_lm	radamsa/radamsa_generated_inputs10.csv 	radamsa/sim_openssl_rc4_radamsa.txt radamsa/sim_openssl_rc4_radamsa.log 	500000				1000