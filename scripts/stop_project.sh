#!/bin/bash

source ../.env.deploy

echo "Остановка проекта..."
ssh ${DEPLOY_USER}@${DEPLOY_HOST} << EOF
  cd ${DEPLOY_PATH}
  docker-compose down
EOF

echo "Проект остановлен."
