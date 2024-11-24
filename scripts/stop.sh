#!/bin/bash
set -e
source ../.env.deploy

echo "Остановка проекта на сервере $SERVER_IP..."
ssh "$USER@$SERVER_IP" "cd $DEPLOY_PATH && docker-compose down"
echo "Проект остановлен!"
