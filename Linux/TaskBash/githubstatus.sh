#!/bin/bash

if [ -z "$1" ]; then
    echo "Ошибка: передайте репозиторий аргументом. Пример: ./github-stats.sh tensorflow/tensorflow"
    exit 1
fi

REPO="$1"

# Проверка софта
if ! command -v curl &> /dev/null || ! command -v jq &> /dev/null; then
    echo "Ошибка: установите curl и jq (sudo apt install curl jq)"
    exit 1
fi

# Запрос к API
RESPONSE=$(curl -s "https://github.com")

if echo "$RESPONSE" | jq -r '.message?' | grep -q "Not Found"; then
    echo "Ошибка: Репозиторий '$REPO' не найден."
    exit 1
fi

# Сбор данных
NAME=$(echo "$RESPONSE" | jq -r '.full_name')
STARS=$(echo "$RESPONSE" | jq -r '.stargazers_count')
FORKS=$(echo "$RESPONSE" | jq -r '.forks_count')
ISSUES=$(echo "$RESPONSE" | jq -r '.open_issues_count')
OWNER=$(echo "$RESPONSE" | jq -r '.owner.login')
UPDATED=$(echo "$RESPONSE" | jq -r '.updated_at')

# Цвета ANSI
RESET="\033[0m"
YELLOW="\033[1;33m"
GREEN="\033[1;32m"
RED="\033[1;31m"
CYAN="\033[1;36m"

[ "$ISSUES" -gt 100 ] && COLOR_ISSUES="$RED" || COLOR_ISSUES="$YELLOW"

# Красивый вывод
echo -e "${CYAN}╔════════════════════════════════════════╗${RESET}"
echo -e "${CYAN}║  🚀 GitHub Repository Analyzer            ║${RESET}"
echo -e "${CYAN}╚════════════════════════════════════════╝${RESET}"
echo ""
echo -e "📦 Репозиторий: ${CYAN}$NAME${RESET}"
echo -e "⭐ Звёзды:       ${YELLOW}$STARS${RESET}  (⭐)"
echo -e "🔀 Форки:        ${GREEN}$FORKS${RESET}  (🔀)"
echo -e "🐛 Open Issues:  ${COLOR_ISSUES}$ISSUES${RESET}  (🐛)"
echo -e "👤 Автор:        ${CYAN}$OWNER${RESET}"
echo -e "📊 Активность:   Обновлен в $UPDATED"
