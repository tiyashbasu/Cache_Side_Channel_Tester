CXX = g++
CXXFLAGS = -std=c++14 -O3 -pthread -lpthread
REDR = > make.log 2>&1
SOURCES = $(shell echo src/*.cpp)
HEADERS = $(shell echo src/*.h)

DEFS1 = -D PARAM_LEN=16 -D BASIC_AES
DEFS2 = -D PARAM_LEN=1  -D GDKLIB_NAME
DEFS3 = -D PARAM_LEN=1  -D GDKLIB_UNI
DEFS4 = -D PARAM_LEN=16 -D OPENSSL_AES
DEFS5 = -D PARAM_LEN=8  -D OPENSSL_DES
DEFS6 = -D PARAM_LEN=10 -D OPENSSL_RC4

TARGET1 = basic_aes
TARGET2 = gdklib_name
TARGET3 = gdklib_uni
TARGET4 = openssl_aes
TARGET5 = openssl_des
TARGET6 = openssl_rc4

all: $(TARGET1) $(TARGET2) $(TARGET3) $(TARGET4) $(TARGET5) $(TARGET6)

debug: CXXFLAGS += -g -Wall -Wextra
debug: $(TARGET1)

$(TARGET1): $(SOURCES) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(DEFS1) -o $(TARGET1) $(SOURCES) $(LIBS) $(REDR)

$(TARGET2): $(SOURCES) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(DEFS2) -o $(TARGET2) $(SOURCES) $(LIBS) $(REDR)

$(TARGET3): $(SOURCES) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(DEFS3) -o $(TARGET3) $(SOURCES) $(LIBS) $(REDR)

$(TARGET4): $(SOURCES) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(DEFS4) -o $(TARGET4) $(SOURCES) $(LIBS) $(REDR)

$(TARGET5): $(SOURCES) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(DEFS5) -o $(TARGET5) $(SOURCES) $(LIBS) $(REDR)

$(TARGET6): $(SOURCES) $(HEADERS)
	$(CXX) $(CXXFLAGS) $(DEFS6) -o $(TARGET6) $(SOURCES) $(LIBS) $(REDR)

clean:
	-@rm -f $(TARGET1) $(TARGET2) $(TARGET3) $(TARGET4) $(TARGET5) $(TARGET6)
	-@rm mkdir.log make.log
	-@rm -rf temp/*