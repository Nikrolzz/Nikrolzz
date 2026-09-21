#!/bin/bash
# Берёт случайные символы из urandom, отсекает лишнее и оставляет 8 знаков
password=$(tr -dc 'A-Za-z0-9' < /dev/urandom | head -c 8)
echo "Ваш сгенерированный пароль: $password"
