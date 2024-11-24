#!/bin/bash

source ../.env.deploy

BACKUP_PATH="/path/to/backup"
TIMESTAMP=$(date +"%F-%H-%M")

echo "Создание резервной копии базы данных..."
docker exec -t db pg_dump -U ${POSTGRES_USER} ${POSTGRES_DB} > ${BACKUP_PATH}/db_backup_${TIMESTAMP}.sql

echo "Бэкап создан: ${BACKUP_PATH}/db_backup_${TIMESTAMP}.sql"
