#!/bin/bash
echo "Plotting for Local hardware - Basic AES"
python3 ./generate_plot.py local_basic_aes_ourtool.log 	local_basic_aes_afl.txt 	local_basic_aes_radamsa.txt 	500		"lower right" local_basic_aes.png
echo "Plotting for Local hardware - GDK key from name"
python3 ./generate_plot.py local_gdklib_name_ourtool.log 	local_gdklib_name_afl.txt 	local_gdklib_name_radamsa.txt 	500 	"lower right" local_gdklib_name.png
echo "Plotting for Local hardware - GDK key to unicode"
python3 ./generate_plot.py local_gdklib_uni_ourtool.log 	local_gdklib_uni_afl.txt 	local_gdklib_uni_radamsa.txt 	500 	"lower right" local_gdklib_uni.png
echo "Plotting for Local hardware - OpenSSL AES"
python3 ./generate_plot.py local_openssl_aes_ourtool.log 	local_openssl_aes_afl.txt 	local_openssl_aes_radamsa.txt 	500 	"lower right" local_openssl_aes.png
echo "Plotting for Local hardware - OpenSSL DES"
python3 ./generate_plot.py local_openssl_des_ourtool.log 	local_openssl_des_afl.txt 	local_openssl_des_radamsa.txt 	500 	"lower right" local_openssl_des.png
echo "Plotting for Local hardware - OpenSSL RC4"
python3 ./generate_plot.py local_openssl_rc4_ourtool.log 	local_openssl_rc4_afl.txt 	local_openssl_rc4_radamsa.txt 	500 	"lower right" local_openssl_rc4.png

echo "Plotting for Simplescalar - Basic AES"
python3 ./generate_plot.py sim_basic_aes_ourtool.log 		sim_basic_aes_afl.txt 		sim_basic_aes_radamsa.txt 		50000 	"lower right" sim_basic_aes.png
echo "Plotting for Simplescalar - GDK key from name"
python3 ./generate_plot.py sim_gdklib_name_ourtool.log 	sim_gdklib_name_afl.txt 	sim_gdklib_name_radamsa.txt 	5000 	"lower right" sim_gdklib_name.png
echo "Plotting for Simplescalar - GDK key to unicode"
python3 ./generate_plot.py sim_gdklib_uni_ourtool.log 		sim_gdklib_uni_afl.txt 		sim_gdklib_uni_radamsa.txt 		5000 	"upper right" sim_gdklib_uni.png
echo "Plotting for Simplescalar - OpenSSL AES"
python3 ./generate_plot.py sim_openssl_aes_ourtool.log 	sim_openssl_aes_afl.txt 	sim_openssl_aes_radamsa.txt 	50000 	"lower right" sim_openssl_aes.png
echo "Plotting for Simplescalar - OpenSSL DES"
python3 ./generate_plot.py sim_openssl_des_ourtool.log 	sim_openssl_des_afl.txt 	sim_openssl_des_radamsa.txt 	50000 	"lower right" sim_openssl_des.png
echo "Plotting for Simplescalar - OpenSSL RC4"
python3 ./generate_plot.py sim_openssl_rc4_ourtool.log 	sim_openssl_rc4_afl.txt 	sim_openssl_rc4_radamsa.txt 	50000 	"lower right" sim_openssl_rc4.png

echo "Done. All plots have been generated."
