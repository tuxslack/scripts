#!/bin/bash
#
# Autor:           Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:            04/12/2018
# Atualização em:  https://github.com/tuxslack/scripts   | https://notabug.org/
# Script:          atualiza.sh
# Versão:          0.2
# Realiza atualização do seu sistema.
#
# Data da atualização:  20/10/2023 as 19:10
#
# Licença:  GPL - https://www.gnu.org/
# 
#
#
# Para debug o script (#!/bin/bash -x)
#
# Muitas vezes configuramos um shell script (bash) e gostaríamos de saber O QUE está 
# sendo feito linha-a-linha, ou então ONDE existe um erro que force o script a 
# interromper a sequência. 
#
#
# Como usar:
#
# mv atualiza.sh /usr/local/bin/
#
# chmod +x /usr/local/bin/atualiza.sh
#
# $ atualiza.sh 
#
#
# Para verificar o md5sum do arquivo atualiza.sh
#
# $ md5sum atualiza.sh
#
#
#
# Caso:
#
# Na empresa que trabalho temos uma boa quantidade de máquinas com o s.o. ubuntu 18.04, temos bastante problemas de 
# mantê-las atualizadas por ter que acessar uma a uma, então gostaria de saber se alguém conhece alguma forma seja 
# por aplicação ou até mesmo script, para automatizar o processo, desconheço se no mundo do pinguim existe uma 
# alternativa ao wsus da microsoft, poderiam me ajudar?
#
#
# Com apenas dois comandos, o problema é resolvido....
#
# sudo apt update;
# sudo apt upgrade;
#
# Leitura recomendada:
#
# https://www.debian.org/doc/manuals/apt-howto/ch-apt-get.pt-br.html
#
# Utilize o "agendador de Tarefas", procure por "crontab" aqui no vivaolinux....
#
#
#
#
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
#
# Conclusão:
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
# Para mais dicas: https://www.youtube.com/@fernandosuporte/


# A legibilidade sempre deve ser priorizada. O código deverá ser fácil de entender, e 
# ser mantido. - Princípio KISS (Keep It Simple).




# Melhor é criar um repositório local, assim vc controla as atualizações. 
#
#
# https://www.vivaolinux.com.br/topico/Servidores-Linux-para-iniciantes/Gestor-de-atualizacoes
#
# https://www.vivaolinux.com.br/dica/Acompanhando-o-(bash)-shell-script-debug
# https://www.vivaolinux.com.br/dica/Configuracoes-de-rede-com-o-comando-ip
# https://www.vivaolinux.com.br/topico/Slackware/Atualizacao-do-Slackware-1
# https://www.vivaolinux.com.br/script/Metodo-para-verificar-e-instalar-pacotes
# https://www.vivaolinux.com.br/topico/Shell-Script/Verificar-se-um-programa-esta-instalado
# https://www.vivaolinux.com.br/script/Verifica-se-quem-executa-e-root
# https://elias.praciano.com/2014/04/como-fazer-faxina-no-ubuntu-linux/
# https://pplware.sapo.pt/linux/4-dicas-para-dar-uma-limpeza-no-seu-linux-ubuntu/
# https://sempreupdate.com.br/bons-habitos-que-todo-usuario-linux-deve-conhecer/
# https://sejalivre.org/fazendo-uma-limpeza-completa-no-seu-ubuntu-em-modo-texto-e-grafico/
# https://www.edivaldobrito.com.br/alternativas-ao-ccleaner-no-linux/
# http://dclarks.blogspot.com/2012/02/limpar-os-arquivos-de-varlog.html
# https://lists.debian.org/debian-user-portuguese/2007/12/msg00409.html
# https://nooblinuxnodes.blogspot.com/2017/07/limpeza-do-ubuntu-dica.html
# https://www.vivaolinux.com.br/dica/Sabayon-Linux-Entropy-sem-espaco-temporario-para-atualizar-Resolvido


# ----------------------------------------------------------------------------------------

# Variaveis globais:


# Arquivo de log (obte a data atual para criação do nome do arquivo de log)

log="/tmp/update_$(date +%d-%m-%Y).log"

rm -Rf /tmp/update_*.log


# Nome do usuário que verá à notificação no desktop

usuario="fernando"



# Titulos das janelas do Dialog, Yad e do Zenity

titulo="Atualizar o sistema"



# ----------------------------------------------------------------------------------------

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


# ----------------------------------------------------------------------------------------

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


# ----------------------------------------------------------------------------------------



# Criar algo global para atualizar o sistema:


# export DISPLAY=:0.0



# ----------------------------------------------------------------------------------------

clear


echo "
Por mais segurança que o Linux tenha, é sempre necessário estar atento às atualizações recorrentes.

Mantenha seu sistema sempre atualizado com as atualizações de segurança mais recentes. 

Antes de atualizar o sistema, é recomendável que você sempre faça um backup completo de seus dados.

Atualizações sempre contêm seus perigos. Faça sempre backup. Por sua conta e risco!!

"

sleep 5



# ----------------------------------------------------------------------------------------



# Verificar se usuário com o qual eu estou executando é o Root.

# Verifica se quem executa é o Root

# Verificar se o usuário tem permissoes de SU



verificar_root(){


# ----------------------------------------------------------------------------------------


if [ "$(id -u)" != "0" ]; then

        echo -e "${RED}\nVocê deve executar este script como Root! \n ${NC}"
        
exit 

else

        echo -e "\n${GREEN}Verificação de Root [OK] ${NC}\n"

fi



# ----------------------------------------------------------------------------------------

# if [ "`whoami`" != "root" ]
# then
#    echo "Logue como root utilizando o comando: su"

#    exit
# fi


# ----------------------------------------------------------------------------------------


# if [ $USER != root ]; then

# echo "Você precisa ser logar como ROOT para executar este script!."

# exit

# else

# echo "Você é root!"

# fi

# ----------------------------------------------------------------------------------------



}



# Chama a função verificar_root

verificar_root






# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados

clear


# Verifique se tem o Yad instalado no sistema. 

which yad           2> /dev/null || { echo "Programa Yad não esta instalado."      ; exit ; }


# Verifique se tem o Zenity instalado no sistema. 

which zenity        2> /dev/null || { echo "Programa Zenity não esta instalado."   ; exit ; }



# Verifique se tem o dialog instalado no sistema. 

which dialog        2> /dev/null || { echo "Programa dialog não esta instalado."   ; exit ; }



# ----------------------------------------------------------------------------------------


# Mata o processo deste script caso ele já estiver rodando em segundo plano.

echo killall -9  $(basename "$0")


# ----------------------------------------------------------------------------------------

# Para verificar se o diretório /tmp/ existe e criá-lo, se necessário.

    if [ -d "/tmp/" ]; then
    
        echo -e "${RED}${MSG_MKDIR} ${NC}"
        
    else
    
        echo -e "Criando a pasta /tmp para salvar o log da execução..."
        
        mkdir -v "/tmp/"
    fi


# ----------------------------------------------------------------------------------------


# Função chamada caso o usuário não tenha acesso à internet.


aviso() {

clear

dialog                                         \
--backtitle "$titulo"        \
--title 'Sua conexão não esta ativa'           \
--msgbox '



Verifique o servidor DNS (DNS primário e DNS alternativo):

cat /etc/resolv.conf


Configuração de rede:

ifconfig -a

ip link show 


Interface de configuração de rede: networkmanager, wicd e kppp


# Debian

cat  /etc/network/interfaces


# Slackware

cat /etc/rc.d/rc.inet1.conf


Os dados de IP fixo, Máscara, Gateway

https://sempreupdate.com.br/como-configurar-ip-fixo-no-ubuntu/



Verifique ser o serviço de rede esta ativo.

# Para reiniciar toda a rede no Slackware, digite:
#
# /etc/rc.d/rc.inet1 restart


Cliente DHCP

sudo dhclient eth0


Modem 3G:

wvdialconf

cat /etc/wvdial.conf


KPPP


Cabo de rede.
Configurações do modem.


Placas Wi-Fi: 

iwconfig

Verifica a falta de firmware


nslookup www.google.com

route -n 


Wavemon para verificar a intensidade do sinal Wifi no Linux

wavemon


Habilitar wi-fi

1º - O led indicativo de wifi do notebook está ligado?

2º - Será que a sua distro tem o driver para placa?


Se o LED está apagado, você deve usar as teclas do teclado para acionar o Wi-fi.

Geralmente é Fn + F(número).


Verifica o firewall:

# iptables -L

# iptables -t nat -L

'  \
   35 100


clear

}


# https://www.vivaolinux.com.br/topico/Rede-Wireless/Nao-me-ligo-ao-wifi
# https://www.vivaolinux.com.br/dica/Configuracoes-de-rede-com-o-comando-ip

    
# ----------------------------------------------------------------------------------------

clear


#  Verifica se o usuário tem acesso à internet.

echo "
Testando se a conexão com a internet está ativa...
"


# O site do Google, tem bem menos chance de estar fora do ar.


if ! ping -c 1 www.google.com.br -q &> /dev/null; then

              # Internet está PARADA !!!

              echo -e "${RED}${CONERROR} ${NC}"
              
              # aviso
              
              sleep 10
              exit 1
    
    else
             # Conexao ativa...
             
             echo -e "${GREEN}${CONSUCESS} ${NC}"
             
             sleep 2
    
fi


# https://www.vivaolinux.com.br/script/Testar-conexao-com-a-internet


# ----------------------------------------------------------------------------------------


echo -e "\n------------------------------------------------------------------------"

echo -e "${RED}${NOTA} ${NC}"

# echo -e "\e[1;34m${NOTA} \e[m"


# ----------------------------------------------------------------------------------------


reiniciar(){


# Reinicia automaticamente após a atualização

echo -e "\n${GREEN} *** As atualizações foram realizadas com sucesso. Reiniciando o sistema. *** ${NC}\n"

sleep 3600

reboot


}

# ----------------------------------------------------------------------------------------



# Atualizar antivirus (Clamav) - freshclam / clamav-unofficial-sigs.sh


clamav_update(){


# ========================================================================================

# Método antigo via cron



# Agenda atualização automática da base de dados do Clamav por intermédio do Cron a cada 4 horas todo os dias com o usuário Root.


# 0 */4 * * * /usr/bin/echo -e "Update do ClamAV...\n" && /usr/bin/freshclam


# https://www.vivaolinux.com.br/dica/Instalacao-e-integracao-do-CLAMAV-com-o-SAMBA


# ========================================================================================





# Verificar se o programa freshclam esta instalado


# Faço o redirecionamento da saída padrão e do erro padrão para /dev/null. O objetivo 
# é não mostrar nenhum tipo de mensagem.


echo -e "\n------------------------------------------------------------------------"





which freshclam 1> /dev/null 2> /dev/null

if [ "$?" -eq "0" ];
then


killall -9 freshclam   1> /dev/null 2> /dev/null

     
echo -e "\n${RED}Atualizando a base de dado do Clamav...${NC}\n"


echo "
Atualizando a base de dado do Clamav...

" >> "$log"



freshclam   | tee -a "$log"

if [ "$?" -eq "0" ];
then 

      echo -e "\n${GREEN}${UPDATE_CLAMAV} ${NC}\n"


else 

      echo -e "\n${RED}${UPDATE_NO_CLAMAV} ${NC}\n"


fi


   
     
else 

     echo -e "\nfreshclam não esta instalado..." | tee -a "$log"


fi



# killall -9 clamav-unofficial-sigs.sh   1> /dev/null 2> /dev/null
#
# clamav-unofficial-sigs.sh | tee -a "$log"





echo -e "\n------------------------------------------------------------------------\n"


}




# ----------------------------------------------------------------------------------------


# Para atualizar os relatórios do Sarg do Servidor Proxy (Squid).


