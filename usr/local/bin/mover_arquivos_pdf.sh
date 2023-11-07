#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     07/11/2023 as 15:31
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
# Versão:   20231107
# Script:   mover_arquivos_pdf.sh
#
# Objetivo: Move os arquivos PDF para as pastas conforme o mes e o ano da criação dos arquivos.
#
# 
#
#
# 
# Modo de usar:
#
# $ mover_arquivos_pdf.sh  diretorio_origem   diretorio_destino
#
#
# Ex:
#
# ls -lh --time-style=+"%d/%m/%Y" 46332896.pdf 
# -rw-r--r-- 1 fernando fernando 1,3M 25/10/2022 46332896.pdf
#
# ls -lh --time-style=+"%d/%m/%Y" xubuntu-documentation-A4.pdf 
# -rw-r--r-- 1 fernando fernando 463K 08/10/2023 xubuntu-documentation-A4.pdf
#
# 
# mv -i xubuntu-documentation-A4.pdf backup/2023/10 outubro
#
#
# ls -lh --time-style=+"%d/%m/%Y"  *.pdf
#
#
#
# https://terminalroot.com.br/2015/07/30-exemplos-do-comando-sed-com-regex.html
# https://www.hostinger.com.br/tutoriais/como-verificar-o-uso-de-espaco-em-disco-no-linux



# ----------------------------------------------------------------------------------------

# Diretório onde os arquivos estão

diretorio_origem="$1"


# Diretório onde os arquivos serão movidos

diretorio_destino="$2"


# Arquivo de log

log="/tmp/pdf.log"


# ----------------------------------------------------------------------------------------

# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor

# ----------------------------------------------------------------------------------------

clear

echo -e "\n${GREEN}
Modo de usar:

$ $(basename $0)  diretorio_origem   diretorio_destino

${NC}"


        
# ----------------------------------------------------------------------------------------


# Verificar se as variaveis acima estão nulas.


if [ -z $diretorio_origem ]; then

		echo -ne "${RED} Você não forneceu uma pasta de origem dos arquivos PDF.\n\n ${NC}" | tee -a "$log"
		
		exit
		
fi

# ----------------------------------------------------------------------------------------

if [ -z $diretorio_destino ]; then

		echo -ne "${RED} Você não forneceu uma pasta de destino dos arquivos PDF.\n\n ${NC}" | tee -a "$log"
		
		exit
		
fi

# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados


which mkdir || exit
which cp    || exit
which mv    || exit
which rsync || exit
which tree  || exit
which rm    || exit
which date  || exit
which cat   || exit
which sed   || exit

# ----------------------------------------------------------------------------------------

clear

rm -Rf "$log"


cd $HOME

# ----------------------------------------------------------------------------------------

 


echo "
Arquivos PDF na pasta: $diretorio_origem

" >> "$log"


# ----------------------------------------------------------------------------------------

# Inicio do loop para mover cada arquivo PDF

for arquivo in "$diretorio_origem"/*.pdf; do
if [ -f "$arquivo" ]; then
ano=$(date -r "$arquivo" +"%Y")
mes=$(date -r "$arquivo" +"%m-%B" | tr [:upper:] [:lower:] | sed 's/-/ /')

# Cria a pasta de destino, caso não exista
mkdir -p "$diretorio_destino/$ano/$mes"

# Move o arquivo para a pasta correta

# date -r "$arquivo" +"%d-%m-%Y" >> "$log"

echo "
Copiando o arquivo $arquivo para  $diretorio_destino/$ano/$mes
"

# mv -i "$arquivo" "$diretorio_destino/$ano/$mes"

cp -a "$arquivo" "$diretorio_destino/$ano/$mes"


echo -e "$(date -r "$arquivo" +"%d-%m-%Y")  =>  $arquivo \n" >> "$log"

fi



done

# Fim do loop

# ----------------------------------------------------------------------------------------


echo "
Arquivos PDF na pasta: $diretorio_destino

" >> "$log"

tree "$diretorio_destino" >> "$log"

# Inclue texto no início da linha 1


sed -i '1s/^/\nÚtil para organizar os arquivos .xml do setor de Contabilidade da sua empresa.\n\nArquivo de log do script '$(basename $0)': \n\n/' "$log"


# ----------------------------------------------------------------------------------------

# Qual o tamanho total da pasta especificada
  
echo "
Pasta de destino com:
" >> "$log"  
du -sh $diretorio_destino  >> "$log"

# ----------------------------------------------------------------------------------------

# Visualizar o arquivo de log gerado no final do processo

cat "$log"

# ----------------------------------------------------------------------------------------


exit 0


