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
# http://ti1.free.fr/index.php/yad-les-listes/
# https://stackoverflow.com/questions/64242109/why-is-this-yad-list-code-not-working-correctly
# https://www.contabeis.com.br/forum/contabilidade/379796/extencao-de-arquivo-invalida-exclua-este-arquivo-conectividade-v2/
# https://atendimento.nasajon.com.br/nasajon/artigos/6f6614c1-f279-451a-b54a-f244664cbf0a
# https://blog.fortestecnologia.com.br/fortes-contabil/importacao-planilhas-extensao-csv-sistema-contabil/
# https://suporte.dominioatendimento.com/central/faces/solucao.html?codigo=1922
# https://www.rech.com.br/blog/2009-02-sped-fiscal-efd-escrituracao-fiscal-digital/
# https://www.barroscontabilidadetaubate.com.br/noticias/tecnicas/2022/05/17/passo-a-passo-para-enviar-a-gfip-utilizando-o-novo-conectividade-social.html
# https://forums.bunsenlabs.org/viewtopic.php?id=1978&p=10
# https://pclosmag.com/html/Issues/201508/page06.html
# https://unix.stackexchange.com/questions/594129/problem-with-yad-and-variables-spaces-its-arguments
# https://www.youtube.com/watch?v=APqUavF5qMI
# http://smokey01.com/yad/



clear


# ----------------------------------------------------------------------------------------

# Arquivo de log

log="/tmp/pdf.log"

rm -Rf "$log"

# ----------------------------------------------------------------------------------------


titulo="Organize seus arquivos - Contabilidade"
imagem="/usr/share/icons/extras/organize_xml.png"


# ----------------------------------------------------------------------------------------

# Cores para formatação da saída dos comandos.

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor

# ----------------------------------------------------------------------------------------


# Verificar se os programas estão instalados.


which yad     2> /dev/null || { echo "Programa Yad não esta instalado."      ; exit ; }


which notify-send   2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa notify-send não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which mkdir   2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa mkdir não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which cp      2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa cp não esta instalado."    --width 450 --height 100 2>/dev/null   ; exit ; }

which mv      2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa mv não esta instalado."    --width 450 --height 100 2>/dev/null   ; exit ; }

which rsync   2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa rsync não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which tree    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa tree não esta instalado."  --width 450 --height 100 2>/dev/null   ; exit ; }

which rm      2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa rm não esta instalado."    --width 450 --height 100 2>/dev/null   ; exit ; }

which date    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa date não esta instalado."  --width 450 --height 100 2>/dev/null   ; exit ; }

which cat     2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa cat não esta instalado."   --width 450 --height 100 2>/dev/null   ; exit ; }

which sed     2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa sed não esta instalado."   --width 450 --height 100 2>/dev/null   ; exit ; }


# ----------------------------------------------------------------------------------------


# echo -e "\n${GREEN}
# Modo de usar:
# 
# $ $(basename $0)  diretorio_origem   diretorio_destino
# 
# ${NC}"

# ----------------------------------------------------------------------------------------

# As extensões de arquivos para a Contabilidade

# Formatos de arquivo de Contabilidade


# pdf
# xml
# ofx
# txt
# mdb
# prf
# csv
# nli
# rtf
# aut
# rqr
# rec
# SFP
# ICP


# yad --list --column=Select:chk --column=Comment:text true pdf false xml

# Para varias opções =>  --list --checklist \


extensao=$(yad \
--center  \
--title="Selecione um tipo de extensão" \
--window-icon "$imagem" \
--text="Somente marque uma extensão." \
--list --radiolist \
--column=Marcar --column=Extensão \
true  "pdf" \
false "xml" \
false "ofx" \
false "txt" \
false "mdb" \
false "prf" \
false "csv" \
false "nli" \
false "rtf" \
false "aut" \
false "rqr" \
false "rec" \
false "sfp" \
false "icp" \
--width 400 --height 600 \
2> /dev/null)



# TRUE|pdf|
# TRUE|xml|

extensao=$(echo "$extensao" | cut -d '|' -f2)



# ----------------------------------------------------------------------------------------

# Diretório onde os arquivos estão

# diretorio_origem="$1"


# yad \
# --center \
# --entry \
# --window-icon "$imagem" \
# --title="$titulo" \
# --text="Qual a pasta de origem dos arquivos $extensao?" \
# --entry-text="" \
# --width=700 --entry \
# 2> /dev/null


diretorio_origem=$(yad --center --file --directory --window-icon "$imagem" --title="$titulo" --text="Qual a pasta de origem dos arquivos $extensao?" --width=900 --height=800 2> /dev/null)

