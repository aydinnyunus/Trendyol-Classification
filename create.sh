#!/bin/bash

set -B                  # enable brace expansion
for i in {1..10}; do
	echo $i
	
	cat $i._url.txt | cut -d '"' -f2 | awk '{ printf "https://cdn.dsmcdn.com"; print }' > "$i""_last.txt"
done
