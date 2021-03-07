#!/bin/bash
#
# Baixe o Firefox através da página de download do Firefox, para a sua pasta "Home".
# 
# https://www.mozilla.org/firefox/download/thanks/
# https://www.edivaldobrito.com.br/firefox-no-linux-manualmente/
# https://support.mozilla.org/pt-BR/kb/instale-o-firefox-no-linux
#
# http://devfuria.com.br/linux/instalando-firefox/
#
#
# 
# Para remove o Firefox antigo
# 
# root@darkstar:# ls /var/log/packages/ | grep -i firefox
# firefox-74.0.1-x86_64
# 
# root@darkstar:# removepkg firefox-74.0.1-x86_64
#
#
# Para instalar o Firefox atual
#
# root@darkstar:# installpkg firefox-75.0-x86_64.tgz 
#
#
# Basicamente é só altera a variavel "versao" nas futuras versão do Firefox para gera o pacote no Slackware.
#
#
# Futuramente passagem por parâmetros (versao)
#
#

clear

# Titulos das janelas do Zenity

titulo="Gera pacote para o Slackware"


# Nome do programa

nome_do_pacote="firefox"


# Página web do programa

Homepage="https://www.mozilla.org/pt-BR/firefox/new/"


# Arquivo de log

log="/tmp/$nome_do_pacote.log"


# Altera essa variavel para o diretório onde você deseja salvar o download do programa.
#
# ondesalvar="/run/media/fernando/backup/backup/meus pacotes manual/firefox/"


ondesalvar=$(zenity \
--title="$titulo" \
--text "Qual a pasta você deseja salvar o download do Firefox?" \
--entry \
--entry-text="/run/media/fernando/backup/backup/meus_pacotes_manual/firefox" 2> /dev/null)


# Para verificar se a variavel é nula

if [ -z "$ondesalvar" ];then

zenity \
--warning \
--timeout="10" \
--text "Não pode ter valor nulo! \n\n\nInforme uma pasta para o download do Firefox \n\n\n Saindo 10s ..." \
--width="300" height="300" 2> /dev/null

clear

exit 2


fi



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







rm -Rf $log


which zenity   | tee $log
which lynx     | tee $log
which makepkg  | tee $log
which wget     | tee $log
which firefox  | tee $log
which md5sum   | tee $log


# Verifica se quem executa é root

# https://www.vivaolinux.com.br/script/Verifica-se-quem-executa-e-root


if [ "$(id -u)" != "0" ]; then

zenity --info --text "Você deve executar este script como root! " ---width 650 --height 100 2> /dev/null

else

echo "Você é root!"



# ******************************************************************************************

