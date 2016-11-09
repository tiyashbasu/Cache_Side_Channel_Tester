CXX=g++

all: csv-exec

csv-exec: csv-exec.cpp
	$(CXX) -std=c++14 -O3 -lpthread -pthread -o csv-exec csv-exec.cpp

clean:
	-@rm csv-exec
