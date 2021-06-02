#!/bin/bash

clear

titulo="Remove as fontes problematicas do sistema"


log="/tmp/fontes-problematicas.log"

rm -Rf "$log"


which zenity


# -----------------------------------------------------------------------------------------------------

# Diretório das fontes problematicas

diretorio=$(zenity \
--entry \
--title="$titulo" \
--text "Informe a pasta de destino das fontes." \
--entry-text "$HOME/.fonts" 2> /dev/null)



# -----------------------------------------------------------------------------------------------------

clear

# Aborta se a variavel diretorio estiver vazia

[ -z "${diretorio}" ] && clear && echo "Tem que informa uma pasta." && exit 2

# -----------------------------------------------------------------------------------------------------

clear

# Verificar se diretorio existe

if [ ! -d "$diretorio" ]; then

echo "
Pasta $diretorio não localizada.
"

    exit 1
fi

# -----------------------------------------------------------------------------------------------------


echo "Com problema no libreoffice writer"

find "$diretorio" -iname "segoeuil_0.ttf" -exec rm {} \; 2> "$log"


echo "Com problema no e-mail"

find "$diretorio" -iname "Helvetica-Black-SemiBold.ttf"  -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "Helvetica-Black.otf"           -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "Helvetica-BlackOblique.otf"    -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "Helvetica-Light.otf"           -exec rm {} \; 2>> "$log"


echo "Com problema com a fonte times new roman no libreoffice writer"

find "$diretorio" -iname "Locust Regular.ttf"           -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "Pudmonkey Regular.ttf"        -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "BLACKNIT.TTF"                 -exec rm {} \; 2>> "$log"



echo "Com problema no e-mail e no terminal do xfce"

find "$diretorio" -iname "VeraMoBd.ttf"                 -exec rm {} \; 2>> "$log"



echo "Problema com gedit e terminal"

find "$diretorio" -iname "VeraIt.ttf"                  -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "VeraMoBd.ttf"                -exec rm {} \; 2>> "$log"


echo "Problema com o site vol"

find "$diretorio" -iname "Helvetica-Narrow.otf"              -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaCE-Bold.otf"              -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaInseratLTStd-Roman.otf"   -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-Blk.otf"            -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-BlkCond.otf"        -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-BlkCondObl.otf"     -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-BlkObl.otf"         -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-Bold.otf"           -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-BoldCond.otf"       -exec rm {} \; 2>> "$log"




echo "
Problema com fonte: Kristen ITC-9 quando usa o ~/.fluxbox/styles/royal_red_antix/


Remove a fonte ITCKRIST.TTF do sistema. 

Esta também na pasta de fonte do Windows 10 Pro 64 bit.

"


find "$diretorio" -iname "ITCKRIST.TTF"       -exec rm {} \; 2>> "$log"




# Falta identificar o problema
#
# find "$diretorio" -iname "OpenSans-Bold.ttf"               -exec rm {} \; 2>> "$log" 
# find "$diretorio" -iname "OpenSans-BoldItalic.ttf"         -exec rm {} \; 2>> "$log" 
# find "$diretorio" -iname "OpenSans-ExtraBold.ttf"          -exec rm {} \; 2>> "$log" 
# find "$diretorio" -iname "OpenSans-ExtraBoldItalic.ttf"    -exec rm {} \; 2>> "$log" 
# find "$diretorio" -iname "OpenSans-Italic.ttf"             -exec rm {} \; 2>> "$log" 
# find "$diretorio" -iname "OpenSans-Light.ttf"              -exec rm {} \; 2>> "$log" 
# find "$diretorio" -iname "OpenSans-LightItalic.ttf"        -exec rm {} \; 2>> "$log" 
# find "$diretorio" -iname "OpenSans-Regular.ttf"            -exec rm {} \; 2>> "$log" 
# find "$diretorio" -iname "OpenSans-SemiBold.ttf"           -exec rm {} \; 2>> "$log" 
# find "$diretorio" -iname "OpenSans-SemiBoldItalic.ttf"     -exec rm {} \; 2>> "$log" 


# -----------------------------------------------------------------------------------------------------



zenity --info --title="RESULTADO" --text="Leia o arquivo em: $log." --width=800 --height=150  2> /dev/null

sleep 2
clear


# /usr/bin/xdg-open: line 781: x-www-browser: comando não encontrado

xdg-open "$log"


exit 0

