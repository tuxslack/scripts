#!/bin/bash
#
# Por  Fernando Souza
# Data: 16/08/2023 as 16:07
#
# verificar-hash.sh
#
#
# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml
#
#
# https://www.vivaolinux.com.br/topico/Shell-Script/Script-de-verificacao-de-hash
# https://www.vivaolinux.com.br/topico/yad/Yad-listando-um-arquivo-e-duas-colunas
# https://brainwork.com.br/2023/05/11/verificando-md5-hash-de-um-arquivo-no-windows-e-linux/
# http://www.dicas-l.com.br/arquivo/yad_yet_another_dialog.php
# https://www.blogopcaolinux.com.br/p/verificar-md5-sha-no-windows.html
# https://www.linux-magazine.com/Online/Blogs/Productivity-Sauce/Dress-Up-Bash-Scripts-with-YAD




clear


which md5sum        || exit 1
which sha1sum       || exit 2
which sha224sum     || exit 3
which sha256sum     || exit 4
which sha384sum     || exit 5
which sha512sum     || exit 6
which yad           || exit 7
which notify-send   || exit 8


yad  \
--center \
--title="Script de verificação de hash" \
--window-icon="/usr/share/icons/hicolor/48x48/apps/gcr-key-pair.png" \
--height=100 --width=700  \
--button="OK:0"  \
--text="Uma forma de validar a autenticidade de um arquivo.

É comum (e importante) fazermos isso quando baixamos um arquivo da internet para 
validar se não foi alterado.

Para quem trabalha com redes é comum, após baixar um software do site do fabricante, 
validar o MD5 para garantir que o software não foi corrompido durante a transferência.

A validação também tem a função de garantir que não houve outras alterações. Pode acontecer 
de um software ser intencionalmente alterado por um cracker, permitindo a infecção e 
controle da máquina." 2> /dev/null


# algoritmo=$(yad --center --width 300 --entry \
#    --title "Script de verificação de hash" \
#    --image=/usr/share/icons/hicolor/48x48/apps/gcr-key-pair.png \
#    --button="OK:0" --button="fechar:1" \
#    --text "Escolha um algoritmo:"                       \
#    --entry-text                                  \
#    "md5sum" "sha1sum" "sha224sum" "sha256sum" "sha384sum" "sha512sum" 2> /dev/null) || exit 8
    
    
algoritmo=$(yad \
--center \
--title="Script de verificação de hash" \
--window-icon="/usr/share/icons/hicolor/48x48/apps/gcr-key-pair.png" \
--width 300 --height 250 \
--text-align="center" \
--list --radiolist \
--column="Selecionado" --column="Algoritmo" \
False "md5sum" \
False "sha1sum" \
False "sha224sum" \
True  "sha256sum" \
False "sha384sum" \
False "sha512sum" \
2> /dev/null) || exit 9



# yad --list --column=Age:num --column=Select:chk --column=Comment:text 22 true Good

# yad --list --column=Algoritmo --column=Select:chk  \
# md5sum false \
# sha1sum true Good



algoritmo=$(echo "$algoritmo" | cut -d "|" -f2) 


 
# hashes SHA256SUMS
  
# df7208289adc4f855264a4387a7e7615435068cd8b0474260aa4271bbfff6c7c



# =============================================================================================================


hash_fornecido=$(yad --center --entry --title='Script de verificação de hash' --text="Qual o hash do arquivo $1 que foi fornecido?" --text-align="center" 2>/dev/null || exit 10)


notify-send -i /usr/share/icons/gnome/48x48/actions/system-search.png  -t 10000 "Script de verificação de hash" "Verificando $algoritmo (hash) do arquivo $1 ..."


hash_arquivo=$($algoritmo $1 | cut -d" " -f1)
  
sleep 10

        if [ "$hash_arquivo" == "$hash_fornecido" ]; then
                        
            yad --center --title='Script de verificação de hash' --image "/usr/share/icons/gnome/48x48/emotes/face-laugh.png"  --text="A verificação usando o algoritmo $algoritmo confere com o arquivo $1" --timeout=50 --no-buttons 2>/dev/null            
            
        else
                        
            yad --center --title='Error' --image "/usr/share/icons/gnome/48x48/emotes/face-angry.png"  --text="A verificação usando o algoritmo $algoritmo não confere para o arquivo $1" --timeout=50 --no-buttons 2>/dev/null
            
        fi
        
# =============================================================================================================
 

echo "
---------------------------------------------------------------------------------------------------------------

Arquivo:          $1
Algoritmo:        $algoritmo
hash do arquivo:  $hash_arquivo
hash fornecido:   $hash_fornecido

---------------------------------------------------------------------------------------------------------------

" | yad --center  --window-icon=/usr/share/icons/hicolor/48x48/apps/gcr-key-pair.png --title='Script de verificação de hash' --text-info --fontname "mono 10" --width 1000 --height 300 2> /dev/null


# =============================================================================================================

   
exit 0

