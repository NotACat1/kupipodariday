#!/bin/bash
set -e
source ../.env.deploy

DATE=$(date +%Y-%m-%d_%H-%M-%S)
BACKUP_FILE=backup_${DATE}.sql

echo "Создание бэкапа базы данных..."
ssh "$USER@$SERVER_IP" "docker exec db pg_dump -U $POSTGRES_USER $POSTGRES_DB" > "$BACKUP_FILE"

echo "Бэкап базы данных сохранен локально: $BACKUP_FILE"