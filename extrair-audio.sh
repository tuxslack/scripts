#!/bin/bash
#
#
# Função: lhe permite extrair som do arquivo de vídeo.
#
# 
# Como converter áudio do WhatsApp (opus para mp3)
#
#
# Quando você salva um áudio no WhatsApp, o arquivo sai em formato *.opus, o que não é ideal para tocar 
# em players de música ou compartilhar com amigos em outros aplicativos. Saiba como converter áudio do 
# WhatsApp para .mp3 (a partir de *.opus) sem maiores problemas.
#
#
# Opções do FFmpeg
#
# -i  - Especificar o caminho e o nome do arquivo do vídeo de entrada;
# -vn - ignora a inclusão do fluxo de vídeo;
# -ab - usado para salvar o áudio em 128Kbps - pode ser 256kbps;
# -acodec copy - é para copiar o áudio original (sem recodificação);
# -y - Sobrescreva arquivos de saída sem perguntar;
# -ar - define a taxa de amostragem para fluxos de áudio se codificado;
# -ac - Defina o número de canais de áudio;
# -b:a - Defina a taxa de bits do áudio;
# -f - formato;
#
#
# O XMMS é um dos mais famosos e utilizados players de áudio no Linux. 
#
# Autor: Peter e Mikael Alm 
# Data:  Novembro de 1997.
#
# Pode reproduzir arquivos de mídia como MP3, MOD's, WAV e outros com o uso de plug-ins de entrada.
#
# https://www.xmms.org/
# https://www.vivaolinux.com.br/dica/Instalacao-do-Xmms-no-Debian
# http://br-linux.org/linux/a-ascencao-e-a-queda-do-xmms
# https://fedoraproject.org/wiki/Pt_BR/Multimedia/XMMS
#
#
#
#
# xmms2
#
#
# https://www.linuxdescomplicado.com.br/2016/12/guia-pratico-com-exemplos-de-conversao-de-audio-e-video-usando-o-ffmpeg.html
# https://tecnoblog.net/261148/converter-audio-whatsapp-mp3-opus/
# https://www.edivaldobrito.com.br/como-extrair-o-audio-de-videos-no-formato-original-ou-converter-para-mp3-ou-ogg-vorbis/
# https://www.linuxquestions.org/questions/linux-software-2/ffmpeg-unknown-encoder-%27libmp3lame%27-4175598322/
# https://qastack.com.br/programming/9913032/how-can-i-extract-audio-from-video-with-ffmpeg
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=16925
# https://www.vivaolinux.com.br/dica/Informacoes-detalhadas-de-arquivos-de-video-com-mediainfo
# https://olhardigital.com.br/2017/06/22/dicas-e-tutoriais/wav-mp3-aac-flac-entenda-as-diferencas-entre-os-formatos-de-audio/
# https://www.vivaolinux.com.br/topico/Zenity/Script-para-desligar-maquinas-com-confirmacao
# https://stackoverflow.com/questions/37997249/zenity-dialog-window-with-two-buttons-but-no-text-entry
# https://www.vivaolinux.com.br/dica/Instalador-Skype-automatizado-Zenity
# https://www.vivaolinux.com.br/script/Ferramenta-de-backup-do-HD-para-dispositivos-externos
# https://aurelio.net/shell/dialog/
# https://superuser.com/questions/253467/convert-an-mp3-from-48000-to-44100-hz
# https://wiki.archlinux.org/index.php/FFmpeg
# https://askubuntu.com/questions/13737/what-packages-do-i-install-for-ffmpeg-and-libmp3lame
# https://www.vivaolinux.com.br/dica/Combinando-os-comandos-head-e-tail
# http://guilhermearantes.com/site/br/?page_id=225
# http://wiki.ubuntu-br.org/Midi
# https://sites.google.com/site/marquinhosmidis/arquivos
# https://planetamidi.blogspot.com/
# https://www.dicas-l.com.br/arquivo/notify-send_notificacoes_no_desktop.php



# ALSA pcm 'default' set buffer size 32768, period size 8192 bytes

# mplayer -ao alsa:device=hw=1.0 -srate 48000  bryan.mp3

# https://jan.newmarch.name/LinuxSound/Sampled/Alsa/





log="/tmp/audio.log"

# .mp4

video="$1"


# Permite salvar o arquivo de áudio de um vídeo.

clear


which zenity
which lame
which ffplay
which ffprobe
which mediainfo
which ffmpeg
which notify-send



