#!/bin/bash

# Define a frequência de atualização da velocidade e das informações de IP (em segundos)
FREQUENCY=5

while true; do
    # Obtém a velocidade de download e upload
    SPEED=$(speedtest-cli --simple | awk '/^Download:|^Upload:/ {print $2 " " $3}')
    # Obtém o endereço IP da máquina
    IP=$(hostname -I | awk '{print $1}')
    # Obtém o endereço IP do roteador padrão
    ROUTER_IP=$(ip route show | grep default | awk '{print $3}')
    # Exibe as informações de velocidade e IP
    echo -ne "Velocidade: $SPEED | IP da Máquina: $IP | IP do Roteador: $ROUTER_IP $(seq -s "─" $(tput cols) | sed 's/[0-9]//g')\r"
    # Aguarda a próxima atualização da velocidade e das informações de IP
    sleep $FREQUENCY
done
