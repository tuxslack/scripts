#!/bin/bash
#
# Autor:           Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:            12/01/2024 as 22:21
# Atualização em:  https://github.com/tuxslack/scripts   | https://notabug.org/
# Script:          gravando-seu-desktop-com-FFmpeg.sh
# Versão:          0.1
# Grava seu desktop com FFmpeg.
#
# Data da atualização: 
#
# Licença:  GPL - https://www.gnu.org/
# 
#
# Requer: FFmpeg
#
#
# Instalação: 
#
#
# mv -i  gravando-seu-desktop-com-FFmpeg.sh  /usr/local/bin/
#
# chmod +x /usr/local/bin/gravando-seu-desktop-com-FFmpeg.sh
#
#
# Uso:
# 
# $ gravando-seu-desktop-com-FFmpeg.sh
#
#
#
#
# http://www.techtudo.com.br/artigos/noticia/2013/04/descubra-principais-diferencas-entre-os-formatos-de-arquivo-de-audio.html
#
# sudo apt-get update && sudo apt-get install -y mediainfo zenity ffmpeg
#
# -f alsa -i pulse \  (usado para gravar som)  - observação: ALSA lib pulse.c:243:(pulse_connect) PulseAudio: Unable to connect: Connection refused
# sudo apt-get install -y pulseaudio
#
#
# -sameq 
#
# -vcodec libtheora
#
# -qscale 0
#
#
# Video muito rapido grava tambem o audio
#
# ffmpeg -f alsa -i pulse -f x11grab -s $(xrandr | grep '\*\+' | awk '{print $1}') -r 26 -i :0.0 -acodec ac3 -ab 64k -vcodec mpeg4  screencast-`date +%d-%m-%Y_%H:%M:%S`.mp4 
#
#
# ffmpeg -f x11grab -s wxga -r 25 -i :0.0 -qscale 0 out.mpg
#
#
# video muito rapido
#
# ffmpeg -f x11grab -s $(xrandr | grep '\*\+' | awk '{print $1}') -follow_mouse 100 -show_region 1 -i :0 -vcodec libx264 -preset ultrafast -qp 0 -y video.mkv
#
#
# qualidade ruim
#
# ffmpeg -f x11grab -s $(xrandr | grep '\*\+' | awk '{print $1}') -r 25 -i :0.0 -y out.mpg
#
# ffmpeg -f alsa -ac 2 -i pulse -f x11grab -r 15 -s $(xrandr | grep '\*\+' | awk '{print $1}') -i :0.0 -acodec libvorbis -aq 0 -vcodec libtheora -qscale 4 -f ogg captura.ogg
#
#
# -follow_mouse faz o video seguir o mouse, o numeral passado como parâmetro é a distancia mínima da borda antes de movimentar a área capturada
# -show_region 1 exibe um quadro para você saber o que está capturando
# -vcodec libx264 -preset ultrafast -qp 0 isso faz você capturar com praticamente 100% de fidelidade sem comprometer o desempenho do computador durante a captura, depois pode usar:
# -vcodec libx264 -preset veryslow -qp 15 para reduzir drasticamente o tamanho do vídeo já capturado (a menos que você tenha um processador ultra rápido, já pode fazer dessa forma já na primeira captura)
#
#
########################################################################################################


# Verificar se a pasta /Windows/System32/DriverStore/ existe 
#
# -d nos ajuda a saber se o diretório existe, se mudarmos -d para -f é para verificar a existência de arquivos.

if [ -d $HOME/Videos ];
then

diretorio="$HOME/Videos"
      
fi


if [ -d $HOME/Vídeos ];
then

diretorio="$HOME/Vídeos"
      
fi
    
      
      

resolucao="$(xrandr | grep '\*\+' | awk '{print $1}')"  # -s
codec_video="libx264"            # libx264 , mpeg4
frame_de_video="30.000"
bitrate_de_video="0k"            # 240k
extensao_do_video="mp4"          # mpg , mkv , mp4 , avi

bitrate_de_audio="128k"
codec_audio="libmp3lame"         # mp3, ac3 , flac , libmp3lame
canal_de_audio="2"
taxa_de_amostragem_de_audio="44100" 

# Tempo de atividade do ffmpeg
# -t 00:00:10.00



clear


# =============================================================


# Void Linux - modo live (não tem instalados os programas: xrandr e o zenity)


modosimples(){

which notify-send || exit 3

clear

echo  "A gravação iniciará em 30 segundos.

Vídeo

Diretorio:                  $diretorio
Resolução:                  1152x864
Formato:                    h264
Taxa de bits:               
Quadros por segundo:        $frame_de_video 
Extensao do video:          $extensao_do_video

Áudio

Taxa de bits:               
Taxa:                       
Canais:                     
Codificador selecionado:    




Parar: killall ffmpeg  ou CTRL + C.
"


sleep 30
clear


ffmpeg -f x11grab \
-s 1152x864  \
-r $frame_de_video \
-i :0.0  \
-qscale 0 \
-y "$diretorio"/screencast-`date +%d-%m-%Y_%H:%M:%S`.$extensao_do_video


notify-send -t 20000 "Gravação do desktop" "\n\nFim da gravação.... com ffmpeg.\n\nArquivo gerado em $diretorio \n"


exit 2

}


which zenity   || modosimples
which xrandr  || modosimples
which ffmpeg || exit 1



# =============================================================



zenity --info --text "A gravação iniciará em 6 segundos.


Vídeo

Diretorio:                  $diretorio
Resolução:                  $resolucao
Formato:                    $codec_video  (Obs: libx264  = H264)
Taxa de bits:               $bitrate_de_video
Quadros por segundo:        $frame_de_video 
Extensao do video:          $extensao_do_video

Áudio

Taxa de bits:               $bitrate_de_audio
Taxa:                       $taxa_de_amostragem_de_audio Hz
Canais:                     $canal_de_audio
Codificador selecionado:    $codec_audio




Parar: killall ffmpeg  ou ctrl+c.
"


# sleep 6 ;

# ffmpeg -f alsa -i pulse  \
# -f x11grab -s $resolucao \
# -r $frame_de_video \
# -i :0.0 \
# -acodec $codec_audio \
# -ab $bitrate_de_audio \
# -vcodec $codec_video \
# -b $bitrate_de_video \
# -ac $canal_de_audio \
# -ar $taxa_de_amostragem_de_audio \
# -qscale 0 \
# $diretorio/screencast-`date +%d-%m-%Y_%H:%M:%S`.$extensao_do_video



ffmpeg -f x11grab \
-s $resolucao  \
-r $frame_de_video \
-i :0.0  \
-qscale 0 \
-y $diretorio/screencast-`date +%d-%m-%Y_%H:%M:%S`.$extensao_do_video



killall ffmpeg

zenity --info --text "Fim da gravação.... com ffmpeg."

exit 0