dados(){

# zenity --forms --title="Add Friend" --text="Enter Multicast address" --separator="," --add-entry="IP address" --add-entry="PORT"


# Quais os gêneros musicais?

#    --separator=" " \


# O macete foi ter mudado o valor da variável $IFS (que foi alterado para |, que é o separador de default 
# das saídas do Zenity), somente durante a execução do read (note que a atribuição do IFS está ligada ao 
# read, pois não há nada entre os dois). Assim sendo, a execução do comando Zenity foi priorizada ($(...)) 
# e redirecionada (<<<) para a entrada do read. 


IFS=\| read titulo nome_do_artista album comentario genero  ano <<< "$(zenity \
    --forms \
    --title='Escolha do genero da música' \
    --text='Dados do arquivo de áudio'    \
    --add-entry='Titulo'                  \
    --add-entry='Nome do artista'         \
    --add-entry='Album'                   \
    --add-entry='Comentario'              \
    --add-combo='Gênero'                  \
    --combo-values=Religioso\|Axé\|Blues\|\
Country\|Eletrônica\|Forró\|Funk\|Gospel\|\
"Hip Hop"\|Jazz\|MPB\|"Música clássica"\|\
Pagode\|Pop\|Rap\|Reggae\|Rock\|Samba\|\
Sertanejo \
--add-calendar "Ano" \
2> /dev/null)"

echo "$titulo  $nome_do_artista  $album  $comentario  $genero  $ano"



ffmpeg \
-i "$video"."$extensao" \
-c copy \
-metadata title="$titulo" \
-metadata artist="$nome_do_artista" \
-metadata album="$album" \
-metadata genre="$genero" \
-metadata comment="$comentario" \
-metadata date="$ano" \
"alterado-$video.$extensao"


# https://www.dicas-l.com.br/arquivo/zenity_o_dialogo_--forms.php


}




# O utilitário ffmpeg é uma aplicação de linha de comando usado para converter arquivos multimídia a 
# partir de um formato para outro . É um produto de código aberto que pode ser instalado no Linux , 
# Unix, Mac OSX e Windows. Muitas vezes, é instalado com outros utilitários multimídia, como MPlayer/MEncoder. 
# O utilitário suporta a capacidade de definir o bitrate de áudio e do número de canais de áudio , 
# bem como muitas outras opções. 





# Verificar qualidade do áudio e vídeo

# ffplay "$video" > "$log"


# ffprobe "$video" >> "$log"

# Stream #0:1(eng): Audio: opus, 48000 Hz, mono, fltp (default)


# uma saída ainda mais detalhada:


# Retornar segunda linha (Mostrar a última => tail -n1)

# http://www.bosontreinamentos.com.br/linux/comando-tail-mostrar-o-final-de-um-arquivo-de-texto-no-linux/
# https://ivanix.wordpress.com/2008/07/31/head-e-tail-visualizando-o-inicio-e-o-fim-de-um-arquivo-em-modo-texto/


# Identificar o tipo de codec de áudio e definir o tipo de extensão para esse codec de audio.

echo "Codec de áudio: `mediainfo --fullscan "$video" | grep -i "Audio codecs" | cut -d: -f2` " > "$log"

# echo "Codec de áudio: `mediainfo --Inform="Audio;%Format%" "$video"` " >> "$log"


# https://www.vivaolinux.com.br/topico/Shell-Script/Pegar-somente-o-formato-do-audio-do-video


echo "Taxa de bits do áudio: `mediainfo --fullscan "$video" | grep -i "Overall bit rate" |  tail -n 1 | cut -d: -f2 `" >> "$log"


echo "

Codecs de áudio => Extensão do arquivo de áudio final

opus => .ogg ou .mp3

AAC LC => .m4a

MP3 =>  .mp3

Vorbis => .ogg

MIDI => .mid


" >> "$log"

# https://developer.android.com/guide/topics/media/media-formats?hl=pt-br#audio-codecs


# Audio
#
# ID                                       : 2
# Format                                   : Opus
# Codec ID                                 : A_OPUS
# Duration                                 : 2 min 52 s
# Channel(s)                               : 1 channel
# Channel layout                           : C
# Sampling rate                            : 48.0 kHz
# Compression mode                         : Lossy
# Language                                 : English
# Default                                  : Yes
# Forced                                   : No



zenity \
--info \
--title="Informação" \
--text="Essa informação sera util na proxima tela.

`cat $log`

Leia a saída acima para ver qual é o codec, para definir a extensão correta do arquivo de áudio do vídeo:

$video.
" \
--width=800 --height=150  \
2> /dev/null


clear

# extensao=$(zenity \
# --title="Extrai áudio do vídeo" \
# --text "Qual é a extensão do áudio do video? Ex: mp3 | ogg | aac | opus" \
# --entry  \
# 2> /dev/null)




# M4A é um arquivo estritamente somente de áudio desenvolvido pela Apple.inc. É codificado com AAC (Advanced Audio Coding), 
# que usa compactação com perdas. Como o MP4, o M4A usa o codec MPEG-4, embora seja composto exclusivamente por áudio. O MP4, 
# por outro lado, contém arquivos de áudio e vídeo. Normalmente, os arquivos M4A vêm com uma extensão .m4a.


