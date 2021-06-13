#!/bin/bash
#
# Por Fernando Souza
# Data: 31/04/2021 as 16:58
# Licença: GPL <https://www.gnu.org/>
# Versão: 0.0.1
# Script: 
#
# Atualização em https://notabug.org/


clear

# Variaveis do programa


# Titulos das janelas do Zenity

titulo="Gera pacote para os scripts no Slackware"



DATA=`date +%d/%m/%Y-%H:%M`

# Autor

MAINTAINER="Fernando Souza"


EMAIL=""


# Nome do programa

programa="scripts"


# Versão do programa

versao="0.0.1"



# Arquitetura do programa

# `uname -m`

arquitetura="all"



# Arquivo de log

log="/tmp/$programa.log"


# Página web do programa (página oficial)

Homepage=""



REQUIRES="Zenity dialog FFmpeg rsync makepkg xdg-open tar xterm xz tee sed"


usuario="fernando"


# Pasta onde sera salvos os pacotes gerados no final do processo.

diretorio="/run/media/$usuario/backup/backup/meus_pacotes_manual/scripts"




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


echo "
Antes de executar esse script remove o pacote antigo dele e roda o /home/fernando/git atualiza repo/atualiza-script.sh e depois esse script.
"


ls -l /var/log/packages/ | grep -i scripts-*-all

removepkg scripts-*-all


# =====================================================================================================

# Altera essa variavel para o diretório onde você deseja salvar o download do programa.
#
# ondesalvar="/run/media/fernando/backup/backup/meus_pacotes_manual/$programa"


ondesalvar=$(zenity \
--title="$titulo" \
--text "Qual a pasta você deseja salvar o pacote do $programa?" \
--entry \
--entry-text="/run/media/fernando/backup/backup/meus_pacotes_manual/$programa" 2> /dev/null)

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

sleep 5

# =====================================================================================================



echo "
Removendo o arquivo de log...
"

rm -Rf "$log"




echo "
Realizando faxina...
"

rm -Rf $programa           2>> "$log"

rm -Rf $programa*.tgz      2>> "$log"

rm -Rf $programa-*.md5sum  2>> "$log"

# =====================================================================================================


sleep 3
clear

echo "
Criando as pastas do pacote $programa
"

mkdir -p $programa/install/                     2>> "$log"

mkdir -p $programa/usr/local/bin/               2>> "$log"

mkdir -p $programa/usr/share/applications/      2>> "$log"

mkdir -p $programa/usr/doc/$programa/           2>> "$log"

mkdir -p $programa/usr/share/icons/extras/      2>> "$log"

# =====================================================================================================

echo "

Sincronizando os arquivos .sh 

de /usr/local/bin/ para $programa/usr/local/bin/ ...

"

# Altera mv para rsync -av

