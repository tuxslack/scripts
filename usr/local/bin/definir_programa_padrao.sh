#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     14/06/2023 as 13:08
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
# Definindo aplicativo padrão

# Método de configuração de aplicativos padrão em ambientes de desktop Linux.


# No xfce4 => xfce4-mime-settings



# Configurando o tipo MIME padrão para um aplicativo específico
#
# Um aplicativo padrão pode ser definido como um tipo MIME com o xdg-mime especificando o 
# arquivo {application_name}.desktop encontrado em /usr/share/applications/{application_name}.desktop
#
#
# xdg-mime query filetype 1.csv 
# inode/x-empty



# O comando xdg-open  no arquivo .conf esta abrindo com o libreoffice e não com o Gedit com o usuário Root.


# cat ~/.local/share/applications/mimeapps.list

# cat ~/.config/mimeapps.list | grep -i  text


# https://askubuntu.com/questions/628973/how-do-i-set-thunar-as-my-default-file-manager-in-15-04
# https://wiki.archlinux.org/title/XDG_MIME_Applications
# https://wiki.gentoo.org/wiki/Default_applications
# https://www.youtube.com/watch?v=-dHhL9Gf9Ss
# https://www.vivaolinux.com.br/dicas/impressora.php?codigo=25422



# Verificar se os programas estão instalados

which xdg-mime    || exit 1
which ffmpeg      || exit 2
which xdg-open    || exit 3


clear




# ------------------------------------------------------------------------------------------------


# Aqui você defini os programas que serão definidos como padrão para o sistema.


# Nomes dos programas nos arquivos das pastas /usr/share/applications/  e ~/.local/share/applications/


# Editor de texto padrão (Gedit)

editor_de_texto="org.gnome.gedit.desktop"



# Gerenciador de arquivo padrão (Thunar)
#
# Ex: 
#
# Thunar                     => xfce4-file-manager.desktop
# Dolphin                    => org.kde.dolphin.desktop    ou dolphin.desktop
# Nautilus                   => org.gnome.Nautilus.desktop ou nautilus.desktop
# PCManFM                    => pcmanfm.desktop
# Nemo (fork do Nautilus)    => 
# Caja                       => 



gerenciador_de_arquivo="xfce4-file-manager.desktop"



# Visualizado de arquivos PDF padrão (Master PDF Editor)

visualizado_de_arquivos_PDF="masterpdfeditor5.desktop"



# Visualizado de arquivos de imagens padrão (gthumb)

# ls  /usr/share/applications/ | grep -i gthumb
# org.gnome.gThumb.Import.desktop
# org.gnome.gThumb.desktop

visualizado_de_imagens="org.gnome.gThumb.desktop"



# Player de vídeo padrão (Parole)

player_de_video="org.xfce.Parole.desktop"



# Cliente torrent padrão (qBittorrent)

cliente_torrent="org.qbittorrent.qBittorrent.desktop"



# Player de áudio padrão (reprodutor de música - qmmp)

player_de_audio="qmmp-1.desktop"



# Liferea

# ls  /usr/share/applications/ | grep -i Liferea

visualizado_de_arquivos_rss="net.sourceforge.liferea.desktop"


# ------------------------------------------------------------------------------------------------



clear

# rm -Rf /root/.*



# ------------------------------------------------------------------------------------------------

echo "

Esse script pode ser usado pelo usuário comum e também pelo usuário Root para definir os programas padrão do sistema.


Defini programa como padrão para:

* Editor de texto
* Gerenciador de arquivo
* Visualizador de arquivo PDF
* Player de vídeo
* Cliente torrent
* Player de áudio
* Associa o player de áudio a arquivos .m3u
* Visualizador de arquivo de imagens
* Visualizador de arquivo .rss


É util para o caso de:

# rm -Rf /root/.*

ou

$ rm -Rf ~/.*


"

sleep 50

clear

# ------------------------------------------------------------------------------------------------

# Verificar se o diretório $HOME/.config/ existe
#
# -d nos ajuda a saber se o diretório existe, se mudarmos -d para -f é para verificar a existência de arquivos.


if [ -d $HOME/.config/ ];
then

echo "
Diretório $HOME/.config/ existe...
"


else


echo "
Diretório $HOME/.config/ não existe...

"

echo "
Criando o diretório $HOME/.config/ ...
"

mkdir -p $HOME/.config/



fi


# ------------------------------------------------------------------------------------------------

# Verificar se o arquivo $HOME/.config/mimeapps.list existe

if [ -e $HOME/.config/mimeapps.list ];
then

echo "
O arquivo $HOME/.config/mimeapps.list existe...
"

else


echo "
O arquivo $HOME/.config/mimeapps.list não existe...

"


fi

# ------------------------------------------------------------------------------------------------




# xdg-mime query filetype fluxbox.odt 
# application/vnd.oasis.opendocument.text
#
#
#
# Para descobrir o aplicativo padrão
#
# Padrão definido para arquivo .odt:
#
# xdg-mime query default application/vnd.oasis.opendocument.text
# libreoffice-writer.desktop





