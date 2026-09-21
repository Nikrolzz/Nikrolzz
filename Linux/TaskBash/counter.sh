#!/bin/bash
echo -n "Введите имя или путь к файлу: "
read filepath

if [ -f "$filepath" ]; then
    lines=$(wc -l < "$filepath")
    echo "В файле '$filepath' найдено строк: $lines"
else
    echo "Ошибка: Файл '$filepath' не существует."
fi
