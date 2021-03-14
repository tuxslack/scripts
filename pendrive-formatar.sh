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
# IMPORTANTE: Sempre tenha backup dos seus dados antes de usar qualquer programa de edição de partições!
#
#
# https://www.vivaolinux.com.br/script/dForm-Formatador-de-Dispositivos
# https://www.vivaolinux.com.br/topico/vivaolinux/FORMATACAO-DE-PEN-DRIVE-DANDO-ERRO
# http://manual.aptosid.com/pt-br/part-cfdisk-pt-br.htm
# https://www.hardware.com.br/livros/entendendo-linux/particionando-com-cfdisk.html
# https://www.vivaolinux.com.br/script/Formatacao-de-pendrives
# http://web.mit.edu/rhel-doc/3/rhel-sag-pt_br-3/s1-parted-create-part.html


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
which parted



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




# Apagar dados definitivamente de um disco rígido
#
# Você pode precisar limpar o disco rígido para eliminar erros de partição, instalações mal sucedidas ou por privacidade. Existem duas opções possíveis com o comando dd.
#
# Primeira, preencher os setores do disco com valores zeros (pode demorar um pouco, já que é feito byte a byte de valor 0):
#
#
# dd if=/dev/zero of=/dev/$unid bs=1M 


# Ou, para garantir que nenhum dado poderá ser recuperado, você deve preencher os setores do disco com dados aleatórios ao invés de zeros 
# (isso vai levar ainda mais do que o primeiro exemplo):
#
#
# dd if=/dev/urandom of=/dev/$unid bs=1M 




# Retira o numeral da variavel


sleep 1
 
# https://blog.myhro.info/2015/08/limpando-um-dispositivo-com-o-wipefs
# https://www.linuxdescomplicado.com.br/2016/11/alguns-exemplos-de-que-o-comando-dd-pode-ser-considerado-umas-das-ferramentas-mais-versateis-do-linux.html


# ---------------------------------------------------------------------------------------------------


# Particionando o disco rígido com o cfdisk (cria partição)

# sudo cfdisk /dev/$unid



# mklabel TIPO-LABEL Cria uma nova tabela de partição do tipo TIPO-LABEL, a qual pode ser bsd, gpt, loop, mac, msdos, sun, pc98 ou dvh

parted -s /dev/$unid mklabel msdos


# mkpart TIPO-PART [TIPO-FS] início fim Cria uma partição do tipo TIPO-PART com o sistema de arquivos TIPO-FS (opcional) começando em 
# início e terminando em fim (especificados em megabytes por padrão). O TIPO-FS pode ser fat16, fat32, ext2, ext3, HFS, linux-swap, NTFS, 
# reiserfs ou ufs. O TIPO-PART pode ser primary (primária), extended (estendida) ou logical (unidade lógica)

parted -a optimal -s /dev/$unid mkpart primary fat32 0% 100%


# http://www.bosontreinamentos.com.br/linux/como-particionar-discos-com-o-utilitario-gnu-parted-no-linux/
# https://dataunique.com.br/blog/parted-manipulando-particoes-no-linux/


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

# Usar a opção -n para colocar um nome no dispositivo. Utilize o nome entre aspas simples e com MAIÚSCULAS, para haver compatibilidade com o Windows. 

sudo mkfs.$form -n ''$nome'' -I /dev/"$unid" > /dev/null

# https://empresadigital.net.br/blog/2019/07/06/formatar-pendrive-linux-terminal/


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

