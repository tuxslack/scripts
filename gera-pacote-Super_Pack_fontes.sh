#!/bin/bash
#
# Por Fernando Souza
# Data: 07/06/2021 as 13:50
# Licença: GPL <https://www.gnu.org/>
# Versão: 0.0.1
# Script: 
#
# Atualização em


# Super Pack de Fontes para Linux


# ~/.fonts/


# =====================================================================================================


# Variaveis do programa


USER="fernando"


# Titulos das janelas do Zenity

titulo="Gerenciar pacote de fontes - Super Pack de Fontes no Slackware"


DATA=`date +%d/%m/%Y-%H:%M`


# Autor

MAINTAINER="Fernando Souza"


# E-mail

EMAIL=""


# Nome do pacote

programa="Super-Pack-fontes"


# Versão do pacote

versao="0.0.1"


# Página web do programa (página oficial)

Homepage=""


# Arquivo de log

log="/tmp/$programa.log"


echo "
Removendo o arquivo de log $log ...
"

rm -Rf "$log"



# Tempo de espera para cada tarefa

tempo="3"



# `uname -m`

arquitetura="all" 


# =====================================================================================================


clear



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


verificar_root


# =====================================================================================================


# Pasta onde sera salvos os pacotes gerados no final do processo.

# Altera essa variavel para o diretório onde você deseja salvar o download do programa.
#
# ondesalvar="/run/media/fernando/backup/backup/meus_pacotes_manual/fontes/Super Pack de Fontes para Linux - com problema no Thunderbird trava/"


