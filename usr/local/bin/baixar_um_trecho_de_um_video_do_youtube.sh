#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     01/11/2023 as 04:31
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml



# Como baixar parte do vídeo com o comando yt-dlp?
# Baixar um Trecho de um Vídeo do YouTube

# Extrair cenas favoritas de vídeos do YouTube 


# 14:38  - 14:40

# https://www.youtube.com/watch?v=cWaTO73_kpw


# https://unix.stackexchange.com/questions/230481/how-to-download-portion-of-video-with-youtube-dl-command
# https://gist.github.com/umidjons/8a15ba3813039626553929458e3ad1fc
# https://unix.stackexchange.com/questions/230481/how-to-download-portion-of-video-with-youtube-dl-command



# ----------------------------------------------------------------------------------------

# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor

# ----------------------------------------------------------------------------------------

echo "
Testando conexão com à internet...
"

if ! ping -c 1 www.google.com.br -q &> /dev/null; then

    echo -e "${RED}[ERRO] - Seu sistema não tem conexão com à internet. Verifique os cabos e o modem.\n ${NC}"
    sleep 10
    exit 1
    
    else
    
    echo -e "${GREEN}[VERIFICADO] - Conexão com à internet funcionando normalmente. ${NC}"
    sleep 2
    
fi

# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados

clear


which yad           2> /dev/null || { echo "Programa Yad não esta instalado."      ; exit ; }


which yt-dlp        2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa yt-dlp não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }


# ----------------------------------------------------------------------------------------


clear

cd "$(echo $PWD)"


# ----------------------------------------------------------------------------------------

# Flag 0x0001, status 0, EXIT 1 STAT 0

link=$(parcellite -c | grep "https" | cut -d" " -f 2)

# ----------------------------------------------------------------------------------------


opcao=$(yad \
--center \
--image="/home/fernando/.icons/extras/youtube.png" \
--title="yt-dlp - Baixar um Trecho de um Vídeo do YouTube" \
--text="Informe os dados do trecho do vídeo abaixo:" \
--form  \
--item-separator="!" \
--field="Cola a URL do vídeo youtube:" \
--field="Inicio do trecho:" \
--field="Fim do trecho:" \
"$link" "$inicio" "$fim"  \
--button="OK:0" \
--button="Cancelar:1" \
--width 500 --height 100 \
2>/dev/null)


case "$?" in

    0)


link=$(echo "$opcao"   | awk 'BEGIN {FS="|" } { print $1 }')

inicio=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $2 }')

fim=$(echo "$opcao"    | awk 'BEGIN {FS="|" } { print $3 }')


clear

echo "$link"
echo "$inicio" 
echo "$fim" 

sleep 3

# exit

# ----------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$link" ];then


yad \
--center \
--image=dialog-error \
--title='Aviso' \
--text='\n\nVocê precisa informar um link de um video na internet...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


clear


exit 1

fi

# ----------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$inicio" ];then


yad \
--center \
--image=dialog-error \
--title='Aviso' \
--text='\n\nVocê precisa informar o início do trecho do video na internet...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


clear


exit 2

fi

# ----------------------------------------------------------------------------------------


# Para verificar se a variavel é nula

if [ -z "$fim" ];then


yad \
--center \
--image=dialog-error \
--title='Aviso' \
--text='\n\nVocê precisa informar o fim do trecho do video na internet...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


clear


exit 3

fi



# ------------------------------------------------------------------------------------


yt-dlp --download-sections "*$inicio-$fim" -o "%(title)s-%(section_title)s.%(ext)s"  "$link" | \
        yad  \
        --center \
        --window-icon "/home/fernando/.icons/extras/youtube.png" \
        --progress \
        --title "Progresso" \
        --width="300" \
        --progress-text="Baixando o video..." \
        --pulsate \
        --auto-close \
        --auto-kill  \
        2>/dev/null


# sleep 20

# ----------------------------------------------------------------------------------------

notify-send -i gtk-dialog-info  -t 200000 "yt-dlp - Baixado um Trecho de um Vídeo do YouTube..." "

Site: $link

Salvo em: $PWD
"

# ------------------------------------------------------------------------------------

        ;;
        
        
     1) 
        # Sair
     
         exit
                
        ;;
        
    * )
        # echo "Opção inválida, use $(basename $0)"
           
        exit
        
        ;;
esac
        
                
exit 0


