##aessim-file:
Writes the input, the total number of cache hits, the number of load misses, the number of store misses and the number of data cache misses, respectively, to the file *aessim-results.log*.

###Example
```
$ aessim 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
```

##aessim-all
Outputs in terminal the total number of cache hits, the number of load misses, the number of store misses and the number of data cache misses, respectively.

###Example
```
$ aessim-all 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
```

##aessim-lm
Outputs in terminal the number of load misses.

###Example
```
$ aessim-lm 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
```

##aessim-sm
Outputs in terminal the number of store misses.

###Example
```
$ aessim-sm 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
```

##aessim-dm
Outputs in terminal the number of data cache misses.

###Example
```
$ aessim-dm 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
```

##aessim-csv.sh
Executes the AES wrapper with parameters from a csv file.
Warning: A small unning it deletes the aessim-results.log file created in the previous run.
Syntax: aessim-csv.sh <aessim_executable> <csv_file>
###Example
```
$ ./aessim-csv.sh ./aessim-file ./aes-keys.csv
```

###Install Dependencies
```
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1 build-essential
```
