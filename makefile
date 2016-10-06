CXX=g++

all: main.cpp
	$(CXX) -std=c++14 -o thesisdev main.cpp
	@echo "Usage example: ./thesisdev config.txt"
	@echo "To kill process: ./KillProcess thesisdev"

clean:
	@rm thesisdev
