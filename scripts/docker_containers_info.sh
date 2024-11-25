#!/bin/bash
set -e
source ../.env.deploy

echo "Получение информации о Docker-контейнерах на сервере $SERVER_IP..."

# Выполняем команды на сервере
ssh "$USER@$SERVER_IP" << EOF
  echo "Контейнеры (запущенные):"
  docker ps --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"

  echo ""
  echo "Контейнеры (все, включая остановленные):"
  docker ps -a --format "table {{.ID}}\t{{.Names}}\t{{.Image}}\t{{.Status}}\t{{.Ports}}"

  echo ""
  echo "Дополнительная информация о ресурсах (использование CPU и памяти):"
  docker stats --no-stream --format "table {{.Name}}\t{{.CPUPerc}}\t{{.MemUsage}}"
EOF

echo "Готово!"
