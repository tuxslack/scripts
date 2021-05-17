#!/bin/bash
#
#
#
# Altera o papel de parede (wallpaper) no Fluxbox usando o comando fbsetbg 
#
#
#
# https://askubuntu.com/questions/599839/how-to-use-zenity-file-selection
# https://sobrelinux.info/questions/18391/how-to-use-zenity-file-selection
# https://www.vivaolinux.com.br/topico/Zenity/Escolher-varios-arquivos
# https://stackoverflow.com/questions/16267042/bash-file-selection-by-multiple-patterns-in-zenity


clear


which fbsetbg
which zenity
which idesk


# Verificar se a pasta $HOME/.fluxbox existe

if [ -e $HOME/.fluxbox ]; then


# Testar se essa opção esta funcionado com #

# cat ~/.fluxbox/startup | grep -i "fbsetbg -l &"  > /dev/null

# if [ $? -eq 0 ];then


  if grep -Eq "^(fbsetbg -l &|fbsetbg -l)" ~/.fluxbox/startup;then

   echo -e "[\033[01;32m OK - fbsetbg -l esta no arquivo  $HOME/.fluxbox/startup \033[01;37m] "

  else

   echo -e "[\033[01;31m Erro - fbsetbg -l não esta no arquivo  $HOME/.fluxbox/startup \033[01;37m]"

   exit 1

 fi

imagem=$(zenity \
--file-selection  \
--title="Selecione um arquivo de imagem" \
--file-filter='Arquivo de Imagens (jpg,png,webp) | *.jpg *.png *.webp' --file-filter='All files | *' \
--filename=$HOME/Imagens/ 2>/dev/null)

case $? in
         0)
               # sleep 2
 
               clear

               # echo "\"$imagem\" selecionada."

                echo "" > ~/.fluxbox/lastwallpaper && fbsetbg -f "$imagem"


               # echo "Restart Idesk..."

               # pkill  idesk ; killall -9  idesk ; idesk &


               # zenity --info --text "Wallpaper alterado!" --width="500" --height="100"   2>/dev/null 
         ;;

         1)
                clear

                zenity --error --text="Nenhum arquivo selecionado."  --width="500" --height="100"   2>/dev/null 

                exit 2
         ;;

        -1)
                clear

                zenity --error --text="Ocorreu um erro inesperado."  --width="500" --height="100"   2>/dev/null 

                exit 3
         ;;
esac





else

   echo -e "[\033[01;31m O diretório $HOME/.fluxbox não existe \033[01;37m]"

   exit 4

fi




exit 0

