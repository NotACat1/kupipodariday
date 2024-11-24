#!/bin/bash
set -e
source ../.env.deploy

KEY_PATH=~/.ssh/$SSH_KEY_NAME

if [ ! -f "$KEY_PATH" ]; then
  echo "Генерация нового SSH-ключа ($SSH_KEY_NAME)..."
  ssh-keygen -t rsa -b 4096 -C "$EMAIL" -f "$KEY_PATH" -N ""
fi

echo "Добавляем ключ на сервер $SERVER_IP..."
ssh-copy-id -i "$KEY_PATH.pub" "$USER@$SERVER_IP"

echo "Добавляем ключ в GitHub..."
echo "Скопируйте содержимое публичного ключа:"
cat "$KEY_PATH.pub"
