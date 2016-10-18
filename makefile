CXX=g++

all: thesisdev

thesisdev: main.cpp
	@$(CXX) -std=c++14 -pthread -o thesisdev main.cpp
	-@mkdir data
	-@mkdir temp
	@echo
	@echo "Usage example: ./thesisdev config.txt"
	@echo "To kill process: ./KillProcess thesisdev"

clean:
	-@rm thesisdev
	-@rm -rf temp
	-@rm -rf data
