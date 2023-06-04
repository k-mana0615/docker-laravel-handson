#!/bin/bash

chmod -R 777 storage bootstrap/cache
docker compose up -d
docker compose exec app composer install
docker compose exec app cp .env.example .env
docker compose exec app php artisan key:generate
docker compose exec app php artisan storage:link