# Usando uma lista com botões de rádio com o Zenity

extensao=$(zenity  \
    --width=500 --height=350  \
    --list  \
    --text "Extrai áudio do vídeo" \
    --radiolist \
    --column "" \
    --column "Extensão do arquivo de áudio final" \
    TRUE  "mp3" \
    FALSE "ogg" \
    FALSE "aac" \
    FALSE "wma" \
    FALSE "ac3" \
    FALSE "m4a" \
    FALSE "3gp" \
    FALSE "mid" \
    FALSE "wav" \
    FALSE "flac" \
    FALSE "acc" \
    FALSE "mpa" \
    FALSE "m3u" \
    FALSE "aif" \
    FALSE "pls" \
    FALSE "amr" \
    FALSE "m4r" \
    FALSE "asf" \
    FALSE "aiff" \
    FALSE "wmv" \
    FALSE "" \
    FALSE "" \
    2> /dev/null)



# Se usar o botão Cancelar (Sair)

if [ $? == 1 ]; then

clear

exit 1

fi



# Aborta se a variavel extensao estiver vazia

[ -z "${extensao}" ] && clear && echo "A extensão não pode ser vazia." && exit 1


clear

echo "
Extraindo áudio do vídeo e salvando em $extensao ...
"
sleep 2





# Formato do arquivo 


resp=$(zenity \
--list \
--title="Extrai áudio do vídeo" \
--text "Deseja tentar qual o tipo de extração para o vídeo:

$video?" \
--radiolist \
--column "" \
--column "Opções" false "semrecodificar" false "comrecodificar" \
--width=500 --height=350  \
2>/dev/null);


# ----------------------------- Testa a resposta do usuário -------------------------------------


case $resp in
          semrecodificar)

clear

echo "
Extraindo o áudio do vídeo $video sem recodificá-lo...
"
sleep 2

   # Para extrair o fluxo de áudio sem recodificar:

ffmpeg \
-i "$video" \
-vn \
-acodec copy \
-y \
"$video"."$extensao"


   # Leia a saída para ver qual é o codec, para definir a extensão correta do nome do arquivo.

# Como saber se comando do script foi executado com sucesso?

if [ $? -eq 0 ]
then

    notify-send --icon=dialog-information -t 10000 "O fluxo de áudio extraido com sucesso sem recodificar...."


else

    notify-send --icon=important -t 10000 "Possível falha na extração do audio" "Ocorreu um problema."
fi

# https://pt.stackoverflow.com/questions/143454/como-saber-se-comando-do-script-foi-executado-com-sucesso



echo "
Tamanho do arquivo $video.$extensao
"  > audio-sem_recodificar-"$video"."$extensao".txt

   du -h "$video"."$extensao" >> audio-sem_recodificar-"$video"."$extensao".txt

   echo ""  >> audio-sem_recodificar-"$video"."$extensao".txt

   mediainfo "$video"."$extensao" >> audio-sem_recodificar-"$video"."$extensao".txt


   notify-send --icon=dialog-information -t 10000 "Audio Extractor"  ""


;;
          comrecodificar)

clear

echo "
Extraindo o áudio do vídeo $video e codificando-lo...
"

sleep 2


# Usando uma lista com botões de rádio com o Zenity

# Taxa de compressão: qual é a relação com a qualidade de áudio?

# É pelo valor da taxa de compressão (ou bitrate) que conseguimos controlar o tamanho do arquivo e, consequentemente, a qualidade de áudio.

