../simplescalar/sim-outorder -config ../simplescalar/processor.config $1 $2 $3 $4 $5 $6 $7 $8 $9 ${10} ${11} ${12} ${13} ${14} ${15} ${16} ${17}> ./temp/simoutorder.log 2>&1
grep 'data accesses' ./temp/simoutorder.log | cut -d" " -f10 > ./temp/da.log
grep 'load misses' ./temp/simoutorder.log | cut -d" " -f12 > ./temp/lm.log
grep 'store misses' ./temp/simoutorder.log | cut -d" " -f11 > ./temp/sm.log
grep 'dcache misses' ./temp/simoutorder.log | cut -d" " -f10 > ./temp/dm.log
rm -f miss_out
paste ./temp/da.log ./temp/lm.log ./temp/sm.log ./temp/dm.log
