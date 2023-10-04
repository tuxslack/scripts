#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     04/10/2023 as 04:37
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#

clear

poff -a

killall -9 wvdial
killall -9 ppp
killall -9 pppd


ping -c 3 www.google.com.br


exit 0

