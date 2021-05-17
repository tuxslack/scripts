#!/bin/bash

# Facilitando a instalação de pacotes no Slackware



# Em caso de problema com icones dos programa do libreoffice que não aparece no gerenciador de arquivo (Thunar) e nem no menu iniciar:
#
# Ver se remover as pastas ~/.cache e ~/.thumbnails funciona depois de reiniciar o gerenciador de arquivos (Thunar) => $ thunar -q
#
# https://linuxdicasesuporte.blogspot.com/2014/04/thunar-xfce4-nao-exibe-miniaturas-de.html
# https://linuxavante.com/cover-thumbnailer-mostra-miniaturas-de-pastas-para-diretorios-de-imagens-e-musicas-nautilus-nemo-caja-thunar



# https://slackbuilds.org/
# https://www.libreoffice.org
# https://slackbuilds.org/repository/14.2/office/libreoffice/
# https://www.vivaolinux.com.br/script/Testando-o-Zenity-2
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=16666


clear


# Variaveis do programa


titulo="Gerenciar pacote do LibreOffice no Slackware"


DATA=`date +%d/%m/%Y-%H:%M`


MAINTAINER=""
EMAIL=""


# Arquivo de log

log="/tmp/libreoffice.log"


Homepage="https://www.libreoffice.org"
link="https://pt-br.libreoffice.org/baixe-ja/"



DOWNLOAD="https://pt-br.libreoffice.org/donate/dl/rpm-x86_64/7.0.5/pt-BR/LibreOffice_7.0.5_Linux_x86-64_rpm.tar.gz
https://download.documentfoundation.org/libreoffice/stable/7.0.5/rpm/x86_64/LibreOffice_7.0.5_Linux_x86-64_rpm_langpack_pt-BR.tar.gz
https://download.documentfoundation.org/libreoffice/stable/7.0.5/rpm/x86_64/LibreOffice_7.0.5_Linux_x86-64_rpm_helppack_pt-BR.tar.gz

https://downloadarchive.documentfoundation.org/libreoffice/old/6.2.8.2/rpm/x86_64/LibreOffice_6.2.8.2_Linux_x86-64_rpm_helppack_en-US.tar.gz
https://downloadarchive.documentfoundation.org/libreoffice/old/6.2.8.2/rpm/x86_64/LibreOffice_6.2.8.2_Linux_x86-64_rpm_langpack_en-GB.tar.gz


https://tdf.c3sl.ufpr.br/libreoffice/stable/7.0.5/rpm/x86_64/LibreOffice_7.0.5_Linux_x86-64_rpm.tar.gz
https://www.mirrorservice.org/sites/download.documentfoundation.org/tdf/libreoffice/stable/7.0.5/rpm/x86_64/LibreOffice_7.0.5_Linux_x86-64_rpm.tar.gz
https://download.documentfoundation.org/libreoffice/src/7.0.5/libreoffice-7.0.5.2.tar.xz


http://mirror.pop-sc.rnp.br/mirror/tdf/libreoffice/stable/7.0.6/rpm/x86_64/LibreOffice_7.0.6_Linux_x86-64_rpm.tar.gz
https://tdf.c3sl.ufpr.br/libreoffice/stable/7.0.6/rpm/x86_64/LibreOffice_7.0.6_Linux_x86-64_rpm_langpack_pt-BR.tar.gz
https://tdf.c3sl.ufpr.br/libreoffice/stable/7.0.6/rpm/x86_64/LibreOffice_7.0.6_Linux_x86-64_rpm_helppack_pt-BR.tar.gz
"



arquitetura=`uname -m`





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




# Verificar se esta usando o Slackware

verificar_slack(){


clear

grep 'Slackware' /etc/slackware-version > /dev/null

 if [ $? -eq 0 ];then

   clear

   echo ""

   echo -e "[\033[01;32m OK - Esta usando Slackware... \033[01;37m]"


  else


   clear

   echo ""

   echo -e "[\033[01;31m Erro - Não esta usando Slackware.  \033[01;37m]"

   zenity --error --text="Não esta usando Slackware." --width="300" --height="100"   2>/dev/null

   exit 2

 fi


}





# Baixar o LibreOffice

