#!/bin/bash
echo -n "Введите первое число: "
read num1
echo -n "Введите второе число: "
read num2

sum=$((num1 + num2))
echo "Сумма чисел $num1 и $num2 равна: $sum"