Sarg_update(){

# Para atualizar os relatórios do Sarg


# No Void Linux verificar os programas nos repositórios:

#  xbps-query -Rs squid
# [-] squid-5.7_3 Caching proxy for the Web
# 
#  xbps-query -Rs sarg
#
#  xbps-query -Rs webmin


clear

# Lembre que precisa do Squid instalado na maquina onde vai rodar o Sarg, pode não estar 
# rodando nem configurado, mesmo quando vai copiar os logs de outra maquina para gerar 
# relatórios, de qualquer forma precisa do Squid instalado antes de iniciar a instalação 
# do Sarg.


which squid  1> /dev/null 2> /dev/null

if [ $? == 0 ]; then



which sarg  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear


# Depois de instalar o Sarg, precisa editar seu arquivo de configuração para gerar 
# relatórios conforme suas necessidades.


# Verificar se o arquivo existe

# /etc/sarg.conf
# /usr/local/sarg/sarg.conf

if [ -e "/etc/sarg/sarg.conf" ] ; then

clear

echo "
O arquivo /etc/sarg/sarg.conf existe.
"


# Sarg é um utilitario gerador de relatórios sobre os arquivos de log do Squid, gera os 
# relatorios em HTML e qualquer estação da rede ou mesmo via web tem acesso aos relatorios 
# em um servidor web, são relatórios e gráficos ricos em detalhes.


echo "
Atualizando os relatórios do SARG (Squid Analysis Report Generator)...
" | tee -a "$log"


# O sarg não atualiza sozinho. Você tem que emitir o comando sarg no Linux e assim ele 
# atualiza os relatórios.
#
# Se você quiser pode utilizar o cron para agendar o sarg para rodar uma vez por dia.
#
# Por exemplo: todos os dias as 18:00.


# ========================================================================================

# Limpar o cache do Squid
# 
# echo "
# Limpando o Cache do Squid...
# " | tee -a "$log"
# 
# Primeiramente precisamos verificar onde está localizado o seu cache, através da 
# varíavel cache_dir
# 
# 
# egrep cache_dir /etc/squid/squid.conf 2>> "$log"
# 
# cache_dir ufs /var/spool/squid 3500 16 256
# 
# No nosso caso o cache fica no diretório /var/spool/squid
# 
#
# ou
#
#
# egrep cache_dir /etc/squid3/squid.conf 2>> "$log"
#
#
# 
# Vamos parar o serviço do Squid (Debian e derivados)
# 
# service squid stop
# 
#
# Removendo os arquivos do diretório de cache
#  
# Renomeie o diretório do Squid (aqui está o segredo, se você apagar esse diretório e 
# depois recriar, ele vai demorar para apagar e sua Internet vai ficar mais tempo 
# sem funcionar). => mv /var/spool/squid /var/spool/squid.del
#
# rm -rf /var/spool/squid/*  2>> "$log"
# 
#
#
# Reconstruindo o cache
# 
# squid -z  2>> "$log"
# 
# ou
#
# squid3 -z 2>> "$log"
#
#
# Reiniciando o serviço do Squid (Debian e derivados)
# 
# service squid start


# https://ebasso.net/wiki/index.php?title=Squid:Limpando_o_Cache_do_Squid
# https://www.vivaolinux.com.br/dica/Squid-Limpando-cache-rapidamente


# ========================================================================================


# Onde fica o log do Sarg, da um grep -ri sarg * /var/log




# Gerando os relatórios.

sarg -f /etc/sarg/sarg.conf  

# 2>> "$log"

# -x Mensagens do processo
# -z Mensagens de debug

if [ $? == 0 ]; then

clear

echo "
Prontinho, relatorios gerados, para acessar a partir do navegador da propria maquina ou 
qualquer estação estação da rede, coloque na URL o IP//squid-reports/, por exemplo: 

https://192.168.0.1/squid-reports/


Onde o IP 192.168.0.1 é o IP da maquina onde gerou os relatorios, precisa também do 
servidor web (Apache) rodando.

Considere o uso de senhas para acessar estes relatorios.

"

sleep 3m


else

# Para  mensagem de erro ao gera os relatorios do SARG (Squid Analysis Report Generator).

clear

echo "
Ocorreu um problema ao gera os relatórios do SARG (Squid Analysis Report Generator) 
verifique os arquivos de log do sistema. 

" | tee -a "$log"


fi






else

clear

echo "
O arquivo /etc/sarg/sarg.conf não existe.
" | tee -a "$log"



fi



fi



fi



# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Atualizacao-Sarg
# https://forum.netgate.com/topic/60016/resolvido-problema-ap%C3%B3s-atualizar-o-sarg/3
# https://www.forumitbr.com.br/viewtopic.php?t=1455
# http://www.zago.eti.br/squid/sarg.html
# https://under-linux.org/showthread.php?t=106932
# https://forum.adrenaline.com.br/threads/sarg-nao-atualiza-relatorios.213705/
# https://sempreupdate.com.br/como-configurar-e-instalar-o-gerador-de-relatorios-do-squid-no-linux/
# https://www.hardware.com.br/comunidade/v-t/778217


}



# ----------------------------------------------------------------------------------------


# Lynis

lynis_update(){


clear

echo "
Auditoria de sistemas com Lynis

" | tee -a "$log"


sleep 1





killall -9 lynis   1> /dev/null 2> /dev/null


echo "
Atualizar a ferramenta de Auditoria - lynis (lynis --check-update  e lynis update info).
"  | tee -a "$log"




# Problema no Void Linux:
#
# /usr/bin/lynis: line 612: [: -lt: unary operator expected


lynis update check | tee -a "$log"

lynis update info  | tee -a "$log"



# lynis -c | tee -a "$log"


}


# ----------------------------------------------------------------------------------------



rkhunter_update(){


clear

echo "
Checando se há rootkits em seu sistema...
" | tee -a "$log"

sleep 2


# chkrootkit




killall -9 rkhunter 1> /dev/null 2> /dev/null


echo "
Rootkits
" | tee -a "$log"

echo "
Atualiza a base com as propriedades dos arquivos (rkhunter --propupd).
" | tee -a "$log"

rkhunter --propupd | tee -a "$log"


echo "
Atualiza a base do rkhunter (rkhunter --update).
" | tee -a "$log"

rkhunter --update | tee -a "$log"



# rkhunter -c        | tee -a "$log"

# rkhunter -c --rwo  | tee -a "$log"



echo "
Arquivo de log do rkhunter (/var/log/rkhunter.log).
" | tee -a "$log"

cat /var/log/rkhunter.log | tee -a "$log"


# https://www.vivaolinux.com.br/artigo/Procurando-rootkits-no-seu-sistema


}



# https://www.vivaolinux.com.br/artigo/Mantendo-a-seguranca-no-Linux
# https://www.linuxdescomplicado.com.br/2017/02/por-que-usuarios-linux-devem-se-preocupar-com-riscos-em-seguranca-e-o-que-pode-ser-feito-para-se-proteger.html
# https://e-tinet.com/linux/servidor-linux-dicas-seguranca/
# https://www.vivaolinux.com.br/artigo/Procurando-rootkits-no-seu-sistema
# http://ricardoolonca.blogspot.com/2013/10/auditoria-de-sistemas-com-lynis.html



# ----------------------------------------------------------------------------------------


updatedb_update(){


# updatedb
#
# Ao ser invocado, este utilitário varre todo o sistema gerando uma listagem completa que por sua vez é copiada para o banco de dados.
#
# O modo como o comando updatedb atualiza o banco de dados é regulado pelo arquivo de configuração /etc/updatedb.conf
#
# Como o banco de dados é uma imagem da situação do sistema em um determinado momento, pode ocorrer que este banco de dados esteja 
# desatualizado quando consultado. Por esta razão, a frequencia de atualização irá depender das necessidades de uso do 
# utilitário. Dependendo do tamanho de seu sistema, você pode agendar, via cron, a execução do updatedb a cada hora, a cada dez 
# minutos, enfim, com a frequencia que for mais conveniente.
#
# No exemplo abaixo de crontab, o comando updatedb será executado a cada hora cheia.
#
  # m h dom mon dow usercommand
#   0 * * * * root  updatedb
  
 

echo "
updatedb
" | tee -a "$log"


updatedb | tee -a "$log" 


  
# http://www.dicas-l.com.br/arquivo/o_comando_locate_listagem_de_arquivos_do_sistema.php

}




# ----------------------------------------------------------------------------------------


# Atualizar as fontes do sistema nas pastas: /usr/share/fonts/TTF/ e ~/fonts


fontes_update(){

echo "
Atualizar as fontes do sistema (.ttf, etc)
" | tee -a "$log"

sleep 2


fc-cache -f -v | tee -a "$log"

}


# ----------------------------------------------------------------------------------------





# Funções para executar a atualização de varios tipos de distribuições Linux.

# ----------------------------------------------------------------------------------------

# Void Linux


void(){



# ========================================================================================

# Roda a cada 10 min no cron. => */10 * * * * /usr/local/bin/atualiza.sh


# Notificação sobre atualização de pacotes a cada 10 min.  (método antigo via cron)

# */10 * * * * /usr/bin/xbps-install -S && /usr/bin/xbps-install -Sun | tee  /tmp/update.txt  && [ -s  /tmp/update.txt ] &&  sudo -u fernando DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/gnome/48x48/status/software-update-available.png  'Atenção!' "\n\nVocê tem pacotes para ser atualizados: \n\n\n$(cat /tmp/update.txt) \n\n " && rm -Rf /tmp/update.txt  || rm -Rf /tmp/update.txt




# Notificação sobre atualização de pacotes



/usr/bin/xbps-install -nuM 1> /tmp/update.txt 2>/tmp/error

updates="$(wc -l < /tmp/update.txt)"


if [ "$updates" -gt 1 ]; then
	
		echo -e "ATUALIZAÇÕES DISPONÍVEIS: $updates  \n\n$(awk '{print $1" ---> "$2}' /tmp/update.txt)"

		
# $(cat /tmp/update.txt)

sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/gnome/48x48/status/software-update-available.png  'Atenção!' "\n\nVocê tem $updates pacotes para ser atualizados: \n\n\n$(awk '{print $1" ---> "$2}' /tmp/update.txt) \n\n " && rm -Rf /tmp/update.txt  || rm -Rf /tmp/update.txt


		
else
       sleep 1
       
       clear
        
       echo -e "\n${GREEN}O Void Linux está com as atualizações em dias.... ${NC}\n" 
       
       exit
		
fi

# ========================================================================================




# Como atualizar e limpar o cache de pacotes no Void Linux?


# Para atualizar o seu sistema por completo e remover os pacotes obsoletos do cache, execute os comandos abaixo:



echo -e "\n------------------------------------------------------------------------"

echo -e "\n${YELLOW}${BEGIN_UPDATE} ${NC}\n"

sleep 1

echo "
Atualizando o sistema...
" >> "$log"

      echo -e "\n${GREEN}Atualizando o Void Linux.... ${NC}\n" 
       
# xbps-install -uy xbps | tee -a "$log" && xbps-install -Suvy  | tee -a "$log"


xbps-install -uy xbps && xbps-install -Suvy | tee -a "$log"


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
" | tee -a "$log"

echo -e "\n${YELLOW}${BEGIN_CLEAN} ${NC}\n"

sleep 1


# xbps-remove -Ooy | tee -a "$log" ; vkpurge rm all | tee -a "$log"

xbps-remove -Ooy  ; vkpurge rm all | tee -a "$log"


if [ "$?" -eq "0" ];
then 

      echo -e "\n${GREEN}${END_CLEAN} ${NC}\n"


else 

     echo -e "\n${RED}${NO_CLEAN} ${NC}\n"


fi


# https://edpsblog.wordpress.com/2016/09/10/dica-atualizacao-de-pacotes-no-void-linux/


}




# ----------------------------------------------------------------------------------------

# RHEL (Red Hat Enterprise Linux)


RHEL(){

echo -e "\n------------------------------------------------------------------------"


echo -e "\n${YELLOW}${BEGIN_UPDATE} ${NC}\n"

sleep 1


echo "
Atualizando o sistema...
" >> "$log"


yum check-update  && yum upgrade -y && yum upgrade --security | tee -a "$log"


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
" | tee -a "$log"

echo -e "\n${YELLOW}${BEGIN_CLEAN} ${NC}\n"

sleep 1

yum clean all | tee -a "$log"


if [ "$?" -eq "0" ];
then 

      echo -e "\n${GREEN}${END_CLEAN} ${NC}\n"


else 

     echo -e "\n${RED}${NO_CLEAN} ${NC}\n"


fi

    
}




# ----------------------------------------------------------------------------------------

# Distribuições Linux de base Debian


