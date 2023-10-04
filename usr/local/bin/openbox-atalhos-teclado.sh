#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     02/10/2023 as 11:28
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#



clear

# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados


which yad            2> /dev/null || { echo "Programa yad não esta instalado."   ; exit ; }

which notify-send    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa notify-send não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which xdg-open    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa xdg-open não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which openbox    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa openbox não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }


# ----------------------------------------------------------------------------------------


# Verificar se o arquivo $HOME/.config/openbox/rc.xml existe


if [ -e "$HOME/.config/openbox/rc.xml" ] ; then

clear

echo "O arquivo $HOME/.config/openbox/rc.xml existe."



xdg-open $HOME/.config/openbox/rc.xml 2> /dev/null && /usr/bin/openbox --reconfigure


notify-send \
-i gtk-dialog-info  \
-t 200000 "Atalhos do techado no OpenBox..." "

Atalhos atualizados em: `date +%d/%m/%Y-%H:%M` 
"


else

clear

echo "O arquivo $HOME/.config/openbox/rc.xml não existe."

# yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$HOME/.config/openbox/rc.xml' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "\n\nNão foi possível acessar $HOME/.config/openbox/rc.xml arquivo inexistente!" --width 650 --height 100 2>/dev/null 

clear

fi

# ----------------------------------------------------------------------------------------



exit 0

