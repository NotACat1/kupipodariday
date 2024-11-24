#!/bin/bash

source ../.env.deploy

echo "Обновление HTTPS сертификатов..."
docker run --rm \
  -v /etc/letsencrypt:/etc/letsencrypt \
  -v /var/lib/letsencrypt:/var/lib/letsencrypt \
  certbot/certbot renew --non-interactive --quiet --agree-tos --email ${CERTBOT_EMAIL}

echo "Перезапуск NGINX для применения сертификатов..."
docker exec nginx nginx -s reload

echo "Сертификаты обновлены."
