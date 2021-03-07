#!/bin/bash
#
# Baixe o Thunderbird através da página de download dele, para a sua pasta "Home".
# 
# https://www.mozilla.org/firefox/download/thanks/
# https://www.edivaldobrito.com.br/firefox-no-linux-manualmente/
# https://support.mozilla.org/pt-BR/kb/instale-o-firefox-no-linux
#
# http://devfuria.com.br/linux/instalando-firefox/
#
#
# 
# Para remove o Thunderbird antigo
# 
# root@darkstar:# ls -l /var/log/packages/ | grep -i thunderbird
# Thunderbird-74.0.1-x86_64
# 
# root@darkstar:# removepkg Thunderbird-74.0.1-x86_64
#
#
# Para instalar o Thunderbird atual
#
# root@darkstar:# installpkg Thunderbird-75.0-x86_64.tgz 
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

nome_do_pacote="thunderbird"


# Página web do programa

Homepage="https://www.thunderbird.net/pt-BR/"


# Arquivo de log

log="/tmp/$nome_do_pacote.log"



# Altera essa variavel para o diretório onde você deseja salvar o download do programa.
#
# ondesalvar="/run/media/fernando/backup/backup/meus pacotes manual/thunderbird"


ondesalvar=$(zenity \
--title="$titulo" \
--text "Qual a pasta você deseja salvar o download do Thunderbird?" \
--entry \
--entry-text="/run/media/fernando/backup/backup/meus_pacotes_manual/thunderbird" 2> /dev/null)


# Para verificar se a variavel é nula

if [ -z "$ondesalvar" ];then

zenity \
--warning \
--timeout="10" \
--text "Não pode ter valor nulo! \n\n\nInforme uma pasta para o download do Thunderbird \n\n\n Saindo 10s ..." \
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


which zenity       | tee $log
which lynx         | tee $log
which makepkg      | tee $log
which wget         | tee $log
which thunderbird  | tee $log
which md5sum       | tee $log


# Verifica se quem executa é root

# https://www.vivaolinux.com.br/script/Verifica-se-quem-executa-e-root


if [ "$(id -u)" != "0" ]; then

zenity --info --text "Você deve executar este script como root! " ---width 650 --height 100 2> /dev/null


else

echo "Você é root!"




#
#
#
# Pega a versão atual do Thunderbird no site https://www.thunderbird.net/
#
# ******************************************************************************************
#
# Método 1 (Problema):
#
#
# versao=$(lynx -dump https://www.thunderbird.net/en-US/thunderbird/releases/|sed -nr 's/^ +//p'|sed -nr '/^Release notes/,+3p'|tail -n1|awk -F '[ \]]' '{print $NF}')
#
# awk: warning: escape sequence `\]' treated as plain `]'
# [17]78.3.0 [18]78.3.1 [19]78.3.2 [20]78.3.3 [21]78.4.0 [22]78.4.1
#
#
#
# Nota:
#
# Esse Método 1, não é eficiente, pq, quem seleciona as linhas, é o sed.....
#
# sed -nr '/^Release notes/,+3p' # pega a linha "Release notes" + 3 linhas
#
# se colocarem mais uma linha com novas versões, não pegará a versão correta.
# Já os métodos, 2 e 3, pegam o registro inteiro,
# independentemente do nº de linhas....
#
#
#
#
#
#
# O método 2 e o 3 são iguais....
#
# A diferença é que criei a variavel $url para "encurtar" o comando....
#
#
# Método 2 - OK
#
#
# url="https://www.thunderbird.net/en-US/thunderbird/releases/";
#
# versao=$(lynx -dump $url|sed 's/^ \+//'|awk 'BEGIN{RS="\n\n";FS="[\n ]";} /Release notes/{x=NR+2;}(NR==x) {printf "%s\n" ,$NF}'|sed 's/^.*\]//')
#
#
# Método 3 - OK
#
#
versao=$(lynx -dump "https://www.thunderbird.net/en-US/thunderbird/releases/"|sed 's/^ \+//'|awk 'BEGIN{RS="\n\n";FS="[\n ]";} /Release notes/{x=NR+2;}(NR==x) {printf "%s\n" ,$NF}'|sed 's/^.*\]//')
#
#
#
# Nota sobre os métodos 2 e 3:
# 
#
# O "SED" inicial retira os espaços do inicio da linha....
#
# O "AWK", analisa a saída do lynx como registros separados por "\n\n",
#
# "Casei" o padrão "/Release notes", observando a saída, o que 'queremos', está 2 registros após o que 'casou', {x=NR+2;}
#
#
# E, finalmente, pega o que "queremos", que é o ultimo campo "$NF"
#
# (NR==x) {printf "%s\n" ,$NF}'
#
# sed 's/^.*\]//' , elimina \[[0-9]+\]
#
#
# É isso......
#
#
# Contribuição para a variavel $versao: msoliver <https://www.vivaolinux.com.br/~msoliver>
#
#
#
#
# Verifique se é a versão atual, senão modifique.
#
# https://www.thunderbird.net/pt-BR/
# https://www.thunderbird.net/en-US/thunderbird/78.4.1/releasenotes/
#
#
# Método 4 (Coloca a versão do Thunderbird de forma manual) - OK
#
# versao="78.4.1"
#
#
#
# ******************************************************************************************