# Pega a versão atual do Firefox no site https://www.mozilla.org/
#
versao=$(lynx -dump https://www.mozilla.org/pt-BR/firefox/notes/|gawk -F '[ ,]+' '/^ +Version.*$/ {print $3}')

#
#
# Contribuição para a variavel $versao: msoliver <https://www.vivaolinux.com.br/~msoliver>
#
#
#
#
# Método 4 (Coloca a versão do Firefox de forma manual) - OK
#
#
# Verifique se é a versão atual, senão modifique.
#
# https://www.mozilla.org/pt-BR/firefox/
#
#
# versao="82.0.2"


# ******************************************************************************************


# versao_instalada=$(firefox -v | awk '{print $3}')

versao_instalada=$(ls /var/log/packages/ | grep -i firefox  | cut -d '-' -f 2)


# ls /var/log/packages/ | grep -i firefox
# firefox-82.0.3-x86_64


# https://discourse.c3sl.ufpr.br/t/webgl-para-scratch-mit-edu/987



# Só funciona com o usuário comum a variavel $versao_instalada. 
#
# Com Root tem problema.
#
#
# Running Firefox as root in a regular user's session is not supported.  ($XAUTHORITY is $HOME/.Xauthority which is owned by $USER.)



arquivo="$nome_do_pacote-$versao.tar.bz2"


# Link para baixar o Firefox
#
link="https://download-installer.cdn.mozilla.net/pub/firefox/releases/$versao/linux-`uname -m`/pt-BR/firefox-$versao.tar.bz2"



# Comparar valores das variáveis


if [ "$versao_instalada" == "$versao" ]; then

            clear

            # Valores iguais

zenity --info --text "
O Firefox está atualizado.

Versão no site $Homepage : $versao

Versão instalada: $versao_instalada

" ---width 650 --height 100 2> /dev/null


           exit 2


           else


           clear

           # Valores não batem

zenity --info --text "O Firefox está desatualizado.

Versão no site $Homepage : $versao

Versão instalada: $versao_instalada

" ---width 650 --height 100 2> /dev/null



# Verificar se o diretório existe

if [ -d "$ondesalvar" ]
then

echo "O diretório $ondesalvar existe.

"
sleep 5
clear




else

sleep 2

clear

zenity --error --text "O diretório $ondesalvar  não existe." --width="300" height="300"  2> /dev/null

exit 1

fi





echo "
Baixando a versão $versao para arquitetura `uname -m` ...
"


# O comando wget pode ser usado de diversas maneiras para baixar conteúdos de páginas web. O programa 
# oferece uma grande quantidade de opções e é extremamente flexível. 
#
# Se a sua conexão internet não presta (99.99% do Brasil), a opção "-c" permite que o comando seja reemitido 
# e o download seja retomado a partir do ponto em que parou.
#
#
# Como baixar um arquivo com wget e salvar com nome diferente ou em diretório diferente
#
# A maneira como wget grava os nomes dos arquivos baixados nem sempre é a mais adequada 
# para a sua situação. Para estes casos, use o parâmetro -O.
#
# O mesmo pode ser feito se você quiser gravar em um diretório diferente do atual.
#
#

wget -O "$ondesalvar"/"$arquivo" -c "$link"

sleep 5


fi


# https://pt.stackoverflow.com/questions/456099/shell-script-comparar-valores-multilinha-de-vari%C3%A1vel-com-string
# https://qastack.com.br/unix/8518/how-to-get-my-own-ip-address-and-save-it-to-a-variable-in-a-shell-script
# https://qastack.com.br/superuser/238112/what-is-the-difference-between-i686-and-x86_64
# https://www.dicas-l.com.br/arquivo/dicas_e_truques_com_wget.php
# https://elias.praciano.com/2013/12/o-comando-wget-em-10-exemplos/


# ******************************************************************************************


cd "$ondesalvar" 2>> $log

pwd
ls


# Verificar se o arquivo $nome_do_pacote-$versao.tar.bz2 existe na pasta atual.

if [ -e "$arquivo" ]; then

echo "Arquivo $arquivo existe

Versão do Firefox a ser instalada: $versao

"
sleep 5

echo "

" > $log

ls -lh firefox-*.tar.bz2  2>> $log



rm -Rf estrutura_diretorio.txt                 2>> $log
rm -Rf $nome_do_pacote-$versao-`uname -m`      2>> $log
rm -Rf $nome_do_pacote-$versao-`uname -m`.tgz  2>> $log



mkdir -p $nome_do_pacote-$versao-`uname -m`/opt/                     2>> $log

mkdir -p $nome_do_pacote-$versao-`uname -m`/install/                 2>> $log

mkdir -p $nome_do_pacote-$versao-`uname -m`/usr/local/bin/           2>> $log

mkdir -p $nome_do_pacote-$versao-`uname -m`/usr/share/applications/  2>> $log



# tar xvjf firefox-*.tar.bz2

tar xvjf $nome_do_pacote-$versao.tar.bz2 -C $nome_do_pacote-$versao-`uname -m`/opt/  2>> $log


# Feche todas as janelas do Firefox se tiver alguma aberta.




echo "[Desktop Entry]
Exec=/opt/firefox/firefox %u
Icon=/opt/firefox/browser/chrome/icons/default/default128.png
Type=Application
Categories=Network;
Name=Firefox
GenericName=Web Browser
GenericName[pt]=Navegador Web
GenericName[pt_BR]=Navegador Web
MimeType=text/html;text/xml;application/xhtml+xml;application/vnd.mozilla.xul+xml;text/mml;x-scheme-handler/http;x-scheme-handler/https;
X-KDE-StartupNotify=true
" > $nome_do_pacote-$versao-`uname -m`/usr/share/applications/mozilla-firefox.desktop  2>> $log





# Mas pense um pouco: “já existe uma versão instalada com esse link definido” então é melhor desinstalar a versão atual

echo '

if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database -q usr/share/applications 
fi

' > $nome_do_pacote-$versao-`uname -m`/install/doinst.sh  2>> $log


echo "
Copiando o arquivo do link simbolico /opt/$nome_do_pacote/$nome_do_pacote para a pasta $nome_do_pacote-$versao-`uname -m`/usr/local/bin/


No arquivo $nome_do_pacote-$versao-`uname -m`/install/doinst.sh

( cd usr/local/bin ; rm -rf firefox )
( cd usr/local/bin ; ln -sf /opt/firefox/firefox firefox )

"



cp -a firefox  $nome_do_pacote-$versao-`uname -m`/usr/local/bin/  2>> $log



echo "
Vamos criar o slack-desc, que nada mais é do que a descrição do nosso pacote. Esse arquivo será salvo dentro da pasta install
"

echo "# HOW TO EDIT THIS FILE:
# The \"handy ruler\" below makes it easier to edit a package description.
# Line up the first '|' above the ':' following the base package name, and
# the '|' on the right side marks the last column you can put a character in.
# You must make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':' except on otherwise blank lines.

           |-----handy-ruler------------------------------------------------------|
$nome_do_pacote-$versao-`uname -m`: $nome_do_pacote-$versao-`uname -m` (Navegador web)
$nome_do_pacote-$versao-`uname -m`:
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: Mozilla Firefox é um navegador livre e multi-plataforma desenvolvido
$nome_do_pacote-$versao-`uname -m`: pela Mozilla Foundation (em português: Fundação Mozilla) com ajuda de 
$nome_do_pacote-$versao-`uname -m`: centenas de colaboradores. A intenção da fundação é desenvolver um 
$nome_do_pacote-$versao-`uname -m`: navegador leve, seguro, intuitivo e altamente extensível. Baseado no 
$nome_do_pacote-$versao-`uname -m`: componente de navegação da Mozilla Suite (continuada pela comunidade 
$nome_do_pacote-$versao-`uname -m`: como SeaMonkey), o Firefox tornou-se o objetivo principal da Mozilla 
$nome_do_pacote-$versao-`uname -m`: Foundation. Anteriormente o navegador e o Mozilla Thunderbird, outro 
$nome_do_pacote-$versao-`uname -m`: produto da Mozilla Foundation, eram os destaques do grupo. Cerca de 
$nome_do_pacote-$versao-`uname -m`: 40% do código do programa foi totalmente escrito por voluntários.
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: https://pt.wikipedia.org/wiki/Mozilla_Firefox
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`:  
$nome_do_pacote-$versao-`uname -m`:  
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`:
$nome_do_pacote-$versao-`uname -m`:
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`:
$nome_do_pacote-$versao-`uname -m`:
$nome_do_pacote-$versao-`uname -m`: Homepage: $Homepage
$nome_do_pacote-$versao-`uname -m`:
$nome_do_pacote-$versao-`uname -m`:" > $nome_do_pacote-$versao-`uname -m`/install/slack-desc  2>> $log



chown -R root:root $nome_do_pacote-$versao-`uname -m`  2>> $log

chmod -R 755 $nome_do_pacote-$versao-`uname -m`  2>> $log


cd $nome_do_pacote-$versao-`uname -m`  2>> $log


tree -a > estrutura_diretorio.txt

mv estrutura_diretorio.txt  ../   2>> $log




# Apagar a linha que tem a palavra estrutura_diretorio.txt no arquivo ../estrutura_diretorio.txt

sed -i '/estrutura_diretorio.txt/d' ../estrutura_diretorio.txt

# https://www.vivaolinux.com.br/topico/Sed-Awk-ER-Manipulacao-de-Textos-Strings/Apagar-linha-com-palavra



clear

echo "
Gerando pacote $nome_do_pacote-$versao-`uname -m`.tgz
"

sleep 2


/sbin/makepkg -l y -c n  ../$nome_do_pacote-$versao-`uname -m`.tgz  | tee $log


clear


echo '

MD5SUM


Carlos E. Morimoto criou 26/jun/2005 às 22h03

O MD5SUM é um algoritmo que gera uma "assinatura" de um arquivo qualquer, um código de 32 bits obtido a partir da soma de todos os bits contidos no arquivo.

Em geral, ao baixar uma imagem ISO de uma distribuição Linux ou um pacote de programa qualquer, você encontrará um arquivo "md5sum" na mesma pasta do arquivo disponibilizado. Este é um arquivo de texto com o md5sum do arquivo, algo como:

213d0e5615e8b6aeb6ab34de22282ff2 zxyz.iso

À esquerda temos o número de verificação e à direita o nome do arquivo. Tudo o que você precisa fazer é, depois de baixar o arquivo, digitar num terminal: md5sum zxyz.iso

O sistema verificará o arquivo que você baixou e devolverá outro número. Se os dois números forem iguais, significa que o arquivo chegou intacto. Se por outro lado o número gerado for diferente signifca que o arquivo chegou corrompido ou alterado de alguma forma. Neste caso o mais recomendável é baixa-lo novamente em outro mirror.

O md5sum é um comando padrão no Linux e existe também uma versão for Windows (que roda sobre o DOS) que pode ser baixada no http://www.md5summer.org/download.html. Você pode usa-lo, inclusive; para gerar códigos para arquivos enviados para os amigos, para que eles tenham certeza que o download foi bem sucedido.

Sem comentários
Por Carlos E. Morimoto. Revisado 26/jun/2005 às 22h03


Calculando hash MD5 do arquivo '$nome_do_pacote-$versao-`uname -m`.tgz'

'



sleep 3

md5sum ../$nome_do_pacote-$versao-`uname -m`.tgz  > ../$nome_do_pacote-$versao-`uname -m`.tgz.md5

# https://www.hardware.com.br/termos/md5sum


sed -i 's/\.\.\///' ../$nome_do_pacote-$versao-`uname -m`.tgz.md5



# O -f do comando cut abaixo pode variar de 12 para 13


zenity --info --text="


Obs: 

Antes de instalar a nova versão do $nome_do_pacote remove a versão antiga dele caso esteja instalado no seu sistema.



# ls -l /var/log/packages/ | grep -i $nome_do_pacote
`ls -l /var/log/packages/ | grep -i  "$nome_do_pacote"`


Exemplo:


# killall -9 $nome_do_pacote ; pkill $nome_do_pacote

# removepkg `ls -l /var/log/packages/ | grep -i "$nome_do_pacote" | cut -d' ' -f12`



Fica arquivo do pacote no sistema (Solução: criar um link simbolico do /opt/$nome_do_pacote/$nome_do_pacote na pasta $nome_do_pacote-$versao-`uname -m`/usr/local/bin/

e copiar o link do $nome_do_pacote para a pasta antes de gera o pacote .tgz)


# ls -l /usr/local/bin/firefox

`ls -l /usr/local/bin/firefox`


Para verificar o md5sum do arquivo $nome_do_pacote-$versao-`uname -m`.tgz

md5sum -c $nome_do_pacote-$versao-`uname -m`.tgz.md5
$nome_do_pacote-$versao-`uname -m`.tgz: SUCESSO


Agora é só roda os comandos abaixo para instalar o pacote $nome_do_pacote-$versao-`uname -m`.tgz:

# cd $ondesalvar

# installpkg $nome_do_pacote-$versao-`uname -m`.tgz


" --width="1000" --height="10"  2>/dev/null 




else


zenity --error --text "O arquivo $arquivo não existe!"  ---width 650 --height 100 2>/dev/null 

exit 1


fi



fi


exit 0

