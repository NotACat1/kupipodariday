#!/bin/bash
set -e
source ../.env.deploy

echo "Запуск проекта на сервере $SERVER_IP..."
ssh "$USER@$SERVER_IP" "cd $DEPLOY_PATH && docker compose up -d"
echo "Проект запущен!"
