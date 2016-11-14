CXX=g++

all: csvexec

csvexec: csvexec.cpp
	$(CXX) -std=c++14 -O3 -lpthread -pthread -D PARALLEL -o csvexec_p csvexec.cpp
	$(CXX) -std=c++14 -O3 -lpthread -pthread -D SERIAL -o csvexec_s csvexec.cpp

clean:
	-@rm csvexec_p
	-@rm csvexec_s