baixar(){

clear


# Mostra a versão do LibreOffice instalada no sistema.

versaoinstalada=`soffice --version | cut -d" " -f2 | head -n1`

versaonosite=$(lynx -dump "https://pt-br.libreoffice.org/baixe-ja/libreoffice-novo/" | grep -i "stable" | head -n 6 | tail -n1 | cut -d"/" -f6)


# http://www.bosontreinamentos.com.br/linux/comando-tail-mostrar-o-final-de-um-arquivo-de-texto-no-linux/



# Obtendo os fontes do LibreOffice

# O primeiro passo e um dos mais importantes que faremos, será acessar o site do LibreOffice e obter os arquivos para a instalação e criação do pacote propriamente dito. 

echo "
Carregada a página de downloads, você vai baixar os três pacotes RPM referente à sua arquitetura do sistema operacional, isto é, se eu seu sistema for 32 bits, baixe a versão Linux x86 (rpm). Senão, a versão será Linux x86_64 (rpm) para sistemas 64 bits.
"


zenity  \
--info  \
--timeout="60" \
--title="$titulo" \
--text="Carregada a página de downloads, você vai baixar os três pacotes RPM referente à sua arquitetura do sistema operacional, isto é, se eu seu sistema for 32 bits, baixe a versão Linux x86 (rpm). Senão, a versão será Linux x86_64 (rpm) para sistemas 64 bits.


Versão do LibreOffice instalada no sistema: $versaoinstalada

Versão do LibreOffice no site $Homepage: $versaonosite


" \
--width="700" --height="100"  2>/dev/null



xdg-open "$link"


}






# Gera pacote para o Slackware

gera(){


which installpkg 
#/sbin/installpkg


which zenity
#/usr/bin/zenity


which  sed
# /bin/sed



# Faxina inicial

rm -Rf /tmp/libreoffice*



# -----------------------------------------------------------------------------------------------------

programa="libreoffice"

versao="7.0.5.2"
SRCSHORT=$(echo "$versao" | cut -f1-3 -d.)


BUILD=${BUILD:-1}
TAG=${TAG:-_SBo}

# Libreoffice Draw e Impress parecem precisar de avahi

REQUIRES="libdaemon avahi"



ls -l /var/log/packages/ | grep -i libdaemon
# -rw-r--r-- 1 root root    1122 Abr  2 02:25 libdaemon-0.14-x86_64-1_SBo

# https://slackbuilds.org/repository/14.2/libraries/libdaemon/


ls -l /var/log/packages/ | grep -i avahi
# -rw-r--r-- 1 root root   10405 Abr  2 02:27 avahi-0.8-x86_64-3_SBo

# https://slackbuilds.org/repository/14.2/network/avahi/



tmp="/tmp/$programa"


# rm: não foi possível remover '/tmp/libreoffice/ajuda/opt/libreoffice7.0/help/pt-BR/text/sbasic/shared/03090103.html': Permissão negada

rm -Rf "$tmp"
rm -Rf /tmp/$programa*

mkdir -p "$tmp"
mkdir -p "$tmp"/pacote


PKG="$tmp/pacote"



# Change source package name

if [ "$arquitetura" = "x86_64" ]; then
  SRCARCH="x86-64"
  PKGARCH="$arquitetura"
elif [ "$arquitetura" = "arm" ]; then
  printf "\n$arquitetura não é compatível com o LibreOffice...\n\n"
  exit 1
else
  SRCARCH="x86"
  PKGARCH="i586"
fi



# Janela de seleção do diretório que estão os arquivos compactados do LibreOffice

 diretorio=`zenity --file-selection --directory --title "Selecione o diretório onde estão os arquivos baixados do LibreOffice" 2> /dev/null`

  case $? in
     0) source $diretorio ;;
     1) zenity --warning --text "Nenhum diretório foi selecionado" 2> /dev/null ;;
    -1) zenity --warning --text "Nenhum diretório foi selecionado" 2> /dev/null ;;
  esac


cd "$diretorio"

ls *.tar.gz >> "$log"



# Pacote principal


clear

# Verificar se arquivo existe

if [ -e LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm.tar.gz ]; then

echo "O arquivo LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm.tar.gz  existe"

sleep 2

clear

# Descompactar o arquivo

echo "
Extrair tarball (LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm.tar.gz)
"

tar xvf LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm.tar.gz                -C "$tmp"  2>> "$log"

 if [ $? -eq 0 ];then

   echo -e "[\033[01;32m OK - Extração terminada... \033[01;37m]"

  else

   echo -e "[\033[01;31m Erro - A extração do arquivo deve problema. \033[01;37m]"

   exit 1

 fi