bitrate_do_audio=$(zenity  \
    --width=1400 --height=800  \
    --list  \
    --text "Extrai áudio do vídeo - Bitrate do áudio" \
    --radiolist \
    --column "" \
    --column "" \
    --column "À medida que se abaixa o valor do bitrate, menor fica o arquivo, mas perdas sonoras passam a ser perceptíveis, dependendo do áudio em questão.
kbps (kilobits por segundo)" \
    TRUE  "320k" "320 kbps - áudio indistinguível da qualidade de um CD" \
    FALSE "192k" "192 kbps - sem perdas significativas para a maioria das pessoas" \
    FALSE "160k" "160 kbps  - " \
    FALSE "132k" "132 kbps  - " \
    FALSE "128k" "128 kbps - perdas ligeiramente perceptíveis" \
    FALSE "102k" "102 kbps  - " \
    FALSE "64k"  "64 kbps  - podcast sem trilha sonora" \
    FALSE "96k"  "96 kbps  - qualidade similar a de rádio FM" \
    FALSE "32k"  "32 kbps  - similar à rádio AM;" \
    FALSE "24k"  "24 kbps  - " \
    FALSE "16k"  "16 kbps  - similar à rádio de ondas curtas (walkie-talkie)" \
    2> /dev/null)

# https://blog.hotmart.com/pt-br/qualidade-do-audio/



# Se usar o botão Cancelar (Sair)

if [ $? == 1 ]; then

clear

exit 1

fi



# Aborta se a variavel taxa estiver vazia

[ -z "${bitrate_do_audio}" ] && clear && echo "A taxa não pode ser vazia." && exit 1



echo "$bitrate_do_audio"


# ffmpeg -codecs > /tmp/codecs.log

codec_de_audio=$(zenity  \
--width=500 --height=350  \
    --list  \
    --text "Extrai áudio do vídeo" \
    --radiolist \
    --column "" \
    --column "" \
    --column "Informe o codec de áudio do arquivo final" \
    TRUE  "libmp3lame" "codec mp3 (.mp3)" \
    FALSE "mpeg4"      "codec MPEG-4" \
    FALSE "libtheora"  "codec Theora" \
    FALSE "ac3"        "codec ac3" \
    FALSE "mp2"        "codec MP2" \
    FALSE "libopus"    "codec Opus (Opus Interactive Audio Codec)" \
    FALSE "libspeex"   "codec Speex" \
    FALSE "libvorbis"  "codec Vorbis (.ogg)" \
    FALSE "libopencore_amrnb" "codec AMR-NB" \
    FALSE "" "" \
    FALSE "" "" \
    FALSE "" "" \
    2> /dev/null)


# Se usar o botão Cancelar (Sair)

if [ $? == 1 ]; then

clear

exit 1

fi


# Aborta se a variavel codec_de_audio estiver vazia

[ -z "${codec_de_audio}" ] && clear && echo "A taxa não pode ser vazia." && exit 1



# 44100 | 48000

taxa_de_amostragem=$(zenity --scale --text "Taxa de amostragem" --min-value=0 --max-value=500000 --value=48000 --step 2)


# Canais máximos de áudio

canais=$(zenity  \
--list  \
--text "Canais máximos de áudio" \
--radiolist  \
--column "Opção" \
--column "Canais" \
FALSE 1 \
TRUE  2 \
2> /dev/null)


# https://linux.byexamples.com/archives/265/a-complete-zenity-dialog-examples-2/




# ffmpeg -i "$video" -vn -ab "$taxa"k "$video"."$extensao"

# ffmpeg -i "$video" -codec:a libmp3lame -q:a 0 "$video"."$extensao"


ffmpeg \
-i "$video" \
-acodec "$codec_de_audio" \
-ab "$bitrate_do_audio" \
-ar "$taxa_de_amostragem" \
-ac "$canais" \
-vn \
-y \
"$video"."$extensao"


# Como saber se comando do script foi executado com sucesso?

if [ $? -eq 0 ]
then

    notify-send --icon=dialog-information -t 10000 "O fluxo de áudio extraido com sucesso com recodificação...."


else

    notify-send --icon=important -t 10000 "Possível falha na extração do audio" "Ocorreu um problema."
fi

# https://pt.stackoverflow.com/questions/143454/como-saber-se-comando-do-script-foi-executado-com-sucesso



# http://laplace.eletrica.ufpr.br/ffmpeg.html


# Retira a primeira extensão do arquivo final

# basename  "$video"."$extensao" | cut -d. -f2
# webm



# ffmpeg -i 'ArquivoDeVideo.extensão' -acodec libmp3lame -b:a 320k -ac 2 -ar 48000 Arquivo.mp3


# for f in *.flv; do ffmpeg -i "$f" "${f%.flv}.mp4" -vcodec copy -acodec mpeg4; done


# ffmpeg -i song.m4a -acodec libmp3lame -ab 128k -ac 2 song.mp3
#
#
# Para converter o arquivo m4a para um arquivo mp3 . Este comando diz para usar o arquivo m4a como o arquivo de entrada, 
# use o codec libmp3lame , defina a taxa de bits para 128 e usar dois canais de áudio. A saída será o arquivo mp3.
#
# Teste o novo arquivo por jogá-lo em qualquer leitor de mp3.




# -b:a "$taxa"K
# -ac 2
# -ar 48000      (48.000 Hz)
# -ar 96000 

# -i (input): vídeo de entrada.
# -vn Desabilitar vídeo.
# -ar Taxa de amostragem.
# -ac Canais máximos de áudio.
# -ab Bitrate do áudio.
# -f Define formato de saída como mp3. 



   du -h "$video"."$extensao" > audio-com_recodificar-"$video"."$extensao".txt

   mediainfo "$video"."$extensao" >> audio-com_recodificar-"$video"."$extensao".txt


;;
          *) echo "Retorno desconhecido";;
esac


rm -Rf "$log"


exit 0