# versao_instalada=$(thunderbird -v | awk '{print $2}')

versao_instalada=$(ls /var/log/packages/ | grep -i thunderbird  | cut -d '-' -f 2)


# ls /var/log/packages/ | grep -i thunderbird
# thunderbird-78.4.2-x86_64


# https://discourse.c3sl.ufpr.br/t/webgl-para-scratch-mit-edu/987



# Só funciona com o usuário comum a variavel $versao_instalada. 
#
# Com Root tem problema.
#
#
# Running Thunderbird as root in a regular user's session is not supported.  ($XAUTHORITY is $HOME/.Xauthority which is owned by $USER.)


# Link para baixar o Thunderbird
#
link="https://download-installer.cdn.mozilla.net/pub/thunderbird/releases/$versao/linux-`uname -m`/pt-BR/thunderbird-$versao.tar.bz2"


arquivo="$nome_do_pacote-$versao.tar.bz2"



# Comparar valores das variáveis


if [ "$versao_instalada" == "$versao" ]; then

            clear

            # Valores iguais

zenity --info --text "

O Thunderbird está atualizado.

Versão no site $Homepage : $versao

Versão instalada: $versao_instalada

" ---width 650 --height 100 2> /dev/null


           exit 2


           else


           clear

           # Valores não batem

zenity --info --text "
O Thunderbird está desatualizado.

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


wget -O "$ondesalvar/$arquivo" -c "$link"

sleep 5


fi

# ******************************************************************************************


clear



cd "$ondesalvar" 2>> $log

pwd 
ls 


# Verificar se o arquivo $nome_do_pacote-$versao.tar.bz2 existe na pasta atual.

if [ -e "$arquivo" ]; then

echo "Arquivo $arquivo existe.

Versão do Thunderbird  a ser instalada: $versao
"


sleep 5



echo "

" > $log


ls -lh $nome_do_pacote-*.tar.bz2  2>> $log



rm -Rf estrutura_diretorio.txt                 2>> $log
rm -Rf $nome_do_pacote-$versao-`uname -m`      2>> $log
rm -Rf $nome_do_pacote-$versao-`uname -m`.tgz  2>> $log



mkdir -p $nome_do_pacote-$versao-`uname -m`/opt/                    2>> $log

mkdir -p $nome_do_pacote-$versao-`uname -m`/install/                2>> $log

mkdir -p $nome_do_pacote-$versao-`uname -m`/usr/local/bin/          2>> $log

mkdir -p $nome_do_pacote-$versao-`uname -m`/usr/share/applications/ 2>> $log




tar xvjf $nome_do_pacote-$versao.tar.bz2 -C $nome_do_pacote-$versao-`uname -m`/opt/  2>> $log


# Feche todas as janelas do Thunderbird se tiver alguma aberta.




