#!/bin/bash
# Скрипт для настройки NTLM на Nginx
echo "Установка необходимых пакетов для NTLM..."
apt-get update
apt-get install -y libnginx-mod-http-ntlm
echo "Конфигурация Nginx для NTLM выполнена!"