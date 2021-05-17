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
# https://wiki.archlinux.org/index.php/wvdial
# https://blog.ffelix.eti.br/como-saber-se-comando-do-script-foi-executado-com-sucesso/
# https://www.vivaolinux.com.br/topico/Shell-Script/Validar-comando



clear

terminal="xfce4-terminal"



which zenity                || dialog --msgbox         "Não foi localizado zenity."                        10 60      2> /dev/null    ||  exit 1
which "$terminal"           || zenity --warning --text="Não foi localizado $terminal."                   --width=300  2> /dev/null    ||  exit 2


# O arquivo /etc/wvdial.conf deve esta configurado para o modem USB da sua operadora (Claro, TIM, Vivo, Oi e etc ... ).


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


# wvdial

# Como saber se comando do script foi executado com sucesso ...

# $? Valor de retorno do último comando executado

# if [ $? != 0 ]; then

# echo " ..."


# else

# ATDT*99**1#
# NO CARRIER
# --> No Carrier!  Trying again.
# --> Sending: ATDT*99**1#
# --> Waiting for carrier.


# echo "
# wvdialconf...
# "

# Para o caso de o comando "wvdial" não funcionar por causa da troca de dispositivo de /dev/ttyUSB0 para /dev/ttyUSB1 ...

# su -c wvdialconf 



# wvdialconf 
# Editing `/etc/wvdial.conf'.
#
# Scanning your serial ports for a modem.
# 
# ttyS0<*1>: ATQ0 V1 E1 -- failed with 2400 baud, next try: 9600 baud
# ttyS0<*1>: ATQ0 V1 E1 -- failed with 9600 baud, next try: 115200 baud
# ttyS0<*1>: ATQ0 V1 E1 -- and failed too at 115200, giving up.
# Modem Port Scan<*1>: S1   S2   S3   
# ttyUSB1<*1>: ATQ0 V1 E1 -- OK
# ttyUSB1<*1>: ATQ0 V1 E1 Z -- OK
# ttyUSB1<*1>: ATQ0 V1 E1 S0=0 -- OK
# ttyUSB1<*1>: ATQ0 V1 E1 S0=0 &C1 -- OK
# ttyUSB1<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 -- OK
# ttyUSB1<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0 -- OK
# ttyUSB1<*1>: Modem Identifier: ATI -- Manufacturer: huawei
# ttyUSB1<*1>: Speed 9600: AT -- OK
# ttyUSB1<*1>: Max speed is 9600; that should be safe.
# ttyUSB1<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0 -- OK
# ttyUSB2<*1>: ATQ0 V1 E1 -- OK
# ttyUSB2<*1>: ATQ0 V1 E1 Z -- OK
# ttyUSB2<*1>: ATQ0 V1 E1 S0=0 -- OK
# ttyUSB2<*1>: ATQ0 V1 E1 S0=0 &C1 -- OK
# ttyUSB2<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 -- OK
# ttyUSB2<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0 -- OK
# ttyUSB2<*1>: Modem Identifier: ATI -- Manufacturer: huawei
# ttyUSB2<*1>: Speed 9600: AT -- OK
# ttyUSB2<*1>: Max speed is 9600; that should be safe.
# ttyUSB2<*1>: ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0 -- OK
# 
# Found a modem on /dev/ttyUSB1.
# Modem configuration written to /etc/wvdial.conf.
# ttyUSB1<Info>: Speed 9600; init "ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0"
# ttyUSB2<Info>: Speed 9600; init "ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0"



# fi


exit 0

