#!/bin/bash

format=""
gen_sql=0

while getopts "f:g" opt
do
    case $opt in
        f) format=$OPTARG ;;
        g) gen_sql=1 ;;
    esac
done

shift $((OPTIND - 1))

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

echo "Количество продаж: $count" | tee sales_report.txt
echo "Общая сумма продаж: $total" | tee -a sales_report.txt
echo "Средняя стоимость продажи: $average" | tee -a sales_report.txt
echo "Самая дорогая продажа: $max $max_product" | tee -a sales_report.txt

if [ "$format" = "csv" ] || [ $gen_sql -eq 1 ]
then
    echo "metric,value" > sales_report.csv
    echo "total_sales,$total" >> sales_report.csv
    echo "average_sale,$average" >> sales_report.csv
    echo "max_sale,$max" >> sales_report.csv
fi

if [ $gen_sql -eq 1 ]
then
    cat > import_sales.sql <<EOF
DROP TABLE IF EXISTS sales_report;
CREATE TABLE sales_report (metric VARCHAR(50), value NUMERIC(14,2));
\copy sales_report FROM '$PWD/sales_report.csv' WITH (FORMAT csv, HEADER true);
EOF
fi