# Para definir o aplicativo padrão para um arquivo CSV como LibreOffice Calc:
#
# xdg-mime query filetype 1.csv 
# inode/x-empty
#
# xdg-mime default libreoffice-calc.desktop inode/x-empty
#
#
#
# Funciona no Void Linux:
#
#
# Definir o Gedit como editor de texto padrão para arquivo .csv...
#
# xdg-mime default "$editor_de_texto"  application/x-zerosize
#
#
# Definir o LibreOffice Calc como editor de texto padrão para arquivo .csv...
#
# xdg-mime default libreoffice-calc.desktop  application/x-zerosize




# ------------------------------------------------------------------------------------------------

# Definir o qmmp como player de áudio padrão 


# ls  /usr/share/applications/ | grep -i qmmp
# qmmp-1.desktop
# qmmp-dir-1.desktop
# qmmp-enqueue-1.desktop


echo "
Definindo o qmmp como player de áudio padrão para arquivos de áudio...
"

#
# Arquivo .m4a (No Root esta definido para abrir no Mplayer)
#
# Usando o comando file retorna =>  ISO Media, MP4 Base Media v1 [ISO 14496-12:2003]
#
#
# Para fazer o qmmp abrir arquivos .m4a por padrão, você pode usar o comando 
# xdg-mime. Primeiro, vamos conferir se o tipo do arquivo .m4a está corretamente 
# associado. Execute em seu terminal:
#
# xdg-mime query filetype arquivo.m4a
#
# Supondo que a saída seja "audio/x-m4a", por exemplo, você pode associar este 
# tipo de arquivo com o qmmp utilizando o seguinte comando:
#
# xdg-mime default qmmp.desktop audio/x-m4a 
#
# Se o comando acima não funcionar, certifique-se de que o arquivo qmmp.desktop esteja 
# disponível na sua pasta /usr/share/applications ou ~/.local/share/applications.
#
# Além disso, é importante confirmar se o qmmp suporta o formato .m4a. Para checar, utilize:
#
# qmmp-1 --formats  => retorna "Comando desconhecido"
#
#
# Se .m4a não estiver listado, isso significa que qmmp não suporta este formato natively 
# e você precisará instalar um plugin apropriado.
# 
# 
# Para converter o arquivo .m4a para "audio/x-m4a" sem perder a qualidade do áudio, você pode 
# usar o ffmpeg. Garanta primeiramente que o ffmpeg esteja instalado em sua máquina. Para isso, 
# você pode utilizar o comando:
# 
# apt-get install ffmpeg
# 
# Depois disso, você pode utilizar o seguinte comando para converter o arquivo .m4a para "audio/x-m4a".
# 
# ffmpeg -i entrada.m4a -vn -q:a 0 saída.m4a
# 
# Onde:
# - -i entrada.m4a é o arquivo de entrada
# - -vn é usado para desativar a gravação de vídeo.
# - -q:a 0 escolhe a qualidade do áudio (0 indica a melhor qualidade possível).
# - saída.m4a é o arquivo de saída.
# 
# É importante notar que o comando xdg-mime query filetype retorna o tipo MIME do arquivo de acordo 
# com o seu conteúdo, não sua extensão de arquivo. Logo, mesmo que o arquivo seja renomeado ou convertido 
# para .m4a, o tipo MIME pode não mudar se o conteúdo do arquivo não mudar.
# 
# 

xdg-mime default "$player_de_audio" audio/x-m4a




# Arquivo .ogg (No Root esta definido para abrir no VLC)
#
# Pelo Root essa opção não funciona => audio/ogg
#
# Definir o $player_de_audio como o programa padrão para abrir arquivos .ogg
#
#
# xdg-mime default "$player_de_audio" audio/ogg (não funciona)

xdg-mime default "$player_de_audio" audio/x-vorbis+ogg

# Você pode verificar se o comando teve sucesso usando o comando xdg-mime query. Este comando irá mostrar 
# qual é o programa padrão para abrir arquivos .ogg, veja o exemplo:
#
# xdg-mime query default audio/x-vorbis+ogg
#
# Se tudo estiver correto, o sistema deve retornar "qmmp.desktop" ou "qmmp-1.desktop" como resposta.




# Arquivo .mp3

xdg-mime default "$player_de_audio" audio/mpeg


# Arquivo .wav

xdg-mime default "$player_de_audio" audio/x-wav


# Associa o "$player_de_audio" a arquivos .m3u
#
#
# Para abrir um arquivo .m3u com o $player_de_audio através do xdg-mime
#
# Primeiro, você precisa verificar se o arquivo desktop qmmp-1.desktop já está associado aos arquivos .m3u. Para isto, execute o comando:
#
# xdg-mime query default audio/x-mpegurl
#
# Se o comando acima retornar "qmmp-1.desktop", significa que o qmmp já está associado a arquivos .m3u.
#
#
# Se não estiver, você pode associá-lo executando o seguinte comando:
#

xdg-mime default "$player_de_audio" audio/x-mpegurl


# Depois de associar o $player_de_audio a arquivos .m3u, você será capaz de abrir estes arquivos 
# simplesmente clicando neles no seu gerenciador de arquivos ou utilizando o comando "xdg-open" no terminal.




