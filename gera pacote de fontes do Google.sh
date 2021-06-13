#!/bin/bash
#
# Por Fernando Souza
# Data: 10/04/2020
# Licença: GPL <https://www.gnu.org/>
# Versão: 0.1
# Script: 
#
# Atualização em https://notabug.org/
#
# Realiza o backup das configurações do kppp no formato .tar.xz.
#
#
# Como usar:
#
# mv Gera pacote de fontes do Google.sh /usr/local/bin/
#
# chmod +x /usr/local/bin/Gera pacote de fontes do Google.sh
#
# $ Gera pacote de fontes do Google.sh
#
#
# Para verificar o md5sum do arquivo Gera pacote de fontes do Google.sh
#
# $ md5sum Gera pacote de fontes do Google.sh
# 
#
# https://elias.praciano.com/2018/04/instale-as-fontes-google-no-linux/
# https://elias.praciano.com/2013/09/como-instalar-as-fontes-google-no-ubuntu-via-script/
# http://www.webupd8.org/2011/01/automatically-install-all-google-web.html
#
# -----------------------------------------------------------------------------------------------------



clear

# Variaveis do programa


usuario="fernando"


# Nome do programa

nome_do_pacote="Google_Fonts"


# Versão do programa

versao="0.1"


# Página web do programa (página oficial)

Homepage="https://fonts.google.com/  |  https://github.com/google/fonts"



# Titulos das janelas do Zenity

titulo="Gera pacote de fontes do Google para o Slackware"



DATA=`date +%d/%m/%Y-%H:%M`


# Autor

MAINTAINER="Fernando Souza"


EMAIL=""



# Arquitetura do programa

# `uname -m`

arquitetura="all"



# Arquivo de log

log="/tmp/$nome_do_pacote.log"



REQUIRES=""


# Tempo de espera para cada tarefa

tempo="3"

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

# Atualizando as fontes do Google

# clonar_github

atualizar(){


# Download All Google Fonts

# You can download all Google Fonts in a simple ZIP snapshot (over 650MB) from https://github.com/google/fonts/archive/main.zip

# https://github.com/google/fonts


clear

# echo "
# Clonando o repositório GitHub ...

# https://github.com/google/fonts
# "

cd "/run/media/fernando/backup/backup/meus_pacotes_manual/fontes/Google Fonts/"

# git init

# git clone https://github.com/google/fonts.git

pwd

ls

echo "
Baixando as atualizações das fontes do Google...
"
wget -c "https://github.com/google/fonts/archive/main.zip"  | tee "$log"


}


# https://github.com/google/fonts
# http://gabsferreira.com/forkando-e-clonando-um-repositorio-no-github/
# https://stackoverflow.com/questions/9864728/how-to-get-git-to-clone-into-current-directory
# https://github.com/google





# =====================================================================================================

clear

verificar_root


# =====================================================================================================

# Altera essa variavel para o diretório onde você deseja salvar o download do programa.
#
# ondesalvar="/run/media/fernando/backup/backup/meus_pacotes_manual/$programa"


ondesalvar=$(zenity \
--title="$titulo" \
--text "Qual a pasta você deseja salvar o pacote do $nome_do_pacote?" \
--entry \
--entry-text="/run/media/fernando/backup/backup/meus_pacotes_manual/fontes/Google Fonts/" 2> /dev/null)

# =====================================================================================================

# Para verificar se a variavel é nula

if [ -z "$ondesalvar" ];then

zenity \
--warning \
--timeout="10" \
--text "Não pode ter valor nulo! \n\n\nInforme uma pasta para gera o pacote do $nome_do_pacote \n\n\n Saindo 10s ..." \
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

which installpkg         2> "$log"
#/sbin/installpkg


which zenity             2>> "$log"
#/usr/bin/zenity


which wget               2>> "$log"


which sed                2>> "$log"
# /usr/bin/sed



mkdir -p "$ondesalvar"  2>> "$log"

