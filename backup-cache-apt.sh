#!/bin/bash
# 
# 
# 
# 
# https://www.vivaolinux.com.br/dica/Comandos-de-compactacaodescompactacao
# https://unix.stackexchange.com/questions/608207/how-to-use-multi-threading-for-creating-and-extracting-tar-xz
# https://www.hardware.com.br/guias/ubuntu/cache-apt.html


clear


log="/tmp/apt-get.log"


which tar
which xz
which notify-send

cd ~

tar -cJvf backup-apt-get.tar.xz /var/cache/apt/archives /var/lib/apt/lists /etc/apt  2> "$log"


sleep 2
clear

echo "

Para descompactar para o sistema:

# tar Jxf backup-apt-get.tar.xz -C /

"

echo "
=========================================================================================================
"

echo "
Problemas com o backup:
"

cat "$log"

rm -Rf "$log"

echo "
=========================================================================================================
"

DATA=`date +%d/%m/%Y-%H:%M:%S`


notify-send \
-i "/usr/share/icons/hicolor/256x256/apps/gcr-gnupg.png"  \
-t "3000" \
"Backup do cache do apt-get" \
"Backup atualizado em $DATA salvo na pasta $HOME ..."


exit 0

