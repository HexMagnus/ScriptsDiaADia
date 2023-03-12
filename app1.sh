#!/bin/bash

while true; do
    clear
    echo "------------------------"
    echo "Selecione uma opção:"
    echo "1. Processos mais pesados"
    echo "2. Portas mais utilizadas"
    echo "3. Velocidade da internet"
    echo "4. Informações de IP"
    echo "5. Tráfego de rede em tempo real"
    echo "6. Contador de desligamento do computador"
    echo "0. Sair"
    echo "------------------------"
    read option

    case $option in
        1) ps -e --sort=-%mem --format="%mem %cpu %pid %comm" | head -n 6 ;;
        2) netstat -atn | awk '{print $4}' | cut -d':' -f2 | sort | uniq -c | sort -nr | head -n 5 ;;
        3) speedtest-cli --simple | grep -E "Ping|Download|Upload" ;;
        4) echo "Endereço IP da máquina: $(hostname -I)"; echo "Endereço IP do roteador: $(ip route | grep default | awk '{print $3}')" ;;
        5) sudo iftop ;;
        6) zenity --info --title="Contador de Desligamento" --text="O computador será desligado em 60 minutos. Salve seu trabalho agora!" --timeout=5; for ((i=3600;i>0;i--)); do echo "#$((100-(i*100/3600)))%"; echo $((100-(i*100/3600))) | zenity --progress --title="Contador de Desligamento" --text="O computador será desligado em $i segundos. Pressione Cancelar para interromper o processo." --percentage=$((100-(i*100/3600))) --auto-close --auto-kill --width=300 --height=100 || { zenity --info --title="Contador de Desligamento" --text="Desligamento interrompido pelo usuário."; exit 1; }; done; zenity --info --title="Contador de Desligamento" --text="Desligando o computador..."; sudo shutdown -h now ;;
        0) exit ;;
        *) echo "Opção inválida! Tente novamente." ;;
    esac
    read -p "Pressione Enter para continuar"
done
