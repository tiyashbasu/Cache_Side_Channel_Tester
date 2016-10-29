##dessim-file:
Writes the input, the total number of cache hits, the number of load misses, the number of store misses and the number of data cache misses, respectively, to the file *dessim-results.log*.

###Example
```
$ dessim 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
```

##dessim-all
Outputs in terminal the total number of cache hits, the number of load misses, the number of store misses and the number of data cache misses, respectively.

###Example
```
$ dessim-all 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
```

##dessim-lm
Outputs in terminal the number of load misses.

###Example
```
$ dessim-lm 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
```

##dessim-sm
Outputs in terminal the number of store misses.

###Example
```
$ dessim-sm 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
```

##dessim-dm
Outputs in terminal the number of data cache misses.

###Example
```
$ dessim-dm 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
```

##dessim-csv.sh
Executes the AES wrapper with parameters from a csv file.
Warning: A small unning it deletes the dessim-results.log file created in the previous run.
Syntax: dessim-csv.sh *dessim_executable csv_file*
###Example
```
$ ./dessim-csv.sh ./dessim-file ./des-keys.csv
```

###Install Dependencies
```
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 build-essential
```