cd "$tmp"/LibreOffice_"$versao"_Linux_"$SRCARCH"_rpm/RPMS/  2>> "$log"


# Extraindo os pacotes .rpm

for FILE in *.rpm ; do rpm2cpio < $FILE | cpio -imdv  2>> "$log" ; done

rm -rf desktop-integration *.rpm  2>> "$log"

mv opt usr $PKG  2>> "$log"


cd $PKG


SRCSHORT=$(echo "$versao" | cut -f1-2 -d.)


# Altera os executaveis dos programas do libreoffice

cd $PKG/opt/libreoffice$SRCSHORT/share/xdg/ 2>> "$log"


pwd


# No menu do Fluxbox esta como:
#
# Libreoffice - Writer   soffice --writer
# Libreoffice - Cal      soffice --calc
# Libreoffice - Draw     soffice --draw
# Libreoffice - Impress  soffice --impress
# Libreoffice - Base     soffice --base
# Libreoffice - Math     soffice --math

  for FILE in \
    base.desktop calc.desktop draw.desktop impress.desktop math.desktop startcenter.desktop writer.desktop xsltfilter.desktop ; do


# Usar o sed

      # Exec=libreoffice7.0 --writer


      # sed -e 's|^Exec|Exec= soffice --writer|g'   $FILE  2>> "$log"

      sed -i "s|Exec=libreoffice$SRCSHORT|Exec=soffice|g" $FILE  2>> "$log"

  done




# Altera os icones dos programas do LibreOffice

# Usar o sed

# Icon=/usr/share/icons/hicolor/48x48/apps/libreoffice7.0-base.png libreoffice7.0-document-new


# Obs: Usar o tamanho 512x512 para icones.

# Não pode ter espaço em branco depois do (.png) se não aparece os icones.


sed -i "s|^Icon=libreoffice$SRCSHORT-base|Icon=/usr/share/icons/hicolor/512x512/apps/libreoffice$SRCSHORT-base.png|g"                $PKG/opt/libreoffice$SRCSHORT/share/xdg/base.desktop         2>> "$log"

sed -i "s|^Icon=libreoffice$SRCSHORT-calc|Icon=/usr/share/icons/hicolor/512x512/apps/libreoffice$SRCSHORT-calc.png|g"                $PKG/opt/libreoffice$SRCSHORT/share/xdg/calc.desktop         2>> "$log"

sed -i "s|^Icon=libreoffice$SRCSHORT-draw|Icon=/usr/share/icons/hicolor/512x512/apps/libreoffice$SRCSHORT-draw.png|g"                $PKG/opt/libreoffice$SRCSHORT/share/xdg/draw.desktop         2>> "$log"

sed -i "s|^Icon=libreoffice$SRCSHORT-impress|Icon=/usr/share/icons/hicolor/512x512/apps/libreoffice$SRCSHORT-impress.png|g"          $PKG/opt/libreoffice$SRCSHORT/share/xdg/impress.desktop      2>> "$log"

sed -i "s|^Icon=libreoffice$SRCSHORT-math|Icon=/usr/share/icons/hicolor/512x512/apps/libreoffice$SRCSHORT-math.png|g"                $PKG/opt/libreoffice$SRCSHORT/share/xdg/math.desktop         2>> "$log"

sed -i "s|^Icon=libreoffice$SRCSHORT-startcenter|Icon=/usr/share/icons/hicolor/512x512/apps/libreoffice$SRCSHORT-startcenter.png|g"  $PKG/opt/libreoffice$SRCSHORT/share/xdg/startcenter.desktop  2>> "$log"

sed -i "s|^Icon=libreoffice$SRCSHORT-writer|Icon=/usr/share/icons/hicolor/512x512/apps/libreoffice$SRCSHORT-writer.png|g"            $PKG/opt/libreoffice$SRCSHORT/share/xdg/writer.desktop       2>> "$log" 



# /usr/share/icons/hicolor/48x48/apps/libreoffice$SRCSHORT-chart.png
# /usr/share/icons/hicolor/48x48/apps/libreoffice$SRCSHORT-main.png


# sed -i "s|^Icon=|Icon=|g" $FILE  

# sudo sed --in-place 's/NoDisplay=false/NoDisplay=true/g' *.desktop

# sed 's|^Exec=|Exec=env LANG=he_IL.UTF-8 |g' /usr/share/applications/abiword.desktop > ~/.local/share/applications/abiword.desktop


