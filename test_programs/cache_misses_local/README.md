Here is the source to make executables which compile the benchmarks with the given input, and execute the compiled binary on the native system and report the L1 cache misses. Internally, it runs a program MAX_EXECS (see Environment Variables section) times, sorts the outputs and finally reports the median of the sorted outputs.



##Execution Modes

This program can be run in two different ways:

**1. Using isolcpus instruction.**

	To use this method, you need to execute 'isolcpus=xx' as a kernel command, when your system is booting up. Here, xx is the CPU core number you want to isolate. 	For example '0', '1', '0,1' or '0-2'.

	To execute the isolcpus command, this (works in ubuntu) is one of the many ways:

	a. Open /etc/default/grub

	b. Locate the line which looks something like this: GRUB_CMDLINE_LINUX_DEFAULT="quiet splash"

	c. Add 'isolcpus=xx command to it'. For example, edit it to lmake it look like GRUB_CMDLINE_LINUX_DEFAULT="quiet splash isolcpus=0,1"

	d. Run update-grub in your command line. You probably need to run it with admin rights (sudo).

	e. Reboot your system.

	f. Once rebooted, you will have isolated your CPU core(s) successfully *from user threads*, which you can check n=by running *top* and then pressing 1. Kernel threads may and probably will run on it.
	
	For further isolation, you could set IRQ affinity to other CPU cores by using the script set_irq_affinity.sh. Running it with the affinity mask as its parameter. For example

	```
	$ ./set_irq_parameter.sh 0c
	```

	Here 0c is the affininty mask corresponding to 'isolcpus=0,1'.
	Once the CPU cores are successfully isolated, set CPU_NO (see Environment Variables section) to run the program in your desired CPU core.

**2. Using cpusets.**

	CPU cores can also be shielded (similar to isolated) using cset command (install package *cpuset* for this). The following steps should suffice:

	a. To shield CPU cores 0 and 1, run script cset-start.sh given in the root folder.

	b. Then execute the script cset-exec.sh, also given in the root folder, in this format: ./cset-exec.sh cpu_no(e.g., 0, 1) executable_name arguments. An example is present in the script file itself.

	c. Once you are done with the execution, unshield the CPU cores using the script cset-stop.sh, also given in the root folder.

One could use both methods together, like running the isolcpus command first, and then running the program using cpusets. However, only isolcpus should be sufficient.

An additional tool is also provided to clear the CPU caches. This is implemented as a kernel module, and to use it, one simply needs to run:
```
$ insmod ./wbinvdk/wbinvdk.ko && rmmod wbinvdk
```
This was earlier used in this program, but since it is slow, it is now commented in the source code.



##Environment Variables

The value of MAX_EXECS needs to be set from the terminal. For example:
```
$ export MAX_EXECS=1000
```

One can also specify which CPU core to execute the target on, in case the CPU has multiple cores. The CPU core can be specified from the terminal. For example:
```
$ export CPU_NO=0
```
On setting the CPU_NO value to -1, the target is executed is executed on all CPU cores.

In case MAX_EXECS and CPU_NO are not specified, they are assumed as 3000 and 0 respectively.



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

Every executable requires a certain number of input parameters as specified in its benchmark's header.

###Example
```
$ ./basic_aes 1 2 3 4 5 6 7 8 1 2 3 4 5 6 7 8
$ ./openssl_des 1 2 3 4 5 6 7 8
```