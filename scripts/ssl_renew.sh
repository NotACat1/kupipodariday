#!/bin/bash

# Загрузка переменных из .env
set -o allexport
source .env
set +o allexport

# Выполнение обновления сертификата
sudo certbot certonly --standalone -d "$DOMAIN" --email "$EMAIL" --agree-tos --no-eff-email --renew-by-default

# Перезапуск Docker-контейнеров после обновления сертификата
docker-compose down
docker-compose up -d
