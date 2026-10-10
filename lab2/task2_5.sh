#!/bin/bash

if [ -z "$1" ]
then
	fold="."
else
	fold="$1"
fi

find "$fold" -type f > /tmp/files.list

while read file1
do
	count=0
	while read file2
	do
		if [ "$file1" != "$file2" ]
		then
			if cmp -s "$file1" "$file2"
			then
				count=$((count + 1))
			fi
		fi
	done < /tmp/files.list

	if [ $count -gt 0 ]
	then
		echo ""$count" "$file1""
	fi
done < /tmp/files.list

