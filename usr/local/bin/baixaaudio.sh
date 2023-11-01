#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     28/09/2023 as 02:32
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml
#
#
# https://plus.diolinux.com.br/t/erro-yt-dlp-nao-baixa-audio/45721
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=12713
# https://superuser.com/questions/1647382/what-is-awk-print-2-doing-exactly
# https://www.vivaolinux.com.br/topico/Sed-Awk-ER-Manipulacao-de-Textos-Strings/ordenar-coluna-em-linha
# https://www.vivaolinux.com.br/topico/Comandos/Comando-sort-1
# https://www.linuxadictos.com/pt/yt-dlp-fork-sucesor-del-descontinuado-youtube-dl-que-permite-descargar-videos-de-decenas-de-plataformas.html
# https://www.mentebinaria.com.br/forums/topic/170-introdu%C3%A7%C3%A3o-a-cria%C3%A7%C3%A3o-interface-gr%C3%A1fica-com-shell-script-e-yad/
# https://ubuntuforum-pt.org/index.php?topic=108641.0



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

which sort          2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa sort não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which tail          2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa tail não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which notify-send   2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa notify-send não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }


which parcellite    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa parcellite não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

# ------------------------------------------------------------------------------------


onde_salvar=$(yad \
            --center \
            --file \
            --directory \
            --window-icon "/home/fernando/.icons/extras/youtube.png" \
            --title="Selecione um diretório para salvar o arquivo de audio" \
            --width="500" \
            --height="300" 2> /dev/null)


# ------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$onde_salvar" ];then

yad \
--center \
--title='Aviso' \
--image=dialog-error \
--text='\n\nVocê precisa informar uma pasta para salvar o audio...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


clear


exit 5

fi

# ------------------------------------------------------------------------------------

# Verificar se tem permissões para gravar na pasta.

ls -l "$onde_salvar" >/dev/null

if [ "$?" == "0" ];
then 

      echo -e "\nOK\n"


else 

     yad \
     --center \
     --title='Aviso' \
     --image=dialog-error \
     --text='\n\nVocê não tem acesso a pasta '$onde_salvar'...\n\n' \
     --timeout=10 \
     --no-buttons 2>/dev/null

     exit
     
fi

# ------------------------------------------------------------------------------------



cd "$onde_salvar"



# URL do vídeo que você deseja baixar o áudio.

# link=$(yad \
#        --center \
#        --entry \
#        --title="yt-dlp - baixar áudio de vídeo" \
#        --entry-label="Qual o link do vídeo que você deseja baixar o áudio?" \
#        --entry-text="www.youtube.com/watch?v=K7JGn7qlis8" \
#        --completion \
#        --editable \
#        --width="700" \
#        2> /dev/null) 



link=$(yad \
--center \
--entry \
--window-icon "/home/fernando/.icons/extras/youtube.png" \
--title="yt-dlp - baixar áudio de vídeo" \
--text="Qual o link do vídeo que você deseja baixar o áudio?" \
--entry-text="$(parcellite -c | grep https | cut -d" " -f 2)" \
--width=700 --entry \
2> /dev/null)


# ------------------------------------------------------------------------------------

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


exit 6

fi

# ------------------------------------------------------------------------------------


# Melhorar a forma de selecionar a qualidade do audio

# 139 m4a  audio 49k 
# 251 webm audio 120k 
# 140 m4a  audio 129k 


# O comando sort ordenará a saída numericamente (-n) tomando por base o valor do quinto campo (a contagem começa em 1, que é o default).

yt-dlp -F "$link" | grep -i audio | awk '{ print $1 " " $2 " " $3 " " $14 " "}' | sort -n -k4 | tail -n3 > /tmp/baixar_audio.log

# WARNING: [youtube] Unable to download webpage: The read operation timed out

 

# Observe que o segundo campo (diretiva -k5) , está ordenado numericamente em ordem crescente. Os campos 
# deste arquivo são separados por espaço. O tipo de separador é indicado pela diretiva -t. Em seguida 
# à diretiva -t podemos indicar qualquer tipo de separador (" "). O campo a ser ordenado é indicado 
# pela diretiva -k5 (a contagem dos campos começa em 1). 

# sort -t" " -k5 -n /tmp/baixar_audio.log


cat /tmp/baixar_audio.log | awk '{ print $1 " " $2 " " $4 }' | sort -nr -k3 


qualidade=$(yad \
--center \
--list \
--window-icon "/home/fernando/.icons/extras/youtube.png" \
--title="Selecionar a qualidade do audio" \
--column="Valor" \
--column="Formato" \
--column="Qualidade do audio" $(cat /tmp/baixar_audio.log | awk '{ print $1 " " $2 " " $4 }' | sort -nr -k3) \
--height=400 --width=450 \
2>/dev/null)


