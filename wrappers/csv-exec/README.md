This tool executes a given target_name with inputs from a mentioned csv file, and in the end, it shows the number of unique outputs the target_name has generated.

To build, run:
```
$ make clean all
```

The build generates two executable binaries: csvexec_s and csvexec_p

csvexec_s executes the target serially, i.e., one by one. Ideally, this should be used when parallel executions of a target will affect each other's output.

csvexec_p executes the target parallely. Ideally, this should be used when parallel executions of a target will not affect each other's output.

To execute cache side-channel attack tests:
	1. Extract the contents of afl.tar.gz and radamsa.tar.gz into this folder. This will create folders named afl and radamsa respectively.
	2. Run execute-local.sh to run cache side-channel attack tests on you local computer. The results for respective inputs will be stored in the afl and radamsa folders. Please read the readme for cache_misses_local tool to see how to set up your computer to run these tests.
	3. Run execute-simulator.sh to run cache side-channel attack tests on a simplescalar based PISA architecture simulator. The results for respective inputs will be stored in the afl and radamsa folders. No fancy setup required here.


###Usage
csvexec_p/csvexec_s executable_directory executable_name input_csv_file output_values_file report_file total_#_of_tests reporting_frequency


###Example
./csvexec_p ../sim_wrapper openssl-rc4-lm afl-openssl_rc4.csv afl-openssl_rc4-output.txt afl-openssl_rc4-report.log 50

