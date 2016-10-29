CXX=g++

all: clean rc4sim-file rc4sim-all rc4sim-dm rc4sim-lm rc4sim-sm

rc4sim-file: rc4sim.cpp
	$(CXX) -std=c++14 -O3 -D FILES -o rc4sim-file rc4sim.cpp > make.log 2>&1

rc4sim-all: rc4sim.cpp
	$(CXX) -std=c++14 -O3 -D ALL -o rc4sim-all rc4sim.cpp >> make.log 2>&1

rc4sim-dm: rc4sim.cpp
	$(CXX) -std=c++14 -O3 -D DM -o rc4sim-dm rc4sim.cpp >> make.log 2>&1

rc4sim-lm: rc4sim.cpp
	$(CXX) -std=c++14 -O3 -D LM -o rc4sim-lm rc4sim.cpp >> make.log 2>&1

rc4sim-sm: rc4sim.cpp
	$(CXX) -std=c++14 -O3 -D SM -o rc4sim-sm rc4sim.cpp >> make.log 2>&1

clean:
	-@rm rc4sim-file rc4sim-all rc4sim-dm rc4sim-lm rc4sim-sm miss_out mkdir.log
	-@rm -rf temp/*
