CXX=g++

all: clean cache_sc_tester

cache_sc_tester: ./src/main.cpp
	@$(CXX) -O3 -std=c++14 -lpthread -pthread -D PARALLEL -o cache_sc_tester_p ./src/main.cpp
	@$(CXX) -O3 -std=c++14 -lpthread -pthread -D SERIAL -o cache_sc_tester_s ./src/main.cpp
	-@mkdir data
	@echo "Usage: cache_sc_tester_<s/p> config_file log_file <resume> <quiet> (parameters in <> are optional)."
	@echo "Example: ./cache_sc_tester_p config-test.txt execution-test.log quiet"
	@echo "Use cache_sc_tester_p for parallel execution of target while evaluation."
	@echo "Use cache_sc_tester_s for serial execution of target while evaluation."
	@echo "To kill process: KillProcess cache_sc_tester_p/cache_sc_tester_s"

clean:
	-@rm cache_sc_tester_s cache_sc_tester_p
	-@rm -rf data/*
