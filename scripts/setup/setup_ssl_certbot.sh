#!/bin/bash

# Установка Certbot и его модулей
sudo apt install -y certbot python3-certbot-docker

# Получение SSL-сертификата для домена
sudo certbot certonly --standalone -d yourdomain.com  # Замените на ваш домен

# Добавление cron-задачи для автоматического обновления сертификатов
(crontab -l ; echo "0 0 * * 1 certbot renew --quiet") | sudo crontab -

echo "SSL-сертификат успешно установлен и настроен для автоматического обновления."