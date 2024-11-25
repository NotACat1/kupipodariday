#!/bin/bash
set -e
source ../.env.deploy

# Путь для хранения SSH-ключа на локальной машине
LOCAL_KEY_PATH=~/.ssh/$SSH_SERVER

# Генерация SSH-ключа на локальной машине
if [ ! -f "$LOCAL_KEY_PATH" ]; then
  echo "Генерация нового SSH-ключа ($SSH_SERVER) на локальной машине..."
  ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f "$LOCAL_KEY_PATH" -N ""
else
  echo "SSH-ключ уже существует: $LOCAL_KEY_PATH"
fi

# Передача публичного ключа на сервер
echo "Передача публичного ключа на сервер $SERVER_IP..."
ssh-copy-id -i "$LOCAL_KEY_PATH.pub" "$USER@$SERVER_IP"

echo "Настройка SSH-доступа без пароля завершена!"
