#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     30/09/2023 as 18:48
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml
#
#
# O ExifTool é ótimo porque permite que você leia, escreva e edite informações de metadados. Ele 
# também reconhece a maioria dos formatos de imagem. Além de remover os metadados, também pode 
# ajudá-lo a modificar os metadados, exibir informações específicas e muito mais.


# Na opção do Thunar colocar => /usr/local/bin/removedor-de-metadados-de-arquivos.sh %N



# https://www.dz-techs.com/pt/remove-exif-metadata-from-photos
# https://semanickz.wordpress.com/2017/10/30/linux-obterapagar-informacao-metadata-de-imagens-jpg-e-png-pelo-terminal/
# https://www.youtube.com/watch?v=fa1QBpTDV1s



# Verificar se os programas estão instalados

clear


# which yad            2> /dev/null || { echo "Falta o yad"         ; exit 1; }
# which thunar         2> /dev/null || { echo "Falta o Thunar"      ; exit 2; }

which exiftool       2> /dev/null || { echo "Falta o exiftool"    ; exit 3; }
which notify-send    2> /dev/null || { echo "Falta o exiftool"    ; exit 4; }



arquivo="$1"


cd "$PWD"

log=$(echo $PWD/"$1".log)


echo "
Diretório atual: $PWD
"


# killall -9 exiftool
# pkill exiftool


echo -e "\nRemovedor de metadados de arquivos\n"

# Isso fornecerá todos os detalhes dos metadados do arquivo selecionado.

echo "
Removedor de metadados de arquivos


Esse arquivo foi gerado pelo script: $(basename "$0")


------------------------------------------------------------------------------------------" | tee -a "$log"

echo -e "\nMetadados do arquivo $arquivo antes da remoção:\n" | tee -a "$log"

exiftool "$arquivo" | tee -a "$log"


# Depois de visualizar todos os metadados anexados à imagem, é hora de removê-los completamente. Para fazer isso, basta: 


echo -e "\nRemovendo os metadados do arquivo $arquivo ...\n"

exiftool -all= "$arquivo" 2>> "$log"

echo "
------------------------------------------------------------------------------------------" | tee -a "$log"

# Gera um backup do arquivo na pasta atual => $1_original


echo -e "\nMetadados do arquivo $arquivo depois da remoção:\n" | tee -a "$log"

exiftool "$arquivo" | tee -a "$log"

echo "
------------------------------------------------------------------------------------------
" | tee -a "$log"



notify-send \
-i gtk-dialog-info  \
-t 200000 "Remoção de metadados de arquivo..." "

Verifique o arquivo de log:

$log

"


exit 0

