export MAX_EXECS=3000
export CPU=0

./csvexec_s ../cache_misses basic_aes radamsa_generated_inputs16.csv rad-naes-output.txt rad-naes-report.log 20

./csvexec_s ../cache_misses gdklib_name radamsa_generated_inputs1.csv rad-ngdklib_name-output.txt rad-ngdklib_name-report.log 20

./csvexec_s ../cache_misses gdklib_uni radamsa_generated_inputs1.csv rad-ngdklib_uni-output.txt rad-ngdklib_uni-report.log 20