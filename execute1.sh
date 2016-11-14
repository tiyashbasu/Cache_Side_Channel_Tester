#/bin/sh

cset proc -s cpu0 -e ./thesisdev_s config-naes.txt execution-naes.log
python3 ./src/graph_generator.py ./execution-naes.log ./data/all-results.log 20 graph.png
mv execution-naes.log data
mv graph.png data
cp -r data expmt_results/native-basic-aes/
rm data/*

cset proc -s cpu0 -e ./thesisdev_s config-ngname.txt execution-ngname.log
python3 ./src/graph_generator.py ./execution-ngname.log ./data/all-results.log 20 graph.png
mv execution-ngname.log data
mv graph.png data
cp -r data expmt_results/native-gdklib-name/
rm data/*

cset proc -s cpu0 -e ./thesisdev_s config-nguni.txt execution-nguni.log
python3 ./src/graph_generator.py ./execution-nguni.log ./data/all-results.log 20 graph.png
mv execution-nguni.log data
mv graph.png data
cp -r data expmt_results/native-gdklib-uni/
rm data/*
