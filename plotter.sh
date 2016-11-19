python3 src/graph_generator.py expmt_results/simplescalar/basiccrypto-aes/execution-aes.log expmt_results/simplescalar/basiccrypto-aes/all-results.log expmt_results/simplescalar/basiccrypto-aes/afl-aes-output.txt expmt_results/simplescalar/basiccrypto-aes/rad-aes-output.txt 1000 sim_basic_aes.png quiet

python3 src/graph_generator.py expmt_results/simplescalar/gdklib-name/execution-gdklib.log expmt_results/simplescalar/gdklib-name/all-results.log expmt_results/simplescalar/gdklib-name/afl-gdklib_name-output.txt expmt_results/simplescalar/gdklib-name/rad-gdklib_name-output.txt 50 sim_gdklib_name.png quiet

python3 src/graph_generator.py expmt_results/simplescalar/gdklib-uni/execution-gdklib.log expmt_results/simplescalar/gdklib-uni/all-results.log expmt_results/simplescalar/gdklib-uni/afl-gdklib_uni-output.txt expmt_results/simplescalar/gdklib-uni/rad-gdklib_uni-output.txt 50 sim_gdklib_uni.png quiet

python3 src/graph_generator.py expmt_results/simplescalar/openssl-aes/execution-openaes.log expmt_results/simplescalar/openssl-aes/all-results.log expmt_results/simplescalar/openssl-aes/afl-openssl_aes-output.txt expmt_results/simplescalar/openssl-aes/rad-openssl_aes-output.txt 1000 sim_openssl_aes.png quiet

python3 src/graph_generator.py expmt_results/simplescalar/openssl-des/execution-opendes.log expmt_results/simplescalar/openssl-des/all-results.log expmt_results/simplescalar/openssl-des/afl-openssl_des-output.txt expmt_results/simplescalar/openssl-des/rad-openssl_des-output.txt 1000 sim_openssl_des.png quiet

python3 src/graph_generator.py expmt_results/simplescalar/openssl-rc4/execution-openrc4.log expmt_results/simplescalar/openssl-rc4/all-results.log expmt_results/simplescalar/openssl-rc4/afl-openssl_rc4-output.txt expmt_results/simplescalar/openssl-rc4/rad-openssl_rc4-output.txt 1000 sim_openssl_rc4.png quiet



python3 src/graph_generator.py expmt_results/local_machine/native-basic-aes/execution-aes.log expmt_results/local_machine/native-basic-aes/all-results.log expmt_results/local_machine/native-basic-aes/afl-aes-output.txt expmt_results/local_machine/native-basic-aes/rad-aes-output.txt 20 local_basic_aes.png quiet

python3 src/graph_generator.py expmt_results/local_machine/native-gdklib-name/execution-gdklib.log expmt_results/local_machine/native-gdklib-name/all-results.log expmt_results/local_machine/native-gdklib-name/afl-gdklib_name-output.txt expmt_results/local_machine/native-gdklib-name/rad-gdklib_name-output.txt 20 local_gdklib_name.png quiet

python3 src/graph_generator.py expmt_results/local_machine/native-gdklib-uni/execution-gdklib.log expmt_results/local_machine/native-gdklib-uni/all-results.log expmt_results/local_machine/native-gdklib-uni/afl-gdklib_uni-output.txt expmt_results/local_machine/native-gdklib-uni/rad-gdklib_uni-output.txt 20 local_gdklib_uni.png quiet

python3 src/graph_generator.py expmt_results/local_machine/native-openssl-aes/execution-noaes.log expmt_results/local_machine/native-openssl-aes/all-results.log expmt_results/local_machine/native-openssl-aes/afl-openssl_aes-output.txt expmt_results/local_machine/native-openssl-aes/rad-openssl_aes-output.txt 20 local_openssl_aes.png quiet

python3 src/graph_generator.py expmt_results/local_machine/native-openssl-des/execution-nodes.log expmt_results/local_machine/native-openssl-des/all-results.log expmt_results/local_machine/native-openssl-des/afl-openssl_des-output.txt expmt_results/local_machine/native-openssl-des/rad-openssl_des-output.txt 20 local_openssl_des.png quiet

python3 src/graph_generator.py expmt_results/local_machine/native-openssl-rc4/execution-norc4.log expmt_results/local_machine/native-openssl-rc4/all-results.log expmt_results/local_machine/native-openssl-rc4/afl-openssl_rc4-output.txt expmt_results/local_machine/native-openssl-rc4/rad-openssl_rc4-output.txt 20 local_openssl_rc4.png quiet