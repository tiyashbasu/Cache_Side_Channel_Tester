#enable a shield. move away user threads from cpu 0
cset shield -c 0 > cset.log

#try to move away kernel threads from cpu 0
cset shield -k on >> cset.log

#execute command in cpu 0
cset shield -e ./basic_aes $@ >> cset.log
cat cset.log | tail -1

#disable the shield
cset shield --reset >> cset.log