CXX=g++

all: clean aessim-file aessim-all aessim-dm aessim-lm aessim-sm

aessim-file: aessim.cpp
	@$(CXX) -std=c++14 -O3 -D FILES -o aessim-file aessim.cpp >> make.log 2>&1

aessim-all: aessim.cpp
	@$(CXX) -std=c++14 -O3 -D ALL -o aessim-all aessim.cpp >> make.log 2>&1

aessim-dm: aessim.cpp
	@$(CXX) -std=c++14 -O3 -D DM -o aessim-dm aessim.cpp >> make.log 2>&1

aessim-lm: aessim.cpp
	@$(CXX) -std=c++14 -O3 -D LM -o aessim-lm aessim.cpp >> make.log 2>&1

aessim-sm: aessim.cpp
	@$(CXX) -std=c++14 -O3 -D SM -o aessim-sm aessim.cpp >> make.log 2>&1

clean:
	-@rm aessim-file aessim-all aessim-dm aessim-lm aessim-sm miss_out
	-@mv data/aes.c.prefix ./
	-@mv data/aes.c.suffix ./
	-@rm -rf data/*
	-@mv aes.c.prefix data
	-@mv aes.c.suffix data
