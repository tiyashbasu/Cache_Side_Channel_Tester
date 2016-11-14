#/bin/sh

cset proc -s cpu1 -e ./thesisdev_s config-noaes.txt execution-noaes.log
python3 ./src/graph_generator.py ./execution-noaes.log ./data/all-results.log 20 graph.png
mv execution-noaes.log data
mv graph.png data
cp data expmt_results/native-openssl-aes/
rm data/*

cset proc -s cpu1 -e ./thesisdev_s config-nodes.txt execution-nodes.log
python3 ./src/graph_generator.py ./execution-nodes.log ./data/all-results.log 20 graph.png
mv execution-nodes.log data
mv graph.png data
cp data expmt_results/native-openssl-des/
rm data/*

cset proc -s cpu1 -e ./thesisdev_s config-norc4.txt execution-norc4.log
python3 ./src/graph_generator.py ./execution-norc4.log ./data/all-results.log 20 graph.png
mv execution-norc4.log data
mv graph.png data
cp data expmt_results/native-openssl-rc4/
rm data/*
