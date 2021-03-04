#!/bin/bash
#
#
# https://help.ubuntu.com/community/Smartmontools
# https://wiki.archlinux.org/index.php/S.M.A.R.T.
# https://www.howtoforge.com/tutorial/monitor-harddisk-with-smartmon-on-ubuntu/
# https://www.vivaolinux.com.br/topico/Shell-Script/Qual-condicao-para-identificar-que-pen-drive-foi-conectada
# https://duvidas.dicio.com.br/alfabeto-completo-da-lingua-portuguesa/
# https://www.vivaolinux.com.br/topico/Comandos/Verificar-se-o-disco-esta-montado
# https://br.ccm.net/faq/2269-como-ler-um-arquivo-linha-por-linha
# https://www.hardware.com.br/comunidade/hd-identificar/1104578/
# https://ubuntuforum-br.org/index.php?topic=108938.0
# https://cleuber.com.br/index.php/2015/11/27/como-usar-o-comando-rsync-para-transferir-dados-para-diretorios-locais-e-remotos/comment-page-1
# https://sobrelinux.info/questions/771780/using-notify-send-with-cron
# https://qastack.com.br/superuser/31917/is-there-a-way-to-show-notification-from-bash-script-in-ubuntu
# https://stackoverflow.com/questions/28195805/running-notify-send-as-root
# https://www.vivaolinux.com.br/topico/Linux-Mint/Problema-no-crontab-1
# https://www.vivaolinux.com.br/dica/Script-para-avisar-compromissos


clear

log="/tmp/resultado.log"



verificar_root(){


# Verificar se o usuário tem permissoes de SU

# ----------------------------------------------------------------------------------------------------

if [ "`whoami`" != "root" ]
then
    echo "Logue como root utilizando o comando: su"

    exit 1
fi


# ----------------------------------------------------------------------------------------------------

# if [ "$(id -u)" != "0" ]; then

# if [ $USER != root ]; then

# echo "Você precisa ser logar como ROOT para executar este script!."

# exit 1

# else

# echo "Você é root!"

# fi

# ----------------------------------------------------------------------------------------------------

}



verificar_root



which smartctl
which notify-send
which zenity


rm -Rf "$log"


DATA=`date +%d/%m/%Y-%H:%M`

echo "

Data e hora:

$DATA

" > "$log"



# for i in {0..100}; do 



# Para identificar os dispositivos reconhecidos pelo sistema.

# ls /dev/sd* -1
# /dev/sda
# /dev/sdb
# /dev/sdc  <========== Não tem HD ou Pendrive aqui


# Checar se drive esta montado

# df -h  | awk '{ print $1}' | grep -i "/" >> /tmp/verifica.log


fdisk -l  | awk '{ print $1}' | grep -i "/" >> /tmp/verifica.log



# Inicio do loop

# Como ler um arquivo linha por linha - CCM


while read linha; do


montado=$(mount | grep "$linha" | awk '{ print $1}')


# Alfabeto completo da língua portuguesa (a b c d e f g h i j k l m n o p q r s t u v w x y z)

# for i in {a..z}; do 



# SE A MONTAGEM NÃO ESTIVER UP ENTÃO FECHA, CASO CONTRÁRIO REALIZA O QUE QUIZER

# if [ -z "$montado" ]; then

if [ -e "$montado" ];then



echo "
=== INÍCIO DA SEÇÃO DE INFORMAÇÕES PARA $montado ===
" | tee >> "$log"

echo "Fabricante: `smartctl -i $montado | grep -i "Model Family"     | cut -d: -f2`" >> "$log"
echo "Modelo: `smartctl -i $montado | grep -i "Device Model"     | cut -d: -f2`" >> "$log"
echo "Número do serial: `smartctl -i $montado | grep -i "Serial Number"    | cut -d: -f2`" >> "$log"
echo "Capacidade: `smartctl -i $montado | grep -i "User Capacity"    | cut -d: -f2`" >> "$log"
echo "Taxa de rotação: `smartctl -i $montado | grep -i "Rotation Rate"    | cut -d: -f2`" >> "$log"
echo "Suporte a SMART: `smartctl -i $montado | grep -i "SMART support is" | cut -d: -f2`" >> "$log"


# Identifica problema no HD

echo "Teste: `smartctl -H $montado | grep -i "result:" | cut -d: -f2`" >> "$log"

# smartctl -A /dev/sd$i >> "$log"



# else
#	echo "$montado"


fi


# smartctl -x /dev/sd$i >> "$log"; 


# done


done < /tmp/verifica.log

# Fim do loop


# cat /tmp/verifica.log





# Falta pegar todos os usuarios do sistema e enviar a mensagem para eles.


# cat /etc/passwd > /tmp/usuarios.log

# cat /etc/passwd | grep bash | cut -d: -f1 > /tmp/usuarios.log
# root:x:0:0::/root:/bin/bash
# operator:x:11:0:operator:/root:/bin/bash
# fernando:x:1000:1000::/home/fernando:/bin/bash
# master:x:1001:100:,,,:/home/master:/bin/bash


# COMO APAGAR UMA PALAVRA DE UM ARQUIVO?

# sed -i 's/root//g'     /tmp/usuarios.log
# sed -i 's/operator//g' /tmp/usuarios.log


# Outra forma

who | cut -d" " -f1 | sort -u > /tmp/usuarios.log



# for _USER in $(who|cut -d ' ' -f1|sort -u);do
#
# echo "User:$_USER - Execute os comandos";
#
# done 

# https://www.vivaolinux.com.br/topico/Shell-Script/COMO-APAGAR-UMA-PALAVRA-DE-UM-ARQUIVO



# Inicio do loop

# Ler o arquivo linha por linha


# Não esta pegando os nomes dos usuários do sistema e nem enviando a mensagem para eles.

mensagem=$(cat $log)


echo "

"
w


# Tem conta de usuário que não tem :0.x aparece com um -

w | awk '{ print $3}'| cut -d":" -f 2 | tail -n 2 > /tmp/telas.log



# while read tela; do

# export DISPLAY=":$tela"

# echo "$DISPLAY"



export DISPLAY=:0


while read usuario; do


echo "
Enviando mensagem para $usuario
"

su "$usuario" -c "notify-send --icon=important -t 300 'Possível falha de disco' 'HD pode ter um problema. $mensagem ' "

# notify-send "MENSAGEM DE AVISO" -i "/usr/share/icons/Humanity/apps/48/bash.svg"
# notify-send -i gtk-dialog-warning -u normal "Urgente" "Dica - Viva o Linux"

# xdg-open "$log" 2> /dev/null

sleep 1

done < /tmp/usuarios.log


# done <  /tmp/telas.log


# Fim do loop


# cat /tmp/usuarios.log

# cat "$log"


# Faxina:

rm -Rf /tmp/verifica.log
rm -Rf /tmp/usuarios.log
rm -Rf "$log"
rm -Rf /tmp/telas.log


# DISPLAY=:0.0 

#  zenity --text-info --filename="$1" --title="smartd: $SMARTD_DEVICE may have a problem"


exit 0

