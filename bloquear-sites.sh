#!/bin/bash
#
# Autor:           Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:            17/11/2024 as 12:48:45
# Atualização em:  https://github.com/tuxslack/scripts
# Script:          bloquear-sites.sh
# Versão:          0.1
# Bloqueie sites indesejados com o arquivo /etc/hosts.
# 
#
# Data da atualização: 
#
# Licença:  GPL - https://www.gnu.org/
# 




# https://plus.diolinux.com.br/t/bloqueie-sites-indesejados-com-o-arquivo-etc-hosts/68870
# https://github.com/StevenBlack/hosts
# https://hblock.molinero.dev/

# ----------------------------------------------------------------------------------------

# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor



arquivo="/etc/hosts"

# arquivo="hosts"


# Bloqueando sites

# 0.0.0.0 diolinux.com.br

# ou

# 127.0.0.1 diolinux.com.br

clear

# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados:

which yad       1> /dev/null 2> /dev/null || { echo "Programa yad não esta instalado."       ; exit ; }


which grep      1> /dev/null 2> /dev/null || { yad --center --window-icon "$logo" --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa grep não esta instalado."       --width 450 --height 100 2>/dev/null   ; exit ; }

which sed       1> /dev/null 2> /dev/null || { yad --center --window-icon "$logo" --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa sed não esta instalado."       --width 450 --height 100 2>/dev/null   ; exit ; }

which wget      1> /dev/null 2> /dev/null || { yad --center --window-icon "$logo" --image=dialog-error --timeout="10" --no-buttons --title "Aviso" --text "Programa wget não esta instalado."       --width 450 --height 100 2>/dev/null   ; exit ; }


# ----------------------------------------------------------------------------------------

# Função verificar_root

verificar_root(){

if [ "$(id -u)" != "0" ]; then

       # echo -e "${RED}\nVocê deve executar este script como Root! \n ${NC}"
        
yad \
--center \
--title='Aviso' \
--window-icon "$logo" \
--image=dialog-error \
--text='\n\nVocê deve executar este script como Root!\n\n' \
--timeout="10" \
--no-buttons \
2>/dev/null

exit 

else

        echo -e "\n${GREEN}Verificação de Root [OK] ${NC}\n"

        sleep 2

fi

}


verificar_root


# ----------------------------------------------------------------------------------------

pesquisar(){

# clear

# grep - Pesquise por palavras dentro de arquivos de texto

# echo "Pesquisar por dominio Ex: www.google.com.br"
# read site


# Recebe valores e armazena em variáveis

site=$(yad \
        --center \
        --window-icon "$logo" \
        --title="Bloqueie sites indesejados" \
        --entry \
        --entry-label="Pesquisar por dominio:" \
        --entry-text="www.google.com.br" \
        --completion \
        --editable \
        --button=Cancelar:1 \
        --button=OK:0 \
        --width="800" --height="100" \
        2>/dev/null) 

clear

# ----------------------------------------------------------------------------------------

# Para verificar se a variavel é nula

if [ -z "$site" ];then

clear


yad \
--center \
--title='Aviso' \
--window-icon "$logo" \
--image=dialog-error \
--text='\n\nVocê precisa informar um site no script '$(basename "$0")'...\n\n' \
--timeout="10" \
--no-buttons \
2>/dev/null

# echo 'Você precisa informar um site no script '$(basename "$0")'.'

exit

fi

# ----------------------------------------------------------------------------------------



clear

      # echo -e "\n${GREEN}Site encontrado no arquivo $arquivo:${NC} \n"

grep -R "$site" "$arquivo" | yad --center --title="Site encontrado no arquivo $arquivo:" --window-icon="$logo" --text-info --fontname "mono 10" --button=Cancelar:1 --button=OK:0 --width="1100" --height="800" 2>/dev/null


if [ "$?" -eq "0" ];
then

     remove

else

     adicionar

fi

# https://www.mundoubuntu.com.br/dicas/comandos/306-grep-pesquise-por-palavras-dentro-de-arquivos-de-texto


}


# ----------------------------------------------------------------------------------------

adicionar(){

clear

# echo -e "\nDeseja bloquear o site $site ? [s/n] " 
# read resposta

yad \
--center \
--title="Bloqueie sites indesejados" \
--text "Deseja bloquear o site $site?" \
--button="Não":1 --button="Sim":0



# if [[ $resposta = +(S|s) ]];then  # Valida a resposta com "S" e com "s"

if [ "$?" == "0" ];
then

clear

echo "
Bloqueando o site $site...
"

echo "0.0.0.0 $site" >> "$arquivo"

else

clear
exit

fi


# https://www.vivaolinux.com.br/topico/Shell-Script/Loop-no-Sn

}

# ----------------------------------------------------------------------------------------

remove(){

# clear


echo "
Buscando $site no arquivo $arquivo...
"

grep -R "$site" "$arquivo" || exit


# echo -e "\nDeseja remove o bloqueio do site $site ? [s/n]" 
# read resposta

yad \
--center \
--title="Bloqueie sites indesejados" \
--text "Deseja remove o bloqueio do site $site ?" \
--button="Não":1 --button="Sim":0



# if [[ $resposta = +(S|s) ]];then  # Valida a resposta com "S" e com "s"

if [ "$?" == "0" ];
then

clear

echo "
Removendo o bloqueio do site $site...
"

sed -i '/'$site'/d' "$arquivo"

else

clear
exit

fi



# https://www.vivaolinux.com.br/topico/Sed-Awk-ER-Manipulacao-de-Textos-Strings/Apagar-linha-com-palavra
# https://www.thelinuxrain.org/articles/the-buttons-of-yad
# https://yad-guide.ingk.se/examples/examples.html
# https://github.com/v1cont/yad/issues/107

}


# ----------------------------------------------------------------------------------------


gerar(){

# clear


# ----------------------------------------------------------------------------------------

echo "
Testando conexão com à internet...
"

if ! ping -c 1 www.google.com.br -q &> /dev/null; then


yad --center --window-icon "$logo" --image=dialog-error --timeout="10" --no-buttons --title "ERRO" --text "Seu sistema não tem conexão com à internet. Verifique os cabos e o modem."  --width="600" --height="100" 2>/dev/null


    echo -e "${RED}[ERRO] - Seu sistema não tem conexão com à internet. Verifique os cabos e o modem.\n ${NC}"

    sleep 10

    exit 1
    

    else
    
    echo -e "${GREEN}[VERIFICADO] - Conexão com à internet funcionando normalmente. ${NC}"
    sleep 2
    
fi

# ----------------------------------------------------------------------------------------



# echo -e "\nDeseja gerar um novo arquivo $arquivo? [s/n]" 
# read resposta

yad \
--center \
--title="Bloqueie sites indesejados" \
--text "Deseja gerar um novo arquivo $arquivo?" \
--button="Não":1 --button="Sim":0



# if [[ $resposta = +(S|s) ]];then  # Valida a resposta com "S" e com "s"

if [ "$?" == "0" ];
then


echo "
Gerando um novo arquivo $arquivo...
"

wget -O $arquivo -c "https://hblock.molinero.dev/hosts"

else

clear
exit

fi



# https://hblock.molinero.dev/

}

# ----------------------------------------------------------------------------------------



# Verificar se o arquivo existe

if [ -e "$arquivo" ] ; then

        echo -e "\n${GREEN}Arquivo $arquivo encontrado [OK] ${NC}\n"

        sleep 1

        clear

        pesquisar

else

        echo -e "\n${RED}Arquivo $arquivo não encontrado... ${NC}\n"

        sleep 1

        clear

        gerar


fi

# ----------------------------------------------------------------------------------------

exit 0

