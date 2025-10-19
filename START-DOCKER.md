# 🐳 Docker Setup за HDKit

## Бърз старт

```bash
# 1. Отидете в директорията
cd /Users/sonyft/projects/hdkit/hdkit_API

# 2. Стартирайте всички услуги
./start-docker.sh
```

## Или ръчно:

```bash
# 1. Създайте .env файл
cp env.docker .env

# 2. Генерирайте Rails Master Key
cd bodygraph_frontend
rails secret
# Копирайте ключа в .env файла

# 3. Стартирайте услугите
docker-compose up --build -d
```

## 📱 Access

- **API**: http://localhost:4567
- **Frontend**: http://localhost:3001

## 🛑 Спиране

```bash
docker-compose down
```

## 📊 Логове

```bash
docker-compose logs -f
```