# ----------------------------------------------------------------------------------------

# Verificar se as variaveis acima estão nulas.


if [ -z $diretorio_origem ]; then

		# echo -ne "${RED} Você não forneceu uma pasta de origem dos arquivos $extensao.\n\n ${NC}" | tee -a "$log"
		
		yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Você não forneceu uma pasta de origem dos arquivos $extensao." --width 500 --height 100 2>/dev/null 
		
		exit
		
fi

# ----------------------------------------------------------------------------------------

# Diretório onde os arquivos serão movidos

# diretorio_destino="$2"


# yad \
# --center \
# --entry \
# --window-icon "$imagem" \
# --title="$titulo" \
# --text="Qual a pasta de destino dos arquivos $extensao?" \
# --entry-text="" \
# --width=700 --entry \
# 2> /dev/null


diretorio_destino=$(yad --center --file --directory --window-icon "$imagem" --title="$titulo" --text="Qual a pasta de destino dos arquivos $extensao?" --width=900 --height=800 2> /dev/null)

# ----------------------------------------------------------------------------------------

if [ -z $diretorio_destino ]; then

		# echo -ne "${RED} Você não forneceu uma pasta de destino dos arquivos $extensao.\n\n ${NC}" | tee -a "$log"
		
		yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Você não forneceu uma pasta de destino dos arquivos $extensao." --width 500 --height 100 2>/dev/null 
		
		exit
		
fi

# ----------------------------------------------------------------------------------------

clear

cd $HOME

# ----------------------------------------------------------------------------------------


echo "
Arquivos $extensao na pasta: $diretorio_origem

" >> "$log"


# ----------------------------------------------------------------------------------------

# Inicio do loop para mover cada arquivo PDF


for arquivo in "$diretorio_origem"/*.pdf; do
if [ -f "$arquivo" ]; then
ano=$(date -r "$arquivo" +"%Y")
mes=$(date -r "$arquivo" +"%m-%B" | tr [:upper:] [:lower:] | sed 's/-/ /')


# Cria a pasta de destino, caso não exista.

mkdir -p "$diretorio_destino/$ano/$mes"


# Move o arquivo para a pasta correta.

# date -r "$arquivo" +"%d-%m-%Y" >> "$log"

echo "
Copiando o arquivo $arquivo para  $diretorio_destino/$ano/$mes
"

# mv -i "$arquivo" "$diretorio_destino/$ano/$mes"

# cp -a "$arquivo" "$diretorio_destino/$ano/$mes"



rsync -avht --progress "$arquivo" "$diretorio_destino/$ano/$mes"  2>> "$log"


# -a
# Modo archive (arquivamento). Copia os arquivos e diretórios recursivamente (como -r) e 
# preserva links simbólicos, permissões de arquivos, propriedades de usuário e grupo 
# (ownership) e timestamps.

# -v
# Modo verboso, que mostra detalhes sobre a transferência de arquivos.

# -h
# Números são representados em formato legível por humanos

# --progress
# Mostrar o progresso da cópia de arquivos ao transferir os dados


# -t  Preserva datas.


# http://www.bosontreinamentos.com.br/linux/10-exemplos-do-comando-rsync-para-backup-e-sincronismo-de-arquivos-no-linux/
# https://terminalroot.com.br/2021/05/10-exemplos-de-uso-do-comando-rsync.html
# https://www.hostgator.com.br/blog/utilizar-comando-rsync-do-linux/



echo -e "$(date -r "$arquivo" +"%d-%m-%Y")  =>  $arquivo \n" >> "$log"

fi



done


# Fim do loop


# ----------------------------------------------------------------------------------------


echo "
Arquivos $extensao na pasta: $diretorio_destino

" >> "$log"

tree "$diretorio_destino" >> "$log"

# Inclue texto no início da linha 1.


sed -i '1s/^/\nÚtil para organizar os arquivos .xml do setor de Contabilidade da sua empresa.\n\nArquivo de log do script '$(basename $0)': \n\n/' "$log"


# ----------------------------------------------------------------------------------------

# Qual o tamanho total da pasta de destino especificada?
  
echo "
Pasta de destino com:
" >> "$log"  
du -sh $diretorio_destino  >> "$log"

# ----------------------------------------------------------------------------------------

# Visualizar o arquivo de log gerado no final do processo.

# cat "$log"


# sudo -u "$usuario" DISPLAY=:0.0  

notify-send -t 100000 -i "$imagem"  'Atenção!' '\n\nFinalizado a organização dos arquivos em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)'. \n\nO arquivo de log foi salvo: '$log'\n\n'



# ----------------------------------------------------------------------------------------


exit 0


