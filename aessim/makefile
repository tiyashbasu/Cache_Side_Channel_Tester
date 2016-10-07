CXX=g++

all: aessim aessim-all aessim-dm aessim-lm aessim-sm

aessim: aessim.cpp
	@$(CXX) -std=c++14 -o aessim aessim.cpp

aessim-all: aessim-all.cpp
	@$(CXX) -std=c++14 -o aessim-all aessim-all.cpp

aessim-dm: aessim-dm.cpp
	@$(CXX) -std=c++14 -o aessim-dm aessim-dm.cpp

aessim-lm: aessim-lm.cpp
	@$(CXX) -std=c++14 -o aessim-lm aessim-lm.cpp

aessim-sm: aessim-sm.cpp
	@$(CXX) -std=c++14 -o aessim-sm aessim-sm.cpp

clean:
	-@rm aessim aessim-all aessim-dm aessim-lm aessim-sm miss_out
	-@mv data/aes.c.prefix ./
	-@mv data/aes.c.suffix ./
	-@rm -rf data
	-@mkdir data
	-@mv aes.c.prefix data
	-@mv aes.c.suffix data
