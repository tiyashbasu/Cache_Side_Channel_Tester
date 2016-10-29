CXX=g++

all: clean gdklib-name-file gdklib-name-all gdklib-name-dm gdklib-name-lm gdklib-name-sm gdklib-uni-file gdklib-uni-all gdklib-uni-dm gdklib-uni-lm gdklib-uni-sm

gdklib-name-file: gdklibkeysim.cpp
	$(CXX) -std=c++14 -O3 -D KEYNAME -D FILES -o gdklib-name-file gdklibkeysim.cpp > make.log 2>&1

gdklib-name-all: gdklibkeysim.cpp
	$(CXX) -std=c++14 -O3 -D KEYNAME -D ALL -o gdklib-name-all gdklibkeysim.cpp >> make.log 2>&1

gdklib-name-dm: gdklibkeysim.cpp
	$(CXX) -std=c++14 -O3 -D KEYNAME -D DM -o gdklib-name-dm gdklibkeysim.cpp >> make.log 2>&1

gdklib-name-lm: gdklibkeysim.cpp
	$(CXX) -std=c++14 -O3 -D KEYNAME -D LM -o gdklib-name-lm gdklibkeysim.cpp >> make.log 2>&1

gdklib-name-sm: gdklibkeysim.cpp
	$(CXX) -std=c++14 -O3 -D KEYNAME -D SM -o gdklib-name-sm gdklibkeysim.cpp >> make.log 2>&1

gdklib-uni-file: gdklibkeysim.cpp
	$(CXX) -std=c++14 -O3 -D KEYUNI -D FILES -o gdklib-uni-file gdklibkeysim.cpp >> make.log 2>&1

gdklib-uni-all: gdklibkeysim.cpp
	$(CXX) -std=c++14 -O3 -D KEYUNI -D ALL -o gdklib-uni-all gdklibkeysim.cpp >> make.log 2>&1

gdklib-uni-dm: gdklibkeysim.cpp
	$(CXX) -std=c++14 -O3 -D KEYUNI -D DM -o gdklib-uni-dm gdklibkeysim.cpp >> make.log 2>&1

gdklib-uni-lm: gdklibkeysim.cpp
	$(CXX) -std=c++14 -O3 -D KEYUNI -D LM -o gdklib-uni-lm gdklibkeysim.cpp >> make.log 2>&1

gdklib-uni-sm: gdklibkeysim.cpp
	$(CXX) -std=c++14 -O3 -D KEYUNI -D SM -o gdklib-uni-sm gdklibkeysim.cpp >> make.log 2>&1

clean:
	-@rm gdklib-name-file gdklib-name-all gdklib-name-dm gdklib-name-lm gdklib-name-sm gdklib-uni-file gdklib-uni-all gdklib-uni-dm gdklib-uni-lm gdklib-uni-sm miss_out mkdir.log
	-@rm -rf temp/*
