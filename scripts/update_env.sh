#!/bin/bash
set -e
source ../.env.deploy

echo "Обновление или добавление файла .env на сервер $SERVER_IP..."

scp "../.env" "$USER@$SERVER_IP:$DEPLOY_PATH/.env"

echo "Файл $ENV_FILE успешно обновлен на сервере!"
