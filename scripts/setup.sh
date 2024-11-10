#!/bin/bash

chmod +x ./install/install_docker.sh
chmod +x ./install/install_node_pm2.sh
chmod +x ./install/install_security_tools.sh

chmod +x ./setup/setup_backup.sh
chmod +x ./setup/setup_firewall.sh
chmod +x ./setup/setup_ssl_certbot.sh

./install/install_docker.sh
./install/install_node_pm2.sh
./install/setup_ssl_certbot.sh
./setup/setup_backup.sh
./setup/setup_firewall.sh
./install/install_security_tools.sh