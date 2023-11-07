#!/bin/bash

# https://smartworldclub.net/11702149-how-to-tell-when-a-linux-server-was-shut-down-or-restarted

clear


# É possível filtrar apenas o último desligamento ou os demais desligamentos que consideramos necessários.

# O comando last -x shutdown exibe uma lista de todas as últimas vezes em que o sistema foi desligado.

last -x shutdown | head -1 | yad --center --title='Último desligamento do Sistema' --fontname "Sans regular 9" --text-info --tail --height=200 --width=500 2>/dev/null


exit 0