echo "[Desktop Entry]
Encoding=UTF-8
Exec=/opt/thunderbird/thunderbird
Icon=/opt/thunderbird/chrome/icons/default/default128.png
Type=Application
Categories=Application;Network;
Name=Thunderbird
Name[bn]=থাণ্ডারবার্ড
Name[eo]=Mozilo Tondrobirdo
Name[fi]=Mozilla Thunderbird
Name[pa]=ਥੰਡਰਬਰਡ
Name[tg]=Паррандаи бало
GenericName=Mail Client
GenericName[af]=Pos Kliënt
GenericName[ar]=البريد الألكتروني
GenericName[az]=Poçt Alıcısı
GenericName[be]=Паштовы кліент
GenericName[bg]=Пощенски клиент
GenericName[bn]=ইমেইল ক্লায়েন্ট
GenericName[br]=Arval postel
GenericName[bs]=Program za čitanje elektronske pošte
GenericName[ca]=Client de correu electrònic
GenericName[cs]=Klient pro čtení elektronické pošty
GenericName[cy]=Dibynnydd Ebost
GenericName[da]=E-mail-klient
GenericName[de]=E-Mail-Programm
GenericName[el]=Πελάτης mail
GenericName[eo]=Legi kaj sendi retpoŝton
GenericName[es]=Cliente de correo electrónico
GenericName[et]=Meiliklient
GenericName[eu]=Posta bezeroa
GenericName[fa]=کارگیر پست الکترونیکی
GenericName[fi]=Sähköpostiohjelma
GenericName[fo]=Postforrit
GenericName[fr]=Logiciel de messagerie électronique
GenericName[ga]=Cliant Ríomhphoist
GenericName[gl]=Cliente de correo
GenericName[he]=תוכנית דואר
GenericName[hi]=डाकिया
GenericName[hr]=Program za čitanje elektronske pošte
GenericName[hu]=Levelezőprogram
GenericName[id]=Klien Mail
GenericName[is]=Póstforrit
GenericName[it]=Programma di posta elettronica
GenericName[ja]=メールクライアント
GenericName[ko]=편지를 주고 받는 프로그램
GenericName[lo]=ໄຄແເອັນຈົດຫມາຍເອເລັກໂຕນິກ
GenericName[lt]=Pašto klientas
GenericName[lv]=Pasta Klients
GenericName[mk]=Програма за електронска пошта
GenericName[mn]=Э-Захиа-Програм
GenericName[mt]=Klijent tal-imejl
GenericName[nb]=E-postklient
GenericName[nds]=Mailprogramm
GenericName[nl]=E-mailclient
GenericName[nn]=Lesing og sending av e-post
GenericName[nso]=Moreki wa Poso
GenericName[oc]=Programari de correu electrònic
GenericName[pa]=ਪੱਤਰ ਕਲਾਂਇਟ
GenericName[pl]=Program do wysyłania i odbierania poczty elektronicznej
GenericName[pt]=Client de E-mail
GenericName[pt_BR]=Cliente de E-mail
GenericName[ro]=Program de poştă electronică
GenericName[ru]=Клиент электронной почты
GenericName[se]=Boastaprográmma
GenericName[sk]=Klient elektronickej pošty
GenericName[sl]=Program za e-pošto
GenericName[sr]=Програм за e-пошту
GenericName[sr@Latn]=Program za e-poštu
GenericName[ss]=Likhasimende leliposi
GenericName[sv]=E-postklient
GenericName[ta]=அஞ்சல் உறுப்பினர்
GenericName[tg]=Коргири почтаи эллектроникӣ
GenericName[th]=ไคลเอนต์จดหมายอิเล็กทรอนิกส์
GenericName[tr]=Posta İstemcisi
GenericName[uk]=Клієнт електронної пошти
GenericName[uz]=Хат-хабар клиенти
GenericName[ven]=Mushumisani na poso
GenericName[wa]=Cliyint d' emilaedje
GenericName[xh]=Umxhasi Weposi
GenericName[zh_CN]=邮件程序
GenericName[zh_TW]=郵件處理程式
GenericName[zu]=Umxhasi weposi
X-KDE-StartupNotify=true

" > $nome_do_pacote-$versao-`uname -m`/usr/share/applications/mozilla-$nome_do_pacote.desktop  2>> $log





# Mas pense um pouco: "já existe uma versão instalada com esse link definido" então é melhor desinstalar a versão atual

echo '

if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database -q usr/share/applications 
fi

' > $nome_do_pacote-$versao-`uname -m`/install/doinst.sh 2>> $log


echo "
Copiando o arquivo do link simbolico /opt/$nome_do_pacote/$nome_do_pacote para a pasta $nome_do_pacote-$versao-`uname -m`/usr/local/bin/


No arquivo $nome_do_pacote-$versao-`uname -m`/install/doinst.sh

( cd usr/local/bin ; rm -rf $nome_do_pacote )
( cd usr/local/bin ; ln -sf /opt/$nome_do_pacote/$nome_do_pacote $nome_do_pacote )

"


cp -a $nome_do_pacote  $nome_do_pacote-$versao-`uname -m`/usr/local/bin/  2>> $log


