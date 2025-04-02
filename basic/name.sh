#!/bin/bash

# Цвета
TERRACOTTA='\033[38;5;208m'
NC='\033[0m'

# Функция для вывода терракотового текста
function show() {
    echo -e "${TERRACOTTA}$1${NC}"
}

# Вывод ASCII-арта
echo "----------------------------------------------------------------------"
show '██████╗ ██████╗  ██████╗ ███████╗██╗████████╗    ███╗   ██╗ ██████╗ ██████╗ ███████╗███████╗'
show '██╔══██╗██╔══██╗██╔═══██╗██╔════╝██║╚══██╔══╝    ████╗  ██║██╔═══██╗██╔══██╗██╔════╝██╔════╝'
show '██████╔╝██████╔╝██║   ██║█████╗  ██║   ██║       ██╔██╗ ██║██║   ██║██║  ██║█████╗  ███████╗'
show '██╔═══╝ ██╔══██╗██║   ██║██╔══╝  ██║   ██║       ██║╚██╗██║██║   ██║██║  ██║██╔══╝  ╚════██║'
show '██║     ██║  ██║╚██████╔╝██║     ██║   ██║       ██║ ╚████║╚██████╔╝██████╔╝███████╗███████║'
show '╚═╝     ╚═╝  ╚═╝ ╚═════╝ ╚═╝     ╚═╝   ╚═╝       ╚═╝  ╚═══╝ ╚═════╝ ╚═════╝ ╚══════╝╚══════╝'
echo "----------------------------------------------------------------------"

# Ожидание 3 секунды перед началом процесса
sleep 1

# Проверка, что скрипт запущен от root
if [ "$EUID" -ne 0 ]; then
    show "Пожалуйста, запустите скрипт от имени root (sudo)."
    exit 1
fi

# Установка зависимостей
show "Установка зависимостей..."
apt update
apt install -y curl docker.io docker-compose

# Запуск Docker
show "Запуск Docker..."
systemctl start docker
systemctl enable docker

# Создание директории для Profit Nodes
show "Создание директории для Profit Nodes..."
mkdir -p /root/profit-nodes
cd /root/profit-nodes

# Создание docker-compose.yml для Profit Nodes (пример)
show "Создание конфигурации для Profit Nodes..."
cat <<EOF > docker-compose.yml
version: '3.8'
services:
  profit-node:
    image: profitnodes/node:latest  # Замените на актуальный образ Profit Nodes
    restart: always
    ports:
      - "30304:30304"
    volumes:
      - ./data:/data
    environment:
      - NODE_KEY=your_private_key  # Укажите ваш ключ для ноды
EOF

# Запуск ноды
show "Запуск Profit Nodes..."
docker-compose up -d

show "Profit Nodes успешно запущена! Мониторьте логи с помощью: docker logs profit-nodes_profit-node_1"