# ------------------------------------------------------------------------------------------------

# Definir o qBittorrent como cliente torrent padrão 


# xdg-mime query filetype "RoboCop 2 (1990) Bluray 720p Filmes M.H.G.torrent"
# application/octet-stream
#
# ls  /usr/share/applications/ | grep -i qbittorrent
# org.qbittorrent.qBittorrent.desktop


echo "
Definindo o qBittorrent como cliente torrent padrão para arquivo torrent...
"

xdg-mime default "$cliente_torrent" application/octet-stream


# ------------------------------------------------------------------------------------------------

# Definir o Parole como player de vídeo padrão 


echo "
Definindo o Parole como player de vídeo padrão para arquivos de vídeo...
"

# Arquivo .mp4

xdg-mime default "$player_de_video" video/mp4

# Arquivo .mkv

xdg-mime default "$player_de_video" video/x-matroska

# Arquivo .webm

xdg-mime default "$player_de_video" video/webm

# Arquivo .avi

xdg-mime default "$player_de_video" video/x-msvideo

# ------------------------------------------------------------------------------------------------

# Definir o Gthumb como visualizador de arquivo de imagens como padrão
#
#
# file background.tiff 
# background.tiff: TIFF image data, big-endian, direntries=18, height=416, bps=17, compression=none, PhotometricInterpretation=RGB, orientation=upper-left, width=678
#
#
# xdg-mime query filetype background.tiff 
# image/tiff


echo "
Definindo o Gthumb como visualizador de arquivo de imagens padrão...
"

# ------------------------------------------------------------------------------------------------

# O gThumb não visualiza arquivo .ico

# ------------------------------------------------------------------------------------------------

# Arquivo .png

xdg-mime default "$visualizado_de_imagens" image/png

# Arquivo .jpg

xdg-mime default "$visualizado_de_imagens" image/jpeg

# Arquivo .webp

xdg-mime default "$visualizado_de_imagens" image/webp

# Arquivo .tiff

xdg-mime default "$visualizado_de_imagens" image/tiff

# Arquivo .icns (MacOS)

xdg-mime default "$visualizado_de_imagens" image/x-icns


# ------------------------------------------------------------------------------------------------

# Definir o Gedit como editor de texto padrão 


echo "
Definindo o Gedit como editor de texto padrão para arquivos de texto simples...
"

xdg-mime default "$editor_de_texto" text/plain

# ------------------------------------------------------------------------------------------------

echo "
Definindo o Gedit como editor de texto padrão para arquivo .xml...
"

# Procurando o aplicativo padrão de um tipo MIME especificado

# xdg-mime query default inode/directory


# xdg-mime query filetype rc.xml 
# text/xml



xdg-mime default "$editor_de_texto" text/xml

# https://stackoverflow.com/questions/2060284/how-to-use-the-xdg-mime-command
# https://wiki.gentoo.org/wiki/Default_applications

# ------------------------------------------------------------------------------------------------


echo "
Definindo o Gedit como editor de texto padrão para arquivo .sh...
"


# Para verificar

# xdg-mime query filetype 5186.cadastro.sh 
# text/x-shellscript


xdg-mime default "$editor_de_texto" text/x-shellscript

# ------------------------------------------------------------------------------------------------


# Definir o Thunar como gerenciador de arquivo padrão

echo "
Gerenciador de arquivos que está em uso atualmente:
"

xdg-mime query default inode/directory


echo "

Definindo o Thunar como gerenciador de arquivo padrão...
"

xdg-mime default "$gerenciador_de_arquivo" inode/directory


# ------------------------------------------------------------------------------------------------

echo '
Definindo o "Master PDF Editor" como visualizador de arquivo PDF como padrão...
'

# $ cat ~/.config/mimeapps.list | grep "pdf"
# application/pdf=masterpdfeditor5.desktop;


# Para verificar

# xdg-mime query filetype  Dica.pdf 
# application/pdf



xdg-mime default "$visualizado_de_arquivos_PDF" application/pdf


# https://code-industry.net/get-masterpdfeditor/

# ------------------------------------------------------------------------------------------------


# Arquivo .rss

echo '
Definindo o "Liferea" como visualizador de arquivo .rss como padrão...
'

# ls  /usr/share/applications/ | grep -i Liferea
# net.sourceforge.liferea.desktop

# $ file tuxliban.rss 
# tuxliban.rss: XML 1.0 document, Unicode text, UTF-8 text

# $ xdg-mime query filetype  tuxliban.rss 
# application/rss+xml


# xdg-mime default "net.sourceforge.liferea.desktop" application/rss+xml


xdg-mime default "$visualizado_de_arquivos_rss" application/rss+xml


# ------------------------------------------------------------------------------------------------


# Verificar:

cat ~/.config/mimeapps.list


# cat /usr/share/applications/mimeinfo.cache


echo "
Para testar:

Gerenciador de arquivo

xdg-open /tmp/


Editor de arquivo de texto

xdg-open /etc/fstab



# Espera 1 minutos para fecha.

"

sleep 1m


exit 0

