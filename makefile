CXX=g++

all: clean thesisdev

thesisdev: ./src/main.cpp
	@$(CXX) -O3 -std=c++14 -lpthread -pthread -o thesisdev ./src/main.cpp
	-@mkdir data
	@echo "Usage: thesisdev config_file log_file <resume> <quiet> (parameters in <> are optional)."
	@echo "Example: ./thesisdev config-test.txt execution-test.log quiet"
	@echo "To kill process: KillProcess thesisdev"

clean:
	-@rm thesisdev
	-@rm -rf data
