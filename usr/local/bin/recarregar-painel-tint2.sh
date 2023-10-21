#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     02/10/2023 as 22:07
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#

# Verificar se os programas estão instalados

clear

which tint2       2> /dev/null || { echo "Falta o Tint2"    ; exit 1; }



# Não estava recarregando o painel Tint2 no menu do OpenBox
       
# Recarregar Tint2
    
echo "
Recarregando o painel Tint2...
"
    
killall -9 tint2 ; tint2 &
    
# pkill tint2 ; tint2 &


exit 0
     
