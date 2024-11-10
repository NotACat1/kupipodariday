#!/bin/bash

# Загружаем переменные окружения
source .env.production

# Подключаемся к серверу
ssh "$DEPLOY_USER@$DEPLOY_HOST" << EOF
  # Переход в директорию для проекта
  mkdir -p "$DEPLOY_PATH"
  cd "$DEPLOY_PATH" || exit

  # Клонирование репозитория при первом развертывании
  if [ ! -d .git ]; then
    git clone "$DEPLOY_REPO" .
  fi

  # Обновляем код и перезапускаем приложение
  git fetch origin
  git reset --hard "$DEPLOY_REF"
  npm install
  pm2 reload ecosystem.config.js --env production
EOF