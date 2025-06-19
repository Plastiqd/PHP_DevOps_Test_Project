#!/bin/bash

# Аргументы (по умолчанию host=127.0.0.1, port=80)
HOST="${1:-127.0.0.1}"
PORT="${2:-80}"
LOG_FILE="$HOME/port_checker.log"

# Проверяем доступность порта
if nc -zw 3 "$HOST" "$PORT" &> /dev/null; then
    echo "Порт $PORT на $HOST доступен"
else
    # Пишем в лог
    TIMESTAMP=$(date "+%Y-%m-%d %H:%M:%S")
    echo "[$TIMESTAMP] Ошибка: порт $PORT на $HOST недоступен" >> "$LOG_FILE"
    echo "Порт $PORT на $HOST недоступен (см. лог: $LOG_FILE)"
fi
