#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     25/11/2020
# Homepage: https://github.com/tuxslack/scripts   | https://notabug.org/
# Script:   atualiza.sh
# Versão:   0.2
# Realiza atualização do seu sistema.
#
# Data da atualização:  05/10/2023 as 17:24
#
# Licença:  GPL - https://www.gnu.org/
# 
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
# Para mais dicas: https://www.youtube.com/@fernandosuporte/


# A legibilidade sempre deve ser priorizada. O código deverá ser fácil de entender, e ser mantido. - Princípio KISS (Keep It Simple)




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


# ------------------------------------------------------------------------

# Variaveis globais:


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


# export DISPLAY=:0.0


clear


echo "
Antes de atualizar o sistema, é recomendável que você sempre faça um backup completo de seus dados.
"

sleep 5




# Verifica se quem executa é o Root

# Verificar se o usuário tem permissoes de SU


verificar_root(){


# ------------------------------------------------------------------------


if [ "$(id -u)" != "0" ]; then

echo -e "\nVocê deve executar este script como Root! \n"

exit 

else

echo -e "\n${GREEN}Verificação de Root [OK] ${NC}\n"

fi



# ----------------------------------------------------------------------------------------------------

# if [ "`whoami`" != "root" ]
# then
#    echo "Logue como root utilizando o comando: su"

#    exit
# fi


# ----------------------------------------------------------------------------------------------------


# if [ $USER != root ]; then

# echo "Você precisa ser logar como ROOT para executar este script!."

# exit

# else

# echo "Você é root!"

# fi

# ----------------------------------------------------------------------------------------------------



}



verificar_root




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
Testando conexão com à internet...
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



# Atualizar antivirus (Clamav) - freshclam / clamav-unofficial-sigs.sh


clamav_update(){

# Verificar se o programa freshclam esta instalado


# Faço o redirecionamento da saída padrão e do erro padrão para /dev/null. O objetivo 
# é não mostrar nenhum tipo de mensagem.


echo -e "\n------------------------------------------------------------------------"





which freshclam 1> /dev/null 2> /dev/null

if [ "$?" -eq "0" ];
then


killall -9 freshclam                   2>> "$log"

     
echo -e "\n${RED}Atualizando a base de dado do Clamav...${NC}\n"


echo "

" >> "$log"


freshclam   # | tee "$log"

if [ "$?" -eq "0" ];
then 

      echo -e "\n${GREEN}${UPDATE_CLAMAV} ${NC}\n"


else 

      echo -e "\n${RED}${UPDATE_NO_CLAMAV} ${NC}\n"


fi


   
     
else 

     echo -e "\nfreshclam não esta instalado..."


fi



# killall -9 clamav-unofficial-sigs.sh   2>> "$log"
#
# clamav-unofficial-sigs.sh | tee "$log"




echo -e "\n------------------------------------------------------------------------\n"


}



# ------------------------------------------------------------------------

# lynis

lynis_update(){


# Problema => /usr/bin/lynis: line 612: [: -lt: unary operator expected


killall -9 lynis 2>> "$log"


echo "Atualizar a ferramenta de Auditoria - lynis (lynis --check-update  e lynis update info)."

# | tee -a "$log"

lynis update check

lynis update info


}


# ------------------------------------------------------------------------



rkhunter_update(){


killall -9 rkhunter 2>> "$log"


echo "
Rootkits
" | tee -a "$log"

echo "Atualiza a base com as propriedades dos arquivos (rkhunter --propupd)." | tee -a "$log"
rkhunter --propupd | tee -a "$log"

echo "Atualiza a base do rkhunter (rkhunter --update)." | tee -a "$log"
rkhunter --update | tee -a "$log"

echo "Arquivo de log do rkhunter (/var/log/rkhunter.log)." | tee -a "$log"
cat /var/log/rkhunter.log | tee -a "$log"

# https://www.vivaolinux.com.br/artigo/Procurando-rootkits-no-seu-sistema


}



# ------------------------------------------------------------------------


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




# ------------------------------------------------------------------------


# Atualizar as fontes do sistema nas pastas: /usr/share/fonts/TTF/ e ~/fonts


