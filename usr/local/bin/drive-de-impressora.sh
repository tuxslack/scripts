#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     13/01/2024 as 15:53
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
# Versão:   0.1
# Script:   
# Objetivo: Buscar drive de impressora no sistema.



# Epson L3250 Series

# Canon iP1800


# Polaroid P3500S & P5500S XPS Card Printer  (Impressora de Crachá Polaroid P5500)





# xbps-query -l | grep cups
#
# ii cups-2.4.7_4                                                Common Unix Printing System
# ii cups-devel-2.4.7_4                                          Common Unix Printing System - development files
# ii cups-filters-1.28.17_3                                      OpenPrinting CUPS Filters
# ii cups-pdf-3.0.1_1                                            PDF printer for cups
# ii libcups-2.4.7_4                                             Common Unix Printing System - client runtime shared libraries
# ii libcups-filters-1.28.17_3                                   OpenPrinting CUPS Filters - shared library
# ii python3-cups-2.0.1_6                                        Python3 CUPS bindings
# ii python3-cupshelpers-1.5.18_3                                Python utility modules around the CUPS printing system



# xbps-query -l | grep gutenprint
#
# ii gutenprint-5.3.4_1                                          Top quality printer drivers for POSIX systems


# xbps-query -l | grep epson
#
# ii epson-inkjet-printer-escpr-1.8.1_1                          Epson Inkjet Printer Driver (ESC/P-R)



# xbps-query -l | grep hplip
#
# ii hplip-3.23.12_1                                             HP Linux Imaging and Printing

# xbps-install -y hplip



# xbps-query -l | grep foomatic
#
# ii foomatic-db-20210104_1                                      OpenPrinting printer support - database
# ii foomatic-db-engine-4.0.13_3                                 OpenPrinting printer support - programs



clear


# Verificar se os programas estão instalados

which find         1> /dev/null 2> /dev/null || { echo "Programa find não esta instalado."          ; exit ; }



echo -e "\nQual o modelo da sua impressora para verificar se o driver esta disponivel no sistema?"
read impressora

echo -e "\n"



# Para verificar se o diretório /usr/share/cups/model/ existe.

    if [ -d "/usr/share/cups/model/" ]; then
    
       find /usr/share/cups/model/ | grep -i "$impressora"

    fi


# Para verificar se o diretório /usr/share/ppd/ existe.

    if [ -d "/usr/share/ppd/" ]; then
    
       find /usr/share/ppd/ | grep -i "$impressora"

    fi
    

# Para verificar se o diretório /usr/share/ppd/ existe.

    if [ -d "/usr/share/foomatic/db/source/PPD/" ]; then
    
       find /usr/share/foomatic/db/source/PPD/ | grep -i "$impressora"

    fi
    



# /usr/share/cups/model/gutenprint/5.3/Global/stp-bjc-2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-escp2-p20000-s.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-escp2-r2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-ricoh-afc_mp_2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-bjc-G2000-series.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-escp2-2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-nrg-mp_2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-pcl-2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-escp2-scan2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-fujifilm-ask-2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-escp2-p20000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-bjc-PIXMA-G2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-escp2-pm2000c.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-bjc-PIXUS-iP2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-epson-acl_c2000ps.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-bjc-iP2000-series.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-bjc-PIXMA-iP2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-bjc-MB2000-series.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-escp2-mc2000.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-kyocera-fs-2000d.5.3.sim.ppd.gz
# /usr/share/cups/model/gutenprint/5.3/Global/stp-epson-acl_c2000.5.3.sim.ppd.gz


# ls /usr/share/cups/model/gutenprint/5.3/Global/ | grep -i 2000


exit 0

