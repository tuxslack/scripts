#!/bin/bash

# Essa dica é para quem gosta de ficar manipula os serviços com frequência.
#
# Outra forma:
#
# Pode criar um alias para esse comando no ".bashrc".
#
# alias services='ls -l /etc/rc.d'
#
#
# https://www.vivaolinux.com.br/dica/Listando-Servicos-e-Pacotes-mais-Facilmente-no-Slackware/
# https://askubuntu.com/questions/18716/how-to-load-a-zenity-list-dialog-with-space-embedded-data-from-ls
# https://cleuber.com.br/index.php/2016/08/08/como-desativar-aplicativos-de-sessao-e-servicos-no-ubuntu-para-melhorar-o-desempenho
# https://www.hostinger.com.br/tutoriais/listar-servicos-linux


clear

which zenity                || dialog --msgbox         "Não foi localizado zenity."                        10 60      2> /dev/null    ||  exit 1
which xterm                 || zenity --warning --text="Não foi localizado xterm."                       --width=300  2> /dev/null    ||  exit 2


# Listando serviços no Slackware

# ls --color /etc/rc.d 


xterm -geometry 230x50 -bg lightyellow -fg darkblue -T "Listando serviços no Slack" -e "echo -e 'Pasta: /etc/rc.d \n\n' && echo 'Os arquivos na cor verde na pasta /etc/rc.d/ são serviços ativos no sistema (Slackware).

Para desativar podemos usar:

# chmod -x /etc/rc.d/rc.servico

' && ls --color /etc/rc.d && read pause"


# > /tmp/serviços.log

# cat /tmp/serviços.log

# zenity --info --text="$(cat /tmp/serviços.log)" --width=600 --height=450 2> /dev/null
#
# cat /tmp/serviços.log | zenity --list --title='Listando serviços no Slackware' --column='' --width=600 --height=450 2> /dev/null

# rm /tmp/serviços.log

exit 0