fontes_update(){

echo "
Atualizar as fontes do sistema (.ttf, etc)
" | tee -a "$log"

sleep 2


fc-cache -f -v | tee -a "$log"

}


# ------------------------------------------------------------------------





# Funções para executar a atualização de varios tipos de distribuições Linux.

# ------------------------------------------------------------------------

# Void Linux


void(){


# Como atualizar e limpar o cache de pacotes no Void Linux?


# Para atualizar o seu sistema por completo e remover os pacotes obsoletos do cache, execute os comandos abaixo:



echo -e "\n------------------------------------------------------------------------"

echo -e "\n${YELLOW}${BEGIN_UPDATE} ${NC}\n"

sleep 1

# xbps-install -uy xbps | tee -a "$log" && xbps-install -Suvy  | tee -a "$log"


xbps-install -uy xbps && xbps-install -Suvy

# | tee "$log"


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

# | tee "$log"


if [ "$?" -eq "0" ];
then 

      echo -e "\n${GREEN}${END_CLEAN} ${NC}\n"


else 

     echo -e "\n${RED}${NO_CLEAN} ${NC}\n"


fi


# https://edpsblog.wordpress.com/2016/09/10/dica-atualizacao-de-pacotes-no-void-linux/


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


# ------------------------------------------------------------------------

# Verifique se está usando familia Debian. 

debian=`which apt`

if [ -e "$debian" ]
then
	echo "apt localizado ..."
else
	zenity --error --text="Não foi possível encontrar o apt-get no local definido.

" --width="800" --height="100"   2>/dev/null

	exit
fi

# ------------------------------------------------------------------------


killall -9 apt
killall -9 apt-get

# ------------------------------------------------------------------------


# Verificar se os arquivos existem


if [ -e /var/lib/apt/lists/lock ]
then
  echo 'O arquivo /var/lib/apt/lists/lock existe.'

  sudo rm -Rf /var/lib/apt/lists/lock        | tee "$log"

else

  echo 'O arquivo /var/lib/apt/lists/lock não existe.'

fi


if [ -e /var/lib/dpkg/lock ]
then
  echo 'O arquivo /var/lib/dpkg/lock existe.'

  sudo rm -Rf /var/lib/dpkg/lock             | tee "$log"

else

  echo 'O arquivo /var/lib/dpkg/lock não existe.'

fi



if [ -e  /var/lib/dpkg/lock-frontend ]
then

  echo 'O arquivo /var/lib/dpkg/lock-frontend existe.'

  sudo rm -Rf /var/lib/dpkg/lock-frontend    | tee "$log"

else

  echo 'O arquivo /var/lib/dpkg/lock-frontend não existe.'

fi


# https://www.edivaldobrito.com.br/consertar-um-ubuntu-quebrado/


# ------------------------------------------------------------------------

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

# ------------------------------------------------------------------------


# Realiza uma limpeza geral no sistema

# faxina



echo "
Se esse comando for remover algo veja se não vai desinstalar coisas importantes (apt-get autoremove)
"
sudo apt-get autoremove | tee "$log"


# 0 pacotes atualizados, 0 pacotes novos instalados, 0 a serem removidos e 160 não atualizados.

sudo apt-get install -f   | tee "$log"

sudo dpkg --configure -a  | tee "$log"


sudo apt clean | tee "$log"


echo "
Atualizando a lista de pacotes:
" | tee "$log"


# W: Falhou ao buscar http://repository.spotify.com/dists/stable/InRelease As assinaturas a seguir não puderam ser verificadas devido à 
# chave pública não estar disponível: NO_PUBKEY 4773BD5E130D1D45
# W: Falhou o download de alguns ficheiros de índice. Foram ignorados ou os antigos foram usados em seu lugar.


echo "apt-get update

É usado para baixar as informações do pacote de todas as fontes configuradas . Para posteriormente trabalhar 
nesses pacotes, atualizações ou pesquisar e exibir detalhes sobre todos os disponíveis para instalação.
" | tee "$log"

sudo apt-get update | tee "$log"


# sudo apt update --fix-missing | tee "$log"


sudo apt install -f  | tee "$log"


sudo dpkg --configure -a  | tee "$log"



clear

echo "apt-get upgrade

É usado para instalar atualizações disponíveis de todos os pacotes instalados atualmente no sistema das 
fontes configurados via sources.list. Novos pacotes serão instalados se for necessário para satisfazer 
dependências , mas os pacotes existentes não serão removidos. E se um upgrade para um pacote requer a 
remoção de um pacote instalado o upgrade para este pacote não será executado.


Lista atualizada

Instalando os novos pacotes:
" | tee "$log"

sudo apt-get upgrade | tee "$log"

# apt full-upgrade | tee "$log"

sudo apt dist-upgrade | tee "$log"


sudo apt-get install -f | tee "$log"

sudo dpkg --configure -a | tee "$log"


echo "
Se esse comando for remover algo veja se não vai desinstalar coisas importantes (apt-get autoremove)
" | tee "$log"

sudo apt-get autoremove | tee "$log"



# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)

# geral


# Realiza uma limpeza geral no sistema

# faxina




echo "
Pacotes atualizados.


Finalmente, reinicie o sistema usando o comando:

$ sudo reboot


Aviso: Esse método pode não funcionar para todos.


" | tee "$log"



# exit


# Fonte: man apt ou man apt-get


# sudo = Superuser
#
# Permite que um usuário autorizado execute um comando como super usuário ou outro usuário, conforme especificado 
# pela política de segurança. A identificação (uid) real do usuário invocado é usada para determinar o nome de 
# usuário o qual será consultado a política de segurança .

# Fonte: man sudo


# ------------------------------------------------------------------------




}




