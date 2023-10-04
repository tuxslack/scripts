#!/bin/bash
#
# Autor: Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data: 17/09/2023 as 00:50
# Homepage: https://github.com/tuxslack/scripts
# Licença: GPL
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
#
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



# Baixar videos do Instagram


which yad           || exit 
which yt-dlp        || exit 
which notify-send   || exit 
which ffmpeg        || exit 
which ffplay        || exit 



killall -9 yt-dlp 2>/dev/null
# killall -9 yad  2>/dev/null


clear



onde_salvar=$( yad \
            --center \
            --file \
            --directory \
            --title="Selecione um diretório para salvar o vídeo" \
            --width="500" \
            --height="300" 2> /dev/null
)



# Para verificar se a variavel é nula

if [ -z "$onde_salvar" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar uma pasta para salvar o vídeo...\n\n' --timeout=10 --no-buttons 2>/dev/null

clear


exit

fi



# Verificar se tem permissões para gravar na pasta.

ls -l "$onde_salvar"

if [ "$?" == "0" ];
then 

      echo -e "\nOK\n"


else 

     yad --center --title='Aviso' --text='\n\nVocê não tem acesso a pasta '$onde_salvar'...\n\n' --timeout=10 --no-buttons 2>/dev/null

     exit
     
fi





cd "$onde_salvar"









# URL do vídeo que você deseja baixar.

link=$( yad \
        --center \
        --entry \
        --title="yt-dlp - baixar vídeo da internet" \
        --entry-label="Informe o link do vídeo na internet" \
        --entry-text="" \
        --completion \
        --editable \
        --width="700" \
        2> /dev/null
) 



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



# Titulo do video (falta pegar)

# yt-dlp -o "%(channel)s - %(title)s.%(ext)s" "https://www.youtube.com/watch?v=UBAX-13g8OM"
# [download] Destination: Rafaella Ballerini - COMO USAR GIT E GITHUB NA PRÁTICA! - desde o primeiro commit até o pull request! 2⧸2.f303.webm

titulo_do_video=$(yt-dlp  --get-title "$link")


# yt-dlp "$link"


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
  

        
# Mata o processo yt-dl

if [ "$?" = "1" ]; then

killall -9 yt-dl
# killall -9 yad

exit 2

fi



# vídeos em alta qualidade não são "codificados" junto ao áudio, então, você precisa baixar os arquivos separadamente e "unir" usando o ffmpeg. Como exemplo:
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


exit 0

