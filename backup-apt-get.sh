#!/bin/bash

# https://br.ccm.net/faq/2269-como-ler-um-arquivo-linha-por-linha
# https://askubuntu.com/questions/9135/how-to-backup-settings-and-list-of-installed-packages
# https://www.clubedohardware.com.br/forums/topic/188398-backup-no-apt-get/


# APTonCD
#
# Gostaria de replicar os mesmos pacotes em outra maquina.
#
# Faça BKP da pasta /var/cache/apt/archives que é onde os pacotes são salvos e depois copie-os para a outra máquina nessa mesma pasta.


clear

cd /tmp/



# Verificar se o diretório /var/cache/apt/archives/ existe
#
# -d nos ajuda a saber se o diretório existe, se mudarmos -d para -f é para verificar a existência de arquivos.

if [ -d /var/cache/apt/archives/ ];
then

echo "
Diretório /var/cache/apt/archives/ existe...
"




find /etc/apt/ -iname "*.list" -exec ls {} \; > /tmp/repo.txt

sudo dpkg --get-selections > /tmp/pacotes_instalados.log

sudo apt-key exportall > /tmp/repositorio.keys



# while read repo; do

# cp "$repo" /tmp

# done < /tmp/repo.txt



# Removendo backup caso ele existe

rm -Rf /home/backup/APTonCD.tgz


# Criando a pasta backup e alterando suas permissões

mkdir -p /home/backup/ && chmod 777 /home/backup/

echo "
Compactando...
"

tar -zcvf /home/backup/APTonCD.tgz \
/var/cache/apt/archives/*.deb \
/var/lib/apt/lists/ \
$(cat /tmp/repo.txt) \
/tmp/pacotes_instalados.log \
/tmp/repositorio.keys




echo "
Backup do apt finalizado em `date +%d/%m/%Y-%H:%M:%S` salvo na pasta /home/backup/


Para limpar os pacotes .deb da pasta /var/cache/apt/archives/

sudo apt clean ; sudo apt autoclean



Restaurando seu backup
=======================


# Descompactando o arquivo APTonCD.tgz na raiz do sistema

tar -zxvf /home/backup/APTonCD.tgz  -C /


# sudo apt-key add /tmp/repositorio.keys


# sudo apt update

# sudo dpkg --set-selections < /tmp/pacotes_instalados.log

"




else


echo "
Diretório /var/cache/apt/archives/ não existe...


Esse Shell Script é para o Debian e seus derivados para replicar os pacotes .deb em outra maquina.

"

exit 1


fi





exit 0

