#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     04/10/2023 as 04:41
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#

# https://askubuntu.com/questions/660207/autostart-script-to-notify-me-on-connection-issues
# https://askubuntu.com/questions/409611/desktop-notification-when-long-running-commands-complete



# if { nmcli dev status | grep "^"$dev".* connected" ;} &>/dev/null; then
#   while :; do
#     if ping -c 4 -i 0.5 www.google.com.br &>/dev/null; then
#         sleep 5
#     else
#         sleep 30
#         until ping -c 4 -i 0.5 www.google.com.br  &>/dev/null; do
#           
#           sleep 30
#         done
#         
#     fi
#   done
# fi

# alias alert='notify-send --urgency=low -i "$([ $? = 0 ] && echo terminal || echo error)" "$(history|tail -n1|sed -e '\''s/^\s*[0-9]\+\s*//;s/[;&|]\s*alert$//'\'')"'




# Certifique-se de que a variável de ambiente $DISPLAY está definida corretamente no seu script. Você pode fazer isso 
# adicionando a seguinte linha no início do seu script:

# export DISPLAY=:0.0

# Se usar esse script via CRON ativa essa opção acima.



clear


which notify-send     ||   exit 1
which ping            ||   exit 2



ping  -c 1 www.google.com.br 2>&1 >/dev/null


if [ $? = 0 ]; then


                     notify-send -t 100000 -i /usr/share/icons/hicolor/scalable/apps/nm-device-wired.svg  'Atenção!' "Você esta com acesso a internet..."
                     
                     exit 3

else


# Falso positivo
#
# Conexão de internet sobrecarregada
# Conexão com a internet muito lenta

                     notify-send --urgency=critical -t 100000 -i /usr/share/icons/hicolor/scalable/apps/nm-no-connection.svg 'Atenção!'  "Ocorreu um problema de rede, você está \nsem acesso a internet..."

                     exit 4
fi



exit 0

