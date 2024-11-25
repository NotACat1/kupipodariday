#!/bin/bash
set -e
source ../.env.deploy

echo "Деплой проекта на сервере $SERVER_IP..."

ssh "$USER@$SERVER_IP" << EOF
  # Создаем директорию, если она не существует
  if [ ! -d "$DEPLOY_PATH" ]; then
    echo "Создаем директорию $DEPLOY_PATH..."
    mkdir -p "$DEPLOY_PATH"
  fi

  # Проверяем наличие репозитория
  if [ ! -d "$DEPLOY_PATH/.git" ]; then
    echo "Клонируем репозиторий..."
    git clone -b "$GITHUB_BRANCH" "$GITHUB_REPO" "$DEPLOY_PATH"
  else
    echo "Обновляем репозиторий..."
    cd "$DEPLOY_PATH"
    git reset --hard
    git pull origin "$GITHUB_BRANCH"
  fi

  # Запускаем Docker Compose
  cd "$DEPLOY_PATH"
  docker compose down
  docker compose pull
  docker compose up -d
EOF

echo "Деплой завершен!"
