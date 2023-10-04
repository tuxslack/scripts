#!/bin/bash
#
# Autor: Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Homepage: https://github.com/tuxslack/scripts
# Licença: GPL
# 
# Atualizar um sistema operacional Linux é uma tarefa fundamental para garantir 
# a segurança, estabilidade e desempenho do ambiente. No entanto, realizar essas 
# atualizações manualmente pode ser demorado e propenso a erros. É aqui que entra 
# a automação, que pode economizar tempo e garantir que todas as atualizações 
# necessárias sejam aplicadas de forma consistente.
# 
# Describe: Script automatizado para atualização em distribuições Linux. (Debian)
#
# Este script torna o processo de atualização do sistema simples e eficiente.
# 
# 
# 
# Este script realiza as seguintes ações:
# 
# Verifica a conexão com a internet para garantir que as atualizações possam ser baixadas.
# 
# Cria automaticamente a pasta /tmp caso necessario para armazenar logs de atualização.
# 
# Executa a atualização do sistema, verificando e aplicando atualizações disponíveis.
# 
# Realiza a limpeza do sistema para remover pacotes obsoletos.
# 
# Reinicia automaticamente o sistema após a atualização.
# 
# 
# 
# Uso do Script
# 
# Para utilizar este script, siga os passos abaixo:
# 
# Copie o código do script para um arquivo com extensão .sh, por exemplo, atualizar.sh.
# 
# Dê permissões de execução ao arquivo: chmod +x /usr/local/bin/atualiza.sh .
# 
# Execute o script: atualizar.sh.
# 
# O script verificará a conexão com a internet, criará os logs, atualizará o 
# sistema, realizará a limpeza e reiniciará o sistema, se necessário.
# 
# Conclusão
# 
# A automação de atualizações em sistemas Linux é uma prática recomendada 
# para manter a segurança e a eficiência do ambiente. Este script 
# simplifica o processo, economiza tempo e reduz erros. Lembre-se de 
# personalizar o script de acordo com suas necessidades específicas, como 
# agendar execuções automáticas ou adicionar notificações.
# 
# Automatizar tarefas como atualizações é uma excelente maneira de otimizar 
# a administração de sistemas e garantir que seus servidores estejam sempre 
# atualizados e protegidos contra vulnerabilidades.
# 
# Para mais dicas: https://


# A legibilidade sempre deve ser priorizada. O código deverá ser fácil de entender, e ser mantido. - Princípio KISS (Keep It Simple)



# https://www.vivaolinux.com.br/script/Metodo-para-verificar-e-instalar-pacotes
# https://www.vivaolinux.com.br/topico/Shell-Script/Verificar-se-um-programa-esta-instalado
# https://www.vivaolinux.com.br/script/Verifica-se-quem-executa-e-root


# ------------------------------------------------------------------------


# Arquivo de log (obte a data atual para criação do nome do arquivo de log)

log="/tmp/update_$(date +%d-%m-%Y).log"

rm -Rf /tmp/update_*.log


# ------------------------------------------------------------------------

# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor

# echo -e "\e[1;34mTexto \e[m"

# help echo
#
# -e	habilita interpretação de escapes de contrabarra a seguir
# \e	caractere de escape


# Sem o "-e", não interpreta o escape ("\e") que forma a cor.

# ------------------------------------------------------------------------

# Mensagens para as condições e conclusões dos comandos

CONERROR="[ERRO] - Seu sistema não tem conexão com à internet. Verifique os cabos e o modem.\n"
CONSUCESS="[VERIFICADO] - Conexão com à internet funcionando normalmente."

BEGIN_UPDATE="*** INICIANDO ATUALIZAÇÃO DO SISTEMA ***"
END_UPDATE="*** ATUALIZAÇÃO REALIZADA COM SUCESSO ***"
NO_UPDATE="*** ATUALIZAÇÃO NÃO FOI REALIZADA COM SUCESSO ***"

BEGIN_CLEAN="*** INICIANDO LIMPEZA DO SISTEMA ***"
END_CLEAN="*** LIMPEZA CONCLUÍDA ***"
NO_CLEAN="*** LIMPEZA NÃO FOI CONCLUÍDA ***"

MSG_MKDIR="A pasta /tmp já existe."


NOTA="\n\nObs:

Em caso de falta de internet o processo de atualização do sistema 
pode trava e deverá ser refeito apos o acesso à internet volta.\n"



