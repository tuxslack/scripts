#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     04/10/2023 as 20:03
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
# Usado no OpenBox, Fluxbox e i3 para visualizar sites na internet.


yad \
--center \
--title='Links para internet - selecionar e tecla Enter' \
--image="dialog-information" \
--icons \
--read-dir="$HOME/.local/share/applications/links para internet/" \
--width="1500" --height="1900" \
2>/dev/null &
