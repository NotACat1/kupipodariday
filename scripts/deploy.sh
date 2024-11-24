#!/bin/bash

source ../.env.deploy

echo "Деплой проекта..."
ssh ${DEPLOY_USER}@${DEPLOY_HOST} << EOF
  mkdir -p ${DEPLOY_PATH}
EOF

scp ../docker-compose.yml ${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}/
scp ../.env ${DEPLOY_USER}@${DEPLOY_HOST}:${DEPLOY_PATH}/

ssh ${DEPLOY_USER}@${DEPLOY_HOST} << EOF
  cd ${DEPLOY_PATH}
  docker-compose down
  docker-compose up -d
EOF

echo "Деплой завершен!"