cd "$ondesalvar"        2>> "$log"



# -----------------------------------------------------------------------------------------------------


escolha=$(zenity \
--question \
--text="Deseja baixar as atualizações das fontes do Google agora?\n\n" \
--cancel-label="Não" \
--ok-label="Atualizar" \
--width="700" --height="100"   \
2>/dev/null)

if [  $? = 0 ] ; then


atualizar


exit 1

fi


# -----------------------------------------------------------------------------------------------------

clear

echo "
Continuar sem baixar as atualizações das fontes do Google....
"

pwd 

ls 


sleep "$tempo"

# =====================================================================================================

clear

echo "
Removendo o arquivo de log $log ...
"

rm -Rf "$log"




echo "
Realizando faxina...
"

rm -Rf $nome_do_pacote           2>> "$log"

rm -Rf $nome_do_pacote*.tgz      2>> "$log"

rm -Rf $nome_do_pacote-*.md5sum  2>> "$log"

rm -Rf fonts-master              2>> "$log"



sleep "$tempo"

# =====================================================================================================

clear

echo "
Criando as pastas do pacote $nome_do_pacote
"

mkdir -p "$nome_do_pacote"/install/                     2>> "$log"

mkdir -p "$nome_do_pacote"/usr/doc/"$nome_do_pacote"/   2>> "$log"

# mkdir -p "$nome_do_pacote"/usr/share/doc/"$nome_do_pacote"/  2>> "$log"

mkdir -p "$nome_do_pacote"/usr/share/fonts/TTF/extras/"$nome_do_pacote"/ 2>> "$log"



# mkdir -p "$nome_do_pacote"/usr/local/bin/               2>> "$log"

# mkdir -p "$nome_do_pacote"/usr/share/applications/      2>> "$log"

# mkdir -p "$nome_do_pacote"/usr/share/icons/extras/      2>> "$log"



sleep "$tempo"

# =====================================================================================================

clear


echo "
Descompactando o arquivo .tar.gz ...
"

sleep "$tempo"


tar -vzxf fonts-master.tar.gz   2>> "$log"


# https://www.vivaolinux.com.br/dica/Como-descompactar-arquivos-zip-rar-tar.gz-tar.bz2-pelo-terminal




# =====================================================================================================

clear


find fonts-master/ -iname '*.ttf' -exec mv -vi  {} "$nome_do_pacote"/usr/share/fonts/TTF/extras/"$nome_do_pacote"/ \; | tee "$log"


quantidade=`ls "$nome_do_pacote"/usr/share/fonts/TTF/extras/"$nome_do_pacote"/ | wc -l`


sleep "$tempo"


# =====================================================================================================

clear

echo "
Organizar as fontes do Google em ordem alfabética (a b c d e f g h i j k l m n o p q r s t u v w x y z) ...
"


cd "$nome_do_pacote"/usr/share/fonts/TTF/extras/"$nome_do_pacote"/

pwd

ls

# =====================================================================================================

sleep "$tempo"



                 for i in {A..Z}; 

                 do

                     mkdir -p "$i"

                     # echo -e "$i"

                     mv -vi "$i"*.{ttf,TTF,otf,OTF,woff,woff2,eot,pfm,pfb,ttc,TTC,afm,fon,FON} ${i}/ 2>> "$log"


                 done


# =====================================================================================================

sleep "$tempo"


                 for i in {a..z}; 

                 do

                     mkdir -p "$i"


                     mv -vi "$i"*.{ttf,TTF,otf,OTF,woff,woff2,eot,pfm,pfb,ttc,TTC,afm,fon,FON} ${i}/


                 done


# =====================================================================================================

echo "
Renomeando os nomes das pastas de maiúscula para minúscula (a b c d e f g h i j k l m n o p q r s t u v w x y z)
"


