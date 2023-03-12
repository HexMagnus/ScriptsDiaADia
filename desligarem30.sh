#!/bin/bash

# Define o tempo de espera até o desligamento (em segundos)
TIME=1800

# Exibe uma janela de diálogo gráfica informando o desligamento do computador
zenity --info --title="Contador de Desligamento" --text="O computador será desligado em 30 minutos. Salve seu trabalho agora!" --timeout=5

# Inicia a contagem regressiva para o desligamento
for (( i=TIME; i>=1; i-- )); do
    # Calcula a porcentagem de conclusão da contagem regressiva
    PERCENTAGE=$((100-(i*100/TIME)))
    # Exibe a mensagem de atualização com a barra de progresso
    echo "#$PERCENTAGE%"
    echo $PERCENTAGE | zenity --progress --title="Contador de Desligamento" --text="O computador será desligado em $i segundos. Pressione Cancelar para interromper o processo." --percentage=$PERCENTAGE --auto-close --auto-kill --width=300 --height=100
    # Verifica se o usuário cancelou o processo
    if [ $? -eq 1 ]; then
        zenity --info --title="Contador de Desligamento" --text="Desligamento interrompido pelo usuário."
        exit 1
    fi
done

# Desliga o computador
zenity --info --title="Contador de Desligamento" --text="Desligando o computador..."
sudo shutdown -h now