# ------------------------------------------------------------------------

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



# --------------------------------------------------------------------------------------------------------

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

# --------------------------------------------------------------------------------------------------------




echo -e "                                               \033[1;34m***************************************************************"
echo -e "                                               \033[1;34m**            \033[1;37mScript para Atualizacao de Sistema             \033[1;34m**"
echo -e "                                               \033[1;34m**                   \033[1;37m                   \033[1;34m**"
echo -e "                                               \033[1;34m**                \033[1;37mCoordenacao de Suporte e Rede              \033[1;34m**"
echo -e "                                               \033[1;34m**   \033[1;32mGiuliano Domingues - \033[1;31mgiuliano.domingues@esporte.gov.br  \033[1;34m**"
echo -e "                                               \033[1;34m***************************************************************"

echo -e "\033[1;35mVerificando Atualizacoes!"
echo -e "\033[1;31mAguarde . . ."
echo -e "\033[1;32m"

emerge sync | tee "$log"
 
echo -e "\033[1;35mAtualizando a Arvore do seu Sistema"

updatedb | tee "$log"
 
env-update | tee "$log"

echo -e "\033[1;31mEnjoy"
echo ""



# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)

# geral


# Realiza uma limpeza geral no sistema

# faxina


}

# ------------------------------------------------------------------------






# Centos


centos(){



# https://www.vivaolinux.com.br/artigo/CentOS-7-Guia-pratico-pos-instalacao
# https://atendimento.redehost.com.br/hc/pt-br/articles/210101838-Atualizando-o-CentOS-sem-causar-Kernel-Panic
# https://access.redhat.com/documentation/pt-br/red_hat_network_satellite/5.4/html/reference_guide/pup-yum



# --------------------------------------------------------------------------------------------------------

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

# --------------------------------------------------------------------------------------------------------


clear

echo "
Verificar o idioma do sistema:
"
echo $LANG 


# Para editar o arquivo de configuração do gerenciador de pacotes Yum (Yellow dog Updater, Modified).

# nano /etc/yum.conf


# Verificar o repositório atual: 

# yum repolist  | tee "$log"


# CONFIGURANDO NTFS


# Configurando NTFS, caso necessário. Instale o repositório EPEL: 

# yum install epel-release | tee "$log"


# Instale o suporte ntfs-3g: 

# yum install ntfs-3g  | tee "$log"


# Pesquise no terminal pelos pacotes do "libreoffice" disponíveis: 

# yum search libreoffice | tee "$log"


echo " 

A fundação do Atualizador de Pacotes é o gerenciador de pacotes do Yum, desenvolvido pela Duke University para 
aprimorar a instalação dos RPMs. O yum busca repositórios suportados para pacotes e suas dependências, portanto 
devem ser instalados juntos para resolver problemas de dependência. O Red Hat Enterprise Linux 5 usa o yum para 
buscar pacotes e instalar pacotes.


Obs: Após o yum analisar seu sistema operacional ele vai exigir confirmação da atualização, para confirmar digite y.

yum update...
" | tee "$log"

yum update | tee "$log"


echo "
yum upgrade...
" | tee "$log"

yum upgrade | tee "$log"



echo "
Este comando permite que você determine se quaisquer atualizações estão disponíveis para seus pacotes instalados. 
O yum retorna uma lista de todas as atualizações de pacote a partir de todos os repositórios caso algum esteja disponível.
" | tee "$log"

yum check-update | tee "$log"



# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)

# geral


# Realiza uma limpeza geral no sistema

# faxina


}

