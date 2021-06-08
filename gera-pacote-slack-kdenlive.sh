#!/bin/bash


# Nome do programa

programa="kdenlive"


# Página web do programa (página oficial)

Homepage="https://kdenlive.org/"


DATA=`date +%d/%m/%Y-%H:%M`

MAINTAINER="Fernando Souza"
EMAIL=""


# Arquivo de log

log="/tmp/$programa.log"


# Titulos das janelas do Zenity

titulo="Gerenciar pacote do $programa no Slackware"


# Versão do programa (Altera a versão deste pacote conforme a versão baixada do arquivo .AppImage do kdenlive)

versao="17.08.3"


# Arquitetura do programa

arquitetura=`uname -m`




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


clear


verificar_root


# =====================================================================================================

# Altera essa variavel para o diretório onde você deseja salvar o download do programa.
#
# ondesalvar="/run/media/fernando/backup/backup/meus_pacotes_manual/kdenlive"


ondesalvar=$(zenity \
--title="$titulo" \
--text "Qual a pasta você deseja salvar o download do $programa?" \
--entry \
--entry-text="/run/media/fernando/backup/backup/meus_pacotes_manual/$programa" 2> /dev/null)

# =====================================================================================================

# Para verificar se a variavel é nula

if [ -z "$ondesalvar" ];then

zenity \
--warning \
--timeout="10" \
--text "Não pode ter valor nulo! \n\n\nInforme uma pasta para o download do $programa \n\n\n Saindo 10s ..." \
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


cd "$ondesalvar" 2>> $log

pwd 
ls 

sleep 5

# =====================================================================================================

echo "
Realizando faxina...
"

rm -Rf "$log"

rm -Rf $programa-$versao-$arquitetura.tgz                   2>> "$log"

rm -Rf $programa-$versao-$arquitetura.tgz.md5sum            2>> "$log"

rm -Rf /tmp/$programa-$versao-$arquitetura.${PKGTYPE:-tgz}  2>> "$log"


# =====================================================================================================


echo "
Criando as pastas do pacote $programa
"


mkdir -p $programa/install                     2>> "$log"
mkdir -p $programa/opt/$programa               2>> "$log"
mkdir -p $programa/usr/share/applications      2>> "$log"
mkdir -p $programa/usr/doc/$programa           2>> "$log"
mkdir -p $programa/usr/share/pixmaps           2>> "$log"
mkdir -p $programa/usr/local/bin               2>> "$log"


# =====================================================================================================


echo "
Gerando arquivo ChangeLog para $programa...
"

echo "



Remoção manual do $programa:


# rm -Rf /usr/doc/kdenlive

# rm -Rf /usr/share/pixmaps/kdenlive.png

# rm -Rf /usr/share/applications/kdenlive.desktop

# rm -Rf /opt/kdenlive

# rm -Rf /usr/local/bin/kdenlive*



# rm -Rf /root/.local/share/kdenlive

# rm -Rf /root/.config/kdenlive*

# rm -Rf /root/.cache/kdenlive*



$ rm -Rf /tmp/runtime-$USER/kdenlive*
$ rm -Rf /home/$USER/.cache/kdenlive*
$ rm -Rf /home/$USER/.local/share/kdenlive
$ rm -Rf /home/$USER/.config/kdenlive-*
$ rm -Rf /home/$USER/.local/share/stalefiles/kdenlive


# find . | grep kdenlive


 " > "$programa"/usr/doc/"$programa"/ChangeLog   2>> "$log"


# =====================================================================================================


echo "
Gerando arquivo slack-desc para $programa...
"

echo "# HOW TO EDIT THIS FILE:
# The \"handy ruler\" below makes it easier to edit a package description.
# Line up the first '|' above the ':' following the base package name, and
# the '|' on the right side marks the last column you can put a character in.
# You must make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':' except on otherwise blank lines.

         |-----handy-ruler------------------------------------------------------|
