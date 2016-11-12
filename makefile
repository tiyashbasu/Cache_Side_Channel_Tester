CXX=g++

all: clean thesisdev

thesisdev: ./src/main.cpp
	@$(CXX) -O3 -std=c++14 -lpthread -pthread -D PARALLEL -o thesisdev_p ./src/main.cpp
	@$(CXX) -O3 -std=c++14 -lpthread -pthread -D SERIAL -o thesisdev_s ./src/main.cpp
	-@mkdir data
	@echo "Usage: thesisdev config_file log_file <resume> <quiet> (parameters in <> are optional)."
	@echo "Example: ./thesisdev_<p/s> config-test.txt execution-test.log quiet"
	@echo "To kill process: KillProcess thesisdev"

clean:
	-@rm thesisdev
	-@rm -rf data