debian(){


# Como consertar um Debian quebrado sem reinstalá-lo
#
#
# Se seu sistema desligou no meio de atualização e não consegue passar da tela de login, 
# veja como consertar um Debian quebrado sem reinstalá-lo.
# 
# Imagine a seguinte situação: você atualizou seu sistema Debian, e infelizmente, a energia 
# se foi no meio do caminho e o PC foi desligado durante a atualização do sistema operacional.
#
# Quando a energia voltou, você inicializou o sistema novamente. Logo após inserir a senha na tela de login, ela ficou em branco e não respondeu.
# Nesse ponto, o teclado e o mouse também não funcionaram. Tudo que você vê é apenas uma tela em branco!
# Você pode simplesmente limpar todo o sistema operacional e instalá-lo novamente. Mas e se você não quer fazer isso?
# Desde que você não tenha nada a perder, você só queria reparar o meu sistema Debian quebrado sem reinstalá-lo!
# Se você se encontrar em uma situação como essa, não entre em pânico.
#
# Como esse é um procedimento drástico, faça-o por sua própria conta e risco!.
#
# Primeiro de tudo, tente fazer o login com o live cd e fazer o backup de seus dados em uma unidade externa.
#
# Assim, se esse método não funcionar, você ainda poderá ter seus dados e poderá reinstalar tudo!
#
#
# Passo 1. Inicie o sistema normalmente, e na tela de login, pressione CTRL + ALT + F1 para alternar para tty1. Na tela de terminal, 
# entre com seu usuário e senha e faça login;
#
# Passo 2. Em seguida, digite os seguintes comandos, um por um, para corrigir o sistema Debian corrompido;
#


# ----------------------------------------------------------------------------------------

# Verifique se está usando familia Debian. 

debian=`which apt`

if [ -e "$debian" ]
then
	echo "apt localizado ..."
else
	zenity --error --text="Não foi possível encontrar o apt no local definido.

" --width="800" --height="100"   2>/dev/null

	exit
fi

# ----------------------------------------------------------------------------------------


killall -9 apt      1> /dev/null 2> /dev/null
killall -9 apt-get  1> /dev/null 2> /dev/null

# ----------------------------------------------------------------------------------------


# Verificar se os arquivos existem


if [ -e /var/lib/apt/lists/lock ]
then
  echo 'O arquivo /var/lib/apt/lists/lock existe.'

  rm -Rf /var/lib/apt/lists/lock        | tee -a "$log"

else

  echo 'O arquivo /var/lib/apt/lists/lock não existe.'

fi


if [ -e /var/lib/dpkg/lock ]
then
  echo 'O arquivo /var/lib/dpkg/lock existe.'

  rm -Rf /var/lib/dpkg/lock             | tee -a "$log"

else

  echo 'O arquivo /var/lib/dpkg/lock não existe.'

fi



if [ -e  /var/lib/dpkg/lock-frontend ]
then

  echo 'O arquivo /var/lib/dpkg/lock-frontend existe.'

  rm -Rf /var/lib/dpkg/lock-frontend    | tee -a "$log"

else

  echo 'O arquivo /var/lib/dpkg/lock-frontend não existe.'

fi


# https://www.edivaldobrito.com.br/consertar-um-ubuntu-quebrado/


# ----------------------------------------------------------------------------------------

# Atualiza a lista de pacotes, instala e limpa os resíduos

# https://www.vivaolinux.com.br/topico/Duvidas-em-Geral/como-atualizar-o-ubuntu-pelo-terminal
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Problemas-ao-atualizar-pacotes


echo '

# Um dos grandes problemas de qualquer sistema é o usuário. Quando você fica adicionando repositórios no 
# seu sistema ele poderá dar problema ou até mesmo "quebrar" seu gerenciador de pacotes. 

# Tente desabilitar os repositórios que possivelmente tenha colocado; 

Exemplo:

W: Falhou ao buscar http://repository.spotify.com/dists/stable/InRelease As assinaturas a seguir não puderam ser verificadas devido à chave pública não estar disponível: NO_PUBKEY 4773BD5E130D1D45
W: Falhou o download de alguns ficheiros de índice. Foram ignorados ou os antigos foram usados em seu lugar.


# Tente fazer uma limpeza aí

'

# ----------------------------------------------------------------------------------------


# Realiza uma limpeza geral no sistema

# Faxina


echo "
Limpeza...
" | tee -a "$log"

du -sh /var/cache/apt/archives  | tee -a "$log"

rm -Rf /var/cache/apt/archives/*.deb       2>> "$log"
rm -Rf /var/cache/apt/archives/partial/*   2>> "$log"
rm -Rf /var/cache/apt/archives/lock        2>> "$log"


rm -Rf /var/lib/apt/lists/*                2>> "$log"

mkdir -p /var/lib/apt/lists/partial



# Remove pacotes órfãos que não são mais necessários para o sistema.

echo "
Se esse comando for remover algo veja se não vai desinstalar coisas importantes (apt autoremove)
"
sleep 3

apt autoremove -y | tee -a "$log"

# apt-get autoremove --purge -y | tee -a "$log"



# 0 pacotes atualizados, 0 pacotes novos instalados, 0 a serem removidos e 160 não atualizados.

apt install -f   | tee -a "$log"


dpkg --configure -a  | tee -a "$log"



# Limpa os pacotes e instala o script em /var/cache/apt/archives/

apt clean -y | tee -a "$log"


# Limpa pacotes .deb obsoletos, menos de clean

apt autoclean -y | tee -a "$log"


# https://www.youtube.com/watch?v=TIQvYmskOfk


# ----------------------------------------------------------------------------------------

# Deborphan

# Para eliminar bibliotecas Orfãs:

# deborphan | xargs sudo apt -y remove --purge

# apt remove $(deborphan)

# deborphan | xargs sudo apt -y remove --purge


# Debian: A OPÇÃO --PURGE
#
# A opção --purge indica que queremos remover, não somente o pacote em questão, mas 
# também todos os seus arquivos de configuração.
#
# Se o objetivo é manter o seu sistema sempre limpo e livre de coisas inúteis, usar a 
# opção --purge, ao remover um pacote que não será mais usado, sob hipótese alguma, 
# é mandatório.

# ----------------------------------------------------------------------------------------



echo "
Atualizando a lista de pacotes:
" | tee -a "$log"


# W: Falhou ao buscar http://repository.spotify.com/dists/stable/InRelease As assinaturas a seguir não puderam ser verificadas devido à 
# chave pública não estar disponível: NO_PUBKEY 4773BD5E130D1D45
# W: Falhou o download de alguns ficheiros de índice. Foram ignorados ou os antigos foram usados em seu lugar.


echo "apt update

É usado para baixar as informações do pacote de todas as fontes configuradas . Para posteriormente trabalhar 
nesses pacotes, atualizações ou pesquisar e exibir detalhes sobre todos os disponíveis para instalação.
" | tee -a "$log"

apt update | tee -a "$log"


#
# Quero instalar algumas ferramentas, dai usei o apt-get update quando usei o apt-get upgrade tive como saída:
#
# root@kali:# apt-get update
# Reading package lists... Done
# Reading dependency tree
# Reading state information... Done
# you might want to run 'apt-get -f install' to correct these
# the following packages have unmaet dependencies:
# libc-dev-bin: Depends: libc6 (>2.28) but 2.23-4 is installed
# libc6-dev: Depends: libc-dev-bin )=2.23-4) but 2.28-10 is installed
# E: Unmet dependencies. Try using -f
#
#
# https://www.vivaolinux.com.br/topico/Kali-Linux/apt-get-upgrade-nao-funciona-no-Kali-Linux-como-resolver




# sudo apt update --fix-missing | tee -a "$log"


apt install -f  | tee -a "$log"


dpkg --configure -a  | tee -a "$log"



clear

echo "apt upgrade

É usado para instalar atualizações disponíveis de todos os pacotes instalados atualmente no sistema das 
fontes configurados via sources.list. Novos pacotes serão instalados se for necessário para satisfazer 
dependências , mas os pacotes existentes não serão removidos. E se um upgrade para um pacote requer a 
remoção de um pacote instalado o upgrade para este pacote não será executado.


Lista atualizada

Instalando os novos pacotes:
" | tee -a "$log"

apt upgrade | tee -a "$log"


# apt-get upgrade
# Reading package lists... Done
# Building dependency tree
# Reading state information... Done
# Calculating upgrade... Done
# The following packages have been kept back:
# e2fsprogs iptables libext2fs2 libiptc0 libxtables12 openssh-client
# openssh-server openssh-sftp-server
# The following packages will be upgraded:
# gcc-8-base hostname libcryptsetup12 libcups2 libcupsimage2 libijs-0.35
# metasploit-framework sysvinit-utils
# 8 upgraded, 0 newly installed, 0 to remove and 8 not upgraded.
# Need to get 0 B/133 MB of archives.
# After this operation, 265 kB of additional disk space will be used.
# Do you want to continue? [Y/n] y
# E: Setting in Start via TCSAFLUSH for stdin failed! - tcsetattr (13: Permission denied)
# dpkg: error processing archive /var/cache/apt/archives/hostname_3.22_arm64.deb (--unpack):
# cannot open security status notification channel
# Errors were encountered while processing:
# /var/cache/apt/archives/hostname_3.22_arm64.deb
# E: Sub-process /usr/bin/dpkg returned an error code (1)
#
#
# https://www.vivaolinux.com.br/topico/Kali-Linux/apt-get-upgrade-nao-funciona-no-Kali-Linux-como-resolver




apt full-upgrade | tee -a "$log"

apt dist-upgrade | tee -a "$log"


apt install -f | tee -a "$log"

dpkg --configure -a | tee -a "$log"


echo "
Se esse comando for remover algo veja se não vai desinstalar coisas importantes (apt autoremove)
" | tee -a "$log"

apt autoremove | tee -a "$log"



# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)

# geral


# Realiza uma limpeza geral no sistema

# faxina




# ----------------------------------------------------------------------------------------

# Para quem usa o Debian (Ubuntu, Mint etc.), para ver a lista de todas as versões do 
# kernel instaladas no seu sistema.

dpkg --list | grep linux-image  | tee -a "$log"

dpkg -l 'linux-im*' | tee -a "$log"

# Mostra a mesma lista, só que mais enxuta:
 
dpkg-query -l | awk '/linux-image-*/ {print $2}' 2>> "$log"


# apt --purge remove linux-image-3.8.0-35-generic


# O código do Mark McBride, a seguir, remove todas as versões do kernel, exceto a atual 

# dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs  apt -y purge



# É importante atualizar o GRUB:

update-grub | tee -a "$log"

# ----------------------------------------------------------------------------------------



echo "
Pacotes atualizados.


Finalmente, reinicie o sistema usando o comando:

# reboot


Aviso: Esse método pode não funcionar para todos.


" | tee -a "$log"




# exit


# Fonte: man apt ou man apt-get


# sudo = Superuser
#
# Permite que um usuário autorizado execute um comando como super usuário ou outro usuário, conforme especificado 
# pela política de segurança. A identificação (uid) real do usuário invocado é usada para determinar o nome de 
# usuário o qual será consultado a política de segurança .

# Fonte: man sudo


# ----------------------------------------------------------------------------------------




}




# ----------------------------------------------------------------------------------------

# Gentoo




gentoo(){


# Atualização do sistema (Gentoo)
#
# Publicado por Giuliano C. Domingues 30/08/2006 
#
# Este simples script faz a atualização do seu sistema Gentoo.
#
#
# https://www.vivaolinux.com.br/script/Atualizacao-do-sistema-(Gentoo)



# ----------------------------------------------------------------------------------------

# Verifique se está usando gentoo. 

gentoo=`which emerge`

if [ -e "$gentoo" ]
then
	echo "emerge localizado ..."
else
	zenity --error --text="Não foi possível encontrar o emerge no local definido.

" --width="800" --height="100"   2>/dev/null

	exit
fi

# ----------------------------------------------------------------------------------------




echo -e "                                               \033[1;34m***************************************************************"
echo -e "                                               \033[1;34m**            \033[1;37mScript para Atualizacao de Sistema             \033[1;34m**"
echo -e "                                               \033[1;34m**                   \033[1;37m                   \033[1;34m**"
echo -e "                                               \033[1;34m**                \033[1;37mCoordenacao de Suporte e Rede              \033[1;34m**"
echo -e "                                               \033[1;34m**   \033[1;32mGiuliano Domingues - \033[1;31mgiuliano.domingues@esporte.gov.br  \033[1;34m**"
echo -e "                                               \033[1;34m***************************************************************"

echo -e "\033[1;35mVerificando Atualizacoes!"
echo -e "\033[1;31mAguarde . . ."
echo -e "\033[1;32m"

emerge sync | tee -a "$log"
 
echo -e "\033[1;35mAtualizando a Arvore do seu Sistema"

updatedb | tee -a "$log"
 
env-update | tee -a "$log"

echo -e "\033[1;31mEnjoy"
echo ""



# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)

# geral


# Realiza uma limpeza geral no sistema

# faxina


}

# ----------------------------------------------------------------------------------------






# Centos


centos(){



# https://www.vivaolinux.com.br/artigo/CentOS-7-Guia-pratico-pos-instalacao
# https://atendimento.redehost.com.br/hc/pt-br/articles/210101838-Atualizando-o-CentOS-sem-causar-Kernel-Panic
# https://access.redhat.com/documentation/pt-br/red_hat_network_satellite/5.4/html/reference_guide/pup-yum



# ----------------------------------------------------------------------------------------

# Verifique se está usando centos. 

centos=`which yum`

if [ -e "$centos" ]
then
	echo "yum localizado ..."
else
	zenity --error --text="Não foi possível encontrar o yum no local definido.

" --width="800" --height="100"   2>/dev/null

	exit
fi

# ----------------------------------------------------------------------------------------


clear

echo "
Verificar o idioma do sistema:
"
echo $LANG 


# Para editar o arquivo de configuração do gerenciador de pacotes Yum (Yellow dog Updater, Modified).

# nano /etc/yum.conf


# Verificar o repositório atual: 

# yum repolist  | tee -a "$log"


# CONFIGURANDO NTFS


# Configurando NTFS, caso necessário. Instale o repositório EPEL: 

# yum install epel-release | tee -a "$log"


# Instale o suporte ntfs-3g: 

# yum install ntfs-3g  | tee -a "$log"


# Pesquise no terminal pelos pacotes do "libreoffice" disponíveis: 

# yum search libreoffice | tee -a "$log"


echo " 

A fundação do Atualizador de Pacotes é o gerenciador de pacotes do Yum, desenvolvido pela Duke University para 
aprimorar a instalação dos RPMs. O yum busca repositórios suportados para pacotes e suas dependências, portanto 
devem ser instalados juntos para resolver problemas de dependência. O Red Hat Enterprise Linux 5 usa o yum para 
buscar pacotes e instalar pacotes.


Obs: Após o yum analisar seu sistema operacional ele vai exigir confirmação da atualização, para confirmar digite y.

yum update...
" | tee -a "$log"

yum update | tee -a "$log"


echo "
yum upgrade...
" | tee -a "$log"

yum upgrade | tee -a "$log"



echo "
Este comando permite que você determine se quaisquer atualizações estão disponíveis para seus pacotes instalados. 
O yum retorna uma lista de todas as atualizações de pacote a partir de todos os repositórios caso algum esteja disponível.
" | tee -a "$log"

yum check-update | tee -a "$log"



# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)

# geral


# Realiza uma limpeza geral no sistema

# faxina


}

