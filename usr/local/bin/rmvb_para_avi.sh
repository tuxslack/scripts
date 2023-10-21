#!/bin/bash
#
# Autor: Roberson Carlos <robersonfox@genovaengine.com>
# Data: 19/11/2009
#
#
# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml
#
#
#
# Fonte: 
#
# http://carlrobers.wordpress.com/2008/12/20/convertendo-rmvb-para-avi-no-linux/
#
# https://www.vivaolinux.com.br/dicas/impressora.php?codigo=13646



# Tenha o mencoder e o lame instalados em seu sistema.

which mencoder           || exit 1
which lame               || exit 2
which notify-send        || exit 3
which xfce4-terminal     || exit 4
which yad                || exit 5



clear




# Substitua o video.rmvb pelo arquivo de entrada, isto irá gerar um arquivo chamado saida.avi no diretório atual.

entrada="$1"

saida="$1-saida.avi"



# Para verificar se a variavel é nula

if [ -z "$entrada" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar um arquivo de video no formato .rmvb...\n\n' --timeout=10 --no-buttons 2>/dev/null

clear

exit 6

fi


echo "
Convertendo arquivo rmvb para avi ...
"

# xfce4-terminal \
# --maximize \
# --title="Convertendo arquivo rmvb para avi..." \
# -e ""


mencoder \
-oac mp3lame cbr:br=64:vol=2 -srate 22050 \
-ovc xvid -sws 1 -xvidencopts bitrate=500:max_key_interval=120:vhq=4 -ofps 30  \
"$entrada"  \
-o "$saida" 2> /tmp/erro.log



# $? Valor de retorno do último comando executado.

if [ $? != 0 ]
then

# Error - codigo 1

yad --center --title="Convertendo arquivo rmvb para avi" --text="

Erro:

`cat /tmp/erro.log`

" --width=350 --button="OK" 2>/dev/null

rm -Rf /tmp/erro.log


exit 7
    
fi



notify-send -i gtk-dialog-info  -t 100000 "rmvb para avi" "
           
Arquivo $entrada foi convertido para $saida"



exit 0


