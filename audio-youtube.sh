#!/bin/bash
#
#
# nano ~/.bashrc
#
# 
# Baixa somente o áudio dos videos do YouTube (https://www.youtube.com)
#
# alias baixaraudioyoutube="youtube-dl -f bestaudio "
#
#
#
# http://www.bosontreinamentos.com.br/shell-script/zenity-exibindo-caixas-de-dialogo-com-scripts-do-shell-no-linux/
# https://www.vivaolinux.com.br/script/Testando-o-Zenity-2
# https://qastack.com.br/ubuntu/488350/how-do-i-prompt-users-with-a-gui-dialog-box-to-choose-file-directory-path-via-t
# https://www.dicas-l.com.br/arquivo/notify-send_notificacoes_no_desktop.php


clear

log="/tmp/youtube-audio.log"

which youtube-dl
which notify-send
which zenity


link=$(zenity --title="Nome?" --text "Qual é o link do vídeo na internet?" --entry  2>/dev/null)


# Janela de seleção do diretório que vai ser salvo o arquivo de áudio do vídeo da internet.

destino=`zenity --file-selection --directory --title "Selecione uma pasta de destino para o áudio baixado." 2>/dev/null`
   case $? in
#      0) source $destino;;
      1) zenity --warning --text "Nenhum destino foi selecionado" 2>/dev/null && exit 1;;
     -1) zenity --warning --text "Nenhum destino foi selecionado" 2>/dev/null && exit 2;;
   esac


cd "$destino"

youtube-dl -f bestaudio "$link" 2>/dev/null

# | zenity --progress --auto-close  --text "Baixando áudio do vídeo $link, aguarde..." --pulsate 2>/dev/null


# Como saber se comando do script foi executado com sucesso?

if [ $? -eq 0 ]
then

    notify-send --icon=dialog-information -t 10000 "Sucesso" "Vídeo baixado do link $link foi salvo em $destino"


else

    notify-send --icon=important -t 10000 "Possível falha em baixar" "Ocorreu um problema com $link."
fi

# https://pt.stackoverflow.com/questions/143454/como-saber-se-comando-do-script-foi-executado-com-sucesso



exit 0

