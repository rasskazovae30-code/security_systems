#!/bin/bash

> even.txt
> odd.txt

count=0

for i in "$@"
do
	count=$((count + 1))
	if [ $((i % 3)) -eq 0 ]
	then
		continue
	fi
	if [ $((i % 2)) -eq 0 ]
	then
		echo "$i" >> even.txt
	else
		echo "$i" >> odd.txt
	fi

done 

echo "Обработано чиселок "$count""
