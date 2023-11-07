#!/bin/bash

# https://www.vivaolinux.com.br/dica/Matando-todos-os-processos-de-um-usuario
# https://www.vivaolinux.com.br/dica/Quem-se-logou-no-seu-sistema
# https://www.vivaolinux.com.br/dica/Procurando-links-quebrados

clear

echo "
Todos os `ps -fu $USER | wc -l` processos do usuário $USER:
"

# ps -ef > ~/geral.txt
#
# ps -fu $USER | awk '{ print $2 }' | grep -v PID
#
#
# matar todos os processos de um usuário com SIGTERM (sinal 15)
#
# $ sudo pkill -15 -u NOMEUSUARIO
#
# Se os processos se recusarem a teminar, pode usar o SIGKILL (sinal 9)


ps -fu $USER


