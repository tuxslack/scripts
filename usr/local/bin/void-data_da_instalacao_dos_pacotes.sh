#!/bin/bash
#
# Autor:           Fernando Souza <https://www.youtube.com/@fernandosuporte>
# Data:            23/03/2024
# Atualização em:  https://github.com/tuxslack/scripts
# Script:          void-data_da_instalacao_dos_pacotes.sh
# Versão:          0.1
# 


# Como descobrir a data de instalacao dos programas no Void Linux?
#
# Ver a lista de pacotes instalados por data
#
# Listar data de instalação dos pacotes 
#
# Desinstalando todos os programas instalados a partir de uma data específica

# Ver a lista de pacotes instalados por data no Void Linux

# https://www.vivaolinux.com.br/topico/Sed-Awk-ER-Manipulacao-de-Textos-Strings/Comando-SED-para-apagar-duas-ou-mais-palavras-em-um-conteudo-de-arquivo
# https://elcio.com.br/notify-send-notificacoes-do-gnome-em-seu-shell-script/
# https://askubuntu.com/questions/29370/how-to-check-if-a-command-succeeded
# https://www.vivaolinux.com.br/topico/Comandos/Verificar-usuario
# https://www.shellscriptx.com/2016/11/verificando-se-script-foi-executado-como-root.html
# https://www.vivaolinux.com.br/artigo/Formatando-exibicao-de-datas-no-Linux


# ========================================================================================

clear

which xbps-query   1> /dev/null 2> /dev/null || { echo -e '\033[1;31m\nVocê precisa do programa xbps-query instalado para usar esse script.\033[0m' ; exit ; }
which notify-send  1> /dev/null 2> /dev/null || { echo -e '\033[1;31m\nVocê precisa do programa notify-send instalado para usar esse script.\033[0m' ; exit ; }


# ========================================================================================

# Verificar se esta executando esse script como Root


if [ $UID -eq 0 ]; then

# if [ $USER == root ]; then


     clear
     
     echo -e '\033[1;31m\nVocê deve executar esse script como usuário comum e não como Root.\n\033[0m'
     
     exit 1


else

# Executando esse script como usuário comum


# ========================================================================================

xbps-query -l > /tmp/pacote_void.txt

cat /tmp/pacote_void.txt | awk '{print $2}' > /tmp/pacote_voidlinux.txt

mv /tmp/pacote_voidlinux.txt /tmp/pacote_void.txt


rm -Rf /tmp/pacote_voidlinux.txt

# ========================================================================================

while IFS= read -r PACOTE; do # Lê o arquivo linha por linha
       
       echo -e "\e[1;32m$PACOTE\e[0m"

       dado=$(xbps-query -S "$PACOTE" | grep "install-date" | sed  's/install-date: //')

       # 2024-02-27 09:51 -03

       echo "$PACOTE;`gawk '{split($1,dma,"-")}{printf "%s/%s/%s;%s\n" ,dma[3],dma[2],dma[1],$2}' <<< "$dado"`"   >> /tmp/pacote_voidlinux.txt
                   
done < /tmp/pacote_void.txt


rm -Rf /tmp/pacote_void.txt


# Para deletar somente a palavra, use:

# sed -i 's/install-date://' /tmp/pacote_voidlinux.txt
# sed -i 's/-03//'           /tmp/pacote_voidlinux.txt
# sed -i 's/UTC//'           /tmp/pacote_voidlinux.txt

# ========================================================================================

# Acrescentar a linha contendo o cabeçalho

sed -i '1 iPacote;Data;Hora'  /tmp/pacote_voidlinux.txt


cp /tmp/pacote_voidlinux.txt /tmp/pacote_voidlinux.csv

# ========================================================================================

# notify-send - Notificações no desktop

# Para obter uma lista dos ícones disponíveis, dê uma olhada no diretório /usr/share/icons/gnome/48x48.

# Verificar se arquivo existe

if [ -e "/usr/share/icons/gnome/48x48/status/dialog-warning.png" ] ; then

    notify-send -i "/usr/share/icons/gnome/48x48/status/dialog-warning.png" -t 36000 "Notificação..."  "Arquivo /tmp/pacote_voidlinux.csv foi gerado em: `date +"%d/%m/%Y %H:%M:%S"`"

fi

# ========================================================================================

# Abrindo o arquivo gerado:
 

# Como verificar se um comando foi bem-sucedido?

which libreoffice 1>/dev/null 2>/dev/null

if [ $? -eq 0 ]; then

    libreoffice --calc /tmp/pacote_voidlinux.csv 2> /dev/null
    # soffice --calc /tmp/pacote_voidlinux.csv 2> /dev/null
    
else

    cat /tmp/pacote_voidlinux.txt

    rm -Rf /tmp/pacote_voidlinux.txt
    
fi

# ========================================================================================


fi


clear

exit 0

