#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     17/03/2024 as 03:44
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
# Versão:   20240317
# Script:   criaiso.sh
# Objetivo: Gera iso de cd ou dvd.
#

# https://terminalroot.com.br/2017/10/como-criar-uma-imagem-iso-pelo-terminal.html
# https://gnulinuxbr.wordpress.com/2009/11/25/comando-mkisofs-criando-uma-imagem-iso/

clear

which dd      1> /dev/null  || exit
which blkid   1> /dev/null  || exit
which mkisofs 1> /dev/null  || exit


# xbps-query -Rs coreutils
# [*] coreutils-9.4_1 GNU core utilities


# xbps-query -Rf coreutils


# Como criar uma imagem iso pelo Terminal

blkid | grep sr

echo "
Qual a sua unidade de CD/DVD? Ex: /dev/sr1"
read dvd

echo "
Qual o nome do arquivo ISO que será criado? Ex: Windows_10_Pro_64-bit"
read nome_da_ISO

sleep 1
clear

umount "$dvd"

dd if="$dvd" of=$HOME/"$nome_da_ISO".iso bs=2048 status=progress

# O comando dd não gera iso da midia só chega em 35 MB em qualquer midia.



# No dia anterior funcionou o comando dd:

# dd if=/dev/sr1 of=~/teste.iso bs=2048 status=progress
# 3266168832 bytes (3,3 GB, 3,0 GiB) copied, 454 s, 7,2 MB/s 
# 1596800+0 records in
# 1596800+0 records out
# 3270246400 bytes (3,3 GB, 3,0 GiB) copied, 454,636 s, 7,2 MB/s


sha256sum "$dvd" > $HOME/"$nome_da_ISO".iso-sha256sum.txt
# 73df2b435a40ff6d823d653a6f6d154839129bb9bd116056a401b3dfb17cecf8  /dev/sr1

echo "
" >> $HOME/"$nome_da_ISO".iso-sha256sum.txt

sha256sum $HOME/"$nome_da_ISO".iso >> $HOME/"$nome_da_ISO".iso-sha256sum.txt
# 73df2b435a40ff6d823d653a6f6d154839129bb9bd116056a401b3dfb17cecf8  /home/fernando/teste.iso




# mkisofs -r -J -o $HOME/"$nome_da_ISO".iso "$dvd"


echo "

Se o comando dd tiver problema usa o k3b ou xfburn para gera a imagem da midia.
"

exit 0

