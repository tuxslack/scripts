#!/bin/bash

# https://smartworldclub.net/11702149-how-to-tell-when-a-linux-server-was-shut-down-or-restarted

clear


# Inicialização do sistema atual:

last -x reboot | head -1 | yad --center --title='Última inicialização do Sistema' --fontname "Sans regular 9" --text-info --tail --height=200 --width=500 2>/dev/null


exit 0

