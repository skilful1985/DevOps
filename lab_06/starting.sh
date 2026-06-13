#!/bin/bash -x

echo -e "\n\e[33mОстанавливаем и удаляем данные старых контейнеров\e[0m\n"

echo -e "\n\e[33mКонтейнеры приложения\e[0m\n"
docker compose --project-directory ./app down
echo -e "\n\e[33mКонтейнеры мониторинга\e[0m\n"
docker compose --project-directory ./mon down

echo -e "\n\e[33mПроверяем состояние контейнеров\e[0m\n"
docker ps

echo -e "\n\e[33mСобираем и запускаем все контейнеры\e[0m\n"

echo -e "\n\e[33mКонтейнеры приложения\e[0m\n"
docker compose --project-directory ./app up -d --build
echo -e "\n\e[33mКонтейнеры мониторинга\e[0m\n"
docker compose --project-directory ./mon up -d --build

echo -e "\n\e[33mПроверяем состояние контейнеров\e[0m\n"
docker ps
