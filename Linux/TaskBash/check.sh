#!/bin/bash
echo -n "Введите число: "
read num

if (( num % 2 == 0 )); then
    echo "Число $num — чётное."
else
    echo "Число $num — нечётное."
fi