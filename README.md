# FoodTracker Final DevOps Work

## Описание

FoodTracker — веб-приложение на Vue 3 + Vite для отслеживания калорий и БЖУ.

В рамках итоговой работы приложение было упаковано в Docker-контейнеры через Docker Compose.  
Также настроен сбор логов приложения в централизованное хранилище Loki и просмотр логов через Grafana.

## Стек

- Vue 3 + Vite
- Nginx
- Docker
- Docker Compose
- Loki
- Promtail
- Grafana

## Сервисы

- `foodtracker` — web-приложение, доступно на `http://localhost:8080`;
- `loki` — централизованное хранилище логов;
- `promtail` — агент сбора логов Docker-контейнеров;
- `grafana` — просмотр логов через UI, доступна на `http://localhost:3000`.

## Сборка

Сборка выполняется bash-скриптом:

```bash
./scripts/build.sh -t v1
```

## Запуск

Запуск выполняется bash-скриптом:

```bash
./scripts/deploy.sh -t v1
```

## Выполнение и результаты

Скриншоты запуска и результатов находятся в папке images