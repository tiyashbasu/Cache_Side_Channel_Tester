CXX=g++

all: clean dessim-file dessim-all dessim-dm dessim-lm dessim-sm

dessim-file: dessim.cpp
	$(CXX) -std=c++14 -O3 -D FILES -o dessim-file dessim.cpp > make.log 2>&1

dessim-all: dessim.cpp
	$(CXX) -std=c++14 -O3 -D ALL -o dessim-all dessim.cpp >> make.log 2>&1

dessim-dm: dessim.cpp
	$(CXX) -std=c++14 -O3 -D DM -o dessim-dm dessim.cpp >> make.log 2>&1

dessim-lm: dessim.cpp
	$(CXX) -std=c++14 -O3 -D LM -o dessim-lm dessim.cpp >> make.log 2>&1

dessim-sm: dessim.cpp
	$(CXX) -std=c++14 -O3 -D SM -o dessim-sm dessim.cpp >> make.log 2>&1

clean:
	-@rm dessim-file dessim-all dessim-dm dessim-lm dessim-sm miss_out mkdir.log
	-@rm -rf temp/*
