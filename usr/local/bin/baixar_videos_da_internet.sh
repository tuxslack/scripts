#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     17/09/2023 as 00:50
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
#
# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml
#
#
# Como baixar vídeos do Instagram, YouTube e outros sites com o yt-dlp?
#
# yt-dlp, o fork/sucessor do descontinuado youtube-dl
#
# O YT-DLP é uma ferramenta de código aberto que permite baixar vídeos do YouTube e outros sites de compartilhamento de vídeo.
#
# yt-dlp "URL do vídeo que você quer baixar"
#
#
# Não funciona para os sites esse script:
#
# * https://globoplay.globo.com (usa a extensão "Video DownloadHelper" no Firefox)
# * https://www.xvideos.com/    (usa a extensão "Video DownloadHelper" no Firefox)
# * https://twitter.com/        (usa a extensão "Baixar vídeo do Twitter" no Firefox - https://twittervid.com/)
#
#
#
# https://www.youtube.com/watch?v=1lCKIHaHJwI
# https://belenos.me/blog/configurar-yt-dlp-linux/
# https://github.com/yt-dlp/yt-dlp/issues/6801
# https://atareao.es/podcast/yt-dlp-es-una-pura-maravilla-eliminando-carazas/
# https://plus.diolinux.com.br/t/erro-yt-dlp-nao-baixa-audio/45721
# https://manualdousuario.net/baixar-videos-youtube-gratis-cli/
# https://belenos.me/blog/configurar-yt-dlp-linux/


# Para reproduzir videos do YouTube usando o MPV

# https://www.youtube.com/watch?v=jQasLSfRLos



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


which yad            2> /dev/null || { echo "Programa Yad não esta instalado."      ; exit ; }

which notify-send    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa notify-send não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }
 
which yt-dlp    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa yt-dlp não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; } 
 
which ffmpeg    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa ffmpeg não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; } 
 
which ffplay    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa ffplay não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; } 

# which mpv    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa mpv não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; } 


which parcellite    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa parcellite não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }




# ----------------------------------------------------------------------------------------

killall -9 yt-dlp 2>/dev/null

# killall -9 yad  2>/dev/null

# ----------------------------------------------------------------------------------------

clear



onde_salvar=$( yad \
            --center \
            --file \
            --directory \
            --title="Selecione um diretório para salvar o vídeo" \
            --width="500" \
            --height="300" 2> /dev/null
)


# ----------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$onde_salvar" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar uma pasta para salvar o vídeo...\n\n' --timeout=10 --no-buttons 2>/dev/null

clear


exit

fi

# ----------------------------------------------------------------------------------------

# Verificar se tem permissões para gravar na pasta.

ls -l "$onde_salvar" >/dev/null

if [ "$?" == "0" ];
then 

      echo -e "\nOK\n"


else 

     yad --center --title='Aviso' --text='\n\nVocê não tem acesso a pasta '$onde_salvar'...\n\n' --timeout=10 --no-buttons 2>/dev/null

     exit
     
fi





cd "$onde_salvar"


# ----------------------------------------------------------------------------------------


# URL do vídeo que você deseja baixar.

link=$( yad \
        --center \
        --entry \
        --title="yt-dlp - baixar vídeo da internet" \
        --entry-label="Informe o link do vídeo na internet" \
        --entry-text="$(parcellite -c | grep https | cut -d" " -f 2)" \
        --completion \
        --editable \
        --width="700" \
        2> /dev/null
) 

# ----------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$link" ];then

yad \
--center \
--title='Aviso' \
--text='\n\nVocê precisa informar um link de um vídeo na internet...\n\n' \
--timeout=10 \
--no-buttons 2>/dev/null

clear

exit 1

fi

# ----------------------------------------------------------------------------------------

# Titulo do video (falta pegar)

# yt-dlp -o "%(channel)s - %(title)s.%(ext)s" "https://www.youtube.com/watch?v=UBAX-13g8OM"
# [download] Destination: Rafaella Ballerini - COMO USAR GIT E GITHUB NA PRÁTICA! - desde o primeiro commit até o pull request! 2⧸2.f303.webm

titulo_do_video=$(yt-dlp  --get-title "$link")


# yt-dlp "$link"

# ----------------------------------------------------------------------------------------

# Quando começa o processo o "botão Fecha" não funciona. =>         --button=Fecha:1 \ só fecha no X da janela do Yad.

yt-dlp -f bestvideo+bestaudio "$link" | \
        yad \
        --center \
        --progress \
        --title "yt-dlp - baixar vídeo da internet" \
        --width="800" \
        --progress-text="Baixando o vídeo $titulo_do_video agora..." \
        --pulsate \
        --auto-close \
        --button=Fecha:1 \
        --auto-kill 2>/dev/null # mata o processo anterior caso usuario clique em cancelar
  
  
# ----------------------------------------------------------------------------------------
        
# Mata o processo yt-dl

if [ "$?" = "1" ]; then

killall -9 yt-dl
# killall -9 yad

exit 2

fi

# ----------------------------------------------------------------------------------------


# Vídeos em alta qualidade não são "codificados" junto ao áudio, então, você precisa baixar os arquivos separadamente e "unir" usando o ffmpeg. Como exemplo:
#
# ffmpeg -i seu_video_baixado.webm -i seu_audio_baixado.m4a -c:v copy -c:a aac resultado_final_com_audio.mp4
#
# Dependendo do seu processamento, esse processo levará um tempo. Após terminar, teste com:
#
# ffplay resultado_final_com_audio.mp4



notify-send -i gtk-dialog-info  -t 200000 "yt-dlp - Vídeo baixado..." "

Vídeo: $titulo_do_video
Link: $link

Salvo em: `pwd`
"

# ----------------------------------------------------------------------------------------



exit 0

