CXX=g++

all: aes

aes:
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D PARAM_LEN=16 -D AES -o aes-lm src/cache_misses.cpp > make.log 2>&1

clean:
	-@rm aes-lm
	-@rm mkdir.log
	-@rm -rf temp/*