UPDATE_CLAMAV="*** ATUALIZAÇÃO DA BASE DE DADOS DO CLAMAV FOI REALIZADA COM SUCESSO *** "
UPDATE_NO_CLAMAV="*** ATUALIZAÇÃO DA BASE DE DADOS DO CLAMAV NÃO FOI REALIZADA COM SUCESSO ***"


# ------------------------------------------------------------------------



# Criar algo global para atualizar o sistema:

clear

# ------------------------------------------------------------------------

# Verifica se quem executa é o Root


if [ "$(id -u)" != "0" ]; then

echo -e "\nVoce deve executar este script como Root! \n"

exit 

else

echo -e "\n${GREEN}Verificação de Root [OK] ${NC}\n"

fi


# ------------------------------------------------------------------------

# Para verificar se o diretório /tmp/ existe e criá-lo, se necessário.

    if [ -d "/tmp/" ]; then
    
        echo -e "${RED}${MSG_MKDIR} ${NC}"
        
    else
    
        echo -e "Criando a pasta /tmp para salvar o log da execução..."
        
        mkdir -v "/tmp/"
    fi
    
# ------------------------------------------------------------------------

echo "
Testando conexão com a internet...
"

if ! ping -c 1 www.google.com.br -q &> /dev/null; then

    echo -e "${RED}${CONERROR} ${NC}"
    sleep 10
    exit 1
    
    else
    
    echo -e "${GREEN}${CONSUCESS} ${NC}"
    sleep 2
    
fi

# ------------------------------------------------------------------------


echo -e "\n------------------------------------------------------------------------"

echo -e "${RED}${NOTA} ${NC}"

# echo -e "\e[1;34m${NOTA} \e[m"


# ------------------------------------------------------------------------

reiniciar(){


# Reinicia automaticamente após a atualização

echo -e "\n${GREEN} *** As atualizações foram realizadas com sucesso. Reiniciando o sistema. *** ${NC}\n"

sleep 3600

reboot


}

# ------------------------------------------------------------------------




# Funções para executar a atualização de varios tipos de distribuições Linux.

# ------------------------------------------------------------------------

# Void Linux


void(){

echo -e "\n------------------------------------------------------------------------"

echo -e "\n${YELLOW}${BEGIN_UPDATE} ${NC}\n"

sleep 1

# xbps-install -uy xbps | tee -a "$log" && xbps-install -Suvy  | tee -a "$log"

xbps-install -uy xbps && xbps-install -Suvy

if [ "$?" -eq "0" ];
then 

      echo -e "\n${GREEN}${END_UPDATE} ${NC}\n"


else 

     echo -e "\n${RED}${NO_UPDATE} ${NC}\n"


fi


echo -e "\n------------------------------------------------------------------------"

# Realiza a limpeza do sistema

echo "
Faxina (Void Linux)
"
echo -e "\n${YELLOW}${BEGIN_CLEAN} ${NC}\n"

sleep 1

# xbps-remove -Ooy | tee -a "$log" ; vkpurge rm all | tee -a "$log"

xbps-remove -Ooy  ; vkpurge rm all 


if [ "$?" -eq "0" ];
then 

      echo -e "\n${GREEN}${END_CLEAN} ${NC}\n"


else 

     echo -e "\n${RED}${NO_CLEAN} ${NC}\n"


fi


}

# ------------------------------------------------------------------------

# RHEL (Red Hat Enterprise Linux)


RHEL(){

echo -e "\n------------------------------------------------------------------------"

echo "
Atualizando o sistema...
"
echo -e "\n${YELLOW}${BEGIN_UPDATE} ${NC}\n"

sleep 1

yum check-update  && yum upgrade -y && yum upgrade --security 


if [ "$?" -eq "0" ];
then 

      echo -e "\n${GREEN}${END_UPDATE} ${NC}\n"


else 

     echo -e "\n${RED}${NO_UPDATE} ${NC}\n"


fi

echo -e "\n------------------------------------------------------------------------"

# Realiza a limpeza do sistema

echo "
Faxina RHEL (Red Hat Enterprise Linux)
"

echo -e "\n${YELLOW}${BEGIN_CLEAN} ${NC}\n"

sleep 1

yum clean all


if [ "$?" -eq "0" ];
then 

      echo -e "\n${GREEN}${END_CLEAN} ${NC}\n"


else 

     echo -e "\n${RED}${NO_CLEAN} ${NC}\n"


fi

    
}

# ------------------------------------------------------------------------


