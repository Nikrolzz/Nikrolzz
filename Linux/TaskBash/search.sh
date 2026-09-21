#!/bin/bash
echo -n "Введите расширение для поиска (например, sh, md, txt): "
read ext

echo "Файлы с расширением .$ext в текущей папке:"
find . -maxdepth 1 -type f -name "*.$ext"
