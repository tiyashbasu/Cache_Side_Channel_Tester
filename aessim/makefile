CXX=g++

all: main.cpp
	$(CXX) -o aessim main.cpp
	mkdir output

clean:
	@rm aessim miss_out
	@mv data/aes.c.prefix ./
	@mv data/aes.c.suffix ./
	@rm -rf data
	@mkdir data
	@mv aes.c.prefix data
	@mv aes.c.suffix data
