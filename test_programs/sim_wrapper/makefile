CXX = g++
CFLAGS = -std=c++14 -O3 -pthread -lpthread


all: clean aes gdklib_-name gdklib_-uni openssl_aes openssl_des openssl_rc4

aes:
	$(CXX) $(CFLAGS) -D FILES -D PARAM_LEN=16 -D AES -o basic_aes_file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D ALL -D PARAM_LEN=16 -D AES -o basic_aes_all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D LM -D PARAM_LEN=16 -D AES -o basic_aes_lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D SM -D PARAM_LEN=16 -D AES -o basic_aes_sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D DM -D PARAM_LEN=16 -D AES -o basic_aes_dm src/sim_wrapper.cpp > make.log 2>&1

gdklib_-name:
	$(CXX) $(CFLAGS) -D FILES -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklib_name_file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D ALL -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklib_name_all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D LM -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklib_name_lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D SM -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklib_name_sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D DM -D PARAM_LEN=1 -D GDKLIB_NAME -o gdklib_name_dm src/sim_wrapper.cpp > make.log 2>&1

gdklib_-uni:
	$(CXX) $(CFLAGS) -D FILES -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklib_uni_file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D ALL -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklib_uni_all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D LM -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklib_uni_lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D SM -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklib_uni_sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D DM -D PARAM_LEN=1 -D GDKLIB_UNI -o gdklib_uni_dm src/sim_wrapper.cpp > make.log 2>&1

openssl_aes:
	$(CXX) $(CFLAGS) -D FILES -D PARAM_LEN=16 -D OPENSSL_AES -o openssl_aes_file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D ALL -D PARAM_LEN=16 -D OPENSSL_AES -o openssl_aes_all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D LM -D PARAM_LEN=16 -D OPENSSL_AES -o openssl_aes_lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D SM -D PARAM_LEN=16 -D OPENSSL_AES -o openssl_aes_sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D DM -D PARAM_LEN=16 -D OPENSSL_AES -o openssl_aes_dm src/sim_wrapper.cpp > make.log 2>&1

openssl_des:
	$(CXX) $(CFLAGS) -D FILES -D PARAM_LEN=8 -D OPENSSL_DES -o openssl_des_file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D ALL -D PARAM_LEN=8 -D OPENSSL_DES -o openssl_des_all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D LM -D PARAM_LEN=8 -D OPENSSL_DES -o openssl_des_lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D SM -D PARAM_LEN=8 -D OPENSSL_DES -o openssl_des_sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D DM -D PARAM_LEN=8 -D OPENSSL_DES -o openssl_des_dm src/sim_wrapper.cpp > make.log 2>&1

openssl_rc4:
	$(CXX) $(CFLAGS) -D FILES -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl_rc4_file src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D ALL -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl_rc4_all src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D LM -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl_rc4_lm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D SM -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl_rc4_sm src/sim_wrapper.cpp > make.log 2>&1
	$(CXX) $(CFLAGS) -D DM -D PARAM_LEN=10 -D OPENSSL_RC4 -o openssl_rc4_dm src/sim_wrapper.cpp > make.log 2>&1

clean:
	-@rm basic_aes_file basic_aes_all basic_aes_dm basic_aes_lm basic_aes_sm
	-@rm gdklib_name_file gdklib_name_all gdklib_name_dm gdklib_name_lm gdklib_name_sm
	-@rm gdklib_uni_file gdklib_uni_all gdklib_uni_dm gdklib_uni_lm gdklib_uni_sm
	-@rm openssl_aes_file openssl_aes_all openssl_aes_dm openssl_aes_lm openssl_aes_sm
	-@rm openssl_des_file openssl_des_all openssl_des_dm openssl_des_lm openssl_des_sm
	-@rm openssl_rc4_file openssl_rc4_all openssl_rc4_dm openssl_rc4_lm openssl_rc4_sm
	-@rm stderr.log miss_out mkdir.log
	-@rm -rf temp/*
