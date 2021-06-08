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


echo "
Com problema no Libreoffice Writer
"

find "$diretorio" -iname "segoeuil_0.ttf" -exec rm {} \; 2> "$log"


echo "
Com problema no e-mail (Thunderbird)
"

find "$diretorio" -iname "Helvetica-Black-SemiBold.ttf"  -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "Helvetica-Black.otf"           -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "Helvetica-BlackOblique.otf"    -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "Helvetica-Light.otf"           -exec rm {} \; 2>> "$log"


echo "
Com problema com a fonte 'times new roman' no Libreoffice Writer
"

find "$diretorio" -iname "Locust Regular.ttf"           -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "Pudmonkey Regular.ttf"        -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "BLACKNIT.TTF"                 -exec rm {} \; 2>> "$log"



echo "
Com problema no e-mail (Thunderbird) e no terminal do Xfce (xfce4-terminal)
"

find "$diretorio" -iname "VeraMoBd.ttf"                 -exec rm {} \; 2>> "$log"



echo "
Problema com Gedit e terminal do Xfce (xfce4-terminal)
"

find "$diretorio" -iname "VeraIt.ttf"                  -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "VeraMoBd.ttf"                -exec rm {} \; 2>> "$log"


echo "
Problema com o site VOL

https://www.vivaolinux.com.br/

"

find "$diretorio" -iname "Helvetica-Narrow.otf"              -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaCE-Bold.otf"              -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaInseratLTStd-Roman.otf"   -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-Blk.otf"            -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-BlkCond.otf"        -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-BlkCondObl.otf"     -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-BlkObl.otf"         -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-Bold.otf"           -exec rm {} \; 2>> "$log"
find "$diretorio" -iname "HelveticaLTStd-BoldCond.otf"       -exec rm {} \; 2>> "$log"



# =====================================================================================================


clear


echo "
Problema com fonte: Kristen ITC-9 quando usa o ~/.fluxbox/styles/royal_red_antix/


Remove a fonte ITCKRIST.TTF do sistema. 

Esta também na pasta de fonte do Windows 10 Pro 64 bit.


Fonte ITCKRIST.TTF é do Pacote Office Pro 2019 Plus

"


echo "
Buscando a fonte ITCKRIST.TTF...

"

sleep 5


# Não esta validando o if com find: verdadeiro ou falso

# find "$diretorio" -iname "ITCKRIST.TTF" -exec ls {} \;

find "$diretorio" -iname "ITCKRIST.TTF" -exec echo -e "Encontrei:" {} \; > /tmp/buscar_fonte.txt

busca=$(cat /tmp/buscar_fonte.txt)


# Verificar se a variavel "$busca" esta vazia

if [ -z "${busca}" ]; then

    clear

    echo -e "Não encontrei a fonte ITCKRIST.TTF" 

else

    clear

    echo -e "Encontrei a fonte ITCKRIST.TTF" && cat /tmp/buscar_fonte.txt


# Utilizar o comando FIND junto com o comando TAR (Find + TAR)


# find ~/.fonts -iname "ITCKRIST.TTF" | tar --files-from - -czpf ~/.fonts/ITCKRIST.tgz



# find "$diretorio" -iname "ITCKRIST.TTF" | tar --files-from - -czpf "$diretorio"/ITCKRIST.tgz  2>> "$log"


# Acessar o local onde esta o arquivo e compactar e depois remove o arquivo localizado.



# ITCKRIST.TTF.tar.xz

# Ex: find ~/.fonts -iname "ITCKRIST.TTF" | tar --files-from - -Jcf ~/.fonts/ITCKRIST.tar.xz


cd "$diretorio"

find . -iname "ITCKRIST.TTF" | tar --files-from - -Jcf "$diretorio"/ITCKRIST.tar.xz 2>> "$log"



# https://www.vivaolinux.com.br/topico/Shell-Script/Find-+-TAR
# http://www.zago.eti.br/tar.html



find "$diretorio" -iname "ITCKRIST.TTF"       -exec rm {} \; 2>> "$log"




fi


rm -Rf /tmp/buscar_fonte.txt



# https://www.vivaolinux.com.br/topico/Shell-Script/Comando-find-10
# https://qastack.com.br/server/7503/how-to-determine-if-a-bash-variable-is-empty


# =====================================================================================================



echo '

Fontes que vem no arquivo zip baixado da internet

Vera.ttf
VeraBI.ttf
VeraBd.ttf


Remove essa fonte VeraBI.ttf (fonte problematica no qbitorrent e no Thunar)


$ file VeraBI.ttf 
VeraBI.ttf: TrueType Font data, 17 tables, 1st "OS/2", 22 names, Macintosh, Copyright (c) 2003 by Bitstream, Inc. All Rights Reserved.Bitstream Vera Sans Bold ObliqueRelea

'


find "$diretorio" -iname "VeraBI.ttf"       -exec rm {} \; 2>> "$log"






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

