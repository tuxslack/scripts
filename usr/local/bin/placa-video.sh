#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
# Monitor Ultrawide de 34 polegadas (LG 34WP550 ) de 75Hz de taxa de atualização
#
# A resolução maxima que o sistema operacional me permite é de 1920x1080 e 60Hz de taxa de atualização e a resolução deste monitor é de 2560x1080.
#



# Segue comando para adicionar a resolução de 30Hz

# xrandr --newmode "2560x1080_30.00" 106.75 2560 2640 2896 3232 1080 1083 1093 1102 -hsync +vsync
# xrandr --addmode HDMI-1 2560x1080_30.00
# xrandr --output HDMI-1 --mode 2560x1080_30.00
#
# https://plus.diolinux.com.br/t/resolucao-de-tela-para-monitor-ultrawide-lg-34wp550/55825/5


which yad            2> /dev/null || { echo "Falta o yad"          ; exit 1; }
which inxi           2> /dev/null || { echo "Falta o inxi"         ; exit 2; }
which xrandr         2> /dev/null || { echo "Falta o xrandr"       ; exit 3; }


clear

titulo="Monitor X Placa de vídeo"

echo "

Sua placa de vídeo:

`inxi -G`

Resolução maxima que o sistema operacional permite é de:

`xrandr`

" | yad --center --title="$titulo" --fontname "Sans regular 9" --text-info --tail --wrap --height=800 --width=800 2>/dev/null


exit 0

