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

Сборка выполняется bash-скриптом с параметром `-t`:

```bash
./scripts/build.sh -t v1
```