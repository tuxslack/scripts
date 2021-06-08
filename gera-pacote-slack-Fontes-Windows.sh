#!/bin/bash
#
# Por Fernando Souza
# Data: 07/06/2021 as 13:50
# Licença: GPL <https://www.gnu.org/>
# Versão: 0.0.1
# Script: 
#
# Atualização em


# https://www.vivaolinux.com.br/topico/Sed-Awk-ER-Manipulacao-de-Textos-Strings/Apagar-linha-com-palavra
# https://support.microsoft.com/pt-br/office/fontes-que-s%c3%a3o-instaladas-com-produtos-do-microsoft-office-2013-35dfa558-f367-43e6-8f62-7305096b5c21?ui=pt-br&rs=pt-br&ad=br
# https://support.office.com/pt-br/article/baixar-e-instalar-fontes-personalizadas-para-usar-com-o-office-0ee09e74-edc1-480c-81c2-5cf9537c70ce
# https://docs.microsoft.com/pt-br/typography/
# http://sfl.pro.br/blogs/index.php/sergio-blog/mantendo_o_seu_trabalho_sincronizado_em_

clear



# =====================================================================================================


# Variaveis do programa


# Titulos das janelas do Zenity

titulo="Gera pacote de fontes do Windows e do Microsoft Office para o Slackware"


DATA=`date +%d/%m/%Y-%H:%M`


# Autor

MAINTAINER="Fernando Souza"


# E-mail

EMAIL=""


# Nome do pacote

nome_do_pacote="fontes-Windows10"


# Versão do pacote

versao="0.1"


# Página web do programa (página oficial)

Homepage=""


# Arquivo de log

log="/tmp/$nome_do_pacote.log"


echo "
Removendo o arquivo de log $log ...
"

rm -Rf "$log"



# Tempo de espera para cada tarefa

tempo="3"



USER="fernando"

# =====================================================================================================



# gera_lista(){


# clear


# cd /run/media/fernando/CEA8EB9FA8EB83F5/Windows/Fonts/


# ls -1 . > /run/media/fernando/backup/backup/meus_pacotes_manual/fontes/Windows\ 10/WindowsPro10_PacoteOfficePro2019Plus.txt


# ls -1 Fonts/ >  "Fontes Windows 10 Pro 64bit + Pacote Office Pro 2019 Plus.txt"


# }



# =====================================================================================================


verificar_root(){


# Verificar se o usuário tem permissoes de SU

# ----------------------------------------------------------------------------------------------------

if [ "`whoami`" != "root" ]
then
    echo "Logue como root utilizando o comando: su"
    zenity --warning --text "Logue como root utilizando o comando: su" --width="300" --height="100" 2> /dev/null 

    exit 1
fi


# ----------------------------------------------------------------------------------------------------

# if [ "$(id -u)" != "0" ]; then

# if [ $USER != root ]; then

# echo "Você precisa ser logar como ROOT para executar este script!."

# exit 1

# else

# echo "Você é root!"

# fi

# ----------------------------------------------------------------------------------------------------

}






# =====================================================================================================

clear

verificar_root



# Pasta onde sera salvos os pacotes gerados no final do processo.

# Altera essa variavel para o diretório onde você deseja salvar o download do programa.
#
# ondesalvar="/run/media/fernando/backup/backup/meus_pacotes_manual/fontes/Windows\ 10/"


ondesalvar=$(zenity \
--title="$titulo" \
--text "Qual a pasta você deseja salvar o pacote do $nome_do_pacote-$versao?" \
--entry \
--entry-text="/run/media/fernando/backup/backup/meus_pacotes_manual/fontes/Windows 10/" \
--width="620" height="300" \
2> /dev/null)


# =====================================================================================================

# Para verificar se a variavel é nula

if [ -z "$ondesalvar" ];then

zenity \
--warning \
--timeout="10" \
--text "Não pode ter valor nulo! \n\n\nInforme uma pasta para gera o pacote do $programa \n\n\n Saindo 10s ..." \
--width="300" height="300" 2> /dev/null

clear

exit 2


fi

# =====================================================================================================

# Para verificar se existe um diretório, você pode usar o seguinte:

if [ -d "$ondesalvar" ]; then

  clear

  echo "A pasta $ondesalvar existe."


  else 

  clear

  zenity \
--error \
--timeout="10" \
--text "A pasta $ondesalvar não foi localizada." \
--width="300" height="300"  2> /dev/null


  clear

  exit 3

fi


# https://qastack.com.br/programming/59838/how-can-i-check-if-a-directory-exists-in-a-bash-shell-script


# =====================================================================================================

clear

which installpkg  2> "$log"
#/sbin/installpkg


which zenity      2>> "$log"
#/usr/bin/zenity


mkdir -p "$ondesalvar"  2>> "$log"

cd "$ondesalvar" 2>> $log

pwd 
ls 

sleep "$tempo"

# =====================================================================================================

clear

echo "
Realizando faxina...
"

