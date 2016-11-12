#enable a shield. move away user threads from cpu 0
cset shield -c 0 > cset.log

#try to move away kernel threads from cpu 0
cset shield -k on >> cset.log
cset shield -s >> cset.log

#execute command in cpu 0
cset shield -e ./cache_misses $@

#disable the shield
cset shield --reset >> cset.log
