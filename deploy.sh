#!/bin/bash

# Параметры для развертывания
DEPLOY_USER=${DEPLOY_USER:-"user"}
DEPLOY_HOST=${DEPLOY_HOST:-"192.168.31.181"}
DEPLOY_PATH=${DEPLOY_PATH:-"/var/www/kupipodariday"}
REPO_URL=${REPO_URL:-"git@github.com:NotACat1/kupipodariday.git"}

# Переменные для Docker и pm2
ENV_FILE=".env"

# Клонирование репозитория на сервер
echo "Клонирование репозитория..."
ssh "$DEPLOY_USER@$DEPLOY_HOST" "git clone $REPO_URL $DEPLOY_PATH || (cd $DEPLOY_PATH && git pull)"

# Копирование файла .env.production на сервер как .env
echo "Копирование .env.production файла..."
scp "$ENV_FILE" "$DEPLOY_USER@$DEPLOY_HOST:$DEPLOY_PATH/.env"

# Запуск Docker контейнеров
echo "Запуск Docker контейнеров..."
ssh "$DEPLOY_USER@$DEPLOY_HOST" << EOF
  cd $DEPLOY_PATH
  docker-compose down
  docker-compose up -d --build
EOF

# Установка зависимостей и настройка pm2
echo "Настройка pm2..."
ssh "$DEPLOY_USER@$DEPLOY_HOST" << EOF
  cd $DEPLOY_PATH
  npm install
  pm2 start ecosystem.config.js --env production
  pm2 save
EOF

echo "Развертывание завершено."
