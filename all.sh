#!/bin/bash

./curl.sh
./image.sh
./create.sh
cat ./*_last.txt > last.txt
rm -rf ./*_last.txt
rm -rf ./*_url.txt
rm -rf 1.txt 2.txt 3.txt 4.txt 5.txt 6.txt 7.txt 8.txt 9.txt 10.txt