./cache_sc_tester_p config-sim.txt execution.log
./wrappers/csv-exec/csvexec_p ./wrappers/cache_misses_simulator basic_aes_lm ./test/afl-aes.csv afl_basic_aes_sim.txt csv_exec_afl_sim.log 500000 100
./wrappers/csv-exec/csvexec_p ./wrappers/cache_misses_simulator basic_aes_lm ./test/radamsa-aes.csv radamsa_basic_aes_sim.txt csv_exec_radamsa_sim.log 500000 100
python3 ./graphs/generate_graph.py ./data/all-results.log afl_basic_aes_sim.txt radamsa_basic_aes_sim.txt 50000 "lower right" basic_aes_sim_results.png
cp data basic_aes_sim_results

./cache_sc_tester_s config-real.txt execution.log
./wrappers/csv-exec/csvexec_s ./wrappers/cache_misses_local basic_aes ./test/afl-aes.csv afl_basic_aes_real.txt csv_exec_afl_real.log 3000 50
./wrappers/csv-exec/csvexec_s ./wrappers/cache_misses_local basic_aes ./test/radamsa-aes.csv radamsa_basic_aes_real.txt csv_exec_radamsa_real.log 3000 50
python3 ./graphs/generate_graph.py ./data/all-results.log afl_basic_aes_real.txt radamsa_basic_aes_real.txt 500 "lower right" basic_aes_real_results.png
cp data basic_aes_real_results