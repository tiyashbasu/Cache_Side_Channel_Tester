CXX=g++

all: clean thesisdev

thesisdev: ./src/main.cpp
	@$(CXX) -std=c++14 -lpthread -pthread -o thesisdev ./src/main.cpp
	-@mkdir data
	@echo "Usage example: ./thesisdev config.txt"
	@echo "To kill process: ./KillProcess thesisdev"

clean:
	-@rm thesisdev
	-@rm -rf data
