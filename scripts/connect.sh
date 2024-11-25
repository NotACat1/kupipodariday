#!/bin/bash
set -e
source ../.env.deploy

echo "Подключение к серверу $SERVER_IP как $USER..."
ssh "$USER@$SERVER_IP"
