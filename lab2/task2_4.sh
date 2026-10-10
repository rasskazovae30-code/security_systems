#!/bin/bash
find "$HOME" -type f -name "*.txt" > /tmp/txt_files.list
echo "СПИСАК ФАЙЛОВ"
cat /tmp/txt_files.list

liness=0
bytess=0

while read file
do
	byte=$(wc -c < "$file")
	line=$(wc -l < "$file")
	bytess=$((byte + bytess))
	liness=$((line+liness))
done < /tmp/txt_files.list

echo "Байты: "$bytess"" 
echo "Строки:" $liness""
