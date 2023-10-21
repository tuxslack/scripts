#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     13/10/2023 as 03:03
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
# Criptografia: de arma de guerra a pilar da sociedade moderna
#
#
# Como criptografar com a Cifra de César?
#
# 23 de abr. de 2017
#
#
# A Cifra de César é uma das mais simples e conhecidas técnicas de criptografia, tendo 
# sida usada por Júlio César para passar ordens militares. Com apenas duas listras de 
# papel, você pode deixar mensagens secretas para seus amigos! Aprenda como.
#
#
# Download do disco
#
# http://inventwithpython.com/cipherwheel/cipherdisk_cutout_page.pdf
#
#
# Versão interativa
#
# http://inventwithpython.com/cipherwheel/
#
#
# Fonte
#
# Livro “Encrypt messages and hack ciphers!”, de Al Sweigart.
#
# http://inventwithpython.com/hacking/chapters/
#
#
# https://www.youtube.com/watch?v=Iw-CO4MjDkE
#
#
#
# CIFRA DE CÉSAR EM SHELL SCRIPT
#
# 4:20 -  verificar o final do [ ] e em 6:06 o inicio do []
#
# https://www.youtube.com/watch?v=KI5ue2sz7HY
#
#
#
# $ echo {1..10}
#
# 1 2 3 4 5 6 7 8 9 10
#
#
# $ echo {a..z}
#
# a b c d e f g h i j k l m n o p q r s t u v w x y z
#
#
#
# $ echo {a..z} {a..z}
#
# a b c d e f g h i j k l m n o p q r s t u v w x y z a b c d e f g h i j k l m n o p q r s t u v w x y z
#
#
#
# https://mundoeducacao.uol.com.br/acordo-ortografico/o-alfabeto.htm
# https://unix.stackexchange.com/questions/267480/yad-how-to-create-a-simple-question-dialog
# https://www.infoescola.com/historia/julio-cesar/
# https://www.vivaolinux.com.br/topico/Shell-Script/Cifra-de-Cesar
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/comando-para-deletar-coluna-especifica-de-um-arquivo
# https://www.thelinuxrain.org/articles/the-buttons-of-yad



# ----------------------------------------------------------------------------------------

# Arquivo de log

log="/tmp/Cifra_de_Cesar.log"

# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados

clear


which yad       2> /dev/null || { echo "Programa Yad não esta instalado."      ; exit ; }


which tr        2> /dev/null || { yad \
--center \
--image=dialog-error \
--timeout=10 \
--no-buttons \
--title "Aviso" \
--text "Programa tr não esta instalado."    \
--width 450 \
--height 100 \
2>/dev/null   ; exit ; }


which tee       2> /dev/null || { yad \
--center \
--image=dialog-error \
--timeout=10 \
--no-buttons \
--title "Aviso" \
--text "Programa tee não esta instalado."   \
--width 450 --height 100 \
2>/dev/null   ; exit ; }


which iconv     2> /dev/null || { yad \
--center \
--image=dialog-error \
--timeout=10 \
--no-buttons \
--title "Aviso" \
--text "Programa iconv não esta instalado." \
--width 450 --height 100 \
2>/dev/null   ; exit ; }


# ----------------------------------------------------------------------------------------

# Remove o arquivo de log

