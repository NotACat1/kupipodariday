#!/bin/bash

# Загрузка переменных из .env
source .env

# Создание директории для бэкапов, если ее нет
mkdir -p ./backups

# Создание бэкапа с датой в имени файла
docker exec -t $(docker-compose ps -q db) pg_dump -U "$POSTGRES_USER" "$POSTGRES_DB" > "./backups/backup_$(date +'%Y%m%d').sql"
