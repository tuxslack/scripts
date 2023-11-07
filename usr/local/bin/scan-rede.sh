#!/bin/bash

# https://imasters.com.br/desenvolvimento/bash-for-loop-primeiro-passo-na-automacao-no-linux
# https://www.cyberciti.biz/faq/bash-for-loop/

clear

# ----------------------------------------------------------------------------------------

log="/tmp/ips_fora.log"

rm -Rf "$log"

# ----------------------------------------------------------------------------------------

# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor

# ----------------------------------------------------------------------------------------

# Classes de IP:

# rede="10.0.0"

# rede="127.0.0"

# rede="192.168.0"
rede="192.168.1"

# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados

# which yad           2> /dev/null || { echo "Programa Yad não esta instalado."      ; exit ; }
which ping        2> /dev/null || { echo "Programa ping não esta instalado."   ; exit ; }


# ----------------------------------------------------------------------------------------


# {1..255}

echo " 
Para funcionar o ping tem que esta respondendo nas estações de trabalho.
"

for ip in $rede.{1..255} 127.0.0.1; do 


ping -c 1 $ip 1> /dev/null

if [ "$?" == 0 ];then

        echo -e "\n${GREEN}A estação de trabalho de IP $ip esta na rede. [OK] ${NC}\n"
        
        # echo "A estação de trabalho de IP $ip esta na rede." >> "$log"
        
else
        echo -e "${RED}A estação de trabalho de IP $ip esta fora da rede. ${NC}"
        
        # echo "A estação de trabalho de IP $ip esta fora da rede." >> "$log"
        
fi



done


exit 0

