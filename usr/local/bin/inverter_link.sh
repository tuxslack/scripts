#!/bin/bash
#
# Autor:           Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:            25/10/2023 as 13:06
# Atualização em:  https://github.com/tuxslack/scripts   | https://notabug.org/
# Script:          inverter_link.sh
# Versão:          0.3
# Inverte Link - simples script para inverter links da internet para download do mesmo.
#
# Data da atualização:  20/10/2023 as 19:10
#
# Licença:  GPL - https://www.gnu.org/
# 
#
# Colaboração: 
#
# Bio <3t1310@gmail.com> em 10/03/2011 versão 0.1 e atualizado em 18/06/2011 versão 0.2
# Fabio Schevenin        (última atualização em 01/12/2020)
#
# 
#
# 
# Inversor de link
# 
# 
# Simples script shell para inverter link de sites de downloads em modo de linha de comando, muito prático e rápido.
# 
# Dê permissão de execução ao arquivo:        $ chmod +x arquivo
# se desejar mude o dono do arquivo:          $ chown seuusuario.users arquivo
# se executou o item acima então copie para:  $ sudo cp arquivo /bin/
# 
# Se fizer assim quando digitar no terminal:  $ inverter_link.sh  e der <enter> funcionará sem a necessidade de ./
# 
# dúvidas, sugestões postem!
# 
# 
# 
# Changelog: * Checar se o texto é um link usando regex
# * Otimização do código usando heredocuments e removendo redundâncias


# https://www.vivaolinux.com.br/script/Inversor-de-link
# https://www.vivaolinux.com.br/script/Inversor-de-texto



# Exemplo de link invertido: 

# https://www.blograpazdoceu.com/ads/?u=13763673873707b613574636f24756e6e24616f6c607572726e2777777f2f2a33707474786=di?/moc.odigetorpkniluem.www//:ptth
# https://www.blograpazdoceu.com/ads/?u=c6d64786e263262637a64357c627876623f2f636e256c69666b636f627f2f2a33707474786=di?/moc.odigetorpkniluem.www//:ptth
# https://www.blograpazdoceu.com/ads/?u=971677b62696e653f2f647e2c657f2f2a307474786=di?/moc.odigetorpkniluem.www//:ptth

# wjrOMKkfsEOnJJ-fA_O9DxQfCjhKGCy3oJuJin234RH#ISJiV0dm/elif/zn.agem//:sptth


# https://www.g1filmes.com/alem-da-vida-after-life-bdrip-dual-audio-download


# Inverte link de site e texto.


titulo="INVERSOR DE LINK"


# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados


which yad    2> /dev/null || { echo "Programa Yad não esta instalado."   ; exit ; }


which rev    2> /dev/null || { yad \
--center \
--image=dialog-error \
--timeout=10 \
--no-buttons \
--title "Aviso" \
--text "Programa rev não esta instalado." \
--width 450 --height 100 \
2>/dev/null   ; exit ; }

# ----------------------------------------------------------------------------------------


clear


link_invertido=$(yad \
--center \
--entry \
--window-icon "" \
--title="$titulo" \
--text="Digite ou cole o link ou texto a ser invertido: " \
--entry-text="" \
--width=700 --entry \
2> /dev/null)


# ----------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$link_invertido" ];then


yad \
--center \
--image=dialog-error \
--title='Aviso' \
--text='\n\nVocê precisa informar um link ou texto para ser invertido...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null

clear

        exit
        
fi

# ----------------------------------------------------------------------------------------



echo "
------------------------------------------------------------------------


`echo "$link_invertido" | rev`

------------------------------------------------------------------------

Pronto!!! Seu link já esta invertido agora é só copia-lo para navegador.

"  | yad --center --title="$titulo" --fontname "Sans regular 9" --text-info --tail --wrap --height=800 --width=800 2>/dev/null


exit 0

