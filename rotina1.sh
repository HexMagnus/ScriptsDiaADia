#!/bin/bash

# Atualiza a lista de pacotes
sudo apt-get update

# Atualiza todos os pacotes instalados no sistema
sudo apt-get upgrade -y

# Atualiza todas as dependências
sudo apt-get dist-upgrade -y

# Remove pacotes antigos
sudo apt-get autoremove -y

# Remove pacotes antigos e seus arquivos de configuração
sudo apt-get autoclean -y

# Verifica se há atualizações de segurança e as instala automaticamente
sudo unattended-upgrade --dry-run -v

# Revisa as atualizações pendentes novamente
sudo unattended-upgrade -v

# Reinicia o sistema para aplicar todas as atualizações
sudo reboot
