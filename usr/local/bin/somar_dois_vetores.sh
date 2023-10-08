#!/bin/bash
#
# Autor:       Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:        08/10/2023 as 02:50
# Homepage:    https://github.com/tuxslack/scripts
# Colaboração: Jesse Moreira - 31/12/2020
# Licença:     GPL
#
# Shell Script para somar dois vetores.
#
# Shell Script que permite calcular a soma de dois vetores em função do módulo dos vetores 
# e do ângulo entre eles.
#
# Utilizou-se no script um modo matemático que nos permite calcular seno, cosseno, tangente 
# e demais funções trigonométricas dentro do Shell.
#
#
# https://www.youtube.com/watch?v=itFRH92c9XQ
# https://shell-script.yahoogrupos.com.narkive.com/edsgD6LN/calculo-de-seno-cosseno-em-shell-script
# https://www.monolitonimbus.com.br/matematica-com-shell-script/
# https://www.dicas-l.com.br/arquivo/uma_breve_apresentacao_do_yad_yet_another_dialog.php
# https://www.mentebinaria.com.br/forums/topic/170-introdu%C3%A7%C3%A3o-a-cria%C3%A7%C3%A3o-interface-gr%C3%A1fica-com-shell-script-e-yad/
# http://smokey01.com/yad/
# https://daemoniolabs.wordpress.com/tag/exemplos-formulario-yad/
# 

clear


# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados

which yad   2> /dev/null || { echo "Programa Yad não esta instalado."      ; exit ; }


which bc    2> /dev/null || { yad \
--center \
--image=dialog-error \
--timeout=10 \
--no-buttons \
--title "Aviso" \
--text "Programa bc não esta instalado." \
--width 450 --height 100 \
2>/dev/null   ; exit ; } 

# ----------------------------------------------------------------------------------------



dados=$(yad \
--center \
--form \
--image logo-dicas-l.png \
--image-on-top        \
    --title "Shell Script para somar dois vetores."               \
    --text  "Permite calcular a soma de dois vetores"             \
    --field "Qual o valor de a?" '3'                              \
    --field "Qual o valor de b?" '4'                              \
    --field "Qual é ângulo entre os dois vetores?:NUM" '60!' \
--width="100" \
--height="200" \
--button Calcular --buttons-layout="center" \
2> /dev/null)
    
    
# Filtra os dados:

a=$(echo  "$dados" | awk 'BEGIN {FS="|" } { print $1 }')
b=$(echo  "$dados" | awk 'BEGIN {FS="|" } { print $2 }')
an=$(echo "$dados" | awk 'BEGIN {FS="|" } { print $3 }')


# ----------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$a" ];then


yad \
--center \
--image=dialog-error \
--title='Aviso' \
--text='\n\nVocê precisa informar o valor de a...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


clear


exit

fi

# ----------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$b" ];then


yad \
--center \
--image=dialog-error \
--title='Aviso' \
--text='\n\nVocê precisa informar o valor de b...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


clear


exit

fi

# ----------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$an" ];then


yad \
--center \
--image=dialog-error \
--title='Aviso' \
--text='\n\nVocê precisa informar o ângulo entre os dois vetores...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


clear


exit

fi

# ----------------------------------------------------------------------------------------


# Valor de PI é 3.14159265358979323846

PI=$(echo "4*a(1)" | bc -l)


angulo=$(echo "($an*$PI/180)" | bc -l)

c_ao_quadrado=$(echo "$a*$a+$b*$b+2*$a*$b*c($angulo)" | bc -l)


CE=$(echo "sqrt($c_ao_quadrado)"  | bc -l)

# ----------------------------------------------------------------------------------------

echo "
O valor do vetor resultante será:

$CE

" | yad \
--center \
--title="Shell Script para somar dois vetores." \
--fontname "Sans regular 9" \
--text-info --tail --wrap \
--height=200 --width=500 2>/dev/null

# ----------------------------------------------------------------------------------------

exit 0

