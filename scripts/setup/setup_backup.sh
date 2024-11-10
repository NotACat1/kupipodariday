#!/bin/bash

# Создание директории для хранения бэкапов
BACKUP_DIR="/var/backups/postgresql"
mkdir -p "$BACKUP_DIR"

# Создание скрипта для выполнения бэкапа базы данных
echo '#!/bin/bash
source /path/to/.env.production
docker exec -t db pg_dumpall -c -U postgres > '"$BACKUP_DIR/db_backup_\$(date +\%Y-\%m-\%d_\%H-\%M-\%S).sql"'
find '"$BACKUP_DIR"' -type f -mtime +7 -name "*.sql" -exec rm -f {} \;' > /path/to/backup.sh

# Установка прав на выполнение скрипта бэкапа
chmod +x /path/to/backup.sh

# Добавление cron-задачи для ежедневного бэкапа базы данных
(crontab -l ; echo "0 0 * * * /bin/bash /path/to/backup.sh") | sudo crontab -

echo "Настройка автоматического бэкапа базы данных PostgreSQL завершена."
