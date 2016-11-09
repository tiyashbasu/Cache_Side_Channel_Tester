CC=gcc

all: clean aes gdklib_name gdklib_uni openssl_aes openssl_des openssl_rc4

aes: aes.c
	$(CC) -o aes aes.c

gdklib_name: gdklib_name.c
	$(CC) -o gdklib_name gdklib_name.c

gdklib_uni: aes.c
	$(CC) -o gdklib_uni gdklib_uni.c

openssl_aes: aes.c
	$(CC) -o openssl_aes openssl_aes.c

openssl_des: aes.c
	$(CC) -o openssl_des openssl_des.c

openssl_rc4: aes.c
	$(CC) -o openssl_rc4 openssl_rc4.c

clean:
	rm -f aes gdklib_name gdklib_uni openssl_aes openssl_des openssl_rc4
