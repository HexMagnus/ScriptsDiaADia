#!/bin/bash

# URLs a serem abertas
URLS=("https://www.google.com/" "https://www.youtube.com/" "https://www.facebook.com/")

# Abre o Google Chrome com as URLs indicadas e exibe as informações de data, hora e velocidade de acesso
for url in "${URLS[@]}"; do
    # Obtém a data e hora atual
    DATE=$(date +"%Y-%m-%d %H:%M:%S")
    # Obtém a velocidade de acesso à URL
    SPEED=$(curl -o /dev/null -s -w '%{speed_download}\n' "$url")
    # Exibe a data, hora, URL e velocidade de acesso
    echo "$DATE | URL: $url | Velocidade: $SPEED"
    # Abre a URL no Google Chrome
    google-chrome-stable "$url"
done
