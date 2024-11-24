#!/bin/bash

source ../.env.deploy

echo "Генерация SSH ключей..."
ssh-keygen -t rsa -b 4096 -f ${KEY_NAME} -N ""

echo "Передача публичного ключа на сервер..."
ssh-copy-id -i ${KEY_NAME}.pub ${DEPLOY_USER}@${DEPLOY_HOST}

echo "Ключи сгенерированы и переданы."
