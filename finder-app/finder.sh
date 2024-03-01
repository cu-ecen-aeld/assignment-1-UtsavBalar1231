#!/usr/bin/env bash

if [ $# -lt 2 ]; then
	echo "Please pass two arguements"
	exit 1
fi

filesdir=$1
searhstr=$2

if [ ! -d "$filesdir" ]; then
	exit 1
fi

function file_matches_count() {
	files_count=$2
	for file in $(ls "$1"); do
		if [ -d "$file" ]; then
			file_matches_count "$file" "$files_count"
		else
			files_count=$(($files_count + $(grep -c "$searhstr" "$1/$file")))
		fi
	done

	echo "$files_count"
}

filescount=$(ls "$filesdir" | wc -l)
filematches=$(file_matches_count "$filesdir" 0)

echo "The number of files are $filescount and the number of matching lines are $filematches"
