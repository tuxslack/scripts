#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     04/10/2023 as 02:00
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
#
# Conky desconfigurado no xfce4
#
# Ao iniciar o sistema notei que o Conky utilizado está abrindo desconfigurado, com os marcadores ilegíveis, como se os dados estivessem sobrepostos.
#
# ~/.config/picom/picom.conf
# ~/.compton.conf
#
# Transparencia do Conky necessita de somente um compositor ativo no sistema (Picom/Compton/xfwm4)
#
#
# O Picom é um fork do abandonado Compton
#
# Picom é um compositor para X11, baseado em xcompmgr. Além de sombras, desbotamento e 
# translucides, Picom implementa controle de opacidade de moldura de janela, transparência 
# de janela inativa e sombras em janelas argb. 
#
#
#
# https://www.vivaolinux.com.br/topico/XFCE/Transparencia-no-terminal-nao-funciona
# https://linuxdicasesuporte.blogspot.com/2021/01/picom-compositor-para-x11-no-linux.html
# https://linuxdicasesuporte.blogspot.com/2017/07/compositor-compton-no-xfce4-para-debian.html
# https://linuxdicasesuporte.blogspot.com/2022/01/xfce4-whiskermenu-transparente-na-sua.html
# https://linuxdicasesuporte.blogspot.com/2022/07/desktop-xfce4-transparente-na-sua.html



# Coloque aqui seu Conky:

arquivo="$HOME/.conky/.conkyrc-edps-openbox"


clear

which conky       2> /dev/null || { echo "Falta o Conky"    ; exit 1; }
which yad         2> /dev/null || { echo "Falta o Yad"      ; exit 2; }


# which picom



# Desativar o compositor em uso
#
# A primeira providencia é desativar o compositor padrão do seu ambiente gráfico.
#
#
# ps -aux | grep xfwm4 | grep -v grep
# fernando  4468  2.3  1.2 825792 95552 ?        Sl   02:54   0:03 xfwm4

# which xfwm4
#
# Compositor padrão do XFCE4 - xfwm4
#
# xfconf-query -c xfwm4 -p /general/use_compositing -s false



# Screen Tearing
#
# Caso você tenha Screen Tearing
#
# Crie o diretório de configurações do Picom.
#
# mkdir -p ~/.config/picom/
#
# Crie o arquivo de configuração do Picom.
#
# nano ~/.config/picom/picon.conf
    

    

# Reinicie a sessão para usar o Picom.

# loginctl kill-user $USER


# ----------------------------------------------------------------------------------------

# Verificar se o arquivo $arquivo existe


if [ -e "$arquivo" ] ; then


echo "
Recarregando o Conky...
"

killall -9 conky 2> /dev/null ; conky -c "$arquivo" 2> /dev/null &


else

clear

echo "O arquivo $arquivo não existe."



yad \
--center \
--image=dialog-error \
--timeout=10 \
--no-buttons \
--title "Aviso" \
--text "\n\nNão foi possível acessar $arquivo arquivo inexistente!" \
--width 650 --height 100 \
2>/dev/null 





fi

# ----------------------------------------------------------------------------------------

exit 0