# https://linuxize.com/post/how-to-use-sed-to-find-and-replace-string-in-files/
# https://wiki.archlinux.org/title/Desktop_entries_(Portugu%C3%AAs)





# Create symlinks in /usr/bin to actual binaries

cd $PKG/usr/bin



# Entrada inválida no desktop: '/usr/share/applications/libreoffice7.0-writer.desktop

rm -Rf $PKG/usr/bin/libreoffice$SRCSHORT  2>> "$log"

ln -sf ../../opt/libreoffice$SRCSHORT/program/soffice soffice



  for FILE in \
    sbase scalc sdraw simpress smath soffice swriter unopkg ; do

      rm -f $FILE 2>> "$log"

      ln -sf ../../opt/libreoffice$SRCSHORT/program/$FILE $FILE  2>> "$log" ;

  done



cd $PKG/usr/share/applications

  for APP in base calc draw impress math startcenter writer xsltfilter ; do

    rm -f $programa$SRCSHORT-$APP.desktop   2>> "$log"

    ln -sf ../../../opt/libreoffice$SRCSHORT/share/xdg/$APP.desktop $programa-$APP.desktop  2>> "$log"

  done


# Move docs to their expected locations

mkdir -p $PKG/usr/doc/$programa-"$versao"


# cd $PKG/opt/libreoffice$SRCSHORT 2>> "$log"

cd  /tmp/libreoffice/pacote/opt/libreoffice$SRCSHORT/  2>> "$log"

# line 129: cd: /tmp/libreoffice/pacote/opt/libreoffice: Arquivo ou diretório não encontrado

# mv: impossível obter estado de 'CREDITS*':  Arquivo ou diretório não encontrado
# mv: impossível obter estado de '*LICENSE*': Arquivo ou diretório não encontrado
# mv: impossível obter estado de 'readmes':   Arquivo ou diretório não encontrado
# mv: impossível obter estado de 'NOTICE':    Arquivo ou diretório não encontrado

echo "
" >> "$log"

pwd >> "$log"
ls  >> "$log"

  mv CREDITS* *LICENSE* readmes NOTICE  $PKG/usr/doc/$programa-"$versao"  2>> "$log"

  

# Add libreoffice.sh to set SAL_USE_VCLPLUGIN=gtk

mkdir -p $PKG/etc/profile.d/


# Tem como melhora o visual do libreoffice no Fluxbox?

echo "#!/bin/sh

# Funciona no Fluxbox com visual muito ruim

export SAL_USE_VCLPLUGIN=gen


# Não funciona no Fluxbox

# export SAL_USE_VCLPLUGIN=gtk

" > $PKG/etc/profile.d/libreoffice.sh  2>> "$log"


# Antes:  https://www.vivaolinux.com.br/comunidades/imagens/anexos/1607481177.1.png
# Depois: https://www.vivaolinux.com.br/comunidades/imagens/anexos/com-gen.png


# https://www.vivaolinux.com.br/topico/Slackware/Tem-como-melhora-o-visual-do-libreoffice-no-Fluxbox
# https://ask.libreoffice.org/en/question/78965/menu-appearance-is-hard-on-the-eyes/



mkdir -p $PKG/install  2>> "$log"


echo "# HOW TO EDIT THIS FILE:
# The \"handy ruler\" below makes it easier to edit a package description.
# Line up the first '|' above the ':' following the base package name, and
# the '|' on the right side marks the last column you can put a character in.
# You must make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':' except on otherwise blank lines.

         |-----handy-ruler------------------------------------------------------|
$programa: $programa (Suíte de produtividade)
$programa: 
$programa: LibreOffice é um pacote de produtividade compatível com outros
$programa: as principais suítes de escritório e disponíveis em uma variedade de 
$programa: plataformas. Isto é software livre e, portanto, gratuito para baixar,
$programa: usar e distribuir.
$programa: 
$programa: Este é um reempacotamento do RPM binário oficial do LibreOffice
$programa: distribuído pelos desenvolvedores upstream. 
$programa: 
$programa: 
$programa: Pacote principal do LibreOffice.
$programa: 
$programa: 
$programa: Requer: $REQUIRES
$programa: 
$programa: Homepage: $Homepage
$programa: 
$programa: " > $PKG/install/slack-desc  2>> "$log"







echo "if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database -q usr/share/applications
fi