rm -Rf "$log" || { yad \
--center \
--image=dialog-error \
--timeout=30 \
--no-buttons \
--title "Aviso" \
--text "Problema em remove o arquivo $log

# rm -Rf "$log"

"   \
--width 450 --height 100 \
2>/dev/null   ; exit ; }

# ----------------------------------------------------------------------------------------


# Alfabeto - 26 letras / criptografia e descriptografia

#       A B C D E F G H I J K L M N O P Q R S T U V W X Y Z
#
# A B C D E F G H I J K L M N O P Q R S T U V W X Y Z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z


# mensagem="Criptografia: de arma de guerra a pilar da sociedade moderna"
#
# mensagem_criptografada="fulswrjudild: gh dupd gh jxhuud d slodu gd vrflhgdgh prghuqd"
#
# mensagem="abcd"


clear

# ----------------------------------------------------------------------------------------

# Inicio do loop while

while :
do


# ----------------------------------------------------------------------------------------

rm -Rf /tmp/cifra_opcao.txt


# echo -e "\nDigite o seu texto:"
# read mensagem


# mensagem=$(yad \
# --center \
# --entry \
# --window-icon "/usr/share/icons/extras/Cifra_de_Cesar.png" \
# --title="Cifra de César" \
# --text="Digite o seu texto:" \
# --entry-text="" \
# --width=700 --entry \
# 2> /dev/null)


yad \
--center \
--form \
--image "/usr/share/icons/extras/Cifra_de_Cesar.png" \
--image-on-top        \
--title "Cifra de César" --text         \
"Nota: Palavras acentuadas não serão processadas pelo programa." \
--field "Digite o seu texto:" 'Criptografia: de arma de guerra a pilar da sociedade moderna'     \
--field "O que você deseja fazer com essa mensagem?:CB" \
        'criptografar!descriptografar'  \
--button="Sobre:3" \
--button="OK:2" \
--button="Cancelar:1" \
--buttons-layout=center \
--width 900 --height 250 \
2> /dev/null  1> /tmp/cifra_opcao.txt



# ----------------------------------------------------------------------------------------

# Para ver qual foi a opção escolhida pelo usuário

# echo "$?"

# ----------------------------------------------------------------------------------------

opcao=$?


[[ $opcao -eq 1 ]] &&  clear && rm -Rf /tmp/cifra_opcao.txt && clear && exit



if [[ $opcao -eq 2 ]]; then

clear


# ----------------------------------------------------------------------------------------

# Filtrar

mensagem=$(cat /tmp/cifra_opcao.txt | awk 'BEGIN {FS="|" } { print $1 }')
acao=$(cat /tmp/cifra_opcao.txt | awk 'BEGIN {FS="|" } { print $2 }')



# ----------------------------------------------------------------------------------------


# Para verificar se a variavel é nula

if [ -z "$mensagem" ];then


yad \
--center \
--image=dialog-error \
--title='Aviso' \
--text='\n\nVocê precisa informar uma mensagem...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


rm -Rf /tmp/cifra_opcao.txt 

clear

exit 

fi

# ----------------------------------------------------------------------------------------

clear

echo -e "\nComo criptografar com a Cifra de César?" | tee -a "$log"

# ----------------------------------------------------------------------------------------

# Converter todas as letras maiúsculas em minúsculas

mensagem=$(echo "$mensagem" | sed 's/^.*$/\L&/')

echo -e "\nMensagem:		$mensagem" | tee -a "$log"

# https://www.vivaolinux.com.br/dica/SED-texto-para-maiusculas-minusculas-pascal-case-e-camel-case

# ----------------------------------------------------------------------------------------

# Retirando Acentos

mensagem=$(echo "$mensagem" | iconv -t 'ascii//TRANSLIT')

# https://www.dacsolution.com.br/central/index.php?rp=/knowledgebase/54/Shell-script-para-retirar-os-acentos-dos-nomes-dos-arquivos.html


# ----------------------------------------------------------------------------------------

criptografia(){

# Move o alfabeto para gera a criptografar de César

mensagem=$(echo "$mensagem" | tr '[a-z]' '[d-za-c]' )

echo -e "\nMensagem criptografada: $mensagem" | tee -a "$log"

}



# ----------------------------------------------------------------------------------------

descriptografia(){

mensagem=$(echo "$mensagem" | tr '[d-za-c]' '[a-z]' )



# Adicionar cedilha
#
#
# C cedilha (ç)
#
# O ç não é uma letra, mas sim a junção do sinal cedilha com a letra c. O ç representa o 
# fonema /s/ antes das letras a, o, u, como criança, caroço e açúcar.
#
# https://www.todamateria.com.br/alfabeto/
#
#
# Ex: vxlfd
#
# mensagem=$(echo "$mensagem" | tr "[ca]" "[ça]" )
# mensagem=$(echo "$mensagem" | tr "[co]" "[ço]" )
# mensagem=$(echo "$mensagem" | tr "[cu]" "[çu]" )

# mensagem=$(echo "$mensagem" | iconv -f iso-8859-1 -t utf-8)


echo -e "\nMensagem descriptografada: $mensagem" | tee -a "$log"


}



# ----------------------------------------------------------------------------------------



# yad \
# --image dialog-question \
# --title "Cifra de César"  \
# --text "O que você deseja fazer com essa mensagem?" \
# --button=criptografar:0 \
# --button=descriptografar:1 

# if [ "$?" == "0" ];


if [ "$acao" == "criptografar" ];
then 

 criptografia    
  
  
 cat "$log" | yad \
 --center \
 --title='Cifra de César' \
 --fontname "Sans regular 9" \
 --text-info \
 --tail --wrap \
 --height=1000 \
 --width=800 \
 2>/dev/null



if [ $? -eq 1 ]; then
  
        rm -Rf /tmp/cifra_opcao.txt 
        
        clear
                
        # Abandone o loop while.
        
        break

fi


    
else


 descriptografia    
 
 
 cat "$log" | yad \
 --center \
 --title='Cifra de César' \
 --fontname "Sans regular 9" \
 --text-info \
 --tail --wrap \
 --height=1000 \
 --width=800 \
 2>/dev/null
 

if [ $? -eq 1 ]; then
          
        rm -Rf /tmp/cifra_opcao.txt 
        
        clear
                
        # Abandone o loop while.
        
        break

fi



  
fi


# ----------------------------------------------------------------------------------------






elif [[ $opcao -eq 3 ]]; then



# ----------------------------------------------------------------------------------------


# Sobre

clear

        yad \
        --center \
        --image=dialog-information \
        --title "Cifra de César" \
        --text 'Como criptografar um dado de maneira simples
=============================

Para proteger os dados, sejam eles de uma empresa, de órgãos governamentais 
ou até mesmo dados pessoais, utiliza-se a criptografia, que é um conjunto 
de técnicas adotadas para proteger um dado, para que o mesmo só seja acessado 
por quem o envia (emissor) e quem irá recebê-lo (receptor).

Mas você sabia que antes de Cristo vir à Terra, já existiam meios de criptografar mensagens?

Júlio César, uma importante figura política no final do período da República Romana, 
já utilizava um sistema bem simples para encriptar mensagens e enviá-las para seus 
generais. Trata-se da Cifra de César.

Esse algoritmo de criptografia é bastante simples: funciona a partir da substituição das 
letras do alfabeto por outras.

Com este algoritmo bem básico, podemos criptografar uma mensagem, utilizando a Cifra de César por exemplo:


Os soldados mais fortes não são descobertos em tempos de paz e sim resistindo em meio suas guerras. - Júlio César

Texto cifrado: rv vrogdgrv pdlv iruwhv qdr vdr ghvfrehuwrv hp whpsrv gh sdc h vlp uhvlvwlqgr hp phlr vxdv jxhuudv. - mxolr fhvdu

Para descriptografar a mensagem, basta fazer o mesmo processo, só que ao contrário.

Esse é um algoritmo que foi utilizado há mais de 2 mil anos atrás. Ele é muito simples e 
muito fácil de ser "quebrado".

Vários outros algoritmos de criptografia surgiram, sendo eles mais complexos e mais 
difíceis de descriptografar (alguns até mesmo já caíram em desuso justamente 
pelo avanço da área de criptologia e com o aumento do poder computacional).

"NENHUM ALGORITMO DE CRIPTOGRAFIA É 100% INQUEBRÁVEL E SEGURO".

Você já conheciam a Cifra de César?'  \
        --buttons-layout=center \
        --width 1000 --height 300 \
        2>/dev/null



if [ $? -eq 1 ]; then
           
           rm -Rf /tmp/cifra_opcao.txt 

           clear
           
           # Abandone o loop while.
        
           break

       fi
    

# ----------------------------------------------------------------------------------------



else

rm -Rf /tmp/cifra_opcao.txt 
           
clear

exit

fi




# ----------------------------------------------------------------------------------------


# Remove o arquivo de log

rm -Rf "$log"

rm -Rf /tmp/cifra_opcao.txt


# ----------------------------------------------------------------------------------------




# Fim do loop while

 done



exit 0

