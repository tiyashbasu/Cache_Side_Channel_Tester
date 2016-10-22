CXX=g++

all: clean flipper

flipper: flipper.cpp
	$(CXX) -std=c++14 -o flipper.o flipper.cpp

debug:
	$(CXX) -std=c++14 -g -o flipper-debug.o flipper.cpp

clean:
	-@echo "Deleting flipper.o..."
	-@rm -f flipper.o
	-@echo "Deleting flipper_debug.o..."
	-@rm -f flipper_debug.o