if [ -x /usr/bin/update-mime-database ]; then
  /usr/bin/update-mime-database usr/share/mime >/dev/null 2>&1
fi

if [ -x /usr/bin/gtk-update-icon-cache ]; then
  for theme in gnome locolor hicolor ; do
    if [ -e usr/share/icons/$theme/icon-theme.cache ]; then
      /usr/bin/gtk-update-icon-cache -f usr/share/icons/$theme >/dev/null 2>&1
    fi
  done
fi
" > $PKG/install/doinst.sh  2>> "$log"







# Criar um pacote de instalação tgz

cd $PKG


chown -R root:root $PKG   2>> "$log"

chmod -R 755 $PKG   2>> "$log"


/sbin/makepkg -l y -c n /tmp/"$programa"-"$versao"-$PKGARCH-$BUILD$TAG.${PKGTYPE:-tgz}



else

echo "O arquivo LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm.tar.gz  não existe" | tee "$log"

exit 2

fi


# -----------------------------------------------------------------------------------------------------

# Pacote de Ajuda

SRCSHORT=$(echo "$versao" | cut -f1-3 -d.)

clear


cd "$diretorio"


# Verificar se arquivo existe

if [ -e LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm_helppack_pt-BR.tar.gz ]; then

echo "O arquivo LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm_helppack_pt-BR.tar.gz existe"

sleep 2

clear

# Descompactar o arquivo

echo "
Extrair tarball (LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm_helppack_pt-BR.tar.gz)
"

cd "$diretorio"

tar xvf LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm_helppack_pt-BR.tar.gz                -C "$tmp"  2>> "$log"

 if [ $? -eq 0 ];then

   echo -e "[\033[01;32m OK - Extração terminada... \033[01;37m]"

  else

   echo -e "[\033[01;31m Erro - A extração do arquivo deve problema. \033[01;37m]"

   exit 1

 fi

cd "$tmp"/LibreOffice_"$versao"_Linux_"$SRCARCH"_rpm_helppack_pt-BR/RPMS/  2>> "$log"


for FILE in *.rpm ; do rpm2cpio < $FILE | cpio -imdv  2>> "$log" ; done

rm -rf desktop-integration *.rpm  2>> "$log"


mkdir -p /tmp/libreoffice/$programa-helppack/install  2>> "$log"

mv opt  /tmp/libreoffice/$programa-helppack  2>> "$log"



# Não saiu a descrição do pacote de ajuda.


# É de extrema importância seguir as normas, a uma régua chamada handy-ruler que contém 77 colunas, você não deve ultrapassar.
#
# Em appname use o nome do pacote, o mesmo deve se utilizar na hora de gerar o pacote, se não dá problema! :) 



echo "# HOW TO EDIT THIS FILE:
# The \"handy ruler\" below makes it easier to edit a package description.
# Line up the first '|' above the ':' following the base package name, and
# the '|' on the right side marks the last column you can put a character in.
# You must make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':' except on otherwise blank lines.

                  |-----handy-ruler------------------------------------------------------|
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: $programa-helppack (Suíte de produtividade)
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: 
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: LibreOffice é um pacote de produtividade compatível com outros
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: as principais suítes de escritório e disponíveis em uma 
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: variedade de plataformas. Isto é software livre e, portanto,
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: gratuito para baixar, usar e distribuir.
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: 
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: Este é um reempacotamento do RPM binário oficial do LibreOffice
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: distribuído pelos desenvolvedores upstream.
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: 
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: Pacote de ajuda do LibreOffice.
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: 
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: Homepage: $Homepage
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: 
"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG: " > /tmp/libreoffice/$programa-helppack/install/slack-desc  2>> "$log"




# Criar um pacote de instalação tgz

cd  /tmp/libreoffice/$programa-helppack/

chown -R root:root  /tmp/libreoffice/$programa-helppack/   2>> "$log"

chmod -R 755  /tmp/libreoffice/$programa-helppack/   2>> "$log"


# Obs: O nome do pacote deve ser o mesmo nome que esta no arquivo slack-desc

/sbin/makepkg -l y -c n /tmp/"$programa"-helppack_pt-BR-"$versao"-$PKGARCH-$BUILD$TAG.${PKGTYPE:-tgz}



else

echo "O arquivo LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm_helppack_pt-BR.tar.gz não existe"  | tee "$log"

exit 3

fi


# -----------------------------------------------------------------------------------------------------

