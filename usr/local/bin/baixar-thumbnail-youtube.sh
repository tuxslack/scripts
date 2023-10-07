#!/bin/bash
#
# ----------------------------------------------------------------------------------------
#
# Autor:       Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Homepage:    https://github.com/tuxslack/scripts
# Data:        07/10/2023 as 16:25
# Colaboração: Jesse Moreira - https://www.youtube.com/@moreirajesse/about
# Nome:        baixar-thumbnail-youtube.sh
# Função:      Baixar capas de vídeos do canal do YouTube
# Versão:      1.0
# Licença:     GPL
#
# https://www.youtube.com/watch?v=BieK8I8n3Kc
#
# ----------------------------------------------------------------------------------------
#
# 
#
# Baixe e converta capas dos vídeos do YouTube (thumbnail) com yt-dlp e Convert!
#
# Data: 12 de jul. de 2023
#
# Requer: yt-dlp, ImageMagick, yad, notify-send e webp-pixbuf-loader
#
#
# https://www.reddit.com/r/kde/comments/gzztrl/kde_apps_wont_open_or_preview_webp_images_on_void/
# https://www.edivaldobrito.com.br/como-visualizar-imagens-webp-no-nautilus-e-outros-aplicativos-gtk/
# https://askubuntu.com/questions/440345/why-dpkg-l-grep-package-is-showing-a-package-after-being-purged
# https://ubunlog.com/pt/verificar-instalacion-paquete-ubuntu/
# https://blog.desdelinux.net/pt/como-saber-si-un-paquete-se-encuentra-instalado-o-no-de-manera-facil-y-rapida/
# https://www.vivaolinux.com.br/script/Metodo-para-verificar-e-instalar-pacotes
# http://smokey01.com/yad/
# https://www.kabipan.com/densan/yad.html
# https://askubuntu.com/questions/894888/bash-template-to-use-zenity-or-yad-to-insert-edit-delete-records-in-a-file



clear


# ----------------------------------------------------------------------------------------

# Arquivo de log

log="/tmp/thumbnail-YouTube.log"


# Remove o arquivo de log caso ele existe

rm -Rf "$log"

# ----------------------------------------------------------------------------------------

# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor

# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados


which yad            2> /dev/null || { echo "Programa Yad não esta instalado."   ; exit ; }

which notify-send    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa notify-send não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }


# Esses são dois programas muito úteis para manipular vídeos e imagens.

which yt-dlp    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa yt-dlp não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which convert    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa ImageMagick não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }



# ----------------------------------------------------------------------------------------

# Os aplicativos KDE não abrem ou visualizam imagens .webp no Void Linux
#
# Pacotes ausentes: kimageformats e qt5-imageformats 
#
# $ xbps-query -Rs webp
# [-] imlib2-webp-1.12.1_1       WebP loader for Imlib2 (transitional dummy package)
# [*] libsharpyuv-1.3.2_1        Library to expose libwebp's sharpyuv functionality
# [-] libsharpyuv-devel-1.3.2_1  Library to expose libwebp's sharpyuv functionality - development files
# [*] libwebp-1.3.2_1            WebP image format
# [-] libwebp-devel-1.3.2_1      WebP image format - development files
# [*] libwebp-tools-1.3.2_1      WebP image format - tools
# [-] urlwatch-2.28_1            Tool for monitoring webpages for updates
# [*] webp-pixbuf-loader-0.2.4_1 WebP Image format loader for GdkPixbuf
#


# Suporte WebP


# Listando pacotes instalados




# Verificar qual a sua distribuição linux


if [ -n "$(which xbps-query 2> /dev/null)" ]; then

# Para Void Linux

xbps-query -l | grep -i webp-pixbuf-loader || exit





elif [ -n "$(which dpkg 2> /dev/null)" ]; then
 
# Para Debian

dpkg -l | grep -i webp-pixbuf-loader || exit

# dpkg-query --list | grep -i webp-pixbuf-loader || exit


else

echo "
Distribuição linux desconhecida.

O suporte atualmente é para Void Linux e derivado do Debian.
"

exit

fi 



# O Gthumb visualiza o formato webp

which gthumb


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


# Local onde salvar a thumbnail do vídeo do YouTube

# local="$HOME"

# cd ~/


# Selecione para abertura como padrão a pasta $HOME/ do usuário.

local=$(yad \
            --center \
            --file \
            --directory --filename=$HOME/ \
            --window-icon "/usr/share/icons/extras/youtube.png" \
            --title="Selecione um diretório para salvar o arquivo" \
            --width="1500" \
            --height="800" 2> /dev/null)


# ------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$local" ];then

yad \
--center \
--title='Aviso' \
--image=dialog-error \
--text='\n\nVocê precisa informar uma pasta para salvar o arquivo...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


clear


exit 5

fi

# ------------------------------------------------------------------------------------

# Verificar se tem permissões para gravar na pasta.

ls -l "$local" >/dev/null

if [ "$?" == "0" ];
then 

      echo -e "\nOK\n"


else 

     yad \
     --center \
     --title='Aviso' \
     --image=dialog-error \
     --text='\n\nVocê não tem acesso a pasta '$local'...\n\n' \
     --timeout=10 \
     --no-buttons 2>/dev/null

     exit
     
fi

# ------------------------------------------------------------------------------------



cd "$local"


# ----------------------------------------------------------------------------------------



# link_do_video_do_youtube="$1"


link_do_video_do_youtube=$(yad \
--center \
--entry \
--window-icon "/usr/share/icons/extras/youtube.png" \
--title="yt-dlp - baixar áudio de vídeo" \
--text="Qual o link do vídeo que você deseja baixar o áudio?" \
--entry-text="" \
--width=700 --entry \
2> /dev/null)

# ----------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$link_do_video_do_youtube" ];then


yad \
--center \
--image=dialog-error \
--title='Aviso' \
--text='\n\nVocê precisa informar um link de um video na internet...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


clear


exit 

fi

# ----------------------------------------------------------------------------------------

# Você precisa copiar o link do vídeo do youtube que você quer baixar a thumbnail. 

yt-dlp --skip-download --write-thumbnail "$link_do_video_do_youtube" 2>> "$log"


# Esse comando vai baixar apenas a thumbnail do vídeo, sem baixar o vídeo inteiro. O 
# --skip-download significa que você não quer baixar o vídeo, e o --write-thumbnail 
# significa que você quer baixar a thumbnail.
#
#
# O problema é que a thumbnail vem em um formato chamado webp, que nem todos os programas 
# conseguem abrir. Então, nós vamos converter ela para um formato mais comum, como png.


# convert *.webp thumbnail.png


# Esse comando vai converter todos os arquivos com a extensão webp para png, e vai dar 
# o nome de thumbnail.png para a imagem convertida. O convert é um programa do 
# imagemagick que permite fazer várias conversões e edições de imagens.


notify-send \
-t 100000 \
-i /usr/share/icons/extras/youtube.png  \
'Atenção!' \
"
Link do vídeo: $link_do_video_do_youtube
Local da thumbnail do vídeo: $local

Arquivo de log: $log


Pronto! Agora você tem a thumbnail do vídeo do YouTube em um formato .png ou .webp, que você pode usar como quiser."


 
exit 0

