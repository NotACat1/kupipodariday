#!/bin/bash

# Установка переменных окружения
source .env.production

# Подключение к серверу и выполнение необходимых команд
ssh "$DEPLOY_USER@$DEPLOY_HOST" << 'EOF'
  cd $DEPLOY_PATH || exit
  git pull $DEPLOY_REPO $DEPLOY_REF
  docker-compose down
  docker-compose up -d --build
  pm2 reload ecosystem.config.js --env production
EOF