# ----------------------------------------------------------------------------------------



# Sabayon



sabayon(){


echo "
Sabayon Linux
" | tee -a "$log"


# https://www.vivaolinux.com.br/topico/Sabayon-Linux/Atualizacoes-7
# https://cleuber.com.br/index.php/2016/06/21/conhecendo-o-entropy-e-atualizando-o-sabayon


# ----------------------------------------------------------------------------------------

# Verifique se está usando centos. 

sabayon=`which equo`

if [ -e "$sabayon" ]
then
	echo "equo localizado ..."
else
	zenity --error --text="Não foi possível encontrar o equo no local definido.

" --width="800" --height="100"   2>/dev/null

	exit
fi

# ----------------------------------------------------------------------------------------


# Usuários de Sabayon Linux sabem, ele usa Entropy como Gerenciador de Pacotes. 
#
# TENTANDO ATUALIZAR
#
# Você fica muito tempo sem atualizar o Sabayon e quando tenta, os comandos para atualizar os repositórios e atualizar todos os pacotes: 
#
# Recebe uma mensagem de que não tem espaço nos diretórios temporários! Não vai atualizar. 
#
#
# PRIMEIRA SOLUÇÃO
#
# Devido ao moderador do Fórum Sabayon, Sabayonino da Itália, precisa deletar todos os arquivos do diretório
# /var/tmp/entropy ou do /var/tmp, depois apagar todos os pacotes velhos do banco de dados do Entropy e, 
# finalmente, limpar o cache do Entropy. 

rm -rf -I /var/tmp/entropy   2>> "$log"
rm -rf -I /var/tmp           2>> "$log"

equo cleanup      | tee -a "$log"

equo cache clean  | tee -a "$log"


# SEGUNDA SOLUÇÃO
# 
# Puxa, depois de você tentar a solução descrita no Item 2, ainda não deu! 
# 
# Isso ocorre se você estiver usando diretórios temporários em RAM. 
# 
# Solução proposta por Joost Ruis, da Holanda, um dos desenvolvedores do Sabayon: 
# 
# Edite o seu arquivo /etc/fstab e confirme, se você tiver linhas que controlam os diretórios temporários em RAM, comente-as, deixe tipo assim: 
# 
#
# Arquivos temporários na RAM:
#
# tmpfs /var/tmp         tmpfs rw,nosuid,noatime,nodev,size=8G,mode=1777 0 0
# tmpfs /var/tmp/portage tmpfs rw,nosuid,noatime,nodev,size=8G,mode=775,uid=portage,gid=portage,x-mount.mkdir=775 0 0
#
# cat /etc/fstab

cat /etc/fstab | grep -i  tmpfs  | tee -a "$log"
# tmpfs            /dev/shm         tmpfs       defaults         0   0


df -H | grep -i tmpfs  | tee -a "$log"
# devtmpfs        4,0G     0  4,0G   0% /dev
# tmpfs           4,0G  1,3M  4,0G   1% /run
# tmpfs           4,0G   26M  3,9G   1% /dev/shm


echo '

VOLTANDO ÀS CONFIGURAÇÕES NORMAIS

Se você usar SWAP em RAM, no Sabayon, como eu fiz: ZSWAP em Sabayon Linux. Controlável, 
"Ligável" e "Desligável". - Mundo GNU e vários Links citados: ZSWAP em Sabayon Linux. 
Continuação. Testando a ZSWAP Controlável. - Mundo GNU, pode querer, após atualizar 
novamente, remover os comentários das linhas e reativar os diretórios temporários na RAM. 

Pronto, problema resolvido e Sabayon atualizado.

'  | tee -a "$log"


# https://www.vivaolinux.com.br/dica/Sabayon-Linux-Entropy-sem-espaco-temporario-para-atualizar-Resolvido


# ----------------------------------------------------------------------------------------



# equo up

# equo u -av 

# https://www.vivaolinux.com.br/dica/Sabayon-Linux-Entropy-sem-espaco-temporario-para-atualizar-Resolvido



# Para atualizar a distro toda, se vc misturou os instaladores de pacotes,faça nessa ordem os comandos....

# Atualiza o banco de dados do portage

# sudo emerge --sync 

# sudo emerge -v portage

# sudo layman -S


echo "
Atualizando os Repositórios

O comando 'equo update' irá atualizar a base de dados de seu computador com as 
últimas informações de pacotes disponíveis nos repositórios do Entropy.


equo update...
" | tee -a "$log"

equo update | tee -a "$log"


echo "

Otimizando os Mirrors

Agora, é uma boa ideia otimizar a coleção de mirrors para que todos os upgrades 
de pacotes sejam baixados o mais rápido possível. Com isso ele irá testar a 
velocidade dos mirrors disponíveis e ordenar pelos que tiverem maior velocidade 
de download para você, de acordo com a região onde você mora, e então irá 
indexar esses mirrors para baixar da fonte mais rápida quando você for fazer 
um upgrade posteriormente.

Obs. Repare na lista que o número 1 é o ufpr (Universidade Federal do Paraná). 
Pois é o que tem a taxa de download mais rápida para quem mora no Brasil.


equo repo mirrorsort sabayonlinux.org

" | tee -a "$log"

# equo repo mirrorsort sabayonlinux.org | tee -a "$log"



echo "
Atualizando o programa Entropy
" | tee -a "$log"

equo install entropy | tee -a "$log"


# Uma vez que você completou isso, é vital atualizar o próprio Entropy antes de fazer um upgrade total do sistema.
#
# equo install sys-apps/entropy rigo equo  --relaxed
# equo conf update



echo "
Upgrade Total do Sistema

Agora que o seu Entropy está atualizado, faça um upgrade total de todo o seu sistema.


O comando 'equo upgrade' irá baixar dos repositórios os arquivos binários para versões 
dos pacotes instalados no seu sistema e instalar essas novas versões.


equo upgrade --ask ....

" | tee -a "$log"

equo upgrade --ask | tee -a "$log"



# Para procurar pacote, com entropy ou com portage:

# equo search pacote | tee -a "$log"

# emerge -s pacote   | tee -a "$log"



# Para instalar

# sudo equo install --verbose pacote | tee -a "$log"
#
# ou
#
# sudo emerge -v pacote | tee -a "$log"



# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)

# geral


# Realiza uma limpeza geral no sistema

# faxina


}


# ----------------------------------------------------------------------------------------



# openSUSE



openSUSE(){


# ----------------------------------------------------------------------------------------

# Verifique se está usando openSUSE. 

openSUSE=`which zypper`

if [ -e "$openSUSE" ]
then
	echo "zypper localizado ..."
else
	zenity --error --text="Não foi possível encontrar o zypper no local definido.

" --width="800" --height="100"   2>/dev/null

	exit
fi

# ----------------------------------------------------------------------------------------


echo '
Na parte gráfica

- Acesse o Yast no menu principal, dentro do "Yast acesse "Software" acesse o icone do "Atualização online"

' | tee -a "$log"


echo "
Exibir todos os repositórios:
" | tee -a "$log"
zypper repos | tee -a "$log"


echo "
Atualizar lista de repositórios
" | tee -a "$log"
zypper refresh | tee -a "$log"


echo "
Atualizar pacotes
" | tee -a "$log"

# zypper update | tee -a "$log"

zypper up | tee -a "$log"



# https://www.vivaolinux.com.br/dica/Instalando-Codecs-Multimidia-no-openSUSE-Leap-151
# https://lcomlinux.wordpress.com/2017/05/04/como-atualizar-o-opensuse/
# https://www.linuxdescomplicado.com.br/2015/05/15-comandos-zypper-opensuse.html
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Como-atualizar-o-opensuse-leap-421-via-terminal
# https://pt.opensuse.org/Zypper/Uso


}


# ----------------------------------------------------------------------------------------



# Slackware

# Para atualizar o Slackware


# Atualização automática sem interação do usuário ideal para usar no gerenciador de tarefa (cron).



# Falta automatizar a tela do "slackpkg upgrade-all" e do "sbopkg -o"



# Changelog:
#
#
# Data: 26/01/2019
#
# Verificar se usuário com o qual eu estou executando é o Root.
# Verificar se o programa Sbopkg esta instalado.
# Testar a conexão com a Internet.
# Faz uma interação com o usuário (s/n) .
# Sincronizando a base de dados do sbopkg.
# Buscando as atualizações dos programas.
# Instala as atualizações dos programas.



# Changelog
#
#
# Em computação Changelog corresponde a uma lista contendo o registro de todas alterações realizadas em um sistema, ambiente ou qualquer outro elemento (por 
# exemplo: software e site). Muitas vezes o registro de todas as alterações realizadas é fornecido por um sistema de controle de versão.
#
# Um changelog também pode ser utilizado como parte de documentos em formato texto, como memória das alterações efetuadas, à medida que cada uma delas for implementada.
#
# Por sua vez, log de dados é o termo utilizado para descrever o processo de registro de eventos relevantes num sistema computacional. Esse registro pode ser utilizado 
# para restabelecer o estado original de um sistema ou para que um administrador conheça o seu comportamento no passado. Um arquivo de log pode ser utilizado para 
# auditoria e diagnóstico de problemas em sistemas computacionais. 
#
#
# https://pt.wikipedia.org/wiki/Changelog




