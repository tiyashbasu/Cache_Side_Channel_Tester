#program----directory-----------------executable--------csv file--------------------------------output file---------------------------------report file---------------------------------# of tests to run---reporting frequency

./csvexec_p ../cache_misses_simulator basic_aes_lm		afl/afl-aes.csv 						afl/afl-openssl_aes-output-sim.txt			afl/afl-openssl_aes-report-sim.log         	500000				1000
./csvexec_p ../cache_misses_simulator gdkib_name_lm 	afl/afl-gdklib_name.csv 				afl/afl-gdklib_name-output-sim.txt			afl/afl-gdklib_name-report-sim.log         	500000				1000
./csvexec_p ../cache_misses_simulator gdklib_uni_lm 	afl/afl-gdklib_uni.csv 					afl/afl-gdklib_uni-output-sim.txt			afl/afl-gdklib_uni-report-sim.log         	500000				1000
./csvexec_p ../cache_misses_simulator openssl_aes_lm 	afl/afl-openssl_aes.csv 				afl/afl-openssl_aes-output-sim.txt			afl/afl-openssl_aes-report-sim.log         	500000				1000
./csvexec_p ../cache_misses_simulator openssl_des_lm 	afl/afl-openssl_des.csv 				afl/afl-openssl_des-output-sim.txt			fl/afl-openssl_des-report-sim.log         	500000				1000
./csvexec_p ../cache_misses_simulator openssl_rc4_lm 	afl/afl openssl_rc4.csv 				afl/afl-openssl_rc4-output-sim.txt			afl/afl-openssl_rc4-report-sim.log         	500000				1000

./csvexec_p ../cache_misses_simulator basic_aes_lm   	radamsa/radamsa_generated_inputs16.csv 	radamsa/radamsa-openssl_aes-output-sim.txt 	radamsa/radamsa-openssl_aes-report-sim.log 	500000				1000
./csvexec_p ../cache_misses_simulator gdkib_name_lm  	radamsa/radamsa_generated_inputs1.csv  	radamsa/radamsa-gdklib_name-output-sim.txt 	radamsa/radamsa-gdklib_name-report-sim.log 	500000				1000
./csvexec_p ../cache_misses_simulator gdkib_uni_lm   	radamsa/radamsa_generated_inputs1.csv  	radamsa/radamsa-gdklib_uni-output-sim.txt 	radamsa/radamsa-gdklib_uni-report-sim.log  	500000				1000
./csvexec_p ../cache_misses_simulator openssl_aes_lm 	radamsa/radamsa_generated_inputs16.csv 	radamsa/radamsa-openssl_aes-output-sim.txt	radamsa/radamsa-openssl_aes-report-sim.log 	500000				1000
./csvexec_p ../cache_misses_simulator openssl_des_lm 	radamsa/radamsa_generated_inputs8.csv  	radamsa/radamsa-openssl_des-output-sim.txt 	radamsa/radamsa-openssl_des-report-sim.log 	500000				1000
./csvexec_p ../cache_misses_simulator openssl_rc4_lm 	radamsa/radamsa_generated_inputs10.csv 	radamsa/radamsa-openssl_rc4-output-sim.txt 	radamsa/radamsa-openssl_rc4-report-sim.log 	500000				1000