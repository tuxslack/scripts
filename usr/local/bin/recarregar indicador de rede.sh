#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     04/10/2023 as 19:58
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL

clear


# Verificar se os programas estão instalados

which nm-applet       2> /dev/null || { echo "Falta o nm-applet"    ; exit 1; }


echo "
Recarregando o nm-applet...
"

killall -9 nm-applet ; nm-applet &


exit 0


