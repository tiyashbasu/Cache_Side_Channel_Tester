CXX = g++
CFLAGS = -std=c++14 -O3 -pthread -lpthread
DEFS = -D PARAM_LEN=16 -D AES

TARGET   = cache_misses
SOURCES  = $(shell echo src/*.cpp)
HEADERS  = $(shell echo src/*.h)

all: $(TARGET)

debug: CFLAGS += -g -Wall -Wextra
debug: $(TARGET)

$(TARGET): $(SOURCES) $(HEADERS)
	$(CXX) $(CFLAGS) $(DEFS) -o $(TARGET) $(SOURCES) $(LIBS)

clean:
	rm -f $(TARGET)
	rm mkdir.log
	rm -rf temp/*

.PHONY : all debug