# Pacote de idioma

SRCSHORT=$(echo "$versao" | cut -f1-3 -d.)

clear


cd "$diretorio"


# Verificar se arquivo existe

if [ -e LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm_langpack_pt-BR.tar.gz ]; then

echo "O arquivo LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm_langpack_pt-BR.tar.gz  existe"

sleep 2

clear


# Descompactar o arquivo

echo "
Extrair tarball (LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm_langpack_pt-BR.tar.gz)
"

cd "$diretorio"

tar xvf LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm_langpack_pt-BR.tar.gz               -C "$tmp"  2>> "$log"

 if [ $? -eq 0 ];then

   echo -e "[\033[01;32m OK - Extração terminada... \033[01;37m]"

  else

   echo -e "[\033[01;31m Erro - A extração do arquivo deve problema. \033[01;37m]"

   exit 1

 fi

cd "$tmp"/LibreOffice_"$versao"_Linux_"$SRCARCH"_rpm_langpack_pt-BR/RPMS/  2>> "$log"


for FILE in *.rpm ; do rpm2cpio < $FILE | cpio -imdv  2>> "$log" ; done

rm -rf desktop-integration *.rpm  2>> "$log"


mkdir -p /tmp/libreoffice/$programa-langpack/install  2>> "$log"

mv opt  /tmp/libreoffice/$programa-langpack  2>> "$log"



# Não saiu a descrição do pacote de idioma.


# É de extrema importância seguir as normas, a uma régua chamada handy-ruler que contém 77 colunas, você não deve ultrapassar.
#
# Em appname use o nome do pacote, o mesmo deve se utilizar na hora de gerar o pacote, se não dá problema! :) 


echo "# HOW TO EDIT THIS FILE:
# The \"handy ruler\" below makes it easier to edit a package description.
# Line up the first '|' above the ':' following the base package name, and
# the '|' on the right side marks the last column you can put a character in.
# You must make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':' except on otherwise blank lines.

                  |-----handy-ruler------------------------------------------------------|
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: $programa-langpack (Suíte de produtividade)
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: 
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: LibreOffice é um pacote de produtividade compatível com outros
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: as principais suítes de escritório e disponíveis em uma 
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: variedade de plataformas. Isto é software livre e, portanto,
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: gratuito para baixar, usar e distribuir.
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: 
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: Este é um reempacotamento do RPM binário oficial do LibreOffice
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: distribuído pelos desenvolvedores upstream.
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: 
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: 
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: Pacote de idioma do LibreOffice.
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: 
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: Homepage: $Homepage
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: 
"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG: " > /tmp/libreoffice/$programa-langpack/install/slack-desc  2>> "$log"




# Criar um pacote de instalação tgz

cd  /tmp/libreoffice/$programa-langpack

chown -R root:root  /tmp/libreoffice/$programa-langpack   2>> "$log"

chmod -R 755  /tmp/libreoffice/$programa-langpack   2>> "$log"


# Obs: O nome do pacote deve ser o mesmo nome que esta no arquivo slack-desc

/sbin/makepkg -l y -c n /tmp/"$programa"-langpack-"$versao"-$PKGARCH-$BUILD$TAG.${PKGTYPE:-tgz}



else

echo "O arquivo LibreOffice_"$SRCSHORT"_Linux_"$SRCARCH"_rpm_langpack_pt-BR.tar.gz  não existe" | tee "$log"

exit 4

fi


# -----------------------------------------------------------------------------------------------------




echo "
Sera necessario remove esses pacotes:
"

ls -l /var/log/packages/ | grep -i libreoffice



echo "
Verifique se esses são os novos pacotes para instalação:

Pasta: /tmp
"

ls -l /tmp/ | grep -i libreoffice*.*.tgz




# Descompactar os arquivos
# Criar um pacote de instalação tgz
# Instalar o LibreOffice

}


verificar_root

verificar_slack


# Falta configura a opção do x

# Tomada de decisão

escolha=$(zenity --question --text="Deseja fazer o que?\n\nBaixar = baixa o libreoffice atual. \n\nGerar = gera um pacote do libreoffice para o Slackware" --cancel-label="Baixar" --ok-label="Gerar" --width="800" --height="100"   2>/dev/null)

if [  $? = 1 ] ; then

baixar


else

gera


fi



# Abrir o arquivo de log

xdg-open "$log" 2> /dev/null


exit 0