# Vai remove a pasta das fontes do Windows
#
# 
rm -Rf $nome_do_pacote-$versao              2>> "$log"


rm -Rf $nome_do_pacote-$versao.tgz          2>> "$log"
rm -Rf $nome_do_pacote-$versao.tgz.md5sum   2>> "$log"
rm -Rf estrutura_diretorio.txt              2>> "$log"

sleep "$tempo"

# =====================================================================================================

clear

echo "
Criando as pastas do pacote $nome_do_pacote-$versao
"

mkdir -p $nome_do_pacote-$versao/install/                                        2>> "$log"
mkdir -p $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/             2>> "$log"
mkdir -p $nome_do_pacote-$versao/usr/doc/Windows/                                2>> "$log"

# mkdir -p $nome_do_pacote-$versao/usr/local/bin/                                2>> "$log"

sleep "$tempo"

# =====================================================================================================

clear


echo "
Gerando arquivo leia-me.txt para $nome_do_pacote-$versao ...
"

echo "

Problema com fonte: Kristen ITC-9 quando usa o ~/.fluxbox/styles/royal_red_antix/


Remove ou compactar a fonte ITCKRIST.TTF na pasta do sistema.

" > $nome_do_pacote-$versao/usr/doc/Windows/leia-me.txt  2>> "$log"

sleep "$tempo"

# =====================================================================================================

clear

echo "
Gerando arquivo doinst.sh para $nome_do_pacote-$versao ...
"


echo "
if [ -x /usr/share/fonts/TTF/extra ]; then

fc-cache -fv

fi

echo '
Está tudo pronto, você precisará fechar os programas abertos e depois abri-lo para que os mesmos reconheçam as novas fontes.
'
" > $nome_do_pacote-$versao/install/doinst.sh  2>> "$log"

sleep "$tempo"

# =====================================================================================================

clear

echo "
Gerando arquivo slack-desc para $nome_do_pacote-$versao...
"

echo "# HOW TO EDIT THIS FILE:
# The \"handy ruler\" below makes it easier to edit a package description.
# Line up the first '|' above the ':' following the base package name, and
# the '|' on the right side marks the last column you can put a character in.
# You must make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':' except on otherwise blank lines.

           |-----handy-ruler------------------------------------------------------|
$nome_do_pacote-$versao: $nome_do_pacote-$versao (fontes MS)
$nome_do_pacote-$versao:
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: Fontes do Windows 10 Pro 64 bit e do Microsoft Office Professional 2019 Plus 64 bit
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: Foi copiado todos os arquivos da pasta C:\WINDOWS\fonts
$nome_do_pacote-$versao: para /usr/share/fonts/TTF/extras/windows/
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao:
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao:
$nome_do_pacote-$versao:
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao: 
$nome_do_pacote-$versao:
$nome_do_pacote-$versao:
$nome_do_pacote-$versao: Homepage: $Homepage
$nome_do_pacote-$versao:
$nome_do_pacote-$versao:" > $nome_do_pacote-$versao/install/slack-desc  2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

# Repeti o processo para pegar as novas fontes das próximas versões do Windows e do Microsoft Office


zenity \
--info \
--text="

Pausa para copiar os arquivo para a pasta $nome_do_pacote-$versao ...

Copia ou move as fontes do Windows agora para a pasta $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/


root@darkstar:# rsync -av /run/media/$USER/A440E02B40E00640/Windows/Fonts  $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/
sending incremental file list

sent 10,089 bytes  received 17 bytes  20,212.00 bytes/sec
total size is 404,061,176  speedup is 39,982.31


Apos copiar ou move manualmente as fontes do Windows para pasta acima ($nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/) tecla Enter para continuar..." \
--width="1000" --height="10"  2>/dev/null


clear

echo "
Abriando a pasta $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows

"

sleep "$tempo"

xdg-open $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/



# =====================================================================================================

clear

echo "
Removendo os arquivos: StaticCache.dat, desktop.ini e fms_metadata.xml da pasta $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/
"

# rm -Rf $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/StaticCache.dat   2>> "$log"
# rm -Rf $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/desktop.ini       2>> "$log"
# rm -Rf $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/fms_metadata.xml  2>> "$log"


find $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/ -iname "StaticCache.dat"  -exec rm {} \;
find $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/ -iname "desktop.ini"      -exec rm {} \;
find $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/ -iname "fms_metadata.xml" -exec rm {} \;


pwd

ls


sleep "$tempo"

# =====================================================================================================

clear



# VERIFICAR SE ARQUIVO EXISTE

# -e => verifica a existência de diretório ou arquivo.

# Fonte do Pacote Office (ITCKRIST.TTF)

if [ -e "$nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/" ]
then


# Verificar se o arquivo ITCKRIST.TTF existe na pasta $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/

find $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/ -iname "ITCKRIST.TTF"  -exec ls {} \; | tee -a "$log"

echo "
O arquivo ITCKRIST.TTF existe em $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/
" | tee -a "$log"



cd $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/"Pacote Office Pro 2019 Plus"/

