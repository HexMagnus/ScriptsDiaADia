#!/bin/bash

# Define a frequência de atualização das informações (em segundos)
FREQUENCY=5

while true; do
    # Obtém as 5 portas mais utilizadas
    PORTS=$(netstat -npt | awk 'NR>2 {print $4}' | sed 's/.*://' | sort | uniq -c | sort -rn | head -n 5)
    # Obtém as informações de tráfego de rede
    TRAFFIC=$(ifstat | awk '/^en/ {print $1 ": R:" $6 " | T:" $8}')
    # Exibe as informações de portas e tráfego de rede
    echo -ne "Portas Mais Utilizadas: $PORTS | Tráfego de Rede: $TRAFFIC $(seq -s "─" $(tput cols) | sed 's/[0-9]//g')\r"
    # Aguarda a próxima atualização das informações
    sleep $FREQUENCY
done
