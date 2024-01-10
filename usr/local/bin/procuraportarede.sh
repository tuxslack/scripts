#!/bin/bash
#
# Dica: Daniel Donda
#
# Shell Script com NMAP (Scan de rede)
#
# https://www.youtube.com/watch?v=A4qtv0CRnpY


# Script para detectar portas abertas na rede.


# ----------------------------------------------------------------------------------------

# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor


clear

which nmap 1> /dev/null || { echo "Programa nmap não esta instalado."   ; exit ; }


# ----------------------------------------------------------------------------------------

# Verificar Root

if [ "$(id -u)" != "0" ]; then

        echo -e "${RED}\nVocê deve executar este script como Root! \n ${NC}"
        
        exit 

else

        echo -e "\n${GREEN}Verificação de Root [OK] ${NC}\n"

fi

# ----------------------------------------------------------------------------------------


clear

echo -n "Qual a rede deseja escanear (Ex: 192.168.0.0/24):"
read rede

echo -n "Qual a porta aberta que deseja descobrir (Ex: 80):"
read porta

clear

echo -e "\nProcurando hosts na rede $rede com a porta $porta...\n"

nmap -sS -vv -p "$porta" "$rede" | grep "Discovered open port" | awk '{print $6}'


exit 0

