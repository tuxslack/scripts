#!/bin/bash
#
# ============================================================================|
#
# Autor:           Fernando Souza <https://www.youtube.com/@fernandosuporte>
# Data:            17/03/2024
# Atualização em:  https://github.com/tuxslack/scripts
# Script:          void-servicos.sh
# Versão:          0.1
#
# Descrição: 
#
# Utilizado para iniciar e parar serviços que estão na pasta /var/service/ no 
# Void Linux.
# 
# 
#
#
# 
# 
# 
#
# 
#
# ============================================================================|



# https://unix.stackexchange.com/questions/267480/yad-how-to-create-a-simple-question-dialog
# https://yad-guide.ingk.se/text/yad-text.html
# https://yad-guide.ingk.se/examples/examples.html
# https://www.vivaolinux.com.br/topico/Shell-Script/variavel-vazia
# https://www.vivaolinux.com.br/topico/Shell-Script/Verificar-se-diretorio-existe-nao-entra-no-if
# https://www.dicas-l.com.br/arquivo/uma_breve_apresentacao_do_yad_yet_another_dialog.php
# https://www.inf.ufpr.br/cursos/ci1001/Slides/Da-para-fazer-em-shell.pdf
# https://unix.stackexchange.com/questions/685702/yad-text-selection-via-button-or-input-field
# https://www.vivaolinux.com.br/script/Mostrando-aviso-no-notificacao-usando-Yad
# https://stackoverflow.com/questions/28195805/running-notify-send-as-root
# https://sobrelinux.info/questions/867298/how-can-i-execute-notify-send-from-root
# https://bbs.archlinux.org/viewtopic.php?id=272115



clear

# ----------------------------------------------------------------------------------------

# Verifique se tem o Yad instalado no sistema. 

which yad   1> /dev/null 2> /dev/null || { echo -e '\033[1;31m\nVocê precisa do programa Yad instalado para usar esse script:\n\n# xbps-install -Suvy yad\n\033[0m' ; exit ; }


# Verifique se tem o notify-send instalado no sistema. 

which notify-send  1> /dev/null 2> /dev/null

if [ "$?" == "1" ];
then 


yad \
--center \
--title="Void Linux" \
--text="Você precisa do programa notify-send.sh ou xfce4-notifyd instalado para usar esse script:\n\n# xbps-install -Suvy notify-send.sh \n\nou\n\n# xbps-install -Suvy xfce4-notifyd" \
--width="700" \
--height="50" \
--button=OK:0

     exit
     
fi


# ----------------------------------------------------------------------------------------

# Verificar Root

# [ "$UID" != "0" ] && echo -e '\033[1;31mUse esse script pelo Root.\033[0m'  && exit 1


if [ "$UID" != "0" ]; then

yad \
--center \
--title="Void Linux" \
--text="Use esse script pelo Root." \
--width="400" \
--height="100" \
--button=OK:0

   exit 1
   
fi

# ----------------------------------------------------------------------------------------


# Verificar se a pasta existe

if [ ! -d /etc/sv/ ]; then

yad \
  --center \
  --image="dialog-question" \
  --title "Void Linux" \
  --text "Infelizmente a pasta /etc/sv/ não foi localizada." \
  --button="OK:0" 
  
exit
  
fi

# ----------------------------------------------------------------------------------------


# Lista todo o conteúdo da pasta /etc/sv/ e joga para um menu.


servico=$(ls -1 /etc/sv/ | yad --center --list --title="Menu" --text="Selecione um serviço abaixo:" --column "Opção" --width="400" --height="1000" --button=OK:0 $(while read; do echo $REPLY; done))

servico=$(echo $servico | cut -d"|" -f1)


# Verificar se variavel $servico esta vazia

if [ -z $servico ];then
   exit
fi



# ----------------------------------------------------------------------------------------

# Verificar se a pasta existe

if [ ! -d /var/service/ ]; then

yad \
  --center \
  --image="dialog-question" \
  --title "Void Linux" \
  --text "Infelizmente a pasta /var/service/ não foi localizada." \
  --button="OK:0" 
  
exit
  
fi

# ----------------------------------------------------------------------------------------


# Verificar se o link simbólico do serviço existe na pasta /var/service/

if test -h /var/service/$servico ; then



yad \
--image dialog-question \
--title "Void Linux" \
--button=Iniciar:0 \
--button=Parar:2 \
--text "O que deseja fazer com o serviço $servico?"





# Ver se o usuário clicou no 'x' da janela

case $? in

   0)
      
echo "
ln -sv /etc/sv/$servico  /var/service/

sv start $servico

sv status $servico

"

sv restart $servico

sv status $servico


# Para notificar o usuário não-root via notify-send sobre o serviço que foi iniciado.

DISPLAY=:0.0 su $USER -c "/usr/sbin/notify-send.sh 'Start' 'Serviço $servico iniciado...' --icon='/usr/share/icons/hicolor/256x256/apps/void-logo.png' --urgency=critical"

   ;;
   
   2)

echo "
sv stop $servico

sv status $servico

rm -Rf /var/service/$servico

"

sv stop $servico

sv status $servico


# Para notificar o usuário não-root via notify-send sobre o serviço que foi parado.

DISPLAY=:0.0 su $USER -c "/usr/sbin/notify-send.sh 'Stop' 'Serviço $servico parado...' --icon='/usr/share/icons/hicolor/256x256/apps/void-logo.png'  --urgency=critical"
 
   ;;

   *)
         exit
   ;;
   
esac






# ----------------------------------------------------------------------------------------



else


yad \
  --center \
  --image="dialog-question" \
  --title "Void Linux" \
  --text "Infelizmente o serviço $servico não foi localizado na pasta /var/service/" \
  --button="OK:0" 


# ----------------------------------------------------------------------------------------

   
fi



exit 0

