CXX=g++

all: clean thesisdev

thesisdev: ./src/main.cpp
	@$(CXX) -O3 -std=c++14 -lpthread -pthread -D PARALLEL -o thesisdev_p ./src/main.cpp
	@$(CXX) -O3 -std=c++14 -lpthread -pthread -D SERIAL -o thesisdev_s ./src/main.cpp
	-@mkdir data
	@echo "Usage: thesisdev_<s/p> config_file log_file <resume> <quiet> (parameters in <> are optional)."
	@echo "Example: ./thesisdev_p config-test.txt execution-test.log quiet"
	@echo "Use thesisdev_p for parallel execution of target while evaluation."
	@echo "Use thesisdev_p for serial execution of target while evaluation."
	@echo "To kill process: KillProcess thesisdev"

clean:
	-@rm thesisdev_s thesisdev_p
	-@rm -rf data/*
