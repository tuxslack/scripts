#!/bin/bash
# 
# 
# 
# Alterar a resolução da tela
#
# Essa dica é para aqueles usuários que usam interface grafica leve (Fluxbox...) que não tem 
# opções extra para mudar a resolução de vídeo.
# 
# 
# Simular o problema:
# 
# 
# * Estava jogando "call of duty", mas quando saía do jogo a minha resolução de vídeo mudava 
# para 800x600. Ficava tudo estranho e para eu voltar a resolução padrão que costumo usar, 
# tinha que derrubar o X e carregar novamente, sux. 
#
# * Desligar e ligar novamente o monitor quando esta carregando a conta do usuario
# 
# 
# 
# https://linuxdicasesuporte.blogspot.com/2017/02/alterar-resolucao-da-tela-do-grub.html
# https://www.vivaolinux.com.br/dica/Mudando-a-resolucao-de-video-pelo-terminal


log="/tmp/resolução_da_tela.log"

rm -Rf "$log"


titulo="Alterar a resolução da tela"

clear


which zenity                2>  "$log"
which xdpyinfo              2>> "$log"
which xrandr                2>> "$log"
which notify-send           2>> "$log"



zenity --info --text="


# Primeiro deve conferir qual a resolução do seu monitor atual

Exemplo:

$ xdpyinfo  | grep 'dimensions:'
  dimensions:    1440x900 pixels (381x238 millimeters)


O resultado para o meu monitor é: `xdpyinfo  | grep 'dimensions:' | cut -d":" -f2`.


$ xrandr
Screen 0: minimum 320 x 200, current 1440 x 900, maximum 8192 x 8192
VGA-0 connected primary 1440x900+0+0 (normal left inverted right x axis y axis) 408mm x 255mm
   1440x900      59.89*+  74.98  
   1280x1024     75.02    70.00    60.02  
   1152x864      75.00  
   1024x768      75.08    70.07    60.00  
   832x624       74.55  
   800x600       72.19    75.00    60.32    56.25  
   640x480       75.00    72.81    66.67    60.00  
   720x400       70.08  
HDMI-0 disconnected (normal left inverted right x axis y axis)

--------------------------------------------------------------------------------------------------


`xrandr`

Na proxima de tela coloca a resolução da tela deseja para realizar a alteração.

" --width="1000" --height="10"  2>/dev/null



resolucao=$(zenity \
--title="$titulo" \
--text "Qual a resolução da tela deseja para realizar a alteração?" \
--entry \
--entry-text="1440x900" 2> /dev/null)


xrandr -s "$resolucao"



exit 0


