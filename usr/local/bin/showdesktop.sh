#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     18/10/2023 as 22:46
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
# Colaboração: FabioIzidio em 25/08/2015 - 22:37h https://www.vivaolinux.com.br/~FabioIzidio
#
#
#
#
#
#
#
# Fazendo ajustes no painel do Tint2
#
# Criando o botão Mostrar Desktop
#
# Crie o script showdesktop.sh salva em /usr/local/bin 
#
# com permissão x.
#
# chmod +x /usr/local/bin/showdesktop.sh
#
#
#
# http://meumundotux.blogspot.com/2020/09/turbinando-o-openbox-nativo-do-debian.html
# https://www.vivaolinux.com.br/dica/Icone-de-mostrar-area-de-trabalho-no-Plank
# https://askubuntu.com/questions/603120/add-show-desktop-shortcut-to-plank
#
#
# Conteúdo:


which tint2  || exit 1
which wmctrl || exit 2

# which xdotool || exit 3


clear


if wmctrl -m | grep "mode: ON"; then
  
     exec wmctrl -k off
 
else
 
     exec wmctrl -k on
 
fi




# Agora criamos o arquivo .desktop em /usr/share/applications ou em ~/.local/share/applications/
#
# gedit ~/.local/share/applications/showdesktop.desktop
#
# Conteúdo:
#
# [Desktop Entry]
# Version=1.0
# Name[pt_BR]=Mostrar o desktop       
# Exec=/usr/local/bin/showdesktop.sh
# Icon=cs-desktop
# Terminal=false
# Type=Application



# Editamos o arquivo ~/.config/tint2/tint2rc manualmente com um editor de texto (gedit) ou pelo app gráfico tint2conf 
# na sessão LAUNCHER incluímos uma linha com o caminho do arquivo .desktop caso seja feito via editor de texto.
#
# gedit ~/.config/tint2/tint2rc
#
# ...
#
# launcher_item_app = ~/.local/share/applications/showdesktop.desktop
#
# ou
#
# launcher_item_app = /usr/share/applications/showdesktop.desktop
# 
# 
#
# Pronto, é necessário reiniciar o Tint2 para aparecer o botão caso foi feito utilizando um editor de texto.
#
# Para reiniciar o Tint2 em uma janela de terminal.
# 
# Execute os comandos abaixo:
# 
# $ killall -9 tint2
#
# $ tint2 &



exit 0

