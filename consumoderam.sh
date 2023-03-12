#!/bin/bash

# Define a frequência de atualização da barra de informações (em segundos)
FREQUENCY=5

while true; do
    # Obtém o consumo atual de memória RAM
    MEMORY=$(free -m | awk 'NR==2{printf "%.2f%%", $3*100/$2 }')
    # Exibe a barra de informações com o consumo de memória RAM
    echo -ne "Memória RAM: [$MEMORY] $(seq -s "─" $(tput cols) | sed 's/[0-9]//g')\r"
    # Exibe os 5 processos em execução com maior consumo de memória RAM
    ps -eo pid,user,%mem,command --sort=-%mem | head -n 6
    # Aguarda a próxima atualização da barra de informações
    sleep $FREQUENCY
done