slackware(){



# Variaveis locais

versao_slackware=$(cat /etc/slackware-version | awk '{print $2}')




# ----------------------------------------------------------------------------------------


# Teste realizado no Slackware 14.2 Stable 64 bit




# Problemas comuns:
# 
# 
# $ which gksu
# /usr/bin/gksu
# 
# $ gksu
# gksu: error while loading shared libraries: libgtop-2.0.so.10: cannot open shared object file: No such file or directory
# 
# 
# 
# ldd /usr/bin/gksu
# 	linux-vdso.so.1 (0x00007ffca598d000)
# 	libgksu2.so.0 => /usr/lib64/libgksu2.so.0 (0x00007f84de58e000)
# 	libstartup-notification-1.so.0 => /usr/lib64/libstartup-notification-1.so.0 (0x00007f84de385000)
# 	libgnome-keyring.so.0 => /usr/lib64/libgnome-keyring.so.0 (0x00007f84de161000)
# 	libgconf-2.so.4 => /usr/lib64/libgconf-2.so.4 (0x00007f84ddf3b000)
# 	libgtk-x11-2.0.so.0 => /usr/lib64/libgtk-x11-2.0.so.0 (0x00007f84dd900000)
# 	libgdk-x11-2.0.so.0 => /usr/lib64/libgdk-x11-2.0.so.0 (0x00007f84dd64c000)
# 	libpangocairo-1.0.so.0 => /usr/lib64/libpangocairo-1.0.so.0 (0x00007f84dd43f000)
# 	libatk-1.0.so.0 => /usr/lib64/libatk-1.0.so.0 (0x00007f84dd219000)
# 	libcairo.so.2 => /usr/lib64/libcairo.so.2 (0x00007f84dcef4000)
# 	libgdk_pixbuf-2.0.so.0 => /usr/lib64/libgdk_pixbuf-2.0.so.0 (0x00007f84dccd2000)
# 	libgio-2.0.so.0 => /usr/lib64/libgio-2.0.so.0 (0x00007f84dc955000)
# 	libpangoft2-1.0.so.0 => /usr/lib64/libpangoft2-1.0.so.0 (0x00007f84dc740000)
# 	libpango-1.0.so.0 => /usr/lib64/libpango-1.0.so.0 (0x00007f84dc4f6000)
# 	libgobject-2.0.so.0 => /usr/lib64/libgobject-2.0.so.0 (0x00007f84dc2a5000)
# 	libglib-2.0.so.0 => /usr/lib64/libglib-2.0.so.0 (0x00007f84dbf6e000)
# 	libfontconfig.so.1 => /usr/lib64/libfontconfig.so.1 (0x00007f84dbd32000)
# 	libfreetype.so.6 => /usr/lib64/libfreetype.so.6 (0x00007f84dba96000)
# 	libutil.so.1 => /lib64/libutil.so.1 (0x00007f84db893000)
# 	libc.so.6 => /lib64/libc.so.6 (0x00007f84db4ca000)
# 	libpixman-1.so.0 => /usr/lib64/../lib64/libpixman-1.so.0 (0x00007f84db225000)
# 	libEGL.so.1 => /usr/lib64/../lib64/libEGL.so.1 (0x00007f84daffa000)
# 	libgbm.so.1 => /usr/lib64/../lib64/libgbm.so.1 (0x00007f84dadee000)
# 	libxcb-shm.so.0 => /usr/lib64/../lib64/libxcb-shm.so.0 (0x00007f84dabec000)
# 	libXrender.so.1 => /usr/lib64/../lib64/libXrender.so.1 (0x00007f84da9e2000)
# 	libGL.so.1 => /usr/lib64/../lib64/libGL.so.1 (0x00007f84da77a000)
# 	libxcb-dri3.so.0 => /usr/lib64/../lib64/libxcb-dri3.so.0 (0x00007f84da578000)
# 	libxcb-present.so.0 => /usr/lib64/../lib64/libxcb-present.so.0 (0x00007f84da376000)
# 	libxcb-randr.so.0 => /usr/lib64/../lib64/libxcb-randr.so.0 (0x00007f84da16a000)
# 	libxcb-xfixes.so.0 => /usr/lib64/../lib64/libxcb-xfixes.so.0 (0x00007f84d9f64000)
# 	libxcb-render.so.0 => /usr/lib64/../lib64/libxcb-render.so.0 (0x00007f84d9d5b000)
# 	libxcb-shape.so.0 => /usr/lib64/../lib64/libxcb-shape.so.0 (0x00007f84d9b58000)
# 	libxcb-sync.so.1 => /usr/lib64/../lib64/libxcb-sync.so.1 (0x00007f84d9953000)
# 	libxshmfence.so.1 => /usr/lib64/../lib64/libxshmfence.so.1 (0x00007f84d9751000)
# 	libglapi.so.0 => /usr/lib64/../lib64/libglapi.so.0 (0x00007f84d9523000)
# 	libXdamage.so.1 => /usr/lib64/../lib64/libXdamage.so.1 (0x00007f84d9321000)
# 	libXfixes.so.3 => /usr/lib64/../lib64/libXfixes.so.3 (0x00007f84d911b000)
# 	libxcb-glx.so.0 => /usr/lib64/../lib64/libxcb-glx.so.0 (0x00007f84d8f05000)
# 	libxcb-dri2.so.0 => /usr/lib64/../lib64/libxcb-dri2.so.0 (0x00007f84d8d01000)
# 	libXxf86vm.so.1 => /usr/lib64/../lib64/libXxf86vm.so.1 (0x00007f84d8afc000)
# 	libXext.so.6 => /usr/lib64/../lib64/libXext.so.6 (0x00007f84d88ea000)
# 	libdrm.so.2 => /usr/lib64/../lib64/libdrm.so.2 (0x00007f84d86dc000)
# 	librt.so.1 => /lib64/librt.so.1 (0x00007f84d84d4000)
# 	libgmodule-2.0.so.0 => /usr/lib64/../lib64/libgmodule-2.0.so.0 (0x00007f84d82d0000)
# 	libresolv.so.2 => /lib64/libresolv.so.2 (0x00007f84d80b5000)
# 	libgthread-2.0.so.0 => /usr/lib64/../lib64/libgthread-2.0.so.0 (0x00007f84d7eb3000)
# 	libexpat.so.1 => /usr/lib64/../lib64/libexpat.so.1 (0x00007f84d7c89000)
# 	libharfbuzz.so.0 => /usr/lib64/../lib64/libharfbuzz.so.0 (0x00007f84d7a0b000)
# 	libbz2.so.1 => /lib64/libbz2.so.1 (0x00007f84d77fb000)
# 	libpng16.so.16 => /usr/lib64/../lib64/libpng16.so.16 (0x00007f84d75c8000)
# 	libz.so.1 => /usr/lib64/../lib64/libz.so.1 (0x00007f84d73b1000)
# 	libm.so.6 => /lib64/libm.so.6 (0x00007f84d70a8000)
# 	libxcb-util.so.1 => /usr/lib64/../lib64/libxcb-util.so.1 (0x00007f84d6ea3000)
# 	libX11-xcb.so.1 => /usr/lib64/../lib64/libX11-xcb.so.1 (0x00007f84d6ca1000)
# 	libX11.so.6 => /usr/lib64/../lib64/libX11.so.6 (0x00007f84d6966000)
# 	libdl.so.2 => /lib64/libdl.so.2 (0x00007f84d6762000)
# 	libxcb.so.1 => /usr/lib64/../lib64/libxcb.so.1 (0x00007f84d6543000)
# 	libXdmcp.so.6 => /usr/lib64/../lib64/libXdmcp.so.6 (0x00007f84d633e000)
# 	libgtop-2.0.so.10 => not found
# 	libXau.so.6 => /usr/lib64/../lib64/libXau.so.6 (0x00007f84d613b000)
# 	libffi.so.6 => /usr/lib64/../lib64/libffi.so.6 (0x00007f84d5f33000)
# 	libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f84d5d16000)
# 	libdbus-1.so.3 => /usr/lib64/../lib64/libdbus-1.so.3 (0x00007f84d5ac7000)
# 	libgcrypt.so.20 => /usr/lib64/../lib64/libgcrypt.so.20 (0x00007f84d57ba000)
# 	libgpg-error.so.0 => /usr/lib64/../lib64/libgpg-error.so.0 (0x00007f84d55a7000)
# 	libdbus-glib-1.so.2 => /usr/lib64/../lib64/libdbus-glib-1.so.2 (0x00007f84d5380000)
# 	libXinerama.so.1 => /usr/lib64/../lib64/libXinerama.so.1 (0x00007f84d517e000)
# 	libXi.so.6 => /usr/lib64/../lib64/libXi.so.6 (0x00007f84d4f6e000)
# 	libXrandr.so.2 => /usr/lib64/../lib64/libXrandr.so.2 (0x00007f84d4d63000)
# 	libXcursor.so.1 => /usr/lib64/../lib64/libXcursor.so.1 (0x00007f84d4b58000)
# 	libXcomposite.so.1 => /usr/lib64/../lib64/libXcomposite.so.1 (0x00007f84d4956000)
# 	/lib64/ld-linux-x86-64.so.2 (0x00007f84de79e000)
# 
# 
# 
# ldd /usr/bin/gksu | grep "not found"
# 	libgtop-2.0.so.10 => not found
# 
# 
# 
# 
# Problema com kernel generico no Slackware (Kernel Panic)
#
#
# Por não ter o Kernel Generc deu Kernel Panic no boot.
#
#
#
# Tarefa a ser realizada toda vez que atualizar o kernel gerenico no Slackware
#
#
# --timeout <N>    Sai do programa com erro caso o usuário não faça nada em N segundos.


# ls -lh /var/log/packages/ |grep -i kernel
# -rw-r--r-- 1 root root   94K Mar 14 14:56 kernel-firmware-20210305_e425f76-noarch-1
# -rw-r--r-- 1 root root   980 Jul 21 11:50 kernel-generic-4.4.276-x86_64-1
# -rw-r--r-- 1 root root   25K Jul 21 11:50 kernel-headers-4.4.276-x86-1
# -rw-r--r-- 1 root root   976 Jul 21 11:51 kernel-huge-4.4.276-x86_64-1
# -rw-r--r-- 1 root root  252K Jul 21 11:51 kernel-modules-4.4.276-x86_64-1
# -rw-r--r-- 1 root root  3,4M Jul 21 11:55 kernel-source-4.4.276-noarch-1
# -rw-r--r-- 1 root root  1,1K Jul 17 21:20 virtualbox-kernel-5.0.40_4.4.261-x86_64-2_SBo




# Obs: Dependendo do tempo que ficou o seu sistema (Slackware) sem atualizações pode gera 
# uma grande lista de programas para serem atualizados que por sua vez demandara muito 
# mais tempo para ser atualizados.
# 
# 
# Ex: aircrack-ng, libevtx, libinput, libtorrent-rasterbar, meson, audacity, chessx, clamav, vlc, dropbox, qt, smplayer, libreoffice, qemu, steam, opencv  
# 
# 
# Quando o problema for muito complexo dividi-lo em partes....
# 
# 
# Vamos por partes (Jack, o Estripador)
# 
# 
# O ideal seria dividir em parte as atualizações dos programas para cada dias da semana.
# 
# 
# date
# Sáb Jul 20 20:45:51 -03 2019
# 
# 
# uptime 
# 20:45:00 up 10:56,  1 user,  load average: 0,84, 0,87, 0,84
# 
# 
# ifconfig -a
# 
# 
# date
# Dom Jul 21 20:19:16 -03 2019
# 
# 
# Reservar um dia só para atualizar o qt o pacote tem mais de 440 MB e leva 10:28 horas para instalar.
# 
# uptime 
# 20:17:24 up 10:28,  3 users,  load average: 0,50, 1,06, 1,19





avisokernelnovo(){

clear

dialog \
--backtitle "$titulo"        \
--title "Problema com kernel generico no Slackware"  \
--timeout "50" \
--msgbox "
Gera kernel generico no Slackware


Problema com "'"kernel generico no Slackware"'" ocorre quando atualizar os pacotes do kernel:

kernel-headers
kernel-huge
kernel-modules
kernel-source


`ls -lh /var/log/packages/ |grep -i kernel`


Esse procedimento depende do sistema ter uma ferramenta para gerar uma imagem 
generic do kernel, que é o mkinitrd_command_generator.sh.

Por isso o recomendado é você fazer uma instalação padrão com kernel huge após concluir a 
instalação.

O primeiro passo é executar o mkinitrd_command_generator.sh, como usuário root:

bash-4.3 # /usr/share/mkinitrd/mkinitrd_command_generator.sh


O que nos interessa aqui é o comando mkinitrd e o seus atributos que devemos executar 
para gerar uma nova imagem generic do kernel.



E por fim executar o lilo (se utilizar ele) para atualizar o boot.


Porém antes de utilizar esse kernel no próximo boot, devemos informar ao lilo que criamos 
essa imagem.
Nessa etapa utiliza novamente o mkinitrd_command_generator, porém agora com o 
parâmetro -l para gerar um label que irá no arquivo lilo.conf


bash-4.3# /usr/share/mkinitrd/mkinitrd_command_generator.sh -l /boot/vmlinuz-generic


Exemplo:

# /usr/share/mkinitrd/mkinitrd_command_generator.sh -l /boot/vmlinuz-generic 
# Linux bootable partition config begins
# initrd created with ''mkinitrd -c -k 4.4.276 -f ext4 -r /dev/sda3 -m usb-storage:ehci-hcd:ehci-pci:xhci-pci:ohci-pci:xhci-hcd:uhci-hcd:hid:usbhid:i2c-hid:hid_generic:hid-cherry:hid-logitech:hid-logitech-dj:hid-logitech-hidpp:hid-lenovo:hid-microsoft:hid_multitouch:jbd2:mbcache:ext4 -u -o /boot/initrd.gz''
image = /boot/vmlinuz-generic-4.4.276
  initrd = /boot/initrd.gz
  root = /dev/sda3
  label = 4.4.276
  read-only
# Linux bootable partition config ends



Toda esse trecho de codigo gerado deve ser incluído no final do arquivo /etc/lilo.conf 
e após salvar as alterações, devemos rodar o comando lilo -v, como root:


bash-4.3# lilo -v 

Ou

bash-4.3#  update o grub: grub-mkconfig -o /boot/grub/grub.cfg




Os pacotes baixados do kernel, terá que fazer os passos manualmente.

Geralmente você não terá um kernel panic caso o comando lilo -v for executado com 
sucesso.
Agora sim está tudo organizado para você reiniciar a sua máquina e desfrutar a 
nova versão do kernel.

Caso dê algum erro (muito raro ocorrer) só colocar algum boot do Slackware (DVD, CD, pen-drive) 
e dar boot na partição instalada.

Vai carregar o sistema e poderá resolver os erros.


Toda vez que atualizar o kernel precisa fazer esses passos:

1-) Dê boot pelo kernel huge


Rodar esse script para gerar o kernel generic

2-) Gere o initrd: 

# /usr/share/mkinitrd/mkinitrd_command_generator.sh -r | /bin/bash

# nano /etc/lilo.conf


# ----------------------------------------------------------------------------------

# Kernel Generico (Kernel Generc)

        image=/boot/vmlinuz-generic
	label = "'"Kernel Generico"'"

# Opção usada para adicionar um segundo HD no sistema

addappend = "'"root=PARTUUID=000e9f23-03"'"

#	root=/dev/sda3
	initrd = /boot/initrd.gz
	read-only

# ----------------------------------------------------------------------------------

# lilo -v

Verifica se esta funcionando o "'"kernel Generic"'" apos reinciar o sistema.

# reboot

" 35 100 2> /dev/null


clear

}


# avisokernelnovo


# ----------------------------------------------------------------------------------------





clear

# ----------------------------------------------------------------------------------------

# Verifique se está usando Slackware. 

slackware=`which slackpkg`

if [ -e "$slackware" ]
then
	echo "slackpkg localizado ..."
else
	zenity --error --text="Não foi possível encontrar o slackpkg no local definido.

" --width="800" --height="100"   2>/dev/null

	exit
fi

# ----------------------------------------------------------------------------------------

clear



killall -9 slackpkg  1> /dev/null 2> /dev/null

rm -Rf /var/lock/slackpkg.*




echo "
What do you want (K/O/R/P)?
k
"

sleep 5

# ----------------------------------------------------------------------------------------


clear

# echo "Verificando o tamanho do arquivo /var/cache/sbopkg  e das pastas: 
#
# /tmp/SBo
# /var/lib/sbopkg/queues
# /var/log/sbopkg
#
# " >> $log


echo "Verificando o tamanho do arquivo /var/cache/sbopkg  e das pastas: 

