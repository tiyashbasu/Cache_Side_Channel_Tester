#/bin/sh

if [ $# -eq 0 ]; then
	echo "Usage: ./cset-exec.sh <cpu #> <executable name> <executable parameters>"
	echo "Example: ./cset-exec.sh ./thesisdev_s config-noaes.txt execution-noaes.log"
	exit
fi

cset proc -s cpu$1 -e $2 $@

# example:
# cset proc -s cpu1 -e ./thesisdev_s config-noaes.txt execution-noaes.log