$programa-$versao-$arquitetura: $programa (Editor de vídeos)
$programa-$versao-$arquitetura:
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Kdenlive (KDE Non-Linear Video Editor) é um editor de vídeo 
$programa-$versao-$arquitetura: open-source baseado no framework MLT e KDE. O projeto foi 
$programa-$versao-$arquitetura: iniciado por Jason Wood em 2002, e hoje é mantido por um 
$programa-$versao-$arquitetura: pequeno time de desenvolvedores. Com o lançamento da versão 
$programa-$versao-$arquitetura: 15.04.0, o Kdenlive passou a ser oficialmente parte do 
$programa-$versao-$arquitetura: projeto oficial do KDE.Pacotes do Kdenlive estão livremente 
$programa-$versao-$arquitetura: disponíveis para Linux, FreeBSD e Mac OS X sob os termos 
$programa-$versao-$arquitetura: da GNU General Public License versão 2 ou posterior. 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: História
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: O projeto teve início com Jason Wood em 2002. O desenvolvimento 
$programa-$versao-$arquitetura: do Kdenlive foi movido do K Desktop Environment 3 (que originalmente 
$programa-$versao-$arquitetura: não era feito para o MLT) para o KDE Platform 4, com uma 
$programa-$versao-$arquitetura: re-escrita quase completa. Isso foi terminado com o Kdenlive 0.7, 
$programa-$versao-$arquitetura: lançado em Novembro 12, 2008. Kdenlive 0.9.10 lançado em Outubro 1, 
$programa-$versao-$arquitetura: 2014 foi o último lançamento para o KDE 4.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Kdenlive iniciou seu plano de se mover para o projeto KDE e sua 
$programa-$versao-$arquitetura: infraestrutura em 2014. O porte para o KDE Frameworks 5 foi 
$programa-$versao-$arquitetura: finalizado com o lançamento do 2015.04.0 como parte do KDE 
$programa-$versao-$arquitetura: Applications 5. Oficialmente o Kdenlive faz parte do projeto KDE 
$programa-$versao-$arquitetura: e também está disponível, além do Linux, para Windows e Mac OS X.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Características
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Efeitos de vídeo no Kdenlive
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: O software possui as seguintes características:
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Kdenlive é um software livre e gratuito.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Kdenlive faz uso de efeitos do MLT, Frei0r, e bibliotecas SoX e 
$programa-$versao-$arquitetura: LADSPA. Kdenlive suporta todos os formatos suportados pelo FFmpeg 
$programa-$versao-$arquitetura: ou libav (tais como QuickTime, AVI, WMV, MPEG e Flash Video, entre 
$programa-$versao-$arquitetura: outros), e também suporta formatos de imagem 4:3 e 16:9 para PAL, 
$programa-$versao-$arquitetura: NTSC e vários padrões HD, incluindo HDV e AVCHD. O vídeo também pode 
$programa-$versao-$arquitetura: ser exportado para aparelhos DV ou gravado em DVD com capítulos e 
$programa-$versao-$arquitetura: um menu simples.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Kdenlive tem edição multi-track com uma timeline e suporta um número 
$programa-$versao-$arquitetura: ilimitado de trilhas de vídeo e áudio.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Ferramentas para criar, mover, cortar e deletar trechos de vídeo, 
$programa-$versao-$arquitetura: áudio, texto e imagem. Teclas de atalho e layout de interface 
$programa-$versao-$arquitetura: configuráveis.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Um número enorme de efeitos e transições. Efeitos de áudio incluem 
$programa-$versao-$arquitetura: normalização, phase e pitch shifting, limiting, ajuste de volume, 
$programa-$versao-$arquitetura: filtros de reverberação e equalização, bem como outros. Efeitos de 
$programa-$versao-$arquitetura: vídeo incluem opções de masking, blue-screen, distorções, rotações, 
$programa-$versao-$arquitetura: ferramenta de cores, blurring, obscuring e outros.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Capacidade de adicionar efeitos customizados e transições.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Renderização é feita usando um processo separado 'non-blocking', 
$programa-$versao-$arquitetura: podendo, portanto, ser pausado, parado e reiniciado.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Kdenlive também provê um script chamado Kdenlive Builder Wizard 
$programa-$versao-$arquitetura: (KBW) que compila a mais recente versão em desenvolvimento do 
$programa-$versao-$arquitetura: software e suas principais dependências a partir dos fontes para 
$programa-$versao-$arquitetura: permitir aos usuários testar novas características do programa 
$programa-$versao-$arquitetura: e reportar problemas ao bug tracker.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: A instalação é simples e o pacote do Kdenlive pode ser encontrado 
$programa-$versao-$arquitetura: nos principais repositórios Linux, bastando procurá-lo nas lojas 
$programa-$versao-$arquitetura: de aplicativos e realizar o download.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Pode ser usado também na produção de animações.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Prós
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura:     Pode ser uma ótima ferramenta se você tem um trabalho sério 
$programa-$versao-$arquitetura: de edição de vídeo
$programa-$versao-$arquitetura:     Multiplataforma
$programa-$versao-$arquitetura:     Possui boas opções e recursos para edição de vídeo
$programa-$versao-$arquitetura:     Gratuito
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Contras
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura:     Necessita de um computadore relativamente recentes
$programa-$versao-$arquitetura:     Para iniciantes, o programa exige algum esforço para aprender 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: https://pt.wikipedia.org/wiki/Kdenlive
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura:  
$programa-$versao-$arquitetura:  
$programa-$versao-$arquitetura:   Homepage: $Homepage
$programa-$versao-$arquitetura:  
$programa-$versao-$arquitetura:  " > "$programa"/install/slack-desc  2>> "$log"