/tmp/SBo
/var/lib/sbopkg/queues
/var/log/sbopkg

" | tee -a "$log"


du -lhs /var/cache/sbopkg      | tee -a "$log"

du -lhs /tmp/SBo               | tee -a "$log"

du -lhs /var/lib/sbopkg/queues | tee -a "$log"

du -lhs /var/log/sbopkg        | tee -a "$log"


# ----------------------------------------------------------------------------------------

echo "
Verifica se há atualizações disponíveis para o seu sistema - slackpkg (slackpkg check-updates).
" | tee -a "$log"

slackpkg check-updates | tee -a "$log"

# ----------------------------------------------------------------------------------------

clear

echo "
Instalando atualizações do sistema (Slackware)...
" | tee -a "$log"

sleep 1

# ----------------------------------------------------------------------------------------

clear

echo "
Atualizar a chave GPG usada para assinar os pacotes do mirror - (slackpkg update gpg).
" | tee -a "$log"

slackpkg update gpg | tee -a "$log"

# ----------------------------------------------------------------------------------------

clear


# Pasta /var/cache/slackpkg


# Manter pacote slack

# Configurando o slackpkg para não apagar os pacotes após atualizações
# 
# 
# Publicado por Mauricio Ferrari em 24/08/2020
# 
# Blog: https://github.com/MauricioFerrari-NovaTrento
# 
# 
# Essa dica é bem simples. Talvez, você queira guardar os pacotes instalados no Slackware 
# para uma reinstalação futura, caso ocorra algum erro irreversível de não resolver nem 
# com um Timeshift da vida.
# 
# Então, você pode reinstalar o Slackware e aproveitar os pacotes salvos, pois esses não 
# precisaram ser baixados novamente.
# 
# Mas acontece que no Slackware Current e talvez nas outras versões anteriores, vem 
# configurado para excluir os pacotes do cache após a atualização do sistema.
# 
# Para reverter isso e poder salvar os pacotes, você deve alterar o valor de 'DELALL' 
# dentro de /etc/slackpkg/slackpkg.conf de 'on' para 'off'. Para fazer isso é bem simples, 
# é só abrir o terminal como root ou com o sudo (caso tenha configurado) e digitar:
# 
# sed -i 's/DELALL=on/DELALL=off/' /etc/slackpkg/slackpkg.conf
# 
# Pronto, assim os pacotes não serão excluídos após a atualização do sistema e poderão 
# ser copiados para outro local.
# 
# 
# Comentários:
# 
# Após esse procedimento os pacotes do Slackware, vai fica na pasta /tmp ou em outra 
# pasta do sistema?
# 
# Podemos especificar uma pasta para enviar após a instalação do pacote.
# 
# 
# Resposta
# 
# Se não estou errado, seria /var/cache/packages e fica tudo bem organizadinho ainda.


clear


cat /etc/slackpkg/slackpkg.conf | grep -i "DELALL=off"

if [ "$?" = "0" ] ;
then
   echo "
Já esta configurando o slackpkg para não apagar os pacotes após atualizações...

`cat /etc/slackpkg/slackpkg.conf | grep -i "DELALL=on"`
" | tee -a "$log"


sleep 3
clear


else

   echo "
Não esta configurando o slackpkg para não apagar os pacotes após atualizações...

`cat /etc/slackpkg/slackpkg.conf | grep -i "DELALL=off"`
" | tee -a "$log"

sleep 3
clear

# sed -i 's/DELALL=on/DELALL=off/' /etc/slackpkg/slackpkg.conf


fi




# https://www.vivaolinux.com.br/dica/Configurando-o-slackpkg-para-nao-apagar-os-pacotes-apos-atualizacoes



# ----------------------------------------------------------------------------------------


echo "
Para atualizar a lista dos pacotes - slackpkg (slackpkg update)
" | tee -a "$log"


# cat /etc/slackpkg/slackpkg.conf | grep -i batch
# BATCH=off


# slackpkg update

# Updating the package lists...
# 	Downloading...
# 			Downloading http://ftp.slackware-brasil.com.br/slackware64-14.2/ChangeLog.txt...
# --2020-02-16 16:37:49--  http://ftp.slackware-brasil.com.br/slackware64-14.2/ChangeLog.txt
# Resolvendo ftp.slackware-brasil.com.br... 200.137.217.134
# Conectando-se a ftp.slackware-brasil.com.br|200.137.217.134|:80... conectado.
# A requisição HTTP foi enviada, aguardando resposta... 200 OK
# Tamanho: 580804 (567K) [text/plain]
# Salvando em: “/tmp/slackpkg.od6h47/ChangeLog.txt”
# 
# /tmp/slackpkg.od6h47/ChangeLog.txt  100%[=================================================================>] 567,19K   131KB/s    em 4,9s    
# 
# 2020-02-16 16:37:57 (115 KB/s) - “/tmp/slackpkg.od6h47/ChangeLog.txt” salvo [580804/580804]
# 
# 
# 		No changes in ChangeLog.txt between your last update and now.
# 		Do you really want to download all other files (y/N)? 



slackpkg  -batch=on update | tee -a "$log"

# ----------------------------------------------------------------------------------------

clear

echo "Atualiza TODO o sistema conforme o mirror selecionado - slackpkg (slackpkg upgrade-all).
#
# cat /etc/slackpkg/mirrors
" | tee -a "$log"

slackpkg upgrade-all | tee -a "$log"


# ----------------------------------------------------------------------------------------



# slackpkg update gpg && slackpkg -batch=on update && slackpkg upgrade-all   | tee -a "$log"



# 
# 
# Another instance of slackpkg is running. If this is not correct, you can
# remove /var/lock/slackpkg.* files and run slackpkg again.
# 
# 
# 
# Another instance of slackpkg is running. If this is not correct, you can
# remove /var/lock/slackpkg.* files and run slackpkg again.
# 
# 
# 
# Another instance of slackpkg is running. If this is not correct, you can
# remove /var/lock/slackpkg.* files and run slackpkg again.
#
#
# ls /var/lock/slackpkg.*
# /var/lock/slackpkg.4355
#
# rm /var/lock/slackpkg.4355






# ----------------------------------------------------------------------------------------

clear


# Verificar se o programa Sbopkg esta instalado.


programa=$(which sbopkg) 


if [ -n "$programa" ] ;
then 

     echo "
Programa sbopkg já instalado.
"

rm -Rf /tmp/SBo


# sbopkg -c
#
# The following directories do not exist:
#
# Variable                   Assignment
# --------                   ----------
# TMP ---------------------> /tmp/SBo
#
# You can have sbopkg create them or, if these values are incorrect, you can
# abort to edit your config files or pass different flags.
#
# (C)reate or (A)bort?: C




killall -9 sbopkg    1> /dev/null 2> /dev/null


# ----------------------------------------------------------------------------------------

# Em CLEANUP=${CLEANUP:-YES}, opto por realizar a limpeza após o empacotamento
#
# Você também pode alterar /etc/sbopkg/sbopkg.conf para excluir automaticamente a fonte extraída e os diretórios de criação de pacote após o término do sbopkg. 
#
# Mudar CLEANUP=${CLEANUP:-NO} para CLEANUP=${CLEANUP:-YES}
#
#

clear

cat /etc/sbopkg/sbopkg.conf | grep -i '${CLEANUP:-NO}'

 if [ $? -eq 0 ];then

   echo -e "[\033[01;31m Erro - optou por não realizar a limpeza após o empacotamento. \033[01;37m]"


  else

   echo -e "[\033[01;32m OK - optou por realizar a limpeza após o empacotamento. \033[01;37m] "


 fi


sleep 2


# https://www.linuxquestions.org/questions/slackware-14/can-tmp-sbo-directory-be-removed-4175604322/
# https://edpsblog.wordpress.com/2015/10/31/how-to-sbopkg-1a-parte/


# ----------------------------------------------------------------------------------------


# Em MKDIR_PROMPT=${MKDIR_PROMPT:-NO}), escolho por não me incomodarem com perguntas acerca de criação de diretórios

# grep MKDIR_PROMPT /etc/sbopkg/sbopkg.conf > /dev/null

clear

grep 'MKDIR_PROMPT:-NO' /etc/sbopkg/sbopkg.conf > /dev/null

 if [ $? -eq 0 ];then

   cat /etc/sbopkg/sbopkg.conf | grep -i MKDIR_PROMPT

   echo ""

   echo -e "[\033[01;32m OK - optou por não incomodar com perguntas acerca de criação de diretórios. \033[01;37m]"


  else


   cat /etc/sbopkg/sbopkg.conf | grep -i MKDIR_PROMPT

   echo ""

   echo -e "[\033[01;31m Erro - optou por incomodar com perguntas acerca de criação de diretórios. \033[01;37m]"


 fi


sleep 2

# https://www.linuxquestions.org/questions/slackware-14/[ann]-sbopkg-0-34-0-is-released-843804/
# https://edpsblog.wordpress.com/2016/09/17/dica-atualizacao-do-sbopkg/
# https://telazul.drusian.com.br/pt/artigo/sbopkg-gerenciamento-de-pacotes-no-slackware


# ----------------------------------------------------------------------------------------



# Mirrors
#
# http://www.slackware.com/getslack



# Slackware sempre seguiu a filosófia KISS (Keep it simple stupid!). 
#
# https://giofilth.wordpress.com/2010/12/21/atualizando-o-slackware/
# http://meumundotux.blogspot.com.br/2016/09/solucionando-dependencias-no-sbopkg.html
#
#
# Sbopkg (1ª parte)
#
# https://edpsblog.wordpress.com/2015/10/31/how-to-sbopkg-1a-parte/
#
# https://www.vivaolinux.com.br/topico/Slackware/limpeza-no-Slackware
# https://www.vivaolinux.com.br/topico/Slackware/Otimizar-a-inicializacao-do-Slackware
#
# https://www.vivaolinux.com.br/dica/Usando-o-slackpkg
#
#
# Saiba que o sbopkg também possui uma interface de gestão rsrs, tasca aí em seu terminal um puro e simples:
#	
# sbopkg
#
#
# https://www.vivaolinux.com.br/dica/Resolvendo-dependencias-no-Sbopkg
# https://sempreupdate.com.br/verificar-intensidade-sinal-wifi-terminal-ubuntu/
# https://www.vivaolinux.com.br/topico/Slackware/Otimizar-a-inicializacao-do-Slackware
# https://www.vivaolinux.com.br/artigo/Sbopkg-Instalador-de-pacotes-para-Slackware


echo "
Atualizar o Sbopkg (sbopkg -u)
" | tee -a "$log"

sbopkg -u | tee -a "$log"

# Essa opção demora muito



# date
# Seg Fev 26 00:18:02 -03 2018


# sbopkg -u

# Checking https://www.sbopkg.org for an update...

# Your version of sbopkg: 0.38.1

# Latest version of sbopkg found on sbopkg.org: 


# date
# Seg Fev 26 00:39:38 -03 2018



# ----------------------------------------------------------------------------------------

echo 'Verificando atualizações para o Sbopkg...


Lista os pacotes do Sbopkg a serem atualizados mais o usuário deverá realizar sua instalação manualmente.

Em caso de problema usar a opção Q para os programas com problema na atualização.


Exemplo:

# sbopkg -i "dropbox libmediainfo libtorrent-rasterbar libwacom mediainfo meson pyudev skypeforlinux tesseract qbittorrent-qt5"
Both a queuefile and a package were found with the name "libmediainfo".

Use (Q)ueuefile, (P)ackage, or (A)bort?: P
Both a queuefile and a package were found with the name "mediainfo".

Use (Q)ueuefile, (P)ackage, or (A)bort?: P
Both a queuefile and a package were found with the name "meson".

Use (Q)ueuefile, (P)ackage, or (A)bort?: P
Both a queuefile and a package were found with the name "skypeforlinux".

Use (Q)ueuefile, (P)ackage, or (A)bort?: P
Both a queuefile and a package were found with the name "tesseract".

Use (Q)ueuefile, (P)ackage, or (A)bort?: P
Both a queuefile and a package were found with the name "qbittorrent-qt5".

Use (Q)ueuefile, (P)ackage, or (A)bort?: P

###########################################
       New queue process started on:
       Ter Dez 31 19:16:19 -03 2019
###########################################

+++++++++++++++++++++++++++++++++++++++++++
PRE-CHECK LOG
Using the SBo repository for Slackware 14.2
Queue Process:  Download, build, and install

dropbox:
  Checking GPG for dropbox.tar.gz ... OK
  Processing dropbox 87.4.138-1
  Using original .info file
  Using original SlackBuild file
  No build options selected.

libmediainfo:
  Checking GPG for libmediainfo.tar.gz ... OK
  Processing libmediainfo 19.09-1
  Using original .info file
  Using original SlackBuild file
  No build options selected.

libtorrent-rasterbar:
  Checking GPG for libtorrent-rasterbar.tar.gz ... OK
  Processing libtorrent-rasterbar 1.1.13-1
  Using original .info file
  Using original SlackBuild file
  No build options selected.

libwacom:
  Checking GPG for libwacom.tar.gz ... OK
  Processing libwacom 1.2-1
  Using original .info file
  Using original SlackBuild file
  No build options selected.

