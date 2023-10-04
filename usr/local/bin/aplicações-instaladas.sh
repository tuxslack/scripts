#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     04/10/2023 as 20:03
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
# Usado no OpenBox, Fluxbox e i3 para visualizar as aplicações instaladas.
#
#
# Lista os arquivos das pastas ~/.local/share/applications e /usr/share/applications.
#
# Tente colocar o seu arquivo .desktop nas pastas acima e depois visualize por esse script.
#
#
#
# NOTA: 
#
# Para que os arquivos .desktop  possam aparecer na tela do Yad os arquivos deverão esta 
# na raiz das pastas ~/.local/share/applications e /usr/share/applications e não em subpastas.


# A imagem da opção icon deve ter 64x64, 96x96 pixéis no arquivo .desktop

# $HOME/.icons/extras/




# https://www.vivaolinux.com.br/topico/Linux-Basico/Arquivos-desktop-nao-funcionam-no-Ubuntu
# https://askubuntu.com/questions/434269/unity-launcher-wont-update-the-shortcuts-after-update-desktop-database-only-af
# https://askubuntu.com/questions/1307431/update-mime-database-is-the-bottle-neck-of-apt-intall-now-any-workaround
# https://www.cyberciti.biz/howto/how-to-install-and-edit-desktop-files-on-linux-desktop-entries/
# https://www.reddit.com/r/Fedora/comments/wemp5m/applications_not_listing_desktop_files_i_created/


clear



# ========================================================================================

# Verificar se os programas estão instalados


which yad                         2> /dev/null || { echo "Programa Yad não esta instalado."      ; exit ; }


which update-desktop-database     2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa update-desktop-database não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }


# ========================================================================================

# updatedb

# update-desktop-database

update-desktop-database ~/.local/share/applications/


# ls -l ~/.local/share/applications/ | wc -l

# ls -l /usr/share/applications/ | wc -l


# ========================================================================================


# Verificar se o diretório $HOME/.local/share/applications/ existe
#
# -d nos ajuda a saber se o diretório existe, se mudarmos -d para -f é para verificar a existência de arquivos.

if [ -d $HOME/.local/share/applications/ ];
then


yad \
--center \
--title='Aplicações instaladas' \
--image="dialog-information" \
--icons \
--read-dir="$HOME/.local/share/applications/" \
--width="1500" --height="1900" \
2>/dev/null &


else


yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Diretório $HOME/.local/share/applications/ não existe..." --width 450 --height 100 2>/dev/null 

fi


# ========================================================================================


# Verificar se o diretório /usr/share/applications/ existe
#
# -d nos ajuda a saber se o diretório existe, se mudarmos -d para -f é para verificar a existência de arquivos.

if [ -d /usr/share/applications/ ];
then

yad \
--center \
--title='Aplicações instaladas' \
--image="dialog-information" \
--icons \
--read-dir="/usr/share/applications/" \
--width="1500" --height="1900" \
2>/dev/null

else

yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Diretório /usr/share/applications/ não existe..." --width 450 --height 100 2>/dev/null 


fi

# ========================================================================================


exit 0

