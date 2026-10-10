#!/bin/bash

file="$1"

if [ -z "$file" ]
then
	echo "файл пустой"
	exit 1
fi

if [ ! -f "$file" ]
then
	echo " Файл не существует"
	exit 1
fi

tail -n +2 "$file" > /tmp/sales_data.txt

total=0
count=0
max=0
max_product=""

while IFS=',' read date product quantity price
do
	if [ -z "$quantity" ]
	then
		continue
	fi

	amount=$((quantity * price))
	total=$((total + amount))
	count=$((count + 1))

	if [ $amount -gt $max ]
	then
		max=$amount
		max_product=$product
	fi
done < /tmp/sales_data.txt

if [ $count -eq 0 ]
then
	echo "Нет данных о продажах"
	exit 1
fi

average=$((total / count))

echo "Количество продаж: "$count"" | tee sales_report.txt
echo "Общая сумма продаж: "$total"" | tee -a sales_report.txt
echo "Средняя стоимость продажи: "$average"" | tee -a sales_report.txt
echo "Самая ждорогая продажа: "$max" "$max_product"" | tee -a sales_report.txt
