#!/bin/bash
#
# ============================================================================|
#
# Autor:           Fernando Souza <https://www.youtube.com/@fernandosuporte>
# Data:            17/03/2024
# Atualização em:  https://github.com/tuxslack/scripts
# Script:          void-xbps-src-configurar.sh
# Versão:          0.1
#
# Descrição: 
#
# Configura o "xbps-src" no Void Linux para instalar programas (Google Chrome, Anydesk, etc...).
# 
# Uma vez configurado o "xbps-src" pode se usado para atualizar o repositório local e 
# verificar se os programas (Google Chrome, Anydesk, etc...) estão atualizados.
#
# 
#
# ============================================================================|


# O Void Linux possui uma ferramenta para criação de pacotes a partir de binários de 
# terceiros, e também a partir de códigos-fonte, chamada xbps-src, que se assemelha aos 
# Slackbuilds do Slackware, PKGBUILD do Archlinux e EBUILD do Gentoo.


# https://www.youtube.com/watch?v=454ce2I5oEk
# https://www.youtube.com/watch?v=pk-HaPbw4vU
# https://www.youtube.com/watch?v=98rtE1YE8Gc
# https://medium.com/@leandroembu/usando-o-xbps-src-no-void-linux-29550897f66
# https://www.youtube.com/watch?v=pk-HaPbw4vU
# https://www.hostinger.com.br/tutoriais/comando-tee-linux
# https://www.vivaolinux.com.br/dica/Google-Chrome-no-Void-Linux


clear

# ----------------------------------------------------------------------------------------

# Verificar se esta usando o Void Linux


which xbps-install 1> /dev/null 2> /dev/null || exit


which tee 1> /dev/null 2> /dev/null || exit


sleep 2

# ----------------------------------------------------------------------------------------


clear

echo "
Requisitos

Precisamos instalar algumas dependências antes de usarmos o xbps-src...

"


which git || su -c 'xbps-install -Suvy git'

xbps-query -l | grep base-devel || su -c 'xbps-install -Suvy base-devel'

# xbps-query -l | grep xtools || su -c 'xbps-install -Suvy xtools'


sleep 2

# ----------------------------------------------------------------------------------------

clear

cd ~/


# rm -Rf void-packages


# Verifica se a pasta void-packages existe

if [ -d void-packages ]; then

# Ação se a pasta existir


# E como que faço para atualizar o pacote do google-chrome quando o mesmo tiver mudado a versão?

cd void-packages

echo "
Atualizando o repositório local...
"

git pull origin master


# xbps-query -l | grep google-chrome
# xbps-query -l | grep anydesk

echo "
Verificando se os programas estão desatualizado:
"

./xbps-src update-check google-chrome

./xbps-src update-check anydesk
  
  
echo "
Para atualizar:


cd ~/void-packages


./xbps-src pkg google-chrome

su -c 'xbps-install --repository=hostdir/binpkgs/nonfree  google-chrome'


./xbps-src pkg anydesk

"  

  
else



# ----------------------------------------------------------------------------------------

clear

# Cloning into 'void-packages'...
# error: 2734 bytes of body are still expected
# fetch-pack: unexpected disconnect while reading sideband packet
# fatal: early EOF
# fatal: fetch-pack: invalid index-pack output

# ---------------------------------------------------------------


# git config --global http.postBuffer 157286400
# git config --global http.version HTTP/1.1

cat ~/.gitconfig

# https://medium.com/@syatriarifqi/rpc-failed-curl-92-http-2-stream-0-was-not-closed-cleanly-cancel-7dccce293490
# https://stackoverflow.com/questions/66366582/github-unexpected-disconnect-while-reading-sideband-packet

sleep 2

echo "
Clone do repositório void-packages...
"

# git clone https://github.com/void-linux/void-packages.git | tee -a /tmp/void-packages.txt

# git clone https://github.com/void-linux/void-packages.git 2> /tmp/void-packages.txt

git clone --depth 1 https://github.com/void-linux/void-packages.git 2> /tmp/void-packages.txt


# $ cat /tmp/void-packages.txt
# Cloning into 'void-packages'...
# Updating files: 100% (21906/21906), done.


if [ $? = 0 ]
then

# ----------------------------------------------------------------------------------------

echo "
Instalação do bynary-bootstrap

Para trabalhar com os templates do xbps-src (pode conferí-los na pasta 

~/void-packages/srcpkgs/nomeDoPacote/template)

"

cd void-packages

./xbps-src binary-bootstrap

# ----------------------------------------------------------------------------------------

echo "
Permitir pacotes restritos
"

echo "XBPS_ALLOW_RESTRICTED=yes" >> etc/conf


# ----------------------------------------------------------------------------------------

echo "

Pronto! Podemos usar o xbps-src agora.


cd ~/void-packages

Construindo o pacote .xbps

./xbps-src pkg google-chrome

Instalando o pacote

su -c 'xbps-install --repository=hostdir/binpkgs/nonfree google-chrome'


"

# ----------------------------------------------------------------------------------------


else

clear

echo "Ocorreu um problema ao clonar o repositório: 

https://github.com/void-linux/void-packages.git


`cat /tmp/void-packages.txt`


"

rm -Rf /tmp/void-packages.txt


exit 


fi



# Fim da ação se a pasta não existir.
 

fi


exit 0

