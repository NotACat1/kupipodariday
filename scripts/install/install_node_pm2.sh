#!/bin/bash

# Установка Node.js и npm
curl -sL https://deb.nodesource.com/setup_14.x | sudo -E bash -
sudo apt install -y nodejs

# Установка pm2 для управления процессами
sudo npm install -g pm2

echo "Node.js и pm2 успешно установлены."
