#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     02/10/2023 as 12:29
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL

# Atualizar a data e hora do sistema


clear

# ----------------------------------------------------------------------------------------

# Verifica se quem executa é o Root


if [ "$(id -u)" != "0" ]; then

echo -e "\nVocê deve executar este script como Root! \n"

exit 


fi

# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados


which ping               2> /dev/null || { echo "Programa ping não esta instalado."      ; exit ; }
which hwclock            2> /dev/null || { echo "Programa hwclock não esta instalado."   ; exit ; }
which ntpdate            2> /dev/null || { echo "Programa ntpdate não esta instalado."   ; exit ; }

# ----------------------------------------------------------------------------------------

# Verificar o acesso à internet


verifica_internet(){

    ping -c 2 www.google.com.br 2>/dev/null

    if [ $? != 0 ] ; then
    
    echo "
Não foi possível atualizar o relógio...

Esta sem acesso à internet..."
     
    sleep 30
        
    exit 
    
    fi

}


verifica_internet

    
# ----------------------------------------------------------------------------------------

    
clear 

echo "
Data e hora atual do sistema:
"

hwclock


echo "
Atualizando a data e hora do sistema...
"
ntpdate -u pool.ntp.org

    if [ $? != 0 ] ; then
    

# notify-send -i gtk-dialog-info  -t 200000 "Atualização de data e hora do sistema..." "
#
# Ocorreu um problema em atualizar a data e hora do sistema em: `date +%d/%m/%Y-%H:%M`
#
# "


echo "
Ocorreu um problema em atualizar a data e hora do sistema em: `date +%d/%m/%Y-%H:%M`
"

    sleep 30
    
    exit 
       
        
    fi
    

hwclock -w


echo "
Data e hora atual do sistema:
"

hwclock



sleep 30

# ----------------------------------------------------------------------------------------



exit 0
    
