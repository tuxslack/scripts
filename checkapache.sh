#!/bin/bash

# Visualizar arquivos .log [Apache Web Server]

# https://pt.stackoverflow.com/questions/190534/logs-do-apache-verificando-um-ataque-slowloris


# Arquivo de log

log="/tmp/apache.log"


clear


which tail 
# /usr/bin/tail

which zenity
# /usr/bin/zenity

which xterm
# /usr/bin/xterm


sleep 2


zenity \
--title="Verificar log do Apache" \
--info \
--text="
/var/log/httpd/error_log

/var/log/httpd/access_log

" \
--width=400 --height=120 2> /dev/null



# Verificar se arquivo existe

if [ -e /var/log/httpd/error_log ]; then

echo "O arquivo /var/log/httpd/error_log existe"

sleep 2
clear

# Arquivo de log do Apache 

# Todos os erros que possam ter ocorrido no serviço.

xterm -geometry 150x50 -bg lightyellow -fg darkblue -T "Verificar log de error do Apache" -e "tailf -10 /var/log/httpd/error_log" & 


# zenity --error --text="Progresso cancelado." 2> /dev/null


else


clear

echo "O arquivo /var/log/httpd/error_log não existe" >> $log


# Arquivo de log do Apache 

# tail -f /var/log/apache2/error.log

# exit 1

fi



# Logs do apache: verificando um ataque slowloris

# logs dos acessos (horas, ip de origem, metodo HTTP, url a que acedeu, User-Agent).

xterm -geometry 150x50 -bg lightyellow -fg darkblue -T "Verificar log de acesso do Apache" -e "tailf -10 /var/log/httpd/access_log" & 


# https://pt.stackoverflow.com/questions/190534/logs-do-apache-verificando-um-ataque-slowloris



# tailf: follow (seguir) ultimo conteudo do ficheiro
# -10: ultimas 10 linhas


exit 0

