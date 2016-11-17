This tool executes a given target_name with inputs from a mentioned csv file, and in the end, it shows the number of unique outputs the target_name has generated.
To build, run:
```
$ make clean all
```

The build generates two executable binaries: csvexec_s and csvexec_p
csvexec_s executes the target serially, i.e., one by one. Ideally, this should be used when parallel executions of a target will affect each other's output.
csvexec_p executes the target parallely. Ideally, this should be used when parallel executions of a target will not affect each other's output.

###Usage
csvexec_p/csvexec_s executable_directory executable_name input_csv_file output_values_file report_file rounds_per_run

###Example
./csvexec_p ../sim_wrapper openssl-rc4-lm afl-openssl_rc4.csv afl-openssl_rc4-output.txt afl-openssl_rc4-report.log 50
