CXX=g++

all: clean aes gdklib-name gdklib-uni openssl-aes openssl-des openssl-rc4

aes:
	$(CXX) -std=c++14 -O3 -std=c++14 -D FILES -D PARAM_LEN=16 -D AES -o aessim-file sim_wrapper.cpp > make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D ALL -D PARAM_LEN=16 -D AES -o aessim-all sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D LM -D PARAM_LEN=16 -D AES -o aessim-lm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D SM -D PARAM_LEN=16 -D AES -o aessim-sm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D DM -D PARAM_LEN=16 -D AES -o aessim-dm sim_wrapper.cpp >> make.log 2>&1

gdklib-name:
	$(CXX) -std=c++14 -O3 -std=c++14 -D FILES -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklibname-file sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D ALL -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklibname-all sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D LM -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklibname-lm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D SM -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklibname-sm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D DM -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklibname-dm sim_wrapper.cpp >> make.log 2>&1

gdklib-uni:
	$(CXX) -std=c++14 -O3 -std=c++14 -D FILES -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklibuni-file sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D ALL -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklibuni-all sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D LM -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklibuni-lm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D SM -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklibuni-sm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D DM -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklibuni-dm sim_wrapper.cpp >> make.log 2>&1

openssl-aes:
	$(CXX) -std=c++14 -O3 -std=c++14 -D FILES -D PARAM_LEN=16 -D OPENSSL_AES -o openssl-aes-file sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D ALL -D PARAM_LEN=16 -D OPENSSL_AES -o openssl-aes-all sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D LM -D PARAM_LEN=16 -D OPENSSL_AES -o openssl-aes-lm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D SM -D PARAM_LEN=16 -D OPENSSL_AES -o openssl-aes-sm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D DM -D PARAM_LEN=16 -D OPENSSL_AES -o openssl-aes-dm sim_wrapper.cpp >> make.log 2>&1

openssl-des:
	$(CXX) -std=c++14 -O3 -std=c++14 -D FILES -D PARAM_LEN=8 -D OPENSSL_DES -o openssl-des-file sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D ALL -D PARAM_LEN=8 -D OPENSSL_DES -o openssl-des-all sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D LM -D PARAM_LEN=8 -D OPENSSL_DES -o openssl-des-lm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D SM -D PARAM_LEN=8 -D OPENSSL_DES -o openssl-des-sm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D DM -D PARAM_LEN=8 -D OPENSSL_DES -o openssl-des-dm sim_wrapper.cpp >> make.log 2>&1

openssl-rc4:
	$(CXX) -std=c++14 -O3 -std=c++14 -D FILES -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl-rc4-file sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D ALL -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl-rc4-all sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D LM -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl-rc4-lm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D SM -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl-rc4-sm sim_wrapper.cpp >> make.log 2>&1
	$(CXX) -std=c++14 -O3 -std=c++14 -D DM -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl-rc4-dm sim_wrapper.cpp >> make.log 2>&1

clean:
	-@rm aessim-file aessim-all aessim-dm aessim-lm aessim-sm
	-@rm gdklibname-file gdklibname-all gdklibname-dm gdklibname-lm gdklibname-sm
	-@rm gdklibuni-file gdklibuni-all gdklibuni-dm gdklibuni-lm gdklibuni-sm
	-@rm openssl-aes-file openssl-aes-all openssl-aes-dm openssl-aes-lm openssl-aes-sm
	-@rm openssl-des-file openssl-des-all openssl-des-dm openssl-des-lm openssl-des-sm
	-@rm openssl-rc4-file openssl-rc4-all openssl-rc4-dm openssl-rc4-lm openssl-rc4-sm
	-@rm stderr.log miss_out
	-@rm -rf temp/*
