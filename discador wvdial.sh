#!/bin/bash
#
#
# Para usar precisa configurar os arquivos:  /etc/wvdial.conf e /etc/resolv.conf
#
# Usa os programas: xfce4-terminal, dialog, zenity, wvdial
#
#
# Testado em:
#
# $ lsusb | grep -i Huawei
# Bus 006 Device 002: ID 12d1:1003 Huawei Technologies Co., Ltd. E220 HSDPA Modem / E230/E270/E870 HSDPA/HSUPA Modem
#
#
#
#

clear

terminal="xfce4-terminal"



which zenity                || dialog --msgbox         "Não foi localizado zenity."                        10 60      2> /dev/null    ||  exit 1
which "$terminal"           || zenity --warning --text="Não foi localizado $terminal."                   --width=300  2> /dev/null    ||  exit 2


echo "
Desconectar da internet - via kppp ou via wvdial ...
"

killall  -9 wvdial ; killall  -9 kppp ; killall  -9 pppd ; rm -Rf ~/.kde/share/apps/kppp/kppp.pid


"$terminal" \
--title "Discador Wvdial - Modem 3G da Claro" \
-e "wvdial"


# Opções da janela:
#
#  --display=tela; --geometry=geometria; --role=função; --drop-down;
#  --startup-id=texto; -I, --icon=ícone; --fullscreen; --maximize;
#  --show-menubar, --hide-menubar; --show-borders, --hide-borders;
#  --show-toolbar, --hide-toolbar
#
# Veja a página man do xfce4-terminal para uma explicação detalhada das opções acima.


exit 0

