#!/bin/bash
set -e
source ../.env.deploy

echo "Подключаемся к серверу $SERVER_IP и генерируем SSH-ключ..."

ssh "$USER@$SERVER_IP" << EOF
  # Проверяем, существует ли уже ключ
  KEY_PATH=~/.ssh/$SSH_GITHUB
  if [ ! -f "\$KEY_PATH" ]; then
    echo "Генерация нового SSH-ключа на сервере (\$SSH_GITHUB)..."
    ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f "\$KEY_PATH" -q -N ""
    chmod 600 "\$KEY_PATH"
  else
    echo "SSH-ключ уже существует: \$KEY_PATH"
  fi
EOF

echo "Публичный ключ для добавления в GitHub:"
ssh "$USER@$SERVER_IP" "cat ~/.ssh/$SSH_GITHUB.pub"
