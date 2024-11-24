#!/bin/bash

source ../.env.deploy

echo "Обновление Docker-образа..."
ssh ${DEPLOY_USER}@${DEPLOY_HOST} << EOF
  docker pull ${IMAGE_NAME}:${DEPLOY_REF}
  cd ${DEPLOY_PATH}
  docker-compose down
  docker-compose up -d
EOF

echo "Образ обновлен и перезапущен."
