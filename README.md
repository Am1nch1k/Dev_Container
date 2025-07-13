# Dev_Container
1. docker build -t spring-dev . // сборка образа

2. Упрощенный интерфейс (для удобства) //скрипт для горячего перезапуска
Создайте файл start.sh в корне проекта:
#!/bin/bash
docker run -it --rm \
  -p 8080:8080 \
  -v "$(pwd)":/workspace \
  -v "$HOME/.m2":/root/.m2 \
  spring-dev
Теперь просто запускайте проект одной командой:
./start.sh