rsync -av /usr/local/bin/*.sh                                   $programa/usr/local/bin/                    2>> "$log"


# =====================================================================================================

echo "

Sincronizando os arquivos .desktop com exclusão (Thunar-folder-handler.desktop e kdenlive.desktop) ...

de /home/$usuario/.local/share/applications/ para $programa/usr/share/applications/

"

# Criar exceções uma para Thunar-folder-handler.desktop e outra para kdenlive.desktop
#
# O substantivo exceção indica o ato de excetuar ou excluir, ou seja, refere alguém ou 
# algo que foi excluído ou que não foi incluído, sendo sinônimo de exclusão.



# O objetivo é manter uma cópia fiel do mesmo em outra localidade. O diretório destino deverá esta criado e ter permissões de escrita.


# Sincronizando arquivos com exclusão
#
# Sincroniza todos exceto (Thunar-folder-handler.desktop e kdenlive.desktop). 

rsync \
-av \
--exclude 'Thunar-folder-handler.desktop' \
--exclude 'kdenlive.desktop' \
--exclude 'userapp*.desktop' \
/home/"$usuario"/.local/share/applications/*.desktop    \
$programa/usr/share/applications/           \
2>> "$log"


# https://brito.blog.incolume.com.br/2011/10/utilizando-o-comando-rsync.html?m=1
# https://www.vivaolinux.com.br/topico/vivaolinux/Backup-com-rsync


# Outra forma de move os arquivos *.desktop para a pasta scripts/usr/share/applications/


# Não funcionou
#
#
# Verifique se o extglob está habilitado:
#
# shopt extglob 
#
#
# Se retornar:
#
# extglob        	off 
#
#
#
# Habilite:
#
# shopt -s extglob 


# mv -i /home/"$usuario"/.local/share/applications/!(Thunar-folder-handler.desktop|kdenlive.desktop)    scripts/usr/share/applications/           2>> "$log"


# https://www.vivaolinux.com.br/topico/Shell-Script/Criar-excecoes-para-o-comando-mv/?pagina=1
# https://www.linuxjournal.com/content/bash-extended-globbing




# rm -Rf $programa/usr/share/applications/userapp-Firefox-*.desktop                       2>> "$log"
# rm -Rf $programa/usr/share/applications/userapp-Thunderbird-*.desktop                   2>> "$log"
# rm -Rf $programa/usr/share/applications/userapp-Destina*.desktop                        2>> "$log"



chmod +x $programa/usr/share/applications/*.desktop    2>> "$log"

ls -l  --color $programa/usr/share/applications/*.desktop  | tee "$log"

sleep 5

# =====================================================================================================

echo "
Copiando os arquivos LICENSE e README.md de /home/"$usuario"/github/scripts/ para a pasta $programa/usr/doc/$programa ...
"

rsync -av /home/"$usuario"/github/scripts/LICENSE             $programa/usr/doc/$programa/                  2>> "$log"
rsync -av /home/"$usuario"/github/scripts/README.md           $programa/usr/doc/$programa/                  2>> "$log"


# =====================================================================================================

echo "

Copiando os icones para o pacote do scripts...

"

rsync -av /home/"$usuario"/.icons/extras/atualizar_desktop.png                                               $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/youtube.png                                                         $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/application_software_win_windows_windows8_1867.png                  $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/pngwing.com6.png                                                    $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/firefox128.png                                                      $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/thunderbird-256.png                                                 $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/control_panel_16061.png                                             $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/1608571920_preview_font.jpg                                         $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/hard_disk_icon-icons.com_71904.png                                  $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/ViOrbwindows_ViOrb_283.ico                                          $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/super-pacote-25mil-fontes-design-fonte-filme.jpg                    $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/pngegg.png                                                          $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/libre.png                                                           $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/iso.png                                                             $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/faxina.ico                                                          $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/task_list.png                                                       $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/10452mandetectivelightskintone_110591.png                           $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/PngItem_234368.png                                                  $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/pngwing.com5.png                                                    $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/kdenlive2.png                                                       $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/shellscript2.png                                                    $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/windows_284.png                                                     $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/super-pacote-25mil-fontes-design-fonte-filme.jpg                    $programa/usr/share/icons/extras/    2>> "$log"
rsync -av /home/"$usuario"/.icons/extras/google.png                                                          $programa/usr/share/icons/extras/    2>> "$log"



# rsync -av /home/"$usuario"/.icons/extras/                  $programa/usr/share/icons/extras/    2>> "$log"
# rsync -av /home/"$usuario"/.icons/extras/                  $programa/usr/share/icons/extras/    2>> "$log"
# rsync -av /home/"$usuario"/.icons/extras/                  $programa/usr/share/icons/extras/    2>> "$log"
# rsync -av /home/"$usuario"/.icons/extras/                  $programa/usr/share/icons/extras/    2>> "$log"
# rsync -av /home/"$usuario"/.icons/extras/                  $programa/usr/share/icons/extras/    2>> "$log"
# rsync -av /home/"$usuario"/.icons/extras/                  $programa/usr/share/icons/extras/    2>> "$log"
# rsync -av /home/"$usuario"/.icons/extras/                  $programa/usr/share/icons/extras/    2>> "$log"
# rsync -av /home/"$usuario"/.icons/extras/                  $programa/usr/share/icons/extras/    2>> "$log"


# =====================================================================================================

echo "
Gerando arquivo AUTHORS para $programa...
"

echo '
Fernando Souza <>

' > $programa/usr/doc/$programa/AUTHORS  2>> "$log"


# =====================================================================================================

echo "
Gerando arquivo ChangeLog para $programa...
"

echo '

Version 0.0.1
* Pacote com 15 Scripts

' > $programa/usr/doc/$programa/ChangeLog  2>> "$log"

# =====================================================================================================


echo "
Gerando arquivo README.md para $programa...
"


echo "



README do $programa
-------------------


--------------------------------------------------------------------------
NOTAS DE INSTALAÇÃO
--------------------------------------------------------------------------

Remove o pacote antigo antes de instalar essa versão do pacote.


--------------------------------------------------------------------------
NOTAS DE USO
--------------------------------------------------------------------------

No painel do LXDE as opções estão em: menu iniciar => Outros.


--------------------------------------------------------------------------
BUGS CONHECIDOS
--------------------------------------------------------------------------


--------------------------------------------------------------------------
NOTAS DE LICENÇA
--------------------------------------------------------------------------


   O $programa é licenciado sob os termos da Licença Pública GNU. Ver
          COPIANDO para mais informações.


" >> $programa/usr/doc/$programa/README.md  2>> "$log"



# =====================================================================================================


echo "
Gerando arquivo slack-desc para $programa...
"


total=`ls "$diretorio"/$programa/usr/local/bin/*.sh  |wc -l`



echo "# HOW TO EDIT THIS FILE:
# The \"handy ruler\" below makes it easier to edit a package description.
# Line up the first '|' above the ':' following the base package name, and
# the '|' on the right side marks the last column you can put a character in.
# You must make exactly 11 lines for the formatting to be correct.  It's also
# customary to leave one space after the ':' except on otherwise blank lines.

         |-----handy-ruler------------------------------------------------------|
$programa-$versao-$arquitetura: $programa (automatizar tarefas)
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Pacote com $total Scripts em Shell Script para 
$programa-$versao-$arquitetura: automatizar a instalação de programas no Linux 
$programa-$versao-$arquitetura: e outras tarefas do dia-a-dia.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Atualizar o sistema
$programa-$versao-$arquitetura: Instalar programa de terceiros
$programa-$versao-$arquitetura: Conversor de mídia de áudio e vídeo
$programa-$versao-$arquitetura: ...
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Basta ter criatividade e dominar a linguagem do shell script para 
$programa-$versao-$arquitetura: poder automatizar praticamente o que você quiser.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: O bom de trabalhar com funções ou instruções pré-definidas que podem 
$programa-$versao-$arquitetura: ser aproveitadas em diversas partes do seu código.
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Mais informações em: /usr/doc/$programa/README.md
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Distribuído e desenvolvido por $MAINTAINER. 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Requer: $REQUIRES
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: Homepage: $Homepage
$programa-$versao-$arquitetura: 
$programa-$versao-$arquitetura: " > $programa/install/slack-desc  2>> "$log"



# =====================================================================================================

echo "
Gerando arquivo doinst.sh para $programa...
"


echo "if [ -x /usr/bin/update-desktop-database ]; then
  /usr/bin/update-desktop-database -q usr/share/applications
fi

if [ -x /usr/bin/update-mime-database ]; then
  /usr/bin/update-mime-database usr/share/mime >/dev/null 2>&1
fi
" > $programa/install/doinst.sh  2>> "$log"


# =====================================================================================================

echo "
Executando chown e chmod na pasta $programa...
"

chown -R root:root  $programa   2>> "$log"

chmod -R 755  $programa         2>> "$log"


# =====================================================================================================


# Criar um pacote de instalação tgz

cd $programa


echo "
Gerando o pacote $programa-$versao-$arquitetura.${PKGTYPE:-tgz} em /tmp ...
" | tee -a "$log"


# Obs: O nome do pacote deve ser o mesmo nome que esta no arquivo slack-desc

/sbin/makepkg -l y -c n /tmp/"$programa"-"$versao"-$arquitetura.${PKGTYPE:-tgz}  2>> "$log"


mv  /tmp/$programa-$versao-$arquitetura.${PKGTYPE:-tgz} ../  2>> "$log"


# ls -l /var/log/packages/ | grep -i "$programa"-"$versao"-$arquitetura


# =====================================================================================================

echo "
Calculando o md5sum  do arquivo $programa-$versao-$arquitetura.${PKGTYPE:-tgz} ...
"
md5sum ../$programa-$versao-$arquitetura.${PKGTYPE:-tgz} > ../$programa-$versao-$arquitetura.${PKGTYPE:-tgz}.md5sum  2>> "$log"


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

