#!/bin/bash

source ../.env.deploy

echo "Создание Docker-образа..."
docker build -t ${IMAGE_NAME}:${DEPLOY_REF} .

echo "Загрузка образа в Docker Registry..."
docker push ${IMAGE_NAME}:${DEPLOY_REF}

echo "Деплой на сервер..."
ssh ${DEPLOY_USER}@${DEPLOY_HOST} << EOF
  echo "Обновление проекта на сервере..."
  cd ${DEPLOY_PATH}
  docker-compose down
  docker pull ${IMAGE_NAME}:${DEPLOY_REF}
  docker-compose up -d
EOF

echo "Обновление завершено!"
