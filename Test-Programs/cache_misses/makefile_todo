CXX=g++

all: clean aes gdklib-name gdklib-uni openssl-aes openssl-des openssl-rc4

aes:
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D FILES -D PARAM_LEN=16 -D AES -o aessim-file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D ALL -D PARAM_LEN=16 -D AES -o aessim-all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D LM -D PARAM_LEN=16 -D AES -o aessim-lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D SM -D PARAM_LEN=16 -D AES -o aessim-sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D DM -D PARAM_LEN=16 -D AES -o aessim-dm src/sim_wrapper.cpp > make.log 2>&1

gdklib-name:
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D FILES -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklibname-file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D ALL -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklibname-all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D LM -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklibname-lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D SM -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklibname-sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D DM -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklibname-dm src/sim_wrapper.cpp > make.log 2>&1

gdklib-uni:
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D FILES -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklibuni-file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D ALL -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklibuni-all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D LM -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklibuni-lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D SM -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklibuni-sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D DM -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklibuni-dm src/sim_wrapper.cpp > make.log 2>&1

openssl-aes:
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D FILES -D PARAM_LEN=16 -D OPENSSL_AES -o openssl-aes-file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D ALL -D PARAM_LEN=16 -D OPENSSL_AES -o openssl-aes-all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D LM -D PARAM_LEN=16 -D OPENSSL_AES -o openssl-aes-lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D SM -D PARAM_LEN=16 -D OPENSSL_AES -o openssl-aes-sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D DM -D PARAM_LEN=16 -D OPENSSL_AES -o openssl-aes-dm src/sim_wrapper.cpp > make.log 2>&1

openssl-des:
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D FILES -D PARAM_LEN=8 -D OPENSSL_DES -o openssl-des-file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D ALL -D PARAM_LEN=8 -D OPENSSL_DES -o openssl-des-all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D LM -D PARAM_LEN=8 -D OPENSSL_DES -o openssl-des-lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D SM -D PARAM_LEN=8 -D OPENSSL_DES -o openssl-des-sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D DM -D PARAM_LEN=8 -D OPENSSL_DES -o openssl-des-dm src/sim_wrapper.cpp > make.log 2>&1

openssl-rc4:
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D FILES -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl-rc4-file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D ALL -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl-rc4-all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D LM -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl-rc4-lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D SM -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl-rc4-sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -pthread -lpthread -D DM -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl-rc4-dm src/sim_wrapper.cpp > make.log 2>&1

clean:
	-@rm aessim-file aessim-all aessim-dm aessim-lm aessim-sm
	-@rm gdklibname-file gdklibname-all gdklibname-dm gdklibname-lm gdklibname-sm
	-@rm gdklibuni-file gdklibuni-all gdklibuni-dm gdklibuni-lm gdklibuni-sm
	-@rm openssl-aes-file openssl-aes-all openssl-aes-dm openssl-aes-lm openssl-aes-sm
	-@rm openssl-des-file openssl-des-all openssl-des-dm openssl-des-lm openssl-des-sm
	-@rm openssl-rc4-file openssl-rc4-all openssl-rc4-dm openssl-rc4-lm openssl-rc4-sm
	-@rm stderr.log miss_out mkdir.log
	-@rm -rf temp/*
