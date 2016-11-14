cset set -c 0,1 all
cset set -c 0 all/cpu0
cset set -c 1 all/cpu1
cset set -c 2,3 system

cset proc -m -f root -t system
cset proc -k -f root -t system

cset set -lr