clear
sleep 1

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
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: $nome_do_pacote-$versao-`uname -m` (Cliente de E-mail)
$nome_do_pacote-$versao-`uname -m`:
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: Mozilla Thunderbird é um software cliente de e-mails e notícias da 
$nome_do_pacote-$versao-`uname -m`: Mozilla Foundation, mesma criadora do Mozilla Firefox. Acessa também 
$nome_do_pacote-$versao-`uname -m`: arquivos XML, Feeds (Atom e RSS), bloqueia imagens, tem filtro anti-spam 
$nome_do_pacote-$versao-`uname -m`: embutido e um mecanismo que previne golpes por meio das mensagens. 
$nome_do_pacote-$versao-`uname -m`: Sua última versão estável lançada foi a $versao, no dia 12 de março de 2020. 
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: Com os temas (themes), pode-se modificar a aparência da interface do 
$nome_do_pacote-$versao-`uname -m`: Thunderbird. Um tema pode tanto alterar os ícones da barra de  
$nome_do_pacote-$versao-`uname -m`: ferramentas como modificar todos os elementos da interface. É possível 
$nome_do_pacote-$versao-`uname -m`: baixar e instalar temas com apenas alguns cliques. Em 7 de dezembro de 2004 
$nome_do_pacote-$versao-`uname -m`: a versão 1.0 foi lançada, e obteve mais de 500 mil[10] downloads nos três 
$nome_do_pacote-$versao-`uname -m`: primeiros dias (e um milhão em 10 dias). O programa foi lançado com a 
$nome_do_pacote-$versao-`uname -m`: campanha que alegava ser a companhia perfeita ao Mozilla Firefox, navegador 
$nome_do_pacote-$versao-`uname -m`: em constante expansão de mercado.  
$nome_do_pacote-$versao-`uname -m`:  
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: https://pt.wikipedia.org/wiki/Mozilla_Thunderbird
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`:
$nome_do_pacote-$versao-`uname -m`:
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`: 
$nome_do_pacote-$versao-`uname -m`:
$nome_do_pacote-$versao-`uname -m`: Homepage: $Homepage
$nome_do_pacote-$versao-`uname -m`:
$nome_do_pacote-$versao-`uname -m`:
" > $nome_do_pacote-$versao-`uname -m`/install/slack-desc  2>> $log



chown -R root:root $nome_do_pacote-$versao-`uname -m` 2>> $log

chmod -R 755 $nome_do_pacote-$versao-`uname -m` 2>> $log


cd $nome_do_pacote-$versao-`uname -m` 2>> $log


tree -a > estrutura_diretorio.txt 2>> $log

mv estrutura_diretorio.txt  ../  2>> $log



# Apagar a linha que tem a palavra estrutura_diretorio.txt no arquivo ../estrutura_diretorio.txt

sed -i '/estrutura_diretorio.txt/d' ../estrutura_diretorio.txt

# https://www.vivaolinux.com.br/topico/Sed-Awk-ER-Manipulacao-de-Textos-Strings/Apagar-linha-com-palavra


clear

echo "
Gerando pacote $nome_do_pacote-$versao-`uname -m`.tgz
" 

sleep 2


/sbin/makepkg -l y -c n  ../$nome_do_pacote-$versao-`uname -m`.tgz | tee $log


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
`ls -l /var/log/packages/ | grep -i  $nome_do_pacote`


Exemplo:


# killall -9 $nome_do_pacote ; pkill $nome_do_pacote

# removepkg `ls -l /var/log/packages/ | grep -i $nome_do_pacote | cut -d' ' -f12`



Fica arquivo do pacote no sistema (Solução: criar um link simbolico do /opt/$nome_do_pacote/$nome_do_pacote na pasta $nome_do_pacote-$versao-`uname -m`/usr/local/bin/

e copiar o link do $nome_do_pacote para a pasta antes de gera o pacote .tgz)


# ls -l /usr/local/bin/$nome_do_pacote

`ls -l /usr/local/bin/$nome_do_pacote`


Para verificar o md5sum do arquivo $nome_do_pacote-$versao-`uname -m`.tgz

md5sum -c $nome_do_pacote-$versao-`uname -m`.tgz.md5
$nome_do_pacote-$versao-`uname -m`.tgz: SUCESSO


Agora é só roda os comandos abaixo para instalar o pacote $nome_do_pacote-$versao-`uname -m`.tgz:

# cd $ondesalvar

# installpkg $nome_do_pacote-$versao-`uname -m`.tgz


" --width="1000" --height="10" 2>/dev/null


else


clear

zenity --error --text "O arquivo $arquivo não existe!"  ---width 650 --height 100 2>/dev/null 

exit 1


fi



fi


exit 0