qualidade=$(echo "$qualidade" | cut -d '|' -f1)

# echo "$qualidade" | yad --center --text-info --width 800 --height 300  --title \"Qualidade do audio \" --fontname "mono 10" 2> /dev/null


# cat /tmp/baixar_audio.log | eval yad --center --text-info --width 800 --height 300  --title \"Qualidade do audio \" --fontname "mono 10" 2> /dev/null


# qualidade=$(yad \
#        --center \
#        --entry \
#        --entry-label="Qual a qualidade do audio?" \
#        --entry-text="" \
#        --completion \
#        --editable \
#        --title="yt-dlp - baixar audio de site" \
#        --width="400" 2> /dev/null
# )



rm -Rf /tmp/baixar_audio.log

# https://www.dicas-l.com.br/arquivo/ordenar_arquivos_por_ordem_de_data_de_modificacao.php
# http://www.bosontreinamentos.com.br/linux/certificacao-lpic-1/comando-sort-ordenando-dados-em-um-arquivo-de-texto-no-linux-lpi-1/
# https://www.dicas-l.com.br/arquivo/o_comando_sort_e_seus_muitos_recursos.php


# ------------------------------------------------------------------------------------


# Para verificar se a variavel é nula

if [ -z "$qualidade" ];then

yad \
--center \
--title='Aviso' \
--image=dialog-error \
--text='\n\nVocê precisa informar qual será a qualidade do audio a ser baixado...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


clear


exit 7

fi



 

# WARNING: [generic] The url doesn't specify the protocol, trying with http
# 233 mp4   audio only        |                  m3u8  | audio only          unknown             [pt] Default
# 234 mp4   audio only        |                  m3u8  | audio only          unknown             [pt] Default
# 599 m4a   audio only      2 |  683.88KiB   31k https | audio only          mp4a.40.5   31k 22k [pt] ultralow, m4a_dash
# 600 webm  audio only      2 |  782.83KiB   35k https | audio only          opus        35k 48k [pt] ultralow, webm_dash
# 139 m4a   audio only      2 |    1.06MiB   49k https | audio only          mp4a.40.5   49k 22k [pt] low, m4a_dash
# 249 webm  audio only      2 |    1.14MiB   53k https | audio only          opus        53k 48k [pt] low, webm_dash
# 250 webm  audio only      2 |    1.47MiB   68k https | audio only          opus        68k 48k [pt] low, webm_dash
# 140 m4a   audio only      2 |    2.80MiB  130k https | audio only          mp4a.40.2  130k 44k [pt] medium, m4a_dash
# 251 webm  audio only      2 |    2.79MiB  129k https | audio only          opus       129k 48k [pt] medium, webm_dash


# ------------------------------------------------------------------------------------


yt-dlp -f "$qualidade"  "$link" | \
        yad  \
        --center \
        --window-icon "/home/fernando/.icons/extras/youtube.png" \
        --progress \
        --title "Progresso" \
        --width="300" \
        --progress-text="Baixando audio..." \
        --pulsate \
        --auto-close \
        --auto-kill 

# ou


# ------------------------------------------------------------------------------------

# Como usar o yt-dlp para baixar áudio de vídeos do YouTube e outros sites
# 
# Como usar o yt-dlp, uma ferramenta poderosa para baixar áudio de vídeos do YouTube e 
# de outros sites. Com o yt-dlp, você poderá extrair facilmente o áudio de seus vídeos 
# favoritos e salvá-los em formato MP3 ou outros formatos de áudio.
# 
# O que é yt-dlp? 
# 
# yt-dlp é um fork do popular programa youtube-dl, que foi descontinuado. Ele oferece uma 
# interface de linha de comando para baixar vídeos e áudios de várias plataformas, incluindo 
# YouTube, Vimeo, SoundCloud e muitos outros. O yt-dlp é uma alternativa confiável e atualizada 
# para aqueles que desejam continuar baixando conteúdo de vídeo e áudio da Internet.


# yt-dlp -x --audio-format mp3 "$link"



# https://www.youtube.com/watch?v=oQS_RrQhwFc

# ------------------------------------------------------------------------------------


#  yt-dlp -f bestvideo+bestaudio "$link"



notify-send -i gtk-dialog-info  -t 200000 "yt-dlp - áudio baixado..." "

Site: $link

Áudio salvo em: $onde_salvar
"

# ------------------------------------------------------------------------------------


exit 0

