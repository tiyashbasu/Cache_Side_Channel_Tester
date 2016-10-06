# Tiyash Basu - Master Thesis Project

This project aims to develop a system which generates test data sets automatically, for a given program, by running simulated annealing on the program inputs.


## Build instructions

Execute
```
make
```
to build the executable *thesisdev* and
```
make clean
```
to clean up.


## Execution instruction

A config file is required as an input parameter. A config file is provided as an example.
```
$ ./thesisdev config.txt
```

ANy sort of error handling has not been implemeted yet, but will be provided in future releases.

## AES Cache side-channeling

A tool which cross compiles an aes implementation, executes it, and generates cache hit/miss report has been provided in the *aessim* folder. This tool is used in the config file provided as the example. So, if you intend to use the provided config.txt file, *do not* remove this folder.

The following packages are additionally required for 64-bit linux installations:
* lib32z1
* lib32ncurses5
* lib32stdc++6



*_Only works on *nix platforms_*
