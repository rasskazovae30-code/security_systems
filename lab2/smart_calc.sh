#!/bin/bash

verbose=0
outfile=""
operation=""

while getopts "hvo:asmdp" opt
do
	case $opt in
	h)
		echo "Работа: $0 [-h] [-v] [-o файл] операция число 1 число 2"
		echo " -h справка"
		echo " -v подробный вывод"
		echo " -o записать результат в файл"
		echo " -a +"
		echo " -s -"
		echo " -m *"
		echo " -d /"
		echo " -p ^"
		exit 0
		;;
	v) verbose=1 ;;
	o) outfile=$OPTARG ;;
	a) operation="+" ;;
	s) operation="-" ;;
	m) operation="*" ;;
	d) operation="/" ;;
	p) operation="**" ;;
	*)
		echo "Опция неизвестна"
		exit 1
		;;
	esac
done

shift $((OPTIND - 1))

a=$1
b=$2

if [ -z "$operation" ]
then 
	echo "Опция не выбрана"
	exit 1
fi

if [ "$operation" = "/" ] && [ "$b" -eq 0 ]
then
    echo "Ошибка: деление на ноль"
    exit 1
fi

result=$((a $operation b))

if [ -n "$outfile" ]
then
    echo "$result" > "$outfile"
else
    echo "$result"
fi

if [ -n "$outfile" ]
then
    echo "$result" > "$outfile"
else
    echo "$result"
fi

