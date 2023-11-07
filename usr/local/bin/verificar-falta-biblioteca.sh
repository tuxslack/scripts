#!/bin/bash


# Enviado em 03/02/2021 - 00:39h
#
# Como sabe qual o programa pertence a uma determinada biblioteca - library


# Ex: libavcodec.so quero descobri, qual o programa que eu instalo para ter essa biblioteca no sistema.
# Esse é um exemplo que pode ocorre para uma biblioteca faltante na sua distro.


# Como verificar se o pacote é dependência de outro no Slackware para remove de forma segura?

# Ex:

# O anjuta REQUIRES="autogen gdl gtksourceview3 libgda vte3"


# não existe essa informação no gerenciador de pacotes do Slackware. Ou seja, a única 
# forma de saber que um pacote depende de outro é desinstalando o pacote e ver o erro na 
# hora de rodar o programa...

# Outra alternativa é visualizar pelo binário através do comando ldd:

# No SlackBuilds é possível visualizar essa informação pelo requires, mas somente dependências que são encontradas no SlackBuilds.


# grep perl-Module-Build /var/lib/sbopkg/SBo-git/*/*/*.info 

# grep jdk /var/lib/sbopkg/SBo/14.2/*/*/*.info 


which ldd || exit 1


clear

echo "
Qual o nome do programa? Ex: gmplayer ou ffmpeg"
read programa

ldd $(which "$programa") | grep -i "not found"

 

exit 0