# =====================================================================================================

echo "
Gerando arquivo doinst.sh para $programa...
"

echo "

if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database -q usr/share/applications
fi

if [ -x /usr/bin/update-mime-database ]; then
  /usr/bin/update-mime-database usr/share/mime >/dev/null 2>&1
fi

" > "$programa"/install/doinst.sh  2>> "$log"


# =====================================================================================================

echo "
Gerando arquivo $programa.desktop para $programa...
"

echo "[Desktop Entry]
# Exec=dbus-launch /opt/$programa/$programa-20.12.1b-x86_64.appimage
# Exec=/opt/$programa/$programa-17.08.3-x86_64.AppImage
Exec=$programa
Icon=/usr/share/pixmaps/$programa.png
Type=Application
Categories=AudioVideo;
Name=$programa
GenericName=Editor de Video
GenericName[pt]=Editor de Video
GenericName[pt_BR]=Editor de Video
Comment=Programa para edição de videos
MimeType=
StartupNotify=true
" > "$programa"/usr/share/applications/$programa.desktop  2>> "$log"


# =====================================================================================================

echo "
Executando chown e chmod na pasta $programa...
"

chown -R root:root "$programa"   2>> "$log"

chmod -R 755 "$programa"         2>> "$log"


# =====================================================================================================


# Criar um pacote de instalação tgz


cd "$programa" 2>> "$log"


echo "
Criando link para o $programa na pasta /usr/local/bin/ ...
"

ln -sf ../../../opt/$programa/$programa-$versao-$arquitetura.AppImage   usr/local/bin/$programa   2>> "$log"


pwd
ls


# =====================================================================================================

echo "
Gerando o pacote $programa-$versao-$arquitetura.${PKGTYPE:-tgz} em /tmp ...
" | tee -a "$log"

/sbin/makepkg -l y -c n /tmp/$programa-$versao-$arquitetura.${PKGTYPE:-tgz}  2>> "$log"


mv  /tmp/$programa-$versao-$arquitetura.${PKGTYPE:-tgz} ../  2>> "$log"

# =====================================================================================================


echo "
Calculando o md5sum  do arquivo $programa-$versao-$arquitetura.${PKGTYPE:-tgz} ...
"

md5sum ../$programa-$versao-$arquitetura.${PKGTYPE:-tgz} > ../$programa-$versao-$arquitetura.${PKGTYPE:-tgz}.md5sum  2>> "$log"

# Com problema

# Aparece no arquivo de log => md5sum: /tmp/kdenlive-17.08.3-x86_64.tgz: Arquivo ou diretório não encontrado

# =====================================================================================================


echo "
Abrir o arquivo de log $log ...
"

xdg-open "$log" 2> /dev/null


# =====================================================================================================

echo "
Movendo o arquivo de log $log para a pasta $programa
"

mv  "$log" ../ 

# =====================================================================================================


exit 0

