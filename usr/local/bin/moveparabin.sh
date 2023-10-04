#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     04/10/2023 as 04:23
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
# 
#
#
# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml
#
#
#
#
# Na opção do Thunar coloca => /usr/local/bin/moveparabin.sh "%F"




clear

# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados


which yad   2> /dev/null || { echo "Falta o yad"    ; exit 1; }

which xfce4-terminal   2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa xfce4-terminal não esta instalado."    --width 450 --height 100 2>/dev/null   ; exit 2; }

which mv   2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa mv não esta instalado."    --width 450 --height 100 2>/dev/null   ; exit 3; }


# ----------------------------------------------------------------------------------------

# Verificar se o diretório /usr/local/bin/ existe
#
# -d nos ajuda a saber se o diretório existe, se mudarmos -d para -f é para verificar a existência de arquivos.


if [ -d /usr/local/bin/ ];
then

echo "
Diretório /usr/local/bin/ existe...
"



xfce4-terminal --title='Mova os scripts para a pasta /usr/local/bin/'  -e 'su -c "mv -i  '"$1"' /usr/local/bin/ ; sleep 5"'


else


echo "
Diretório /usr/local/bin/ não existe...

"

# yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Diretório /usr/local/bin/ não existe..."    --width 450 --height 100 2>/dev/null 


exit 4


fi

# ----------------------------------------------------------------------------------------




exit 0

