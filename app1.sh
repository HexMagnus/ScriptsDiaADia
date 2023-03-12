#!/bin/bash
#!/bin/bash

opcoes=("5 minutos" "10 minutos" "15 minutos" "30 minutos" "1 hora" "2 horas" "3 horas")
tempos=(300 600 900 1800 3600 7200 10800)

echo "Escolha uma opção de tempo para o desligamento:"
select opcao in "${opcoes[@]}"
do
    if [[ " ${opcoes[@]} " =~ " ${opcao} " ]]; then
        index=$((${!opcoes[@]}+1))
        tempo_em_segundos=${tempos[$index-1]}
        echo "O sistema será desligado em ${opcao}."
        break
    else
        echo "Opção inválida. Escolha um número entre 1 e ${#opcoes[@]}."
    fi
done

shutdown -s -t $tempo_em_segundos