# ------------------------------------------------------------------------



# Sabayon



sabayon(){


# https://www.vivaolinux.com.br/topico/Sabayon-Linux/Atualizacoes-7
# https://cleuber.com.br/index.php/2016/06/21/conhecendo-o-entropy-e-atualizando-o-sabayon


# --------------------------------------------------------------------------------------------------------

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

# --------------------------------------------------------------------------------------------------------


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
" | tee "$log"

equo update | tee "$log"


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

" | tee "$log"

# equo repo mirrorsort sabayonlinux.org | tee "$log"



echo "
Atualizando o Programa Entropy
" | tee "$log"

equo install entropy | tee "$log"


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

" | tee "$log"

equo upgrade --ask | tee "$log"



# Para procurar pacote, com entropy ou com portage:

# equo search pacote | tee "$log"

# emerge -s pacote   | tee "$log"



# Para instalar

# sudo equo install --verbose pacote | tee "$log"
#
# ou
#
# sudo emerge -v pacote | tee "$log"



# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)

# geral


# Realiza uma limpeza geral no sistema

# faxina


}


# ------------------------------------------------------------------------



# openSUSE



openSUSE(){


# --------------------------------------------------------------------------------------------------------

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

# --------------------------------------------------------------------------------------------------------


echo '
Na parte gráfica

- Acesse o Yast no menu principal, dentro do "Yast acesse "Software" acesse o icone do "Atualização online"

' | tee "$log"


echo "
Exibir todos os repositórios:
" | tee "$log"
zypper repos | tee "$log"


echo "
Atualizar lista de repositórios
" | tee "$log"
zypper refresh | tee "$log"


echo "
Atualizar pacotes
" | tee "$log"

# zypper update | tee "$log"

zypper up | tee "$log"



# https://www.vivaolinux.com.br/dica/Instalando-Codecs-Multimidia-no-openSUSE-Leap-151
# https://lcomlinux.wordpress.com/2017/05/04/como-atualizar-o-opensuse/
# https://www.linuxdescomplicado.com.br/2015/05/15-comandos-zypper-opensuse.html
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Como-atualizar-o-opensuse-leap-421-via-terminal
# https://pt.opensuse.org/Zypper/Uso


}




# ------------------------------------------------------------------------


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



# Tipos de distribuições Linux

distribuicao_linux=$(cat /etc/*-release | egrep "PRETTY_NAME" | cut -d = -f 2 | tr -d '"')



 if [[ "$distribuicao_linux" == *"Void Linux"* ]]; then

       echo -e "\n${GREEN}Atualizando o Void Linux.... ${NC}\n" 
 
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


# ------------------------------------------------------------------------


echo "
Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)
"

sleep 2


clamav_update

# lynis_update

# rkhunter_update

# updatedb_update

# fontes_update


# ------------------------------------------------------------------------

 
echo -e "\nMas informações no arquivo de log: $log\n"

echo "
---------------------------------------------------------------------------

Conteúdo do arquivo de log:
"
cat /tmp/update_*.log  2>/dev/null

# sleep 20


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

