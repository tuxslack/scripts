#!/bin/bash

# https://www.vivaolinux.com.br/dica/Comandos-de-compactacaodescompactacao
# https://unix.stackexchange.com/questions/608207/how-to-use-multi-threading-for-creating-and-extracting-tar-xz

clear

which tar
which xz

tar -cJvf backup-apt-get.tar.xz /var/cache/apt/archives /var/lib/apt/lists /etc/apt

exit 0