tar -Jcf ITCKRIST.TTF.tar.xz ITCKRIST.TTF  2>> "$log"

rm -Rf ITCKRIST.TTF

# cd ../../../../../../../

cd "$ondesalvar" 2>> $log

else


echo "
O arquivo ITCKRIST.TTF  não foi localizado em $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/
" | tee -a "$log"


fi



pwd

ls


sleep 10

# =====================================================================================================


clear


# Gera uma lista das fontes que esta no pacote atualmente

echo "

---------------------------------------
    Os arquivos de fontes no pacote 
---------------------------------------

" > $nome_do_pacote-$versao/usr/doc/Windows/lista-completa.txt   2>> "$log"


# ls -1 $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/*.{ttf,TTF,otf,OTF,woff,woff2,eot,pfm,pfb,ttc,TTC,afm,fon,FON}  >> $nome_do_pacote-$versao/usr/doc/Windows/lista-completa.txt   2>> "$log"



# Com problema não esta gerando a lista dos arquivos de fonte na pasta.



# Buscar apenas os arquivos neste diretório $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/ .


# find $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/ \
# -iname "*.ttf" \
# -o -iname "*.otf" \
# -o -iname "*.woff" \
# -o -iname "*.woff2" \
# -o -iname "*.eot" \
# -o -iname "*.pfm" \
# -o -iname "*.pfb" \
# -o -iname "*.ttc" \
# -o -iname "*.TTC" \
# -o -iname "*.afm" \
# -o -iname "*.fon" \
# -type f \
# -exec ls -1 {} \; >> $nome_do_pacote-$versao/usr/doc/Windows/lista-completa.txt   2>> "$log"



find $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/ \
-type f \
-exec ls -1 {} \; >> $nome_do_pacote-$versao/usr/doc/Windows/lista-completa.txt   2>> "$log"


# https://e-tinet.com/linux/comando-find-linux/


echo "

" >> $nome_do_pacote-$versao/usr/doc/Windows/lista-completa.txt   2>> "$log"




tamanho=`du -sh "$nome_do_pacote-$versao" | cut -d"/" -f1`





echo "
Tamanho dos arquivos: $tamanho

" >> $nome_do_pacote-$versao/usr/doc/Windows/lista-completa.txt  2>> "$log"




# Para deletar somente a palavra com sed

echo "

Toda vez que achar as palavras "$nome_do_pacote-$versao" e $nome_do_pacote-$versao/usr/share/fonts/TTF/extras/Windows/ no arquivo $nome_do_pacote-$versao/usr/doc/Windows/lista-completa.txt  deve serem apagadas do arquivo.

" | tee -a "$log"



sed -i "s/$nome_do_pacote-$versao//g"  $nome_do_pacote-$versao/usr/doc/Windows/lista-completa.txt    2>> "$log"


sed -i 's|/usr/share/fonts/TTF/extras/Windows/||' $nome_do_pacote-$versao/usr/doc/Windows/lista-completa.txt    2>> "$log"



# https://www.vivaolinux.com.br/topico/Sed-Awk-ER-Manipulacao-de-Textos-Strings/Remover-palavras-de-um-texto
# https://www.dicas-l.com.br/arquivo/sed_caracteres_delimitadores.php


sleep "$tempo"


# =====================================================================================================

clear

echo "
Executando chown e chmod na pasta $nome_do_pacote-$versao/ ...
"

chown -R root:root $nome_do_pacote-$versao/   2>> "$log"

chmod -R 755 $nome_do_pacote-$versao/         2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

cd $nome_do_pacote-$versao/         2>> "$log"


tree -a > estrutura_diretorio.txt   2>> "$log"

mv estrutura_diretorio.txt  ../     2>> "$log"



# Toda vez que achar a palavra "estrutura_diretorio.txt" no arquivo deve ser apagada toda a linha.

sed -i '/estrutura_diretorio.txt/d' ../estrutura_diretorio.txt   2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

echo "
Gerando o pacote $nome_do_pacote-$versao.tgz em `cd ../ && pwd` ...
" | tee -a "$log"

/sbin/makepkg -l y -c n  ../$nome_do_pacote-$versao.tgz  2>> "$log"



sleep "$tempo"

# =====================================================================================================

clear


echo "
Calculando o md5sum  do pacote $nome_do_pacote-$versao.tgz...
" | tee -a "$log"

md5sum ../$nome_do_pacote-$versao.tgz > ../$nome_do_pacote-$versao.tgz.md5sum 2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

echo "
Abrir o arquivo de log $log e o arquivo $nome_do_pacote-$versao/usr/doc/Windows/lista-completa.txt
"

xdg-open "$log" 2> /dev/null

xdg-open $nome_do_pacote-$versao/usr/doc/Windows/lista-completa.txt


sleep "$tempo"

# =====================================================================================================

clear

echo "
Movendo o arquivo de log $log para a pasta $nome_do_pacote-$versao/
"

mv  "$log" ../ 

# =====================================================================================================


exit 0

