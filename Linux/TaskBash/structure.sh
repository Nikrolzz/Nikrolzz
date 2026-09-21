#!/bin/bash
echo -n "Введите название нового веб-проекта: "
read project_name

# Создаем структуру папок
mkdir -p "$project_name/css" "$project_name/js"

# Создаем пустые файлы
touch "$project_name/index.html"
touch "$project_name/css/style.css"
touch "$project_name/js/script.js"

echo "Структура проекта '$project_name/' успешно создана!"
