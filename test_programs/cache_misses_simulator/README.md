Here is the source to make executables which cross compile the benchmarks with the given input, and execute the cross-compiled binary over a simulator and report the cache hits and misses.



##Provided Benchmarks

The benchmarks provided here are:

1. Basic AES (basic_aes)

2. gdklib (key name) (gdklib_name)

3. gdklib (key unicode) (gdklib_uni)

4. OpenSSL AES (openssl_aes)

5. OpenSSL DES (openssl_des)

6. OpenSSL RC4 (openssl_rc4)

These benchmarks "exist" in this project's environment in the form of prefixes and suffixes specified in their corresponding header files.



##Build & Execution Instructions

To build, run
```
make clean all
```

It will build the following executables for each of the provided benchmark:

1. *_file - Writes data accesses, load misses, store misses and data cache misses from the simulator to a file

2. *_all  - Prints data accesses, load misses, store misses and data cache misses from the simulator

3. *_lm   - Prints load misses from the simulator

4. *_sm   - Prints store misses from the simulator

5. *_dm   - Prints data cache misses from the simulator


Every executable requires a certain number of input parameters as specified in its benchmark's header.

##Example
```
$ ./basic_aes 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
$ ./openssl_des 1 2 3 4 5 6 7 8
```


##Dependencies
To install the dependencies for this project, run the following command
```
sudo apt-get install libc6:i386 libncurses5:i386 libstdc++6:i386 lib32z1
```