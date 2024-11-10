#!/bin/bash

# Установка Fail2ban для защиты от брутфорс-атак
sudo apt install -y fail2ban
sudo systemctl enable --now fail2ban

# Настройка автоматического обновления пакетов
sudo apt install -y unattended-upgrades
sudo dpkg-reconfigure --priority=low unattended-upgrades

echo "Fail2ban установлен и активирован. Настроено автоматическое обновление пакетов."