# Tipos de distribuições Linux

void

# RHEL


# ------------------------------------------------------------------------

# Verificar se o programa freshclam esta instalado


# Faço o redirecionamento da saída padrão e do erro padrão para /dev/null. O objetivo 
# é não mostrar nenhum tipo de mensagem.


echo -e "\n------------------------------------------------------------------------"


which freshclam 1> /dev/null 2> /dev/null

if [ "$?" -eq "0" ];
then

     
echo -e "\n${RED}Atualizando a base de dado do Clamav...${NC}\n"


echo "

" >> "$log"


freshclam   

if [ "$?" -eq "0" ];
then 

      echo -e "\n${GREEN}${UPDATE_CLAMAV} ${NC}\n"


else 

      echo -e "\n${RED}${UPDATE_NO_CLAMAV} ${NC}\n"


fi


   
     
else 

     echo -e "\nfreshclam não esta instalado..."


fi


echo -e "\n------------------------------------------------------------------------\n"



# ------------------------------------------------------------------------

 
echo -e "\nMas informações no arquivo de log: $log\n"

cat /tmp/update_*.log

sleep 20


# reiniciar

# ------------------------------------------------------------------------



# ~/.local/share/applications/Void Linux/voidupdate.desktop

# crontab -e



# Alias do Root
#
# alias atualizar="/usr/local/bin/atualiza.sh"
#
#
# Usando o alias pelo Root o notify-send mostra o aviso  => A conexão está fechada (solução foi colocar um "sudo -u fernando DISPLAY=:0.0" antes do comando notify-send)



# Alias do usuário comum
#
# alias atualizar="su -c '/usr/local/bin/atualiza.sh '"



# xfce4-terminal --maximize --title="Informe a senha do usuário Root abaixo..." -e 'su -c "/usr/local/bin/atualiza.sh "'



# $ atualiza.sh
# fernando is not in the sudoers file.


# Arquivo ~/.local/share/applications/Gerenciador de configurações do XFCE/Atualizar sistema - Void Linux.desktop


# Arquivo ~/.config/openbox/menu.xml


# Arquivo ~/.config/openbox/rc.xml


# Arquivo ~/.config/i3/config


# Arquivo /usr/local/bin/xmenu.sh


# 	Atualizar sistema	yad --notification    --image="appointment-soon"    --text "Clique para atualizar o sistema" --command='xfce4-terminal  -e --command='su -c "/usr/local/bin/atualiza.sh "''
#
#
#	Atualizar sistema - Void Linux		xfce4-terminal --maximize --title="Informe a senha do usuário Root abaixo..." -e 'su -c "/usr/local/bin/atualiza.sh "'





# Arquivo ~/.fluxbox/keys
#
#
# ~/.fluxbox/menu
#
# Menu para os Scripts no Fluxbox
#
# ~/.fluxbox/Scriptsmenu
#
#       [exec] (Atualizar sistema)                       {xfce4-terminal --maximize --title="Atualizar sistema..." -e "su -c '/usr/local/bin/atualiza.sh'"} <>




# Pasta /opt/painel/ com arquivo .desktop



# Atalho de teclado no xfce4
#
# ~/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml



# Filtra por "xbps-install" dentro dos arquivos em / e colocar /usr/local/bin/atualiza.sh no lugar.




# sudo -u fernando DISPLAY=:0.0 notify-send -t 100000 -i /usr/share/icons/gnome/48x48/status/software-update-available.png  'Atenção!' "\n\nVocê tem pacotes para ser atualizados: \n\n\nTestando o script #de atualização de sistema 
#/usr/local/bin/atualiza.sh:


# * Atalho do teclado no Xfce => xfce4-keyboard-settings

# * $HOME/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml


# * $HOME/.local/share/applications/Void Linux/voidupdate.desktop

# * $HOME/.local/share/applications/Gerenciador de configurações do XFCE/Atualizar sistema - Void Linux.desktop

# * $HOME/.config/openbox/menu.xml

# * $HOME/.config/openbox/rc.xml

# * $HOME/.config/i3/config

# * /usr/local/bin/xmenu.sh

# * $HOME/.fluxbox/keys

# * $HOME/.fluxbox/menu

# * $HOME/.fluxbox/Scriptsmenu

# * Pasta /opt/painel/ com arquivo .desktop


# * # crontab -e

# * Alias do Root e do usuário comum  => ~/.bashrc


exit 0

