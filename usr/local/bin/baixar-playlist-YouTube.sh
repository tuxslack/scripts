#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     02/12/2023 as 13:17
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
#
# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml


# Extrair informações de uma playlist do YouTube.


# https://www.youtube.com/watch?v=1NnZjUqeppI


cd "$PWD"

# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados


which yad           2> /dev/null || { echo "Programa Yad não esta instalado."      ; exit ; }

which yt-dlp        2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa yt-dlp não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; } 

which jq            2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa jq não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; } 

which parcellite    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa Parcellite não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; } 


which notify-send    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa notify-send não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

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


# URL do vídeo que você deseja baixar.

playlist=$( yad \
        --center \
        --entry \
        --title="yt-dlp - baixar playlist dos vídeos" \
        --entry-label="Informe o link da playlist dos vídeos na internet" \
        --entry-text="$(parcellite -c | grep https | cut -d" " -f 2)" \
        --completion \
        --editable \
        --width="700" \
        2> /dev/null
) 

# ----------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$playlist" ];then

yad \
--center \
--title='Aviso' \
--text='\n\nVocê precisa informar um link da playlist dos vídeos na internet...\n\n' \
--timeout=10 \
--no-buttons 2>/dev/null

clear

exit 1

fi

# ----------------------------------------------------------------------------------------


rm -Rf lista.json lista.csv


yt-dlp -j --flat-playlist "$playlist" > lista.json

cat lista.json | jq -r '[.title, .url] | @csv' > lista.csv


rm -Rf lista.json


notify-send -i gtk-dialog-info  -t 200000 "yt-dlp - Playlist gerada..." "

Link: $playlist

Salvo em: `pwd`
"



exit 0