ondesalvar=$(zenity \
--title="$titulo" \
--text "Qual a pasta você deseja salvar o pacote do $programa-$versao?" \
--entry \
--entry-text="/run/media/fernando/backup/backup/meus_pacotes_manual/fontes/Super Pack de Fontes para Linux - com problema no Thunderbird trava/" \
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

which installpkg         2> "$log"
#/sbin/installpkg


which zenity             2>> "$log"
#/usr/bin/zenity


mkdir -p "$ondesalvar"   2>> "$log"


cd "$ondesalvar"         2>> "$log"

pwd 

ls 


sleep "$tempo"

# =====================================================================================================

clear

echo "
Realizando faxina...
"


rm -Rf "$programa".log


# Vai remove a pasta das fontes do Windows
#
# 
# rm -Rf $programa-$versao              2>> "$log"

rm -Rf /tmp/"$programa"-"$versao".${PKGTYPE:-tgz} 2>> "$log"

rm -Rf "$programa"-"$versao".tgz                  2>> "$log"
rm -Rf "$programa"-"$versao".tgz.md5sum           2>> "$log"
rm -Rf estrutura_diretorio.txt                    2>> "$log"




sleep "$tempo"

# =====================================================================================================

clear

echo "
Criando as pastas do pacote $programa-$versao
"

mkdir -p "$programa"-"$versao"/install/                                            2>> "$log"
mkdir -p "$programa"-"$versao"/usr/share/fonts/TTF/extras/"$programa"/             2>> "$log"
mkdir -p "$programa"-"$versao"/usr/doc/"$programa"/                                2>> "$log"

# mkdir -p $nome_do_pacote-$versao/usr/local/bin/                                  2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear


echo "
Gerando arquivo leia-me.txt para $programa-$versao ...
"

echo "
Super Pack de Fontes para Linux com problema no Thunderbird e no Qbittorrent trava.



			Pacote de instalação de Fontes
			==============================

Requerimentos
-------------

Não possui nenhum.




Introdução
----------

SOBRE OS ARQUIVOS: 

- 26.000 Fontes para instalação; 
- Recomendamos que instale no máximo 2 mil fontes para não sobrecarregar seu computador; 


Em caso de problema com fonte renomeia a pasta ~/.fonts ou /usr/share/fonts/TTF/extras


Fontes instaladas no sistema que tem problema com FontAwesome

https://www.vivaolinux.com.br/



Problema pode aparece:

Na interface grafica (Xfce)
No cliente de e-mail (Thunderbird)
Nos navegadores webs (Firefox, Google Chrome)
No terminal (xfce4-terminal)
No editor de texto (Gedit)
No site https://www.vivaolinux.com.br/ as fontes aparecem ruim
Nos e-mails recebidos do Facebook => noreply@facebookmail.com (Helvetica-Black-SemiBold.ttf  Helvetica-Black.otf  Helvetica-BlackOblique.otf  Helvetica-Light.otf)



https://fonts.google.com/specimen/Ubuntu
https://design.ubuntu.com/font/



Fontes de filmes

https://www.netfontes.com.br/famosas/filmes/


Fontes de musicas

- matanza



Walk Da Walk Three Expanded

Aunque

Beloid Gothic

Moyenage 15

Walk Da Walk Three Tall

Gutenberg Textura Pro

Walk Da Walk Three Expanded

FF Brokenscript Std Bold

Walk Da Walk Font

https://www.1001freefonts.com/walk-da-walk.font




Descubra qual fonte foi usada no texto de uma imagem ou foto

https://www.myfonts.com/WhatTheFont/

https://canaltech.com.br/internet/descubra-qual-fonte-foi-usada-no-texto-de-uma-imagem-ou-foto/


Fontes de desenhos

Fontes de Bebidas e Comidas



Fontes do Ubuntu

$ md5sum Ubuntu.zip 
30366a1f807d4ffe014f5d96b4d3cdd3  Ubuntu.zip


$ ls -1 Ubuntu/
Ubuntu-Bold.ttf
Ubuntu-BoldItalic.ttf
Ubuntu-Italic.ttf
Ubuntu-Light.ttf
Ubuntu-LightItalic.ttf
Ubuntu-Medium.ttf
Ubuntu-MediumItalic.ttf
Ubuntu-Regular.ttf



$ ls -1 ubuntu-font-family-0.83/
Ubuntu-B.ttf
Ubuntu-BI.ttf
Ubuntu-C.ttf
Ubuntu-L.ttf
Ubuntu-LI.ttf
Ubuntu-M.ttf
Ubuntu-MI.ttf
Ubuntu-R.ttf
Ubuntu-RI.ttf
Ubuntu-Th.ttf
UbuntuMono-B.ttf
UbuntuMono-BI.ttf
UbuntuMono-R.ttf
UbuntuMono-RI.ttf





Obrigado por fazer o download do Pack de Fontes do Brainstorm Tutoriais.

Essas sãs as fontes que eu mais utilizo em meus projetos: vídeos, thumbnails, títulos, imagens, etc.
Sinta-se livre para utilizá-las em seus projetos também!

Qualquer dúvida, faça um comentário no vídeo referente à esse pack.
--------------------------------------------------------------------
Caso as fontes não apareçam em seu Sony Vegas:
http://www.youtube.com/watch?v=LmniZoCn3hs
--------------------------------------------------------------------
Brainstorm Tutoriais
Siga no Twitter: @BrainstormT
--------------------------------------------------------------------
AVISO LEGAL: Estas fontes são gratuitas para uso individual e comercial, e estão disponíveis gratuitamente na Internet. 
Todos os direitos reservados aos autores e criadores das fontes.

DISCLAIMER: These fonts are free for personal and commercial use, and are available for free on the Internet. 
All rights reserved to the font authors and creators.
--------------------------------------------------------------------




  Telegram

  
  https://t.me/DesireFX_me


  https://t.me/joinchat/AAAAAFECQw34bmtMTHZRDw

  

  + Give away premium keys (Voucher code / PREMIUM / activation keys)    -    https://www.syncs.online/

  
  Free sharing content


   3D Models
   After Effects Projects
   Stock Images
   Stock Vectors
   T-Shirts Prints
   Characters
   Fonts
   Mock UP
   Photoshop
   Layered *.PSD
   Actions *.ATN
   Styles *.ASL
   Stock Video Footages


  https://www.DesireFX.me/





Jackwel is a modern and futuristic sans serif font. 
This font looks modern, futuristic, readable, stylish, catchy and easy to use.

Jackwel Font is the best choice for your professional design projects, including : 
logo, poster design, t-shirt, headline, flyer, cd cover album, quotes, business card, 
branding, magazines, social media, advertisements, product designs, or something that 
need modern or futuristic looks.

Highlight :
- Fonts are provided in OTF formats.
- The perfect font choice for powerful projects – watermarks, signatures, photography, logos, business cards, quotes, album covers.
- No special software is required, The fonts can be opened and used in almost any program/software that can read standard fonts – even MS Word

Whats included :
- Jackwel OTF

Enjoy 
Rometheme





Thank you for purchasing

To Install just double click .TTF font and click Install.

Tested and work in Windows 10

Warm Regards
Yandi 
yandidesigns.com

Facebook
https://facebook.com/yandidesigns

Email
yandidesigns@gmail.com




Introducing **Marvelous Photograph - Font Duo**

Marvelous Photograph Font duo is a stunning pair of luxury script and serif fonts. These typefaces are designed to contrast and compliment each other with elegant beauty and contemporary style. Use Marvelous Photograph to create gorgeous wedding invitations, beautiful stationary art, eye-catching social media posts, and cute greeting cards.

**FEATURES**
- TTF/OTF/WOFF (Script)
- TTF/OTF/WOFF (Serif)
- Uppercase and Lowercase letters
- Numbering and Punctuations
- Multilingual Support
- Works on PC or Mac
- Simple Installation
- Support Adobe Illustrator, Adobe Photoshop, Adobe InDesign, also works on Microsoft Word

Hope you Like it.
Thanks.



Hello,

Thank for purchasing and using our font.

- How to Enable OpenType Features in Word, Photoshop and Illustrator: 

https://medialoot.com/blog/how-to-enable-opentype-features-in-word-photoshop-and-illustrator/

- How to Using Special Characters:

https://helpx.adobe.com/illustrator/using/special-characters.html



https://www.desirefx.me/category/fonts/

http://www.mediafire.com/file/67bo9m9ae2g1zgf/Super_Pacote_de_Fontes__4.487.7z/file
http://www.mediafire.com/file/y21ewggm9r5ry6i/SUPER_PACK_DE_FONTES_DO_DRASTIOM_-_ANDROID_E_PC.zip/file
https://mega.nz/#!tE1mULZY!tIaMz62y1HPHWfZhS0lIw89KDmf3FiCau_tYxDUdsP4 


https://diolinux.com.br/design/pack-com-mais-de-4-mil-fontes-para-download.html
https://www.downloadgeral.com/super-fonts-pack-master-6
http://www.mediafire.com/file/yyohiezwxvgvic4/SFPMV640F.zip/file
http://www.mediafire.com/file/d1rw9bfh6ws543n/Pack_das_Fontes_-_professor_youtuber.rar/file
http://www.mediafire.com/file/pygvr4ry929zrde/.fontpack_%2528artbaekai%2529.rar/file
https://www.mediafire.com/file/tg64pye2h7kgke2/brainstorm-fonts.rar/file
https://www.brainstormtutoriais.com/downloads/download-pack-de-fontes-edicao-de-videodesign/
https://linuxdicasesuporte.blogspot.com/2018/12/super-pacote-com-4250-fonts-para-o-seu_19.html
https://www.dropbox.com/sh/5qmd43k6af1y5s6/AADfgO0OZjXTorGbwnlRHVTba
https://www.gugalamenha.com/pack-download-fontes-cartoon/
http://www.mediafire.com/file/rtm4axzc73quqve/Fontes_Cartoon.rar/file

DownloadGeral - https://www.downloadgeral.com

https://superpacktotal.com.br/20-fontes-gratuitas-para-convites-de-casamento-em-varios-estilos/


https://cssti.wordpress.com/2011/02/26/super-pacote-com-5000-fontes-profissionais/
https://mundocriativo.art.br/as-17-melhores-fontes-serifadas-gratuitas-para-designers/



lista completa


Fontes com efeito de giz


sketchy.ttf
apocalypse.ttf
HAWAIIAH.TTF



https://www.dafont.com/pt/theme.php?cat=605&page=2
https://fontmeme.com/fontes/fonte-black-crayon/
https://www.netfontes.com.br/user/giz


" > "$programa"-"$versao"/usr/doc/"$programa"/leia-me.txt  2>> "$log"

sleep "$tempo"

# =====================================================================================================

clear



echo "

0.0.1

* Face beta


Super Pack de Fontes para Linux - com problema no Thunderbird trava na parte das configurações.



Em caso de problema ao remove o pacote via removepkg:


# removepkg  Super_Pack_fontes-0.0.1.tgz

ls: cannot access '/var/log/packages/Super_Pack_fontes-0.0.1*': No such file or directory
No such package: /var/log/packages/Super_Pack_fontes-0.0.1. Can't remove.


# removepkg  Super_Pack_fontes-0.0.1

ls: cannot access '/var/log/packages/Super_Pack_fontes-0.0.1*': No such file or directory
No such package: /var/log/packages/Super_Pack_fontes-0.0.1. Can't remove.


# removepkg  Super_Pack_fontes-*

ls: cannot access '/var/log/packages/Super_Pack_fontes-**': No such file or directory
No such package: /var/log/packages/Super_Pack_fontes-*. Can't remove.



# ls /var/log/packages/ | grep -i Super_Pack_fontes-*


# rm -Rf /usr/doc/Super_Pack_fontes/
# rm -Rf /usr/share/fonts/TTF/extras/Super\ Pack/




Problema com fonte: Kristen ITC-9 quando usa o ~/.fluxbox/styles/royal_red_antix/

Remove a fonte ITCKRIST.TTF do sistema.


" > "$programa"-"$versao"/usr/doc/"$programa"/ChangeLog   2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

echo "

                 COPIANDO GNU GENERAL PUBLIC LICENSE

"

rsync -av COPYING   "$programa"-"$versao"/usr/doc/"$programa"/   2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

echo "
Gerando arquivo slack-desc para $programa-$versao...
"


echo "# HOW TO EDIT THIS FILE:
# The \"handy ruler\" below makes it easier to edit a package description.
# Line up the first '|' above the ':' following the base package name, and
# the '|' on the right side marks the last column you can put a character in.
# You must make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':' except on otherwise blank lines.

         |-----handy-ruler------------------------------------------------------|
$programa-$versao: $programa (Super Pack de Fontes para Linux)
$programa-$versao:
$programa-$versao: 
$programa-$versao: 
$programa-$versao: Baixe mais de 800 fontes para criar artes no Gimp, Inkscape
$programa-$versao: ou usar em seus projetos.
$programa-$versao: 
$programa-$versao: - Fontes do Azarado:
$programa-$versao: 
$programa-$versao:   Pack de fontes. O maior, melhor e mais completo
$programa-$versao: 
$programa-$versao: 
$programa-$versao:   http://sharefonts.net
$programa-$versao: 
$programa-$versao: 
$programa-$versao: - Repositorio:
$programa-$versao: 
$programa-$versao:   Google Fonts => https://fonts.google.com/
$programa-$versao: 
$programa-$versao: 
$programa-$versao: - Fontes da Apple:
$programa-$versao: 
$programa-$versao:   https://developer.apple.com/fonts/
$programa-$versao:  
$programa-$versao:  
$programa-$versao:  
$programa-$versao:  
$programa-$versao:  
$programa-$versao:  
$programa-$versao:  
$programa-$versao:  
$programa-$versao:  
$programa-$versao:  
$programa-$versao:  
$programa-$versao:   Homepage: $Homepage
$programa-$versao:  
$programa-$versao:  " > "$programa"-"$versao"/install/slack-desc  2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

echo "
Gerando arquivo doinst.sh para $programa-$versao ...
"


echo "

echo '
Atualizando cache de fontes...
'

# Depois de ter instalado novas fontes no sistema é importante atualizar o cache.

sudo fc-cache -vf

echo '

Pronto, agora você verá as fontes nos programas sem ter que reiniciar o sistema. :)
'


