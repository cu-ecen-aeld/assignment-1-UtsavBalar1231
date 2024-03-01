#!/usr/bin/env bash

if [ $# -lt 2 ]; then
	echo "Please pass two arguements"
	exit 1
fi

writefile=$1
writestr=$2

if [ ! -d $(dirname "$writefile") ]; then
	mkdir -p $(dirname "$writefile")
fi

if [ ! -f "$writefile" ]; then
	touch "$writefile"
fi

echo "$writestr" > "$writefile"
