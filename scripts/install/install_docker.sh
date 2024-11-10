#!/bin/bash

# Установка Docker и Docker Compose
sudo apt update && sudo apt install -y docker.io docker-compose
sudo systemctl enable --now docker

echo "Docker и Docker Compose успешно установлены и активированы."
