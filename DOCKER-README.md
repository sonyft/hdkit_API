# HDKit Docker Setup

Този docker-compose файл стартира и двата проекта - HDKit API и Rails Frontend.

## 🚀 Бърз старт

```bash
# Стартиране на всички услуги
./start-docker.sh

# Или ръчно:
docker-compose up --build -d
```

## 📱 Access точки

- **HDKit API**: http://localhost:4567
- **Rails Frontend**: http://localhost:3001

## 🔧 Конфигурация

### Environment Variables

Създайте `.env` файл в основната директория:

```bash
# Google API Key за geocoding
GOOGLE_API_KEY=your_google_api_key_here

# Rails Master Key (генерирайте с: rails secret)
RAILS_MASTER_KEY=your_rails_master_key_here
```

### Генериране на Rails Master Key

```bash
cd bodygraph_frontend
rails secret
```

## 📊 Управление на услугите

```bash
# Преглед на логове
docker-compose logs -f

# Преглед на логове за конкретна услуга
docker-compose logs -f hdkit-api
docker-compose logs -f bodygraph-frontend

# Спиране на услугите
docker-compose down

# Спиране и изтриване на volumes
docker-compose down -v

# Преглед на статус
docker-compose ps
```

## 🛠️ Development

### Hot Reload

И двата проекта поддържат hot reload:
- API промените се зареждат автоматично
- Rails промените се зареждат автоматично

### Database

Rails frontend-ът автоматично създава и мигрира базата данни при стартиране.

### Debugging

```bash
# Влизане в контейнера на API-то
docker-compose exec hdkit-api bash

# Влизане в контейнера на Rails
docker-compose exec bodygraph-frontend bash
```

## 🏗️ Архитектура

```
┌─────────────────┐    ┌──────────────────┐
│   HDKit API     │    │  Rails Frontend  │
│   (Sinatra)     │◄───┤   (Port 3001)    │
│   (Port 4567)   │    │                  │
└─────────────────┘    └──────────────────┘
```

- **HDKit API**: Sinatra приложение на порт 4567
- **Rails Frontend**: Rails приложение на порт 3001
- **Network**: hdkit-network за комуникация между услугите

## 🐛 Troubleshooting

### Порт вече зает

```bash
# Проверете кои процеси използват портовете
lsof -i :4567
lsof -i :3001

# Спрете процесите или променете портовете в docker-compose.yml
```

### Database проблеми

```bash
# Ресет на базата данни
docker-compose exec bodygraph-frontend rails db:reset
```

### Build проблеми

```bash
# Пречистете Docker cache
docker-compose down
docker system prune -f
docker-compose up --build
```
