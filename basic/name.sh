#!/bin/bash

# Цвета
PURPLE='\033[38;5;93m'  # Фиолетовый цвет
NC='\033[0m'

# Функция для вывода фиолетового текста
function show() {
    echo -e "${PURPLE}$1${NC}"
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
