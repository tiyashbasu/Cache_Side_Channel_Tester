#!/bin/sh

i=0
rm ./aessim-results.log
while true
#while [ $i -lt 2000 ]
do
	i=`expr $i + 1`
	test=$(sed "$i!d" $2)
	if [ -z $test ]
	then
		echo 'Done.'
		break
	fi
	key=$(sed "$i!d" $2|sed "s/,/ /g")
	$1 $key
done
echo "Unique Load Misses: " $(cut -f18 ./aessim-results.log | sort | uniq | wc -l)
echo "Unique Store Misses: " $(cut -f19 ./aessim-results.log | sort | uniq | wc -l)
echo "Unique Data Cache Misses: " $(cut -f20 ./aessim-results.log | sort | uniq | wc -l)