mediainfo:
  Checking GPG for mediainfo.tar.gz ... OK
  Processing mediainfo 19.09-1
  Using original .info file
  Using original SlackBuild file
  No build options selected.

meson:
  Checking GPG for meson.tar.gz ... OK
  Processing meson 0.52.1-1
  Using original .info file
  Using original SlackBuild file
  No build options selected.

pyudev:
  Checking GPG for pyudev.tar.gz ... OK
  Processing pyudev 0.21.0-2
  Using original .info file
  Using original SlackBuild file
  No build options selected.

skypeforlinux:
  Checking GPG for skypeforlinux.tar.gz ... OK
  Processing skypeforlinux 8.55.0.141-1
  Using original .info file
  Using original SlackBuild file
  No build options selected.

tesseract:
  Checking GPG for tesseract.tar.gz ... OK
  Processing tesseract 4.1.1-1
  Using original .info file
  Using original SlackBuild file
  No build options selected.

qbittorrent-qt5:
  Checking GPG for qbittorrent-qt5.tar.gz ... OK
  Processing qbittorrent-qt5 4.2.1-1
  Using original .info file
  Using original SlackBuild file
  No build options selected.

+++++++++++++++++++++++++++++++++++++++++++

Pre-check complete.

Do you wish to proceed based on the search results above? Packages not
found will be skipped during the process.

(P)roceed or (Q)uit?: P



(D)elete these files?: D'


sleep 10


# ----------------------------------------------------------------------------------------

echo "
The following directories do not exist:

Variable                   Assignment
--------                   ----------
TMP ---------------------> /tmp/SBo

You can have sbopkg create them or, if these values are incorrect, you can
abort to edit your config files or pass different flags.

(C)reate or (A)bort?: C

"

# Verifique se o diretório /tmp/SBo/ existe.

if [ -d "/tmp/SBo/" ] ; then

   echo "O diretório /tmp/SBo/ existe..."


else

   echo "O diretório /tmp/SBo/ não existe.

Criando o diretório /tmp/SBo/ agora..." | tee -a "$log"

   mkdir -p /tmp/SBo | tee -a "$log"

fi
 

# https://www.vivaolinux.com.br/topico/Shell-Script/verificar-se-arquivo-existe
# https://www.vivaolinux.com.br/topico/Shell-Script/Script-Shell-para-verificar-infinitamente-se-diretorio-existe


sleep 2



# ----------------------------------------------------------------------------------------


clear


echo "

Resolvendo dependências no Sbopkg



Sobre os diretórios do sbopkg:

/var/cache/sbopkg = contem todos os pacotes source baixados pelo sbopkg que serão descompactados para posterior compilação

/tmp/SBo/ = fica todos os diretórios de todos os pacotes baixados que foram descompactados e onde será feita a compilação dos mesmos.

/tmp = é o onde fica todos os pacotes já compilados em formato tgz e que foram instalados automaticamente.

/var/lib/sbopkg/queues = diretório que armazena o arquivo com extensão sqf que tem o mesmo nome do pacote especificado ao sqg e dentro dentro dele os nomes de todas as dependências sendo uma por linha.
Para os pacotes que não haja dependências para compilar, não será gerado um arquivo de mesmo nome do pacote neste diretório.

/etc/sbopkg = armazena o arquivo de configuração sbopkg.conf e outros diretórios e arquivos.


Listando todos pacotes que foram instalados pelo sbopkg

# sbopkg -p | nl



Obs: 

Este procedimento levou 40 minutos em uma cpu Phenom I de 2 Ghz e ficando no 
total  2388 arquivos de extensão sqf e totalizando 9,5 MB em /var/lib/sbopkg/queues


Ter Ago 20 13:20:46 -03 2019

sqg -a


Ter Ago 20 15:37:52 -03 2019


# uptime 
 15:38:43 up  2:19,  2 users,  load average: 0,13, 0,25, 0,47




"



echo "
Rastrear todas as dependências de uma vez, de todos os programas (sqg -a).


Este procedimento pode levar 4 horas em uma cpu Phenom I de 2 Ghz.


/var/lib/sbopkg/queues = diretório que armazena o arquivo com extensão sqf que 
tem o mesmo nome do pacote especificado ao sqg e dentro dentro dele os nomes 
de todas as dependências sendo uma por linha.

Para os pacotes que não haja dependências para compilar, não será gerado um 
arquivo de mesmo nome do pacote neste diretório.

" | tee -a "$log"


# Você deseja rastrear todas as dependências de uma vez, de todos os programas. (sqg -a)  (s/n) ?

# clear

# echo "
# Rastreando todas as dependências de uma vez, de todos os programas. (sqg -a) isso pode levar 50 minutos em media.

# " | tee -a "$log"


# sqg -a  2>> "$log"




# Essa opção demora muito


# ou 
#
# Podemos usa: sqg -p  programa &&  sqg -ki  programa
#
# Exemplo:
#
# sqg -p  gammu 
# gammu: empty REQUIRES line. No queuefile generated.
# Uncomment SKIP_EMPTY to change this.
# Done.
#
#
# sqg -a <==== +/- 50 minutos
# sbopkg -r
# sbopkg -c
# sbopkg -ki pacote
#
#
#
# O Sbopkg, por padrão, não resolve dependências. Às vezes, quando precisamos de um programa que possui várias dependências, como o VLC, é um sofrimento. 
#
# O SQG procura todas as dependências de um pacote e as coloca em uma lista, com um formato especial ".sqf", que o Sbopkg entende e procura por ele 
# automaticamente, quando você pede para instalar alguma coisa. 
#
# Um problema que eu percebi usando o SQG, é que ele não checa se algum pacote já foi instalado no seu sistema, então, vamos dizer que você precisa 
# instalar um SlackBuild que precise do JDK, ele vai incluir o JDK mesmo que você já tenha instalado. 
#
#
# Esse problema pode ser contornado pelo sbopkg ao passar o parâmetro -ki
#
# "sbopkg -ki nome_do_pacote" 
#
#
#
# Você pode facilmente editar a fila manualmente.
#
# ls -1l /var/lib/sbopkg/queues/
#
# Lembrando que isso de fato não é "resolução de dependências", ele só gera uma lista com o que você precisa para fazer o build de um programa. Se 
# você for remover o pacote que instalou por meio de uma lista, as dependências vão continuar lá. 
#
#
# Para evitar que o sbopkg baixe e instale pacotes que já estão instalados, passe o parâmetro -k (keep) quando for instalar através do queue. 
#
# https://www.vivaolinux.com.br/dica/Resolvendo-dependencias-no-Sbopkg
# 
# 
# 
#
# https://www.vivaolinux.com.br/dica/Resolvendo-dependencias-no-Sbopkg
# http://meumundotux.blogspot.com/2016/09/solucionando-dependencias-no-sbopkg.html
#

# ----------------------------------------------------------------------------------------

echo "

Arquivo de configuração do Sbopkg

/etc/sbopkg/sbopkg.conf

" | tee -a "$log"


echo "Diretorio dos arquivos de fila:
" | tee -a "$log"

cat /etc/sbopkg/sbopkg.conf  | grep -i QUEUEDIR  | tee -a "$log"


echo 'Sbopkg está configurado a não salvar LOGS? 

Usando a opção: KEEPLOG=${KEEPLOG:-NO} no arquivo /etc/sbopkg/sbopkg.conf


Por padrão ela vem setada para YES, assim caso você deixasse como o padrão, veria por exemplo logs como este:

https://gist.github.com/44be19e1eb89edf68fe2ebb3ab9746c9

** mas usando a opção NO, esta pasta estará sempre limpa.

' | tee -a "$log"

cat /etc/sbopkg/sbopkg.conf  | grep -i KEEPLOG | tee -a "$log"


# ----------------------------------------------------------------------------------------

echo "

Para checar quantos SBos você tem instalado:" | tee -a "$log"


# wc -l é um comando que serve para contar linhas.
#
# Quando você usa cat arquivo | wc -l, o conteúdo do arquivo é redirecionado para o comando wc -l, 
# que a partir da informação recebida, exibe a quantidade de linhas.


