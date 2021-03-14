#!/bin/bash
#
# dForm - Formatador de Dispositivos
# Versão: 1.1
# Publicado por Alexandre Guimarães (azk4n) (28/08/2012)
# Atualizado por: Fernando Souza            (última atualização em 13/03/2021 22:09:43)
#
# Homepage: https://glitch.com/@azk4n | https://www.vivaolinux.com.br/~azk | https://pastebin.com/u/ask4n
#
#
# https://www.vivaolinux.com.br/script/dForm-Formatador-de-Dispositivos
# https://www.vivaolinux.com.br/topico/vivaolinux/FORMATACAO-DE-PEN-DRIVE-DANDO-ERRO
# http://manual.aptosid.com/pt-br/part-cfdisk-pt-br.htm
# https://www.hardware.com.br/livros/entendendo-linux/particionando-com-cfdisk.html
# https://www.vivaolinux.com.br/script/Formatacao-de-pendrives


clear


which lsblk
which umount
which dd
which sudo
which wipefs
which cfdisk
which mkfs
# which exit
which clear


# parted -s $DISK mklabel msdos
# parted -a optimal -s $DISK mkpart primary $FSTYPE 0% 100%


# ---------------------------------------------------------------------------------------------------

# Verificar se é Root

if [ "$(id -u)" != "0" ]; then

   clear

   echo "
Loga como Root... 
# sudo "$0" "$@"
"

exit 1

fi

# ---------------------------------------------------------------------------------------------------

clear

echo "+========================================================================+"
echo "|dForm - Formatador de Dispositivos (Partições, PenDrives, SD Cards, etc)|"
echo "+========================================================================+"

# Listando os dispositivos

sleep 1
echo "-> Listando dispositivos..."
echo
sleep 1
# cat /proc/partitions

lsblk -l | awk '{print $1 "\t" $4}'




# echo "Digite o nome do dispositivo que deseja formatar (ex: sdc):"

echo "
-> Digite a unidade do dispositivo a ser formatado: Exemplo -> sda2, sdb1, sdc1, sdd1 ..."
read unid

sleep 1

# ---------------------------------------------------------------------------------------------------

# Escolhendo o sistema de arquivo do dispositivo

echo "Escolha o sistema de arquivo para formatação:

- bfs
- cramfs
- ext3
- ext4dev
- jfs
- msdos
- reiserfs
- xfs       
- btrfs
- ext2
- ext4
- fat
- minix
- ntfs
- vfat (FAT32)     
"


echo "-> Qual o formato desejado para o dispositivo?"
read form


# ---------------------------------------------------------------------------------------------------

clear

# Desmontando Unidade

echo "
OK, iniciando..."
sleep 1


# Verificar se a resposta está correta

CHECK=`lsblk | grep -cw "$unid"`

if [ $CHECK -eq 1 ]; then

    # Desmontar o dispositivo se estiver montado

    MOUNT=`df | grep -c /dev/$unid`

    if [ $MOUNT -eq 1 ]; then

        clear

        echo "
Desmontando a unidade  /dev/$unid ..."
sleep 2

       sudo umount /dev/$unid 2> /dev/null

    fi
else

    clear

    echo "Opção inválida!"

    sleep 1

    exit 2
fi


sleep 1

# ---------------------------------------------------------------------------------------------------

clear

# Iniciando formatação

echo "
Para zerar os primeiros 512 bytes da partição /dev/$unid ...
"
sudo dd count=1 bs=512 if=/dev/zero of=/dev/$unid && sync

sleep 1

# ---------------------------------------------------------------------------------------------------

# Apagando assinaturas de sistemas de arquivos em um dispositivo de armazenamento.

echo "
Limpando o dispositivo /dev/$unid com o wipefs ...
"
sudo wipefs -a /dev/$unid

sleep 1
 
# https://blog.myhro.info/2015/08/limpando-um-dispositivo-com-o-wipefs


# ---------------------------------------------------------------------------------------------------


# Particionando o disco rígido com o cfdisk (cria partição)

sudo cfdisk /dev/$unid

sleep 1
clear

echo "Qual o nome para o dispositivo /dev/$unid Ex: TI"
read nome

# ---------------------------------------------------------------------------------------------------

sleep 1
clear

echo "
Formatando /dev/$unid ...
"

sudo mkfs.$form -n "$nome" /dev/"$unid" > /dev/null

if [[ $? -ne 0 ]]
   then
       echo "
Problema na formatação!
"
   else 

       clear

       echo
       echo "+==============================================================+"
       echo "|Formatação Concluída Dispositivo: /dev/$unid - Formato: $form   |"
       echo "+==============================================================+"
       echo

       sudo fdisk -l /dev/$unid

       echo "
================================================================
"



        echo "
Desmontando a unidade  /dev/$unid ..."

umount /dev/$unid

eject /dev/$unid


fi

# ---------------------------------------------------------------------------------------------------


exit 0

