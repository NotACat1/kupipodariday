#!/bin/bash
set -e
source ../.env.deploy

echo "Обновление SSL-сертификата для домена $DOMAIN..."
ssh "$USER@$SERVER_IP" << EOF
  sudo certbot certonly --standalone -d $DOMAIN --non-interactive --agree-tos -m $EMAIL
EOF

echo "SSL-сертификат успешно обновлен!"
