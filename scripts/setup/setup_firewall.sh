#!/bin/bash

# Настройка firewall для открытия портов HTTP, HTTPS и SSH
sudo ufw allow OpenSSH
sudo ufw allow 80,443/tcp
sudo ufw enable

echo "Firewall настроен для защиты сети с доступом к портам 80, 443 и SSH."
