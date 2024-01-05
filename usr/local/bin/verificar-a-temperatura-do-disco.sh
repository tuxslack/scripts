#!/bin/bash

# Temperatura do HD

# Script de monitoramento para verificar regularmente a temperatura do disco rígido.

# https://pt.linux-console.net/?p=10187
# https://elias.praciano.com/2014/03/monitore-a-temperatura-do-seu-hd-com-hddtemp/

clear


HD="sda"
usuario="fernando"

# HD="$1"

# ----------------------------------------------------------------------------------------

# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor

# ----------------------------------------------------------------------------------------

if [ "$(id -u)" != "0" ]; then

        echo -e "${RED}\nVocê deve executar este script como Root! \n ${NC}"
        
exit 

else

        echo -e "\n${GREEN}Verificação de Root [OK] ${NC}\n"

fi

# ----------------------------------------------------------------------------------------


# which inxi             || exit
which hddtemp          || exit
# which yad              || exit
which cut              || exit
which sed              || exit
which notify-send      || exit


temperature=$(hddtemp /dev/$HD | cut -d : -f3 | sed 's/[^0-9]*//g')

# REPORT when hard drive's temperature is above 40 °C

if [ "$temperature" -ge "40" ]; then

	# echo "ALERT: hard drive's temperature is above: $temperature"
	
	echo "ALERTA: A temperatura do disco rígido está acima de: $temperature °C."

sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/hicolor/48x48/status/uninterruptible-power-supply.png  'ALERTA' '\n\nA temperatura do disco rígido está acima de: '$temperature' °C\n\n'

fi

# ----------------------------------------------------------------------------------------

exit 0


