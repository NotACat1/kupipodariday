#!/bin/bash
set -e
source ../.env.deploy

echo "Обновление проекта на сервере $SERVER_IP..."

ssh "$USER@$SERVER_IP" << EOF
  echo "Обновляем репозиторий..."
  cd "$DEPLOY_PATH"
  git reset --hard
  git pull origin "$GITHUB_BRANCH"

  echo "Перезапуск контейнеров..."
  docker compose down
  docker compose pull
  docker compose up -d
EOF

echo "Проект обновлен!"
