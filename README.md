# Tiyash Basu - Master Thesis Project

This project aims to develop a system which generates test data sets automatically, for a given target_name, by running simulated annealing on the target_name inputs.

## Build instructions

Execute
```
make clean all
```

The build generates two executable binaries: thesisdev_s and thesisdev_p
thesisdev_s executes the target serially, i.e., one by one. Ideally, this should be used when parallel executions of a target will affect each other's output.
thesisdev_p executes the target parallely. Ideally, this should be used when parallel executions of a target will not affect each other's output.

## Execution instruction

Input Parameters:
	1. A configuration file. Look at sample present in the root folder.
	2. The name of the output report file

Example:
```
$ ./thesisdev_p config.txt report.txt
```

On execution, additional output files are generated in 'data' folder.

### Graph to view progress

A script to generate a graph from the execution data is included. To run:
```
python3 src/graph_generator.py report_file_name all_results_file_name executions_per_trial output_figure_filename
```

*_Only works on *nix platforms_*