ls /var/log/packages/*_SBo* | wc -w | tee -a "$log"

# ou sbopkg -p


# ----------------------------------------------------------------------------------------



# sbopkg -rco


# ----------------------------------------------------------------------------------------

clear


# Sincronizando a base de dados do sbopkg (sbopkg -r)

echo "
Para sincronizar o sbopkg com o repositório Slackbuilds.org (sbopkg -r)

Executando sbopkg -r ...
" | tee -a "$log"

sbopkg -r | tee -a "$log"


# https://edpsblog.wordpress.com/2015/04/04/how-to-instalacao-do-sbopkg-no-slackware/


# ----------------------------------------------------------------------------------------

clear

# Buscando as atualizações dos programas (sbopkg -c)


# O comando tee, é usado para, ao mesmo tempo em que exibe a saída de um comando na tela, 
# gravá-la em um arquivo de texto ($log).



# ERROR
# Another instance of sbopkg appears to be running
# with process id 11365.  Running more than
# one instance of sbopkg is not recommended.
#
# If this is incorrect, you can delete the lockfile
# '/var/run/sbopkg.pid' and restart.  Exiting now.



# sbopkg -c
# [ Checking for potential updates ]
# This may take a few moments. Press <ESC> to abort.
# 100%[======================================================================================================================================]
# Listing installed SBo repository for Slackware 14.2 packages and flagging
# potential updates...
#
# libreoffice:
#   POTENTIAL UPDATE
#   Installed version:  libreoffice-6.0.1-x86_64-1_SBo
#   Repo version:  libreoffice-6.1.4-x86_64-1_SBo
# libreoffice-helppack:
#   POTENTIAL UPDATE
#   Installed version:  libreoffice-helppack-6.0.1_pt_BR-x86_64-1_SBo
#   Repo version:  libreoffice-helppack-6.1.4-x86_64-1_SBo
# libreoffice-langpack:
#   POTENTIAL UPDATE
#   Installed version:  libreoffice-langpack-6.0.1_pt_BR-x86_64-1_SBo
#   Repo version:  libreoffice-langpack-6.1.4-x86_64-1_SBo
# mame:
#   POTENTIAL UPDATE
#   Installed version:  mame-0.203-x86_64-1_SBo
#   Repo version:  mame-0.205-x86_64-1_SBo
#   Note: repo version not obtainable by standard method, may be inaccurate.
#
# Potential update list complete.



# Checando se os pacotes já instalados tem nova update no repositório.


echo "
Atualização do SlackBuild - sbopkg (sbopkg -c)

Executando sbopkg -c ...

" | tee -a "$log"

sbopkg -c | tee -a "$log"




echo "

Os dados do comando acima (sbpkg -c) esta também no arquivo $log
"



# ----------------------------------------------------------------------------------------

clear


echo "Removendo libreoffice-langpack e libreoffice-helppack do arquivo $log


A versão em pt_BR dos pacotes libreoffice-langpack e libreoffice-helppack tera que baixar do site do Libreoffice:


https://pt-br.libreoffice.org/baixe-ja/libreoffice-novo/



SlackBuilds Repository:


https://slackbuilds.org/repository/$versao_slackware/office/libreoffice-langpack/

https://slackbuilds.org/repository/$versao_slackware/office/libreoffice-helppack/


"

sed -i '/^libreoffice-langpack:$\|^libreoffice-helppack:$/s/:/#/' "$log"



echo "Convertendo arquivo Windows para GNU/Linux ou Conversão DOS para UNIX - $log"

sed -i 's/\x0D$//' "$log"

# https://br.ccm.net/faq/8419-sed-converter-quebras-de-linha-dos-crlf-unix-lf




# PKG=$(grep -E '(^[a-z-]+:$)' $log |sed 's/:/ -i/'|xargs |sed 's/-i$//') # "Pega" somente o nome dos arquivos (pkgs), troca ":" por "-i"
# 
# 
# Obs: Bug => Não identifica atualizações de programas com número no nome.
# 
# 
# Exemplo: psycopg2
# 
# 
# Instalando as atualizações dos programas ...
# 
# sbopkg -i psycopg2 
# 
# Both a queuefile and a package were found with the name "psycopg2".
# 
# Use (Q)ueuefile, (P)ackage, or (A)bort?: P
# 
###########################################
#        New queue process started on:
#        Sáb Jan 26 20:02:09 -02 2019
###########################################
# 
# +++++++++++++++++++++++++++++++++++++++++++
# PRE-CHECK LOG
# Using the SBo repository for Slackware 14.2
# Queue Process:  Download, build, and install
# 
# psycopg2:
#   Checking GPG for psycopg2.tar.gz ... OK
#   Processing psycopg2 2.7.7-1
#   Using original .info file
#   Using original SlackBuild file
#   No build options selected.
# 
# +++++++++++++++++++++++++++++++++++++++++++
# 
# Pre-check complete.
# 
# Do you wish to proceed based on the search results above? Packages not
# found will be skipped during the process.
# 
# (P)roceed or (Q)uit?: P
# 
# 
# 



PKG=$(grep -E '(^.*:$)' $log |sed 's/:/ -i/'|xargs |sed 's/-i$//') 



# https://www.vivaolinux.com.br/topico/Slackware/Filtrar-gera-lista-de-programas-e-instalar/


# ----------------------------------------------------------------------------------------

clear

# Verificar se o conteudo da variavel $PKG é nula (Em caso do sistema já esta atualizado).

# Exemplo:
#
# sbopkg -i




# Onde:
#
# -z é nula
# -n não é nula.


if [ -z "$PKG" ];then

# echo "
# Variavel PKG vazia.
# "

echo "
Programas instalados via sbopkg já estão atualizados no seu sistema.

" | tee -a "$log"

sleep 2

cat  "$log"


rm -Rf "$log"

# exit 4

fi


# https://www.vivaolinux.com.br/topico/Shell-Script/variavel-vazia


# ----------------------------------------------------------------------------------------


clear

echo "
Instalando as atualizações dos programas...
" | tee -a "$log"

echo "sbopkg -i ${PKG}


Obs: Alguns programas instalados pode ter problema na atualização que vai interrompe o 
processo de atualização dos pacotes sbopkg depedendo da ordem que ele se encontra na 
lista de atualização.
" | tee -a "$log"

sbopkg -i ${PKG} | tee -a "$log"


# sbopkg -ki libreoffice -ki libreoffice-helppack -ki libreoffice-langpack -ki mame 
# Both a queuefile and a package were found with the name "libreoffice".
#
# Use (Q)ueuefile, (P)ackage, or (A)bort?: P



# sbopkg -ki clamav -ki dropbox -ki hydra -ki ipscan -ki libevtx -ki libinput -ki libmediainfo -ki libreoffice -ki libreoffice-helppack -ki libreoffice-langpack 
# -ki mame -ki mediainfo -ki meson -ki mutagen -ki mxml -ki opencv -ki phpmyadmin -ki qwt -ki skypeforlinux -ki sleuthkit -ki wine -ki wireshark -ki youtube-dl 


# Para evitar que o sbopkg reinstale um pacote já instalado para acelerar a instalação dos outros pacotes, evitando com isto recompilações desnecessárias, 
# devemos passar o parametro -k. 




# Problema com a opção -k
#
# sbopkg -ki qbittorrent -ki wine -ki youtube-dl 
#
# Use (Q)ueuefile, (P)ackage, or (A)bort?: P
# Both a queuefile and a package were found with the name "qbittorrent".
#
# No valid packages found. Exiting.



# Não identifica a atualização do pacote psycopg2
#
#
# Programas instalados via sbopkg já estão atualizados no seu sistema.
#
# # sbopkg -c
# [ Checking for potential updates ]
# This may take a few moments. Press <ESC> to abort.
# 100%[======================================================================================================================================]
# Listing installed SBo repository for Slackware 14.2 packages and flagging
# potential updates...
#
# psycopg2:
#  POTENTIAL UPDATE
#  Installed version:  psycopg2-2.7.6.1-x86_64-1_SBo
#  Repo version:  psycopg2-2.7.7-x86_64-1_SBo
#  Note: repo version not obtainable by standard method, may be inaccurate.
#
# Potential update list complete.
#
#



# https://www.vivaolinux.com.br/topico/Shell-Script/Apagar-ultimo-caracter-da-linha
# http://meumundotux.blogspot.com/2016/09/solucionando-dependencias-no-sbopkg.html



# rm -Rf $log

sleep 30

clear


# ----------------------------------------------------------------------------------------


echo "
Faxina...
" | tee -a "$log"

sleep 5


echo "
Executando sbopkg -o ...


Remover o cache de pacotes obsoletos (Usar a opção d ou D)
 
(K)eep or (D)elete these files?: D
" | tee -a "$log"

# Examina por sources obsoleto e pergunta sobre sua remoção.

sbopkg -o | tee -a "$log"


# ----------------------------------------------------------------------------------------

echo "
Limpando a pasta /tmp/SBo ...
" | tee -a "$log"

rm -Rf /tmp/SBo/*   2>> "$log"

mkdir -p /tmp/SBo   2>> "$log"

# ----------------------------------------------------------------------------------------

# cat /tmp/sbopkg.txt | tee -a "$log"

# cat /tmp/sbopkg.txt

# rm /tmp/sbopkg.txt 2>> "$log"

# ----------------------------------------------------------------------------------------


else 


clear

echo "
Programa sbopkg necessario -> Não instalado  saindo ...


Sbopkg é um programa que usa o repositório SlackBuilds.org para fornecer um pacote de criação automatizado.

SlackBuilds são scripts que lidam com o processo de compilação e empacotamento de um determinado programa.

Os scripts SlackBuilds entregam os pacotes prontos para instalação.


Site do projeto:

http://www.sbopkg.org/ 



Instalação do Sbopkg


Download em: 

https://sbopkg.org/downloads.php


Após baixar, vá no diretório em que você fez o download e dê:


$ cd ~/Downloads/

# installpkg sbopkg-version-noarch-1_cng.tgz

Ou:

# upgradepkg sbopkg-version-noarch-1_cng.tgz



Fonte:

https://www.vivaolinux.com.br/artigo/Sbopkg-Instalador-de-pacotes-para-Slackware
http://meumundotux.blogspot.com/2016/09/solucionando-dependencias-no-sbopkg.html


"
     # echo "Instalando Automaticamente Programa sbopkg ..."

sleep 10

# exit 2
     
fi


# https://www.vivaolinux.com.br/script/Metodo-para-verificar-e-instalar-pacotes


# ----------------------------------------------------------------------------------------

clear

echo "Verifique o arquivo $log."

sleep 5

cat "$log"

# cat /tmp/sbopkg.txt | tee -a "$log"

# rm /tmp/sbopkg.txt

# ----------------------------------------------------------------------------------------


# https://www.vivaolinux.com.br/topico/Slackware/Atualizando-o-Kernel-do-Slackware-Linux-sem-dar-break-no-sistema
# https://sempreupdate.com.br/como-descobrir-versao-do-seu-kernel-ou/
# http://www.bosontreinamentos.com.br/shell-script/shell-scripting-criando-caixas-de-dialogo-tui-com-dialog/
# https://aurelio.net/shell/dialog/
# https://help.gnome.org/users/zenity/stable/info.html.pt_BR
# https://www.vivaolinux.com.br/dica/Kernel-3193-smp-no-Slackware-Current
# https://www.vivaolinux.com.br/topico/Slackware/Nao-consigo-fazer-a-substituicao-da-Kernel-no-Freenix
# https://www.vivaolinux.com.br/topico/Slackware/Problema-com-kernel-generico-no-Slackware-vmlinuz-generic-44261-kernel-panic/?pagina=1
# https://www.vivaolinux.com.br/topico/Slackware/Duvida-sobre-Kernel-Generic-e-Grub
# https://docs.slackware.com/slackware:beginners_guide#switch_to_a_generic_kernel
# https://www.vivaolinux.com.br/dica/Bootsplash-no-Slackware
# https://www.vivaolinux.com.br/dica/Slackware-100-Livre
# https://www.vivaolinux.com.br/topico/Slackware/Duvida-sobre-Kernel-Generic-e-Grub
# https://docs.slackware.com/slackware:beginners_guide#switch_to_a_generic_kernel
# https://www.vivaolinux.com.br/artigo/Gerenciamento-de-pacotes-no-Slackware-Linux?pagina=2
# https://www.vivaolinux.com.br/topico/Slackware/Filtrar-gera-lista-de-programas-e-instalar/


}




# ----------------------------------------------------------------------------------------


# Verificar se o arquivo existe

if [ -e "/etc/os-release" ] ; then


echo "
O arquivo /etc/os-release existe...
"

sleep 2


else

clear

echo "
O arquivo /etc/os-release não existe...
"


exit


fi


# ----------------------------------------------------------------------------------------


# Tipos de distribuições Linux

distribuicao_linux=$(cat /etc/*-release | egrep "PRETTY_NAME" | cut -d = -f 2 | tr -d '"')



 if [[ "$distribuicao_linux" == *"Void Linux"* ]]; then

       void


 elif [[ "$distribuicao_linux" == *"Ubuntu"* || "$distribuicao_linux" == *"Debian"* || "$distribuicao_linux" == *"Kali"*  ]]; then

       echo -e "\n${GREEN}Atualizando distribuições Linux de base debian.... ${NC}\n"  

      # PRETTY_NAME="Ubuntu 18.04.1 LTS"
      # PRETTY_NAME="Ubuntu 22.04.2 LTS"
      # PRETTY_NAME="Kali GNU/Linux Rolling"
      # PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
                         
      debian
      

 elif [[ "$distribuicao_linux" == *"Red Hat Enterprise Linux"* ]]; then
 
       echo -e "\n${GREEN}Atualizando o Red Hat Enterprise Linux.... ${NC}\n" 
             
       # PRETTY_NAME="Red Hat Enterprise Linux Server 7.6 (Maipo)"
       
       RHEL


 elif [[ "$distribuicao_linux" == *"Gentoo"* ]]; then
 
       echo -e "\n${GREEN}Atualizando o Gentoo.... ${NC}\n"  
            
       # PRETTY_NAME="Gentoo/Linux"
              
       gentoo      



 elif [[ "$distribuicao_linux" == *"CentOS"* ]]; then
 
       echo -e "\n${GREEN}Atualizando o CentOS.... ${NC}\n"  
            
       # PRETTY_NAME="CentOS Linux 7 (Core)"
              
       centos


 elif [[ "$distribuicao_linux" == *"SUSE Linux Enterprise"* ]]; then
 
       echo -e "\n${GREEN}Atualizando o openSUSE.... ${NC}\n"  
            
       # PRETTY_NAME="SUSE Linux Enterprise Server 12 SP4"
              
       openSUSE



# elif [[ "$distribuicao_linux" == *""* ]]; then
 
#       echo -e "\n${GREEN}Atualizando o Sabayon.... ${NC}\n"  
            
       # PRETTY_NAME=""
              
#       sabayon
                       

 elif [[ "$distribuicao_linux" == *"Slackware"* ]]; then
 
       echo -e "\n${GREEN}Atualizando o Slackware.... ${NC}\n"  
            
       
              
       slackware
       
                                              	       			
 else

     echo -e "\n${RED}Não foi possível identificar sua distribuição Linux para atualizar...${NC}\n"
    
     # notify-send -i gtk-dialog-info -t 100000 "Atualizar sistema" "\nNão foi possível identificar sua distribuição Linux para atualizar..."
     
     exit
     
 fi
  

    
# PRETTY_NAME="Fedora 17 (Beefy Miracle)"
 
    
    
# https://stackoverflow.com/questions/65361502/getting-os-name-and-version-from-linx-os-release-file
# https://access.redhat.com/discussions/7005193
# https://ubuntuforums.org/showthread.php?t=2404820
# https://unix.stackexchange.com/questions/432816/grab-id-of-os-from-etc-os-release
# https://www.linux.org/docs/man5/os-release.html                
# https://www.baeldung.com/linux/detect-distro
# https://infohub.delltechnologies.com/l/sap-hana-operating-system-upgrade-9/current-operating-system-version-8/
# https://www.zhaowenyu.com/linux-doc/release/os-relase.html
# https://www.shellscriptx.com/2016/12/estrutura-condicional-if-then-elif-else-fi.html


# ----------------------------------------------------------------------------------------


echo "
Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)
"

sleep 2


clamav_update

# lynis_update

# rkhunter_update

# updatedb_update

# fontes_update


# Para atualizar os relatórios do Sarg do Servidor Proxy (Squid).

# Sarg_update


# ----------------------------------------------------------------------------------------

# Programas na pasta /opt

echo "
Programas na pasta /opt (realizar atualização manual):
" | tee -a "$log"

ls -1 /opt/ >> "$log"


# ----------------------------------------------------------------------------------------

# Flatpak


which flatpak 1>/dev/null


if [ $? == 0 ]; then


# ls ~/.local/share/flatpak/



echo "
Todos os flatpaks que você tem no seu sistema (realizar atualização manual - flatpak update):
"  | tee -a "$log"
  
flatpak list  >> "$log"



# echo "
# Atualizando pacotes instalados via flatpak (flatpak update)...

#  " >> | tee -a "$log"


# Como atualizar os pacotes flatpak?

# Para atualizar todos os seus pacotes flatpak, basta rodar o comando:

# flatpak update | tee -a "$log"


# https://plus.diolinux.com.br/t/comandos-basicos-para-gerenciar-pacotes-flatpak-no-linux/35809


fi


# ----------------------------------------------------------------------------------------

# echo "
# Buscando arquivos AppImage...
# " | tee -a "$log"


# .appimage ou .AppImage


# find / -iname "*.appimage" -exec ls -lh {} \;  | tee -a "$log"


# https://askubuntu.com/questions/1438242/finding-a-program-running-as-appimage



# https://diolinux.com.br/tecnologia/alanpope-unsnap-abandonar-snaps.html


echo "

" >> "$log"


# ----------------------------------------------------------------------------------------
 
echo "
---------------------------------------------------------------------------

Mais informações no arquivo de log: $log
"

# echo "
# Conteúdo do arquivo de log:
# "
# cat /tmp/update_*.log  2>/dev/null

# sleep 20


# reiniciar

# ----------------------------------------------------------------------------------------



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

