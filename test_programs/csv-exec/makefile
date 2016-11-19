CXX = g++
CXXFLAGS = -std=c++14 -O3 -lpthread -pthread

all: csvexec

csvexec: csvexec.cpp
	$(CXX) $(CXXFLAGS) -D PARALLEL -o csvexec_p csvexec.cpp
	$(CXX) $(CXXFLAGS) -D SERIAL -o csvexec_s csvexec.cpp

clean:
	-@rm csvexec_p
	-@rm csvexec_s