mv -vi A/* a/    2>> "$log"
mv -vi B/* b/    2>> "$log"
mv -vi C/* c/    2>> "$log"
mv -vi D/* d/    2>> "$log"
mv -vi E/* e/    2>> "$log"
mv -vi F/* f/    2>> "$log"
mv -vi G/* g/    2>> "$log"
mv -vi H/* h/    2>> "$log"
mv -vi I/* i/    2>> "$log"
mv -vi J/* j/    2>> "$log"
mv -vi K/* k/    2>> "$log"
mv -vi L/* l/    2>> "$log"
mv -vi M/* m/    2>> "$log"
mv -vi N/* n/    2>> "$log"
mv -vi O/* o/    2>> "$log"
mv -vi P/* p/    2>> "$log"
mv -vi Q/* q/    2>> "$log"
mv -vi R/* r/    2>> "$log"
mv -vi S/* s/    2>> "$log"
mv -vi T/* t/    2>> "$log"
mv -vi U/* u/    2>> "$log"
mv -vi V/* v/    2>> "$log"
mv -vi W/* w/    2>> "$log"
mv -vi X/* x/    2>> "$log"
mv -vi Y/* y/    2>> "$log"
mv -vi Z/* z/    2>> "$log"



sleep "$tempo"


# =====================================================================================================

clear

echo "
Verificar pastas vazias, em $nome_do_pacote/usr/share/fonts/TTF/extras/$nome_do_pacote/ e exclui-las.
"

pwd

ls

find . -empty -type d -delete



sleep "$tempo"


cd "$ondesalvar"        2>> "$log"

# =====================================================================================================


clear


echo "
Gerando lista dos arquivos de fontes do Google...
"


tamanho=`du -sh "$nome_do_pacote" | cut -d"/" -f1`


echo "

---------------------------------------
    Os arquivos de fontes no pacote 
---------------------------------------

" > "$nome_do_pacote"/usr/doc/"$nome_do_pacote"/lista-completa.txt   2>> "$log"


cd "$nome_do_pacote"/usr/share/fonts/TTF/extras/"$nome_do_pacote"/ 2>> "$log"



  for i in {a..z}; 

                 do


if [ -e "$i" ]
then

# echo "O diretorio $i existe" 


echo "


=================================================================================
                                 Letra $i:
=================================================================================


" >> ../../../../../../usr/doc/"$nome_do_pacote"/lista-completa.txt


                     ls -1 "$i"/*.{ttf,TTF,otf,OTF,woff,woff2,eot,pfm,pfb,ttc,TTC,afm,fon,FON}  >> ../../../../../../usr/doc/"$nome_do_pacote"/lista-completa.txt  2>> "$log"


else

echo "O diretorio $i não existe" | tee -a "$log"

fi

                done



cd ../../../../../../../


echo "
Tamanho dos arquivos: $tamanho

" >> "$nome_do_pacote"/usr/doc/"$nome_do_pacote"/lista-completa.txt  2>> "$log"


# =====================================================================================================


# Toda vez que achar a palavra "$nome_do_pacote" no arquivo deve ser apagada.

sed -i "s/$nome_do_pacote//g" "$nome_do_pacote"/usr/doc/"$nome_do_pacote"/lista-completa.txt  2>> "$log"


# https://www.vivaolinux.com.br/topico/Sed-Awk-ER-Manipulacao-de-Textos-Strings/Remover-palavras-de-um-texto


sleep "$tempo"



                 for i in {a..z}; 

                 do

                       sed -i "s/^$i/\//g" "$nome_do_pacote"/usr/doc/"$nome_do_pacote"/lista-completa.txt  2>> "$log"


                 done



                 sed -i "s|^/*||g"  "$nome_do_pacote"/usr/doc/"$nome_do_pacote"/lista-completa.txt  2>> "$log"


# =====================================================================================================


clear


cd "$ondesalvar"        2>> "$log"


echo "
if [ -x /usr/share/fonts/TTF/extras/$nome_do_pacote/ ]; then

fc-cache -fv

fi

echo '
Está tudo pronto, você precisará fechar os programas abertos e depois abri-lo para que os mesmos reconheçam as novas fontes.
'
" > "$nome_do_pacote"/install/doinst.sh  2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear


echo "# HOW TO EDIT THIS FILE:
# The \"handy ruler\" below makes it easier to edit a package description.
# Line up the first '|' above the ':' following the base package name, and
# the '|' on the right side marks the last column you can put a character in.
# You must make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':' except on otherwise blank lines.

           |-----handy-ruler------------------------------------------------------|
$nome_do_pacote: $nome_do_pacote (Google Fonts)
$nome_do_pacote:
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: Arquivos de fontes do Google
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: O repositório de fontes Google Fonts disponibiliza gratuitamente quase $quantidade fontes, 
$nome_do_pacote: que podem ser usadas no GIMP, no seu editor de textos ou para personalizar todo o 
$nome_do_pacote: seu sistema, do jeito que você quiser.
$nome_do_pacote: O Google Fonts é um dos principais locais de hospedagem de fontes '"'opensource'"', na web.
$nome_do_pacote: O repositório contém centenas de famílias de fontes disponíveis para download individual 
$nome_do_pacote: ou em um único pacote. 
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: Se você encontrar um problema com um arquivo de fonte ou tiver uma solicitação para
$nome_do_pacote: o desenvolvimento futuro de um projeto de fonte, [crie um novo problema no rastreador
$nome_do_pacote: de problemas deste projeto] (https://github.com/google/fonts/issues).
$nome_do_pacote: 
$nome_do_pacote:
$nome_do_pacote: 
$nome_do_pacote: # Download de todas as fontes do Google
$nome_do_pacote: 
$nome_do_pacote: Você pode baixar todas as fontes do Google em um instantâneo ZIP simples (acima de 300 MB)
$nome_do_pacote: em <https://github.com/google/fonts/archive/master.zip>
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: # Licenciamento
$nome_do_pacote:
$nome_do_pacote: É importante sempre ler a licença para cada fonte que você usa.
$nome_do_pacote: Cada diretório da família de fontes contém o arquivo de licença apropriado para as 
$nome_do_pacote: fontes desse diretório.
$nome_do_pacote: Os próprios arquivos de fontes também contêm metadados de licenciamento e autoria.
$nome_do_pacote:
$nome_do_pacote: A maioria das fontes da coleção usa a Licença de fonte aberta do SIL, v1.1.
$nome_do_pacote: Algumas fontes usam a licença Apache 2.
$nome_do_pacote: As fontes Ubuntu usam a Licença de fonte Ubuntu v1.0.
$nome_do_pacote:
$nome_do_pacote: A Licença de fonte aberta do SIL possui uma opção para os detentores de direitos autorais 
$nome_do_pacote: incluirem um requisito de nome de fonte reservado e essa opção é usada com algumas das 
$nome_do_pacote: fontes.
$nome_do_pacote:
$nome_do_pacote: Se você modificar essas fontes, cuide desses detalhes importantes.
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: # Fontes duplicadas
$nome_do_pacote: 
$nome_do_pacote: Existem alguns pares de diretórios com nomes semelhantes, cada um com arquivos de 
$nome_do_pacote: fonte com nomes idênticos.
$nome_do_pacote: Esses arquivos são redundantes e existem após a renomeação de uma família.
$nome_do_pacote: Os diretórios iniciais são mantidos para que as pessoas que já usam esse nome inicial 
$nome_do_pacote: possam continuar a fazê-lo.
$nome_do_pacote: Eles não estão mais listados no diretório principal www.google.com/fonts, mas os arquivos 
$nome_do_pacote: existem neste repositório, pois ainda são exibidos pela API de fontes do Google.
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: Localização: /usr/share/fonts/TTF/extras/Google Fonts/Fontes duplicadas/
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: Os detentores de direitos autorais dessas famílias são principalmente Google, SIL, 
$nome_do_pacote: Adobe, Canonical, Naver e alguns outros discrepantes.
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote: Acima de tudo: aproveite as fontes!
$nome_do_pacote: 
$nome_do_pacote: - Equipe do Google Fonts, 18/06/2015
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote:
$nome_do_pacote:
$nome_do_pacote: O conteúdo do wiki está disponível aqui:
$nome_do_pacote:
$nome_do_pacote: https://github.com/googlefonts/gf-docs
$nome_do_pacote:
$nome_do_pacote:
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote:
$nome_do_pacote:
$nome_do_pacote: Homepage: 
$nome_do_pacote: 
$nome_do_pacote: $Homepage
$nome_do_pacote: 
$nome_do_pacote: https://github.com/google/fonts
$nome_do_pacote: 
$nome_do_pacote: https://github.com/googlefonts
$nome_do_pacote: 
$nome_do_pacote: 
$nome_do_pacote:" > "$nome_do_pacote"/install/slack-desc   2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear


mv -vi fonts-master/AUTHORS             "$nome_do_pacote"/usr/doc/"$nome_do_pacote"/   2>> "$log"
mv -vi fonts-master/CONTRIBUTORS        "$nome_do_pacote"/usr/doc/"$nome_do_pacote"/   2>> "$log"
mv -vi fonts-master/README.md           "$nome_do_pacote"/usr/doc/"$nome_do_pacote"/   2>> "$log"
mv -vi fonts-master/TRIVIA.md           "$nome_do_pacote"/usr/doc/"$nome_do_pacote"/   2>> "$log"
mv -vi fonts-master/CONTRIBUTING.md     "$nome_do_pacote"/usr/doc/"$nome_do_pacote"/   2>> "$log"


sleep "$tempo"

# =====================================================================================================


clear

# Repeti o processo para pegar as novas fontes


zenity \
--info \
--text="

Pausa para copiar os arquivo para a pasta $nome_do_pacote ...

Copia ou move as fontes do Google agora para a pasta $nome_do_pacote/usr/share/fonts/TTF/extras/$nome_do_pacote/


Apos copiar ou move manualmente as fontes do Google para pasta acima ($nome_do_pacote/usr/share/fonts/TTF/extras/$nome_do_pacote/) tecla Enter para continuar..." \
--width="1000" --height="10"  2>/dev/null


clear

echo "
Abriando a pasta $nome_do_pacote/usr/share/fonts/TTF/extras/$nome_do_pacote/

"


xdg-open "$nome_do_pacote"/usr/share/fonts/TTF/extras/"$nome_do_pacote"/


sleep "$tempo"

# =====================================================================================================

clear

echo "
Executando chown e chmod na pasta $nome_do_pacote ...
"

chown -R root:root "$nome_do_pacote"/  2>> "$log"

chmod -R 755 "$nome_do_pacote"/        2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

cd "$nome_do_pacote"/   2>> "$log"


tree -a > ../estrutura_diretorio.txt    2>> "$log"


# Toda vez que achar a palavra "estrutura_diretorio.txt" no arquivo deve ser apagada toda a linha.

sed -i '/estrutura_diretorio.txt/d' ../estrutura_diretorio.txt    2>> "$log"

sleep "$tempo"

# =====================================================================================================

clear

# Criar um pacote de instalação tgz


echo "
Gerando o pacote $nome_do_pacote.tgz em /tmp ...
" | tee -a "$log"


/sbin/makepkg -l y -c n  ../"$nome_do_pacote".tgz    2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

echo "
Calculando o md5sum  do arquivo $nome_do_pacote.tgz ...
"
md5sum ../"$nome_do_pacote".tgz > ../"$nome_do_pacote".tgz.md5sum     2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

echo "
Abrir o arquivo de log $log ...
"

xdg-open "$log" 2> /dev/null


sleep "$tempo"

# =====================================================================================================

clear

echo "
Movendo o arquivo de log $log para a pasta $nome_do_pacote
"

mv  "$log" ../ 


sleep "$tempo"

# =====================================================================================================



exit 0

