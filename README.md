# Kupipodariday

Проект для управления подарками, включающий фронтенд, бэкенд, базу данных и мониторинг.  
Этот проект использует **Docker Compose** для управления контейнерами, включая поддержку HTTPS, мониторинга и автоматического бэкапа данных.

## 🚀 Развернутый проект

Вы можете посмотреть работающий сервер по следующему адресу:  
🔗 [https://example.com](https://example.com)

## 📋 Содержание

- [Технологии](#технологии)
- [Установка](#установка)
- [Настройка](#настройка)
- [Команды](#команды)
- [Мониторинг](#мониторинг)
- [Дополнительные функции](#дополнительные-функции)

## 🛠️ Технологии

Проект использует следующие технологии:

- **Frontend:** Vue.js, TailwindCSS, NGINX
- **Backend:** Node.js, TypeScript, Express
- **Database:** PostgreSQL
- **Monitoring:** Prometheus, Grafana
- **Docker:** Docker Compose
- **Certbot:** Автоматическое обновление HTTPS-сертификатов

## 📦 Установка

1. **Склонируйте репозиторий:**

   ```bash
   git clone https://github.com/your-username/kupipodariday.git
   cd kupipodariday
   ```

2. **Создайте файл `.env.deploy`**  
   Настройте файл `.env.deploy` в соответствии с примером в разделе [Пример .env.deploy](#пример-envdeploy).

3. **Соберите и запустите контейнеры:**

   ```bash
   docker-compose up -d
   ```

4. **Проверьте статус контейнеров:**
   ```bash
   docker-compose ps
   ```

## ⚙️ Настройка

1. Убедитесь, что все переменные окружения корректно настроены в файле `.env.deploy`.
2. Настройте файлы конфигурации для NGINX и Prometheus.

### Пример `.env.deploy`

См. файл [Пример .env.deploy](#пример-envdeploy).

### Пример `.env`

См. файл [Пример .env.deploy](#пример-envdeploy).

## 📜 Команды

### Запуск проекта

```bash
docker-compose up -d
```

### Остановка проекта

```bash
docker-compose down
```

### Перезапуск с обновлением образа

```bash
docker-compose pull && docker-compose up -d
```

### Обновление сертификатов (автоматическое с помощью cron)

```bash
/path/to/certbot_renew.sh
```

### Ручное выполнение бэкапа базы данных

```bash
docker exec db pg_dump -U $POSTGRES_USER $POSTGRES_DB > backup.sql
```

## 📊 Мониторинг

- **Prometheus:** доступен по адресу `http://example.com:9090`
- **Grafana:** доступен по адресу `http://example.com:3001`

## ✨ Дополнительные функции

1. **Автоматическое обновление HTTPS-сертификатов:**  
   Настраивается через cron:

   ```cron
   0 3 * * 7 /path/to/certbot_renew.sh
   ```

2. **Автоматические бэкапы базы данных:**  
   Настраивается через cron:

   ```cron
   0 2 * * * /path/to/backup_db.sh
   ```

3. **SSH-доступ для деплоя:**  
   Для деплоя через SSH используйте ключ, указанный в `.env.deploy`.

---

## 📞 Контакты

Для вопросов или предложений:  
✉️ Email: [admin@example.com](mailto:admin@example.com)  
GitHub: [your-username](https://github.com/your-username)
