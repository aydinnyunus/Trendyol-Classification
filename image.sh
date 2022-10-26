#!/bin/bash

set -B                  # enable brace expansion
for i in {1..10}; do
	cat "$i"".txt" | jq ".result.products[].images[]" > "$i"."_url.txt"
done