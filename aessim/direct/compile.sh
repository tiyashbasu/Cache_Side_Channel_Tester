cp -f $1 ../cde-package/cde-root/src
cd ../cde-package
./sslittle-na-sstrix-gcc.cde -o $2 src/$1
cd ../direct
rm -f ../cde-package/cde-root/src/$1
mv -f ../cde-package/cde-root/$2 ./
