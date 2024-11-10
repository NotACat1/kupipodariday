#!/bin/bash

# Загружаем переменные окружения
source .env.production

# Подключаемся к серверу
ssh "$DEPLOY_USER@$DEPLOY_HOST" << EOF
  # Переход в директорию для проекта
  echo "$DEPLOY_PASSWORD" | sudo -S mkdir -p "$DEPLOY_PATH"
  cd "$DEPLOY_PATH" || exit

  # Клонирование репозитория при первом развертывании
  if [ ! -d .git ]; then
    echo "$DEPLOY_PASSWORD" | sudo -S git clone "$DEPLOY_REPO" .
  fi

  # Обновляем код и перезапускаем приложение
  git fetch origin
  npm install
  pm2 reload ./deployment/ecosystem.config.js --env production
EOF