echo '
Atualizando os atalhos dos programas instalados...
'

if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database -q usr/share/applications 
fi


" > "$programa"-"$versao"/install/doinst.sh  2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

# --timeout="60" \

zenity  \
--info  \
--title="$titulo" \
--text="

Seja Bem vindo!

Copia as fontes agora para a pasta $programa-$versao/usr/share/fonts/TTF/extras/$programa/

" \
--width="700" --height="100"  2>/dev/null


clear

echo "
Abriando a pasta $programa-$versao/usr/share/fonts/TTF/extras/$programa ...
"


xdg-open "$programa"-"$versao"/usr/share/fonts/TTF/extras/"$programa"/


sleep "$tempo"

# =====================================================================================================

clear


# pwd && ls -1 | tee -a "$log"


# Gera uma lista das fontes que esta no pacote atualmente

echo "

---------------------------------------
    Os arquivos de fontes no pacote 
---------------------------------------

" > "$programa"-"$versao"/usr/doc/"$programa"/lista-completa.txt   2>> "$log"


ls -1 "$programa"-"$versao"/usr/share/fonts/TTF/extras/"$programa"/*.{ttf,TTF,otf,OTF,woff,woff2,eot,pfm,pfb,ttc,TTC,afm,fon,FON}  >> "$programa"-"$versao"/usr/doc/"$programa"/lista-completa.txt  2>> "$log"


echo "

" >> "$programa"-"$versao"/usr/doc/"$programa"/lista-completa.txt   2>> "$log"




tamanho=`du -sh "$programa"-"$versao" | cut -d"/" -f1`



cd "$programa"-"$versao"/usr/share/fonts/TTF/extras/"$programa"/ 2>> "$log"

# pwd
# ls

# Retira "a/A Bug s Life - Debugged.ttf" do arquivo lista-completa.txt

                 for i in {a..z}; 

                 do


if [ -e "$i" ]
then

# echo "O diretorio $i existe" 


echo "


=================================================================================
                                 Letra $i:
=================================================================================


" >> ../../../../../../usr/doc/Super_Pack_fontes/lista-completa.txt


                     ls -1 "$i"/*.{ttf,TTF,otf,OTF,woff,woff2,eot,pfm,pfb,ttc,TTC,afm,fon,FON}  >> ../../../../../../usr/doc/"$programa"/lista-completa.txt  2>> "$log"


else

echo "O diretorio $i não existe" | tee -a "$log"

fi

                done



# sleep 1

# pwd && ls -1 | tee -a "$log"


cd ../../../../../../../


echo "
Tamanho dos arquivos: $tamanho

" >> "$programa"-"$versao"/usr/doc/"$programa"/lista-completa.txt  2>> "$log"


# sleep 1

# pwd && ls -1 | tee -a "$log"



# =====================================================================================================

clear

echo "
Para deletar somente a palavra $programa-$versao/usr/share/fonts/TTF/extras/$programa  e $programa-$versao  com sed

"

sed -i 's|'"$programa"'-'"$versao"'/usr/share/fonts/TTF/extras/'"$programa"'/||'  "$programa"-"$versao"/usr/doc/"$programa"/lista-completa.txt  2>> "$log"

sed -i 's|'"$programa"'-'"$versao"'||'  "$programa"-"$versao"/usr/doc/"$programa"/lista-completa.txt  2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

echo "
Executando chown e chmod na pasta $programa-$versao/ ...
"


chown -R root:root "$programa"-"$versao"   2>> "$log"

chmod -R 755       "$programa"-"$versao"   2>> "$log"


sleep "$tempo"


# =====================================================================================================

clear

# Criar um pacote de instalação tgz

cd "$programa"-"$versao" 2>> "$log"


pwd

ls

echo "
Gerando o pacote "$programa"-"$versao".${PKGTYPE:-tgz} em /tmp ...
" | tee -a "$log"

/sbin/makepkg -l y -c n /tmp/"$programa"-"$versao".tgz  2>> "$log"




sleep "$tempo"


# =====================================================================================================

clear

echo "
Calculando o md5sum  do pacote $programa-$versao.tgz...
" | tee -a "$log"


cd ../

pwd

ls


md5sum /tmp/"$programa"-"$versao".${PKGTYPE:-tgz} > "$programa"-"$versao".${PKGTYPE:-tgz}.md5sum  2>> "$log"

mv  /tmp/"$programa"-"$versao".${PKGTYPE:-tgz} .  2>> "$log"


sleep "$tempo"

# =====================================================================================================

clear

echo "
Abrir o arquivo de log $log
"

xdg-open "$log" 2> /dev/null

xdg-open "$programa"-"$versao"/usr/doc/"$programa"/lista-completa.txt 2> /dev/null


sleep "$tempo"

# =====================================================================================================

clear

echo "
Movendo o arquivo de log $log para a pasta $programa-$versao
"

pwd

ls 

mv  "$log"  .


# =====================================================================================================


exit 0

