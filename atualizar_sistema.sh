#!/bin/bash
#
# Por Fernando Souza
# Data: 25/11/2020
# Licença: GPL <https://www.gnu.org/>
# Versão: 0.4
# Script: 
#
#
#
# Falta automatizar a tela do  "slackpkg upgrade-all" e do "sbopkg -o"
#
#
# Atualização em https://notabug.org/
#
# Realiza atualização do seu sistema.
#
#
# Por mais segurança que o Linux tenha, é sempre necessário estar atento às atualizações recorrentes em diversas distribuições.
#
#
# Como usar:
#
# mv atualizar_sistema.sh /usr/local/bin/
#
# chmod +x /usr/local/bin/atualizar_sistema.sh
#
# $ atualizar_sistema.sh 
#
#
# Para verificar o md5sum do arquivo atualizar_sistema.sh
#
# $ md5sum atualizar_sistema.sh
# 
#
# Para debug o script (#!/bin/bash -x)
#
# Muitas vezes configuramos um shell script (bash) e gostaríamos de saber O QUE está sendo feito linha-a-linha, ou então ONDE 
# existe um erro que force o script a interromper a sequência. 
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
# Melhor é criar um repositório local, assim vc controla as atualizações. 
#
#
# https://www.vivaolinux.com.br/topico/Servidores-Linux-para-iniciantes/Gestor-de-atualizacoes
#
# https://www.vivaolinux.com.br/dica/Acompanhando-o-(bash)-shell-script-debug
# https://www.vivaolinux.com.br/dica/Configuracoes-de-rede-com-o-comando-ip
# https://www.vivaolinux.com.br/topico/Slackware/Atualizacao-do-Slackware-1
#
#
#
########################################################################################################


# Variaveis globais



# log="/tmp/log.txt"

log="/tmp/relatorio.log"


rm -Rf "$log"


clear

which tee


sleep 1


# ----------------------------------------------------------------------------------------------------

verificar_root(){


# Verificar se o usuário tem permissoes de SU

# ----------------------------------------------------------------------------------------------------

if [ "`whoami`" != "root" ]
then
    echo "Logue como root utilizando o comando: su"

    exit 1
fi


# ----------------------------------------------------------------------------------------------------

# if [ "$(id -u)" != "0" ]; then

# if [ $USER != root ]; then

# echo "Você precisa ser logar como ROOT para executar este script!."

# exit 1

# else

# echo "Você é root!"

# fi

# ----------------------------------------------------------------------------------------------------

}




# ----------------------------------------------------------------------------------------------------




# Realiza uma limpeza geral no sistema


faxina1(){


echo "

Existem várias maneiras de liberar espaço no Linux limpando dados inúteis.

Embora você não precise fazer esta limpeza sempre, é interessante fazê-la a cada 6 meses ou 1 ano.

"  | tee "$log"

# =====================================================================================================

clear

echo "
Pasta cache
" | tee "$log"

du -lhs ~/.cache | tee "$log"

# rm -r -v ~/.cache | tee "$log"

# ----------------------------------------------------------------------------------------------------


# A barra antes do comando tee é usada para redirecionar a saída de um comando A para um comando B.

echo "
Tamanho da pasta /tmp atualmente
" | tee "$log"

du -lhs /tmp | tee "$log"

# https://www.vivaolinux.com.br/topico/Comandos/Listar-Pasta-e-tamanho



echo "
Deseja remove todos os arquivos do diretorio /tmp? (s/n)"
read resposta

if [[ $resposta =~ [Ss]$ ]]; then 

clear

echo "
Limpando a pasta /tmp ...
" | tee "$log"

rm -Rf /tmp/.*   2>> "$log"

rm -Rf /tmp/*    2>> "$log"


echo "
Tamanho da pasta /tmp depois:
" | tee "$log"

du -lhs /tmp | tee "$log"


fi


# =====================================================================================================

echo "
Com o tempo, os thumbnails vão se acumulando e ocupando espaço no seu disco.
É seguro removê-los - o sistema os recria à medida que vai precisando deles depois.

"

du -h ~/.thumbnails/ | tee "$log"

rm -vfr ~/.thumbnails/normal/*       2>> "$log"

rm -f ~/.cache/thumbnails/normal/*   2>> "$log"


# =====================================================================================================

echo "
Sabayon Linux
" | tee "$log"

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

equo cleanup      | tee "$log"

equo cache clean  | tee "$log"


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

cat /etc/fstab | grep -i  tmpfs  | tee "$log"
# tmpfs            /dev/shm         tmpfs       defaults         0   0


df -H | grep -i tmpfs  | tee "$log"
# devtmpfs        4,0G     0  4,0G   0% /dev
# tmpfs           4,0G  1,3M  4,0G   1% /run
# tmpfs           4,0G   26M  3,9G   1% /dev/shm


echo '

VOLTANDO ÀS CONFIGURAÇÕES NORMAIS

Se você usar SWAP em RAM, no Sabayon, como eu fiz: ZSWAP em Sabayon Linux. Controlável, "Ligável" e "Desligável". - Mundo GNU e vários Links citados: ZSWAP em Sabayon Linux. Continuação. Testando a ZSWAP Controlável. - Mundo GNU, pode querer, após atualizar novamente, remover os comentários das linhas e reativar os diretórios temporários na RAM. 

Pronto, problema resolvido e Sabayon atualizado.

'  | tee "$log"

# https://www.vivaolinux.com.br/dica/Sabayon-Linux-Entropy-sem-espaco-temporario-para-atualizar-Resolvido


# =====================================================================================================


echo "
Limpeza...
"

du -sh /var/cache/apt/archives  | tee "$log"

rm -Rf /var/cache/apt/archives/*.deb       2>> "$log"
rm -Rf /var/cache/apt/archives/partial/*   2>> "$log"
rm -Rf /var/cache/apt/archives/lock        2>> "$log"


rm -Rf /var/lib/apt/lists/*                2>> "$log"

mkdir -p /var/lib/apt/lists/partial


apt-get clean -y | tee "$log"

apt-get autoclean -y | tee "$log"


apt-get autoremove --purge -y | tee "$log"





apt-get install -f | tee "$log"

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



# ----------------------------------------------------------------------------------------------------

# deborphan

# Para eliminar bibliotecas Orfãs:

# deborphan | xargs sudo apt-get -y remove --purge

# apt-get remove $(deborphan)

# sudo deborphan | xargs sudo apt-get -y remove --purge


# Debian: A OPÇÃO --PURGE
#
# A opção --purge indica que queremos remover, não somente o pacote em questão, mas também todos os seus arquivos de configuração.
#
# Se o objetivo é manter o seu sistema sempre limpo e livre de coisas inúteis, usar a opção --purge, ao remover um pacote que não 
# será mais usado, sob hipótese alguma, é mandatório.


# =====================================================================================================


echo "
Remover o cache de pacotes obsoletos (Usar a opção d ou D)
 
(K)eep or (D)elete these files?: D
" | tee "$log"

# Examina por sources obsoleto e pergunta sobre sua remoção.

sbopkg -o | tee "$log"

# ----------------------------------------------------------------------------------------------------

echo "
Limpando a pasta /tmp/SBo ...
" | tee "$log"

rm -Rf /tmp/SBo/*   2>> "$log"

mkdir -p /tmp/SBo   2>> "$log"

# ----------------------------------------------------------------------------------------------------


echo "
Limpando os arquivos na pasta /var/log ...
" | tee "$log"

rm -Rf /var/log/sbopkg/sbopkg-build-log  2>> "$log"
rm -Rf /var/log/httpd/error_log          2>> "$log"
rm -Rf /var/log/teamviewer*              2>> "$log"


# =====================================================================================================


echo "
Limpando as imagens antigas do Kernel
" | tee "$log"


echo "
Essa versão do kernel não deve ser removida.

kernel em uso:
" | tee "$log"

uname -a | tee "$log"

uname -r | tee "$log"


# Como listar as versões do kernel presentes no sistema?

# Nas distribuições baseadas no Red Hat (Fedora, CentOS, RHEL etc.):

rpm -qa kernel | tee "$log"

# Para remover as versões do kernel que não estão mais em uso, no Red Hat e nas distribuições derivadas deste, use o yum:

sudo yum kernel | tee "$log"


# Ao dar este comando, todas as versões desnecessárias serão removidas.
# Não se preocupe, o Linux não fará a sandice de remover o atual, que está sendo usado.
# Mas, para quem deseja ser mais específico, e possível indicar exatamente qual versão você deseja remover:
#
# sudo yum remove kernel-3.7.8-202.fc18.x86_64




# Para quem usa o Debian (Ubuntu, Mint etc.), para ver a lista de todas as versões do kernel instaladas no seu sistema.

dpkg --list | grep linux-image  | tee "$log"

dpkg -l 'linux-im*' | tee "$log"

# Mostra a mesma lista, só que mais enxuta:
 
dpkg-query -l | awk '/linux-image-*/ {print $2}' 2>> "$log"


# sudo apt-get --purge remove linux-image-3.8.0-35-generic


# O código do Mark McBride, a seguir, remove todas as versões do kernel, exceto a atual 

# dpkg -l 'linux-*' | sed '/^ii/!d;/'"$(uname -r | sed "s/\(.*\)-\([^0-9]\+\)/\1/")"'/d;s/^[^ ]* [^ ]* \([^ ]*\).*/\1/;/[0-9]/!d' | xargs sudo apt-get -y purge



# É importante atualizar o GRUB:

update-grub | tee "$log"

# ----------------------------------------------------------------------------------------------------

# Use o "localepurge" para eliminar os locales de outros idiomas. Você não precisará usar idiomas como o russo e o japonês no 
# teu sistema, não é mesmo? Antes de eliminar os idiomas que você não vai querer em teu sistema, marque as opções pt, pt_BR 
# para pacotes em português, en e en_US para pacotes em inglês.

# localepurge


# ----------------------------------------------------------------------------------------------------

echo "
Esvaziar a lixeira
" | tee "$log"

du -lhs ~/.local/share/Trash 2>> "$log"

rm -Rf ~/.local/share/Trash 2>> "$log"


# ----------------------------------------------------------------------------------------------------

echo "KDE" | tee "$log"

du -lhs  ~/.kde/cache-* | tee "$log"

rm -Rf ~/.kde/cache-*    2>> "$log"

rm -Rf ~/.kde/share/config/konq_history 2>> "$log"


# ----------------------------------------------------------------------------------------------------

echo "
Apagar todos os arquivos de log da pasta /var/log
" | tee "$log"

find /var/log -name "*.log.gz"  -exec rm -f {} \;  | tee "$log"
find /var/log -name "*.log"     -exec rm -f {} \;  | tee "$log"
find /var/log -name "*.log.1"   -exec rm -f {} \;  | tee "$log"
find /var/log -name "*.log.old" -exec rm -f {} \;  | tee "$log"


rm -rf /var/log/messages    2>> "$log"
rm -rf /var/log/messages.1  2>> "$log"

rm -rf /var/log/syslog      2>> "$log"
rm -rf /var/log/syslog.1    2>> "$log"


# rm -rf /var/log/squid/*

# ----------------------------------------------------------------------------------------------------

clear

echo "
Limpar o histórico arquivos recentes
" | tee "$log"

rm  ~/.local/share/recently-used.xbel  2>> "$log"


# ----------------------------------------------------------------------------------------------------

# rm $log


# ----------------------------------------------------------------------------------------------------





# https://elias.praciano.com/2014/04/como-fazer-faxina-no-ubuntu-linux/
# https://pplware.sapo.pt/linux/4-dicas-para-dar-uma-limpeza-no-seu-linux-ubuntu/
# https://sempreupdate.com.br/bons-habitos-que-todo-usuario-linux-deve-conhecer/
# https://sejalivre.org/fazendo-uma-limpeza-completa-no-seu-ubuntu-em-modo-texto-e-grafico/
# https://www.edivaldobrito.com.br/alternativas-ao-ccleaner-no-linux/
# http://dclarks.blogspot.com/2012/02/limpar-os-arquivos-de-varlog.html
# https://lists.debian.org/debian-user-portuguese/2007/12/msg00409.html
# https://nooblinuxnodes.blogspot.com/2017/07/limpeza-do-ubuntu-dica.html
# https://www.vivaolinux.com.br/dica/Sabayon-Linux-Entropy-sem-espaco-temporario-para-atualizar-Resolvido


}






# ----------------------------------------------------------------------------------------------------





# Função verifica se o usuario tem acesso a internet.

verifica_internet(){

clear


# ----------------------------------------------------------------------------------------------------


echo "Testando se a conexão com a Internet está ativa..."

ping www.google.com.br -c 1 >/dev/null


if [ "$?" = "0" ] ;
then
   echo "Conexao ativa..."

sleep 3
clear



else


aviso

exit 2

fi


# ----------------------------------------------------------------------------------------------------


# Permite testar a conexão com a Internet.


# echo "
#
# Verificar a conexão com a internet.
#
# "

# O site do Google, tem bem menos chance de estar fora do ar.

# if ! ping -c 7 www.google.com.br ; then

# echo
# echo "Internet está PARADA !!!"

# exit 3

# echo

# else

# echo
# echo "Internet ok !!!"
# echo

# fi


# https://www.vivaolinux.com.br/script/Testar-conexao-com-a-internet


# ----------------------------------------------------------------------------------------------------


clear


}



# ----------------------------------------------------------------------------------------------------


# Função chamada caso o usuario não tenha acesso a internet.


aviso() {

clear

dialog                                         \
--backtitle "Atualização do sistema"           \
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


# ----------------------------------------------------------------------------------------------------


# Verifique se tem o zenity instalado no sistema. 

zenity=`which zenity`

if [ -e "$zenity" ]
then
	echo "zenity localizado ...
"

sleep 1

clear

else
	echo "
Não foi possível encontrar o zenity no local definido.
"

	exit
fi

# ----------------------------------------------------------------------------------------------------


# Verifique se tem o dialog instalado no sistema. 

dialog=`which dialog`

if [ -e "$dialog" ]
then
	echo "dialog localizado ...
"

sleep 1

clear


else
	zenity --error --text="Não foi possível encontrar o dialog no local definido.

" --width="800" --height="100"   2>/dev/null

	exit
fi


# ----------------------------------------------------------------------------------------------------







# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)


geral(){


clear


# ----------------------------------------------------------------------------------------------------


echo "
Atualizar as fontes do sistema (.ttf, etc)
" | tee "$log"

sleep 2


fc-cache -f -v | tee "$log"




echo "
Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)
" | tee "$log"

sleep 2

# ----------------------------------------------------------------------------------------------------



killall -9 freshclam                   2>> "$log"

killall -9 clamav-unofficial-sigs.sh   2>> "$log"


echo "
Atualizar antivirus (clamav) - freshclam e clamav-unofficial-sigs.sh
" | tee "$log"

freshclam | tee "$log"

clamav-unofficial-sigs.sh | tee "$log"

# ----------------------------------------------------------------------------------------------------

clear

killall -9 lynis 2>> "$log"


echo "
Atualizar a ferramenta de Auditoria - lynis (lynis --check-update  e lynis update info).
"

lynis --check-update | tee "$log"

lynis update info    | tee "$log"

# ----------------------------------------------------------------------------------------------------

clear

killall -9 rkhunter 2>> "$log"


echo "
Rootkits
" | tee "$log"

echo "Atualiza a base com as propriedades dos arquivos (rkhunter --propupd)." | tee "$log"
rkhunter --propupd | tee "$log"

echo "Atualiza a base do rkhunter (rkhunter --update)." | tee "$log"
rkhunter --update | tee "$log"

echo "Arquivo de log do rkhunter (/var/log/rkhunter.log)." | tee "$log"
cat /var/log/rkhunter.log | tee "$log"

# https://www.vivaolinux.com.br/artigo/Procurando-rootkits-no-seu-sistema


# ----------------------------------------------------------------------------------------------------


clear


dialog  --backtitle 'Atualizando sistema' --yesno "

updatedb

Ao ser invocado, este utilitário varre todo o sistema gerando uma listagem completa que por sua vez é copiada para o banco de dados.

O modo como o comando updatedb atualiza o banco de dados é regulado pelo arquivo de configuração /etc/updatedb.conf

Como o banco de dados é uma imagem da situação do sistema em um determinado momento, pode ocorrer que este banco de dados esteja desatualizado quando consultado. Por esta razão, a frequencia de atualização irá depender das necessidades de uso do utilitário. Dependendo do tamanho de seu sistema, você pode agendar, via cron, a execução do updatedb a cada hora, a cada dez minutos, enfim, com a frequencia que for mais conveniente.

No exemplo abaixo de crontab, o comando updatedb será executado a cada hora cheia.

  # m h dom mon dow usercommand
  0 * * * * root  updatedb


" 0 0

     # Verifica as respostas do usuário.

     if [ $? -eq 0 ]
     then 

            clear

            echo "
updatedb
" | tee "$log"

            updatedb | tee "$log"

            clear

      else 

           clear

           echo "
Continuar no programa..." 


    fi





# http://www.dicas-l.com.br/arquivo/o_comando_locate_listagem_de_arquivos_do_sistema.php


# ----------------------------------------------------------------------------------------------------





}



# ----------------------------------------------------------------------------------------------------




openSUSE(){

clear

verificar_root


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








voidlinux(){

clear

verificar_root



# Como atualizar e limpar o cache de pacotes no Void Linux.


echo "Para atualizar o seu sistema por completo e remover os pacotes obsoletos do cache, execute os comandos abaixo:

$ sudo xbps-install -Su"


sudo xbps-install -Su | tee "$log"

sudo xbps-remove -0 | tee "$log"




# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)

geral



# Realiza uma limpeza geral no sistema

faxina


# https://edpsblog.wordpress.com/2016/09/10/dica-atualizacao-de-pacotes-no-void-linux/

}






sabayon(){

clear

# https://www.vivaolinux.com.br/topico/Sabayon-Linux/Atualizacoes-7
# https://cleuber.com.br/index.php/2016/06/21/conhecendo-o-entropy-e-atualizando-o-sabayon


verificar_root


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

geral


# Realiza uma limpeza geral no sistema

faxina


}




centos(){


clear

verificar_root


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

geral


# Realiza uma limpeza geral no sistema

faxina


}






gentoo(){


# Atualização do sistema (Gentoo)
#
# Publicado por Giuliano C. Domingues 30/08/2006 
#
# Este simples script faz a atualização do seu sistema Gentoo.
#
#
# https://www.vivaolinux.com.br/script/Atualizacao-do-sistema-(Gentoo)


clear

verificar_root


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
echo -e "                                               \033[1;34m**                   \033[1;37mMinisterio do Esporte                   \033[1;34m**"
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

geral


# Realiza uma limpeza geral no sistema

faxina


exit 0


}








debian(){


clear

verificar_root


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

# --------------------------------------------------------------------------------------------------------

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

# --------------------------------------------------------------------------------------------------------


# Realiza uma limpeza geral no sistema

faxina



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

geral


# Realiza uma limpeza geral no sistema

faxina




echo "
Pacotes atualizados.


Finalmente, reinicie o sistema usando o comando:

$ sudo reboot


Aviso: Esse método pode não funcionar para todos.


" | tee "$log"



exit 0


# Fonte: man apt ou man apt-get


# sudo = Superuser
#
# Permite que um usuário autorizado execute um comando como super usuário ou outro usuário, conforme especificado 
# pela política de segurança. A identificação (uid) real do usuário invocado é usada para determinar o nome de 
# usuário o qual será consultado a política de segurança .

# Fonte: man sudo


}







# ====================================================================================================


# Para atualizar o Slackware


slackware(){

#
# Fernando Souza
# Data: 04/12/2018
# Licenca: GPL
#
#
#
# Manter seu sistema sempre atualizado com as atualizações de segurança mais recentes. 
#
# https://www.vivaolinux.com.br/artigo/Gerenciamento-de-pacotes-no-Slackware-Linux?pagina=2
#
#
# mirrors
#
# http://www.slackware.com/getslack
#
#
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
#
#
######################################################################################################


clear


titulo="Atualização do Slackware"


# ----------------------------------------------------------------------------------------------------


verificar_root

# --------------------------------------------------------------------------------------------------------


# Chama a função verifica_internet

verifica_internet


# --------------------------------------------------------------------------------------------------------

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

# ----------------------------------------------------------------------------------------------------





sbopkg_qui() {


#
# Por Fernando Souza
# Data: 24/01/2019
# Licença: GPL <https://www.gnu.org/>
# Versão: 0.2
# Script: atualizar_pacote_sbopkg.sh
#
# Atualização em https://notabug.org/meianoite
#
#
# Para quem, como eu, usa o Slackware diariamente. 
#
# Realiza as atualizações dos programas instalados via sbopkg no seu Slackware.
#
#
#
#
# Changelog:
#
#
# Data: 26/01/2019
#
# Verificar se usuário com o qual eu estou executando é o root.
# Verificar se o programa Sbopkg esta instalado.
# Testar a conexão com a Internet.
# Faz uma interação com o usuário (s/n) .
# Sincronizando a base de dados do sbopkg.
# Buscando as atualizações dos programas.
# Instala as atualizações dos programas.
#
#
#
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
#
#
#
#
#
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
#
#
#
# Como usar:
#
# mv atualizar_pacote_sbopkg.sh /usr/local/bin/
#
# chmod +x /usr/local/bin/atualizar_pacote_sbopkg.sh
#
# # atualizar_pacote_sbopkg.sh
#
#
# Para verificar o md5sum do arquivo atualizar_pacote_sbopkg.sh
#
# $ md5sum atualizar_pacote_sbopkg.sh
# 
#
# https://www.vivaolinux.com.br/topico/Slackware/Filtrar-gera-lista-de-programas-e-instalar/
#
########################################################################################################

clear

# Variaveis locais

versao_slackware=$(cat /etc/slackware-version | awk '{print $2}')


rm -Rf $log

# =====================================================================================================

clear


# Verificar se usuário com o qual eu estou executando é o root.


verificar_root


# =====================================================================================================

clear


verifica_internet


# =====================================================================================================



clear


dialog  --backtitle 'Atualizando sistema' --yesno '

Atualizações sempre contêm seus perigos. Faça sempre backup. Por sua conta e risco!!



Problemas comuns:


$ which gksu
/usr/bin/gksu

$ gksu
gksu: error while loading shared libraries: libgtop-2.0.so.10: cannot open shared object file: No such file or directory



# ldd /usr/bin/gksu
	linux-vdso.so.1 (0x00007ffca598d000)
	libgksu2.so.0 => /usr/lib64/libgksu2.so.0 (0x00007f84de58e000)
	libstartup-notification-1.so.0 => /usr/lib64/libstartup-notification-1.so.0 (0x00007f84de385000)
	libgnome-keyring.so.0 => /usr/lib64/libgnome-keyring.so.0 (0x00007f84de161000)
	libgconf-2.so.4 => /usr/lib64/libgconf-2.so.4 (0x00007f84ddf3b000)
	libgtk-x11-2.0.so.0 => /usr/lib64/libgtk-x11-2.0.so.0 (0x00007f84dd900000)
	libgdk-x11-2.0.so.0 => /usr/lib64/libgdk-x11-2.0.so.0 (0x00007f84dd64c000)
	libpangocairo-1.0.so.0 => /usr/lib64/libpangocairo-1.0.so.0 (0x00007f84dd43f000)
	libatk-1.0.so.0 => /usr/lib64/libatk-1.0.so.0 (0x00007f84dd219000)
	libcairo.so.2 => /usr/lib64/libcairo.so.2 (0x00007f84dcef4000)
	libgdk_pixbuf-2.0.so.0 => /usr/lib64/libgdk_pixbuf-2.0.so.0 (0x00007f84dccd2000)
	libgio-2.0.so.0 => /usr/lib64/libgio-2.0.so.0 (0x00007f84dc955000)
	libpangoft2-1.0.so.0 => /usr/lib64/libpangoft2-1.0.so.0 (0x00007f84dc740000)
	libpango-1.0.so.0 => /usr/lib64/libpango-1.0.so.0 (0x00007f84dc4f6000)
	libgobject-2.0.so.0 => /usr/lib64/libgobject-2.0.so.0 (0x00007f84dc2a5000)
	libglib-2.0.so.0 => /usr/lib64/libglib-2.0.so.0 (0x00007f84dbf6e000)
	libfontconfig.so.1 => /usr/lib64/libfontconfig.so.1 (0x00007f84dbd32000)
	libfreetype.so.6 => /usr/lib64/libfreetype.so.6 (0x00007f84dba96000)
	libutil.so.1 => /lib64/libutil.so.1 (0x00007f84db893000)
	libc.so.6 => /lib64/libc.so.6 (0x00007f84db4ca000)
	libpixman-1.so.0 => /usr/lib64/../lib64/libpixman-1.so.0 (0x00007f84db225000)
	libEGL.so.1 => /usr/lib64/../lib64/libEGL.so.1 (0x00007f84daffa000)
	libgbm.so.1 => /usr/lib64/../lib64/libgbm.so.1 (0x00007f84dadee000)
	libxcb-shm.so.0 => /usr/lib64/../lib64/libxcb-shm.so.0 (0x00007f84dabec000)
	libXrender.so.1 => /usr/lib64/../lib64/libXrender.so.1 (0x00007f84da9e2000)
	libGL.so.1 => /usr/lib64/../lib64/libGL.so.1 (0x00007f84da77a000)
	libxcb-dri3.so.0 => /usr/lib64/../lib64/libxcb-dri3.so.0 (0x00007f84da578000)
	libxcb-present.so.0 => /usr/lib64/../lib64/libxcb-present.so.0 (0x00007f84da376000)
	libxcb-randr.so.0 => /usr/lib64/../lib64/libxcb-randr.so.0 (0x00007f84da16a000)
	libxcb-xfixes.so.0 => /usr/lib64/../lib64/libxcb-xfixes.so.0 (0x00007f84d9f64000)
	libxcb-render.so.0 => /usr/lib64/../lib64/libxcb-render.so.0 (0x00007f84d9d5b000)
	libxcb-shape.so.0 => /usr/lib64/../lib64/libxcb-shape.so.0 (0x00007f84d9b58000)
	libxcb-sync.so.1 => /usr/lib64/../lib64/libxcb-sync.so.1 (0x00007f84d9953000)
	libxshmfence.so.1 => /usr/lib64/../lib64/libxshmfence.so.1 (0x00007f84d9751000)
	libglapi.so.0 => /usr/lib64/../lib64/libglapi.so.0 (0x00007f84d9523000)
	libXdamage.so.1 => /usr/lib64/../lib64/libXdamage.so.1 (0x00007f84d9321000)
	libXfixes.so.3 => /usr/lib64/../lib64/libXfixes.so.3 (0x00007f84d911b000)
	libxcb-glx.so.0 => /usr/lib64/../lib64/libxcb-glx.so.0 (0x00007f84d8f05000)
	libxcb-dri2.so.0 => /usr/lib64/../lib64/libxcb-dri2.so.0 (0x00007f84d8d01000)
	libXxf86vm.so.1 => /usr/lib64/../lib64/libXxf86vm.so.1 (0x00007f84d8afc000)
	libXext.so.6 => /usr/lib64/../lib64/libXext.so.6 (0x00007f84d88ea000)
	libdrm.so.2 => /usr/lib64/../lib64/libdrm.so.2 (0x00007f84d86dc000)
	librt.so.1 => /lib64/librt.so.1 (0x00007f84d84d4000)
	libgmodule-2.0.so.0 => /usr/lib64/../lib64/libgmodule-2.0.so.0 (0x00007f84d82d0000)
	libresolv.so.2 => /lib64/libresolv.so.2 (0x00007f84d80b5000)
	libgthread-2.0.so.0 => /usr/lib64/../lib64/libgthread-2.0.so.0 (0x00007f84d7eb3000)
	libexpat.so.1 => /usr/lib64/../lib64/libexpat.so.1 (0x00007f84d7c89000)
	libharfbuzz.so.0 => /usr/lib64/../lib64/libharfbuzz.so.0 (0x00007f84d7a0b000)
	libbz2.so.1 => /lib64/libbz2.so.1 (0x00007f84d77fb000)
	libpng16.so.16 => /usr/lib64/../lib64/libpng16.so.16 (0x00007f84d75c8000)
	libz.so.1 => /usr/lib64/../lib64/libz.so.1 (0x00007f84d73b1000)
	libm.so.6 => /lib64/libm.so.6 (0x00007f84d70a8000)
	libxcb-util.so.1 => /usr/lib64/../lib64/libxcb-util.so.1 (0x00007f84d6ea3000)
	libX11-xcb.so.1 => /usr/lib64/../lib64/libX11-xcb.so.1 (0x00007f84d6ca1000)
	libX11.so.6 => /usr/lib64/../lib64/libX11.so.6 (0x00007f84d6966000)
	libdl.so.2 => /lib64/libdl.so.2 (0x00007f84d6762000)
	libxcb.so.1 => /usr/lib64/../lib64/libxcb.so.1 (0x00007f84d6543000)
	libXdmcp.so.6 => /usr/lib64/../lib64/libXdmcp.so.6 (0x00007f84d633e000)
	libgtop-2.0.so.10 => not found
	libXau.so.6 => /usr/lib64/../lib64/libXau.so.6 (0x00007f84d613b000)
	libffi.so.6 => /usr/lib64/../lib64/libffi.so.6 (0x00007f84d5f33000)
	libpthread.so.0 => /lib64/libpthread.so.0 (0x00007f84d5d16000)
	libdbus-1.so.3 => /usr/lib64/../lib64/libdbus-1.so.3 (0x00007f84d5ac7000)
	libgcrypt.so.20 => /usr/lib64/../lib64/libgcrypt.so.20 (0x00007f84d57ba000)
	libgpg-error.so.0 => /usr/lib64/../lib64/libgpg-error.so.0 (0x00007f84d55a7000)
	libdbus-glib-1.so.2 => /usr/lib64/../lib64/libdbus-glib-1.so.2 (0x00007f84d5380000)
	libXinerama.so.1 => /usr/lib64/../lib64/libXinerama.so.1 (0x00007f84d517e000)
	libXi.so.6 => /usr/lib64/../lib64/libXi.so.6 (0x00007f84d4f6e000)
	libXrandr.so.2 => /usr/lib64/../lib64/libXrandr.so.2 (0x00007f84d4d63000)
	libXcursor.so.1 => /usr/lib64/../lib64/libXcursor.so.1 (0x00007f84d4b58000)
	libXcomposite.so.1 => /usr/lib64/../lib64/libXcomposite.so.1 (0x00007f84d4956000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f84de79e000)



# ldd /usr/bin/gksu | grep "not found"
	libgtop-2.0.so.10 => not found





No lugar do Smplayer e do VLC podemos usar o parole.

removepkg smplayer | tee "$log"
removepkg vlc      | tee "$log"



Parole não abre arquivo .mp4 no Slackware


Parole

Softwares adicionais são necessários.

Parole precisa de Decodificador MPEG-4 AAC para reproduzir este arquivo.
Ele pode ser instalado automaticamente.



$ mediainfo simplescreenrecorder-2019-08-03_01.23.08.mp4 | tee "$log"
General
Complete name                            : simplescreenrecorder-2019-08-03_01.23.08.mp4
Format                                   : MPEG-4
Format profile                           : Base Media
Codec ID                                 : isom (isom/iso2/avc1/mp41)
File size                                : 583 KiB
Duration                                 : 26 s 123 ms
Overall bit rate mode                    : Variable
Overall bit rate                         : 183 kb/s
Writing application                      : Lavf57.56.101

Video
ID                                       : 1
Format                                   : AVC
Format/Info                              : Advanced Video Codec
Format profile                           : High@L4
Format settings                          : CABAC / 4 Ref Frames
Format settings, CABAC                   : Yes
Format settings, Reference frames        : 4 frames
Codec ID                                 : avc1
Codec ID/Info                            : Advanced Video Coding
Duration                                 : 26 s 67 ms
Bit rate                                 : 174 kb/s
Width                                    : 1 440 pixels
Height                                   : 900 pixels
Display aspect ratio                     : 16:10
Frame rate mode                          : Variable
Frame rate                               : 29.885 FPS
Color space                              : YUV
Chroma subsampling                       : 4:2:0
Bit depth                                : 8 bits
Scan type                                : Progressive
Bits/(Pixel*Frame)                       : 0.004
Stream size                              : 553 KiB (95%)
Writing library                          : x264 core 148
Encoding settings                        : cabac=1 / ref=1 / deblock=1:0:0 / analyse=0x3:0x3 / me=dia / subme=1 / psy=1 / psy_rd=1,00:0,00 / mixed_ref=0 / me_range=16 / chroma_me=1 / trellis=0 / 8x8dct=1 / cqm=0 / deadzone=21,11 / fast_pskip=1 / chroma_qp_offset=0 / threads=4 / lookahead_threads=1 / sliced_threads=0 / nr=0 / decimate=1 / interlaced=0 / bluray_compat=0 / constrained_intra=0 / bframes=3 / b_pyramid=2 / b_adapt=1 / b_bias=0 / direct=1 / weightb=1 / open_gop=0 / weightp=1 / keyint=250 / keyint_min=25 / scenecut=40 / intra_refresh=0 / rc=crf / mbtree=0 / crf=23,0 / qcomp=0,60 / qpmin=0 / qpmax=69 / qpstep=4 / ip_ratio=1,40 / pb_ratio=1,30 / aq=1:1,00
Color range                              : Limited
Color primaries                          : BT.709
Transfer characteristics                 : BT.709
Matrix coefficients                      : BT.709
Codec configuration box                  : avcC

Audio
ID                                       : 2
Format                                   : Ogg
Codec ID                                 : mp4a-DD
Duration                                 : 26 s 123 ms
Bit rate mode                            : Variable
Bit rate                                 : 375 b/s
Maximum bit rate                         : 128 kb/s
Sampling rate                            : 48.0 kHz
Stream size                              : 1.20 KiB (0%)
Default                                  : Yes
Alternate group                          : 1




https://www.vivaolinux.com.br/topico/Slackware/Parole-nao-abre-arquivo-mp4







Obs: Dependendo do tempo que ficou o seu sistema sem atualizações pode gera uma 
grande lista de programas para serem atualizados que por sua vez demandara 
muito mais tempo para ser atualizados.


Ex: aircrack-ng, libevtx, libinput, libtorrent-rasterbar, meson, audacity, chessx, clamav, vlc, dropbox, qt, smplayer, libreoffice, qemu, steam, opencv  


Quando o problema for muito complexo dividi-lo em partes....


Vamos por partes (Jack, o Estripador)


O ideal seria dividir em parte as atualizações dos programas para cada dias da semana.


# date
Sáb Jul 20 20:45:51 -03 2019


$ uptime 
 20:45:00 up 10:56,  1 user,  load average: 0,84, 0,87, 0,84



# ifconfig -a
eth0: flags=4099<UP,BROADCAST,MULTICAST>  mtu 1500
        inet 192.168.1.3  netmask 255.255.255.0  broadcast 192.168.1.255
        ether 10:78:d2:db:98:cc  txqueuelen 1000  (Ethernet)
        RX packets 0  bytes 0 (0.0 B)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 0  bytes 0 (0.0 B)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

lo: flags=73<UP,LOOPBACK,RUNNING>  mtu 65536
        inet 127.0.0.1  netmask 255.0.0.0
        inet6 ::1  prefixlen 128  scopeid 0x10<host>
        loop  txqueuelen 1  (Local Loopback)
        RX packets 811  bytes 152511 (148.9 KiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 811  bytes 152511 (148.9 KiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0

ppp0: flags=4305<UP,POINTOPOINT,RUNNING,NOARP,MULTICAST>  mtu 1500
        inet 10.165.182.181  netmask 255.255.255.255  destination 10.64.64.64
        ppp  txqueuelen 3  (Point-to-Point Protocol)
        RX packets 589134  bytes 822608137 (784.5 MiB)
        RX errors 0  dropped 0  overruns 0  frame 0
        TX packets 389770  bytes 25539756 (24.3 MiB)
        TX errors 0  dropped 0 overruns 0  carrier 0  collisions 0




$ date
Dom Jul 21 20:19:16 -03 2019


Reservar um dia só para atualizar o qt o pacote tem mais de 440 MB e leva 10:28 horas para instalar.

$ uptime 
 20:17:24 up 10:28,  3 users,  load average: 0,50, 1,06, 1,19




# sbopkg -c

# sbopkg  -i programa



Deseja continuar? (s/n)

' 35 100



if [ $? -eq 0 ]
then 

clear

echo "Continuar..."


else

clear

echo "Saindo..."

exit 5

clear


fi


# =====================================================================================================


killall sbopkg


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






else 


echo
echo "Programa sbopkg Necessario -> Não instalado  Saindo ...


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

exit 2
     
fi

# https://www.vivaolinux.com.br/script/Metodo-para-verificar-e-instalar-pacotes


# =====================================================================================================

clear

#  Faz uma interação com o usuário (s/n) .


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


Você deseja rastrear todas as dependências de uma vez, de todos os programas. (sqg -a)  (s/n) ?

"

read resposta


if [[ $resposta =~ [Ss]$ ]]; then 

clear

echo "
Rastreando todas as dependências de uma vez, de todos os programas. (sqg -a) isso pode levar 50 minutos em media.

" | tee "$log"


sqg -a 2>> "$log"

fi




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


# -----------------------------------------------------------------------------------------------------


clear


echo "

Sincronizando a base de dados do sbopkg (sbopkg -r) ...  (s/n)?

" | tee "$log"

read resposta


if [[ $resposta =~ [Ss]$ ]]; then 

sbopkg -r | tee "$log"

fi


# https://edpsblog.wordpress.com/2015/04/04/how-to-instalacao-do-sbopkg-no-slackware/


# -----------------------------------------------------------------------------------------------------


clear


echo "

Buscando as atualizações dos programas (sbopkg -c) ...

" | tee "$log"

# Checando se os pacotes já instalados tem nova update no repositório.

sbopkg -c | tee "$log"



echo "Removendo libreoffice-langpack e libreoffice-helppack do arquivo $log


A versão em pt_BR dos pacotes libreoffice-langpack e libreoffice-helppack tera que baixar do site do Libreoffice:


https://pt-br.libreoffice.org/baixe-ja/libreoffice-novo/



SlackBuilds Repository:


https://slackbuilds.org/repository/$versao_slackware/office/libreoffice-langpack/

https://slackbuilds.org/repository/$versao_slackware/office/libreoffice-helppack/


"

sed -i '/^libreoffice-langpack:$\|^libreoffice-helppack:$/s/:/#/' $log



echo "Convertendo arquivo Windows para GNU/Linux ou Conversão DOS para UNIX - $log"

sed -i 's/\x0D$//' $log

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


# -----------------------------------------------------------------------------------------------------

clear

# Verificar se o conteudo da variavel $PKG é nula (Em caso do sistema já esta atualizado).

# Exemplo:
#
# sbopkg -i




# Onde:
#
# -z é nula
# -n não é nula.


if [ -z $PKG ];then

# echo "
# Variavel PKG vazia.
# "

echo "
Programas instalados via sbopkg já estão atualizados no seu sistema.

" | tee "$log"

sleep 2

cat  $log 


rm -Rf $log

exit 4

fi


# https://www.vivaolinux.com.br/topico/Shell-Script/variavel-vazia


# -----------------------------------------------------------------------------------------------------


clear

echo "Instalando as atualizações dos programas ...
" | tee "$log"

echo "sbopkg -i ${PKG}


Obs: Alguns programas instalados pode ter problema na atualização que vai interrompe o processo de atualização dos pacotes sbopkg depedendo da ordem que ele se encontra na lista de atualização.
" | tee "$log"

sbopkg -i ${PKG} | tee "$log"


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



rm -Rf $log

sleep 30

clear

# =====================================================================================================




# Realiza uma limpeza geral no sistema

faxina


# =====================================================================================================



exit 0



}








# ----------------------------------------------------------------------------------------------------


# Função realiza uma atualização simples no sistema somente do Slackware padrão.

simples() {


# slackpkg -dialog=off upgrade-all
# 
# Checking local integrity... DONE
# Looking for packages to upgrade. Please wait... DONE
# 
# ca-certificates-20210308-noarch-1_slack14.2.txz
# 
# Total package(s): 1
# 
# Do you wish to upgrade selected packages (Y/n)? n


clear


killall -9 slackpkg 2>> "$log"


# ----------------------------------------------------------------------------------------------------

clear

echo '

Atualizando o Slackware para uma nova versão


Uma atualização massiva como esta terá instalado vários .newarquivos ".new". Alguns pacotes contêm arquivos de configuração que foram renomeados (dentro do pacote) com uma .newextensão ".new" para que um arquivo de configuração existente (contendo suas personalizações) não seja sobrescrito imprudentemente durante a atualização. O Slackpkg fará uma verificação da existência desses .newarquivos ".new" no final de uma atualização ou instalação e solicitará que você faça algo com eles.

Recomenda-se que você atualize para as novas versões dos arquivos de configuração sempre que possível, porque elas geralmente trazem melhorias à configuração do software. O Slackpkg permite que você veja as diferenças entre os arquivos novos e antigos e até mesmo mescle os dois arquivos. Como alternativa, você pode decidir manter o .newarquivo ".new", deixando o arquivo antigo no lugar, para que possa investigar as diferenças posteriormente se forem muito intrusivas.
Você pode forçar uma verificação nos .newarquivos ".new" a qualquer momento, executando o comando

  * # slackpkg new-config

e usando a interface de usuário fácil do slackpkg para mesclar as mudanças.



# slackpkg new-config


Searching for NEW configuration files

Some packages had new configuration files installed.
You have four choices:

	(K)eep the old files and consider .new files later

	(O)verwrite all old files with the new ones. The
	   old files will be stored with the suffix .orig

	(R)emove all .new files

	(P)rompt K, O, R selection for every single file
	
What do you want (K/O/R/P)?
R

'

# https://docs.slackware.com/howtos:slackware_admin:systemupgrade

sleep 50

# ----------------------------------------------------------------------------------------------------


clear

echo "Atualizar a chave GPG usada para assinar os pacotes do mirror - (slackpkg update gpg)." | tee "$log"

slackpkg update gpg | tee "$log"

# ----------------------------------------------------------------------------------------------------

clear

echo "Para atualizar a lista dos pacotes - slackpkg (slackpkg update)" | tee "$log"


# slackpkg update
# 
# Updating the package lists...
# 	Downloading...
# 			Downloading http://ftp.slackware-brasil.com.br/slackware64-14.2/ChangeLog.txt...
# --2021-03-09 10:33:12--  http://ftp.slackware-brasil.com.br/slackware64-14.2/ChangeLog.txt
# Resolvendo ftp.slackware-brasil.com.br... 200.137.217.134
# Conectando-se a ftp.slackware-brasil.com.br|200.137.217.134|:80... conectado.
# A requisição HTTP foi enviada, aguardando resposta... 200 OK
# Tamanho: 622577 (608K) [text/plain]
# Salvando em: “/tmp/slackpkg.65cgPk/ChangeLog.txt”
# 
# /tmp/slackpkg.65cgPk/ChangeLog.txt  100%[=================================================================>] 607,99K  60,4KB/s    em 13s     
# 
# 2021-03-09 10:33:30 (48,0 KB/s) - “/tmp/slackpkg.65cgPk/ChangeLog.txt” salvo [622577/622577]
# 
# 
# 		No changes in ChangeLog.txt between your last update and now.
# 		Do you really want to download all other files (y/N)? n




# slackpkg update | tee "$log"


slackpkg -batch=on update | tee "$log"


# ----------------------------------------------------------------------------------------------------

clear

echo "Atualiza TODO o sistema conforme o mirror selecionado - slackpkg (slackpkg upgrade-all).
#
# cat /etc/slackpkg/mirrors" | tee "$log"


slackpkg upgrade-all | tee "$log"



# slackpkg -dialog=off upgrade-all
#
# Checking local integrity... DONE
# Looking for packages to upgrade. Please wait... DONE
#
# ca-certificates-20210308-noarch-1_slack14.2.txz
#
# Total package(s): 1
#
# Do you wish to upgrade selected packages (Y/n)? n



# ----------------------------------------------------------------------------------------------------

clear

echo "Verifica se há atualizações disponíveis para o seu sistema - slackpkg (slackpkg check-updates)." | tee "$log"

slackpkg check-updates | tee "$log"

# ----------------------------------------------------------------------------------------------------

# ou
#
# slackpkg update && slackpkg upgrade-all | tee "$log"

# ----------------------------------------------------------------------------------------------------

# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)

geral

# ----------------------------------------------------------------------------------------------------

# Realiza uma limpeza geral no sistema

faxina

# ----------------------------------------------------------------------------------------------------


}




# ----------------------------------------------------------------------------------------------------



# Função realiza uma atualização completa no sistema do Slackware usando o slackpkg e pelo gerenciador de pacotes sbopkg. 
#
# Para quem usa Slackware sabe o quanto e chato ficar compilando pacotes na mão. Então nada como um bom gerenciador de 
# pacotes para fazer tudo para você.
#
#
# Atualizar as ferramentas de auditoria (lynis e Rootkits), atualiza o antivirus (clamav) e suas assinaturas de terceiro e limpa os arquivos temporarios do sbopkg.




# Função verifica a instalação do sbopkg no seu Slackware

verificar_sbopkg() {


clear


dialog \
--backtitle "Atualização do sistema"           \
--title 'Introdução ao Sbopkg'  \
--msgbox '
Introdução


Sbopkg é um programa que usa o repositório SlackBuilds.org para fornecer um pacote de criação automatizado.

SlackBuilds são scripts que lidam com o processo de compilação e empacotamento de um determinado programa.

Os scripts SlackBuilds entregam os pacotes prontos para instalação.

Site do projeto:

http://www.sbopkg.org/



Gerenciador de pacotes sbopkg


Para quem usa Slackware sabe o quanto e chato ficar compilando pacotes na mao. entao nada como um bom gerenciador de pacotes para fazer tudo para voce.

Na minha opniao o sbopkg e o melhor gerenciador de pacotes que tem pro slackware porque nele ja vem o gerenciador em "modo grafico" ele adiciona o seu repositorio imenso automaticamente, e geralmente sempre tem os programas que voce precisa. Um exemplo besta foi o comando "sl" que eu tava procurando pra instalar no Slackware, num achava o pacote de instalaçao de jeito nenhum ai tentei procurar por ele. Bingo! ;) Outros exemplos: ( broffice, virtualbox, gnome, ).

Instalando:

baixe o arquivo:

wget -c http://sbopkg.googlecode.com/files/sbopkg-0.33.2-noarch-1_cng.tgz

Instale-o:

installpkg sbopkg*.tgz

Comandos:

Sincronize o Sbopkg com o repositório Slackbuilds.org:

sbopkg -r

O comando para procurar um pacote é:

sbopkg -g palavra-chave

Para instalar é:

sbopkg -i nome-do-pacote

Será perguntado se deseja continuar, tecle "y" seguido de Enter para continuar, ou "N" seguido de Enter para não continuar.

Para instalar mais de um pacote seguidamente use:

sbopkg -i "pacote1 pacote2 pacote3..."

Perceba que é preciso usar aspas nesse caso.

Para ver a lista de comandos (ajuda) use o comando:

sbopkg -h

Opcionalmente você pode usar a versão em "modo grafico" simplesmente com o comando:

sbopkg



Fonte:

http://slackware-df.blogspot.com/2011/05/gerenciador-de-pacotes-sbopkg.html

' 35 100



clear

killall -9 sbopkg 2>> "$log"

sleep 2


# Para verificar se um programa esta instalado.

pacote=$(which sbopkg)

if [ -n "$pacote" ] ;
then 
     echo
     echo "Pacote Sbopkg já instalado no seu sistema.


Verifique se há uma atualização para o sbopkg em https://sbopkg.org/downloads.php.

sbopkg -u

upgradepkg sbopkg-version-noarch-1_wsr.tgz


Confira abaixo a data de instalação ou atualização do pacote:
" 

ls -l /var/log/packages/ | grep -i  sbopkg  | tee "$log"

sbopkg -u | tee "$log"

     sleep 60
     clear



else 
     echo
     echo "Pacote Sbopkg necessario não esta instalado atualmente."
     echo "
Deseja instalar automaticamente o pacote Sbopkg? [s/n]"
     read resposta


     # Verifica as respostas do usuário.

     if [[ "$resposta" = 's' || "$resposta" = 'S' ]];
     then 

            clear

            echo "
Instalando o Sbopkg...

" 


cd /tmp


echo "Baixando o arquivo sbopkg-0.38.1-noarch-1_wsr.tgz em https://sbopkg.org/downloads.php." | tee "$log"

wget -P /tmp -c https://github.com/sbopkg/sbopkg/releases/download/0.38.1/sbopkg-0.38.1-noarch-1_wsr.tgz | tee "$log"


# Onde:
#
# O parametro -c serve para possibilitar a continuidade do download em caso de perda de conexão.
# O parametro -P serve para indicar em qual diretório o arquivo será salvo.


ls -l /tmp | grep -i sbopkg*.*.tgz | tee "$log"


echo "Instalando o arquivo sbopkg-0.38.1-noarch-1_wsr.tgz." | tee "$log"

# installpkg sbopkg*.*.tgz




      else 

           clear

           echo "
Saindo do programa..." 

          exit 3


          clear


    fi

     
fi



}




# ----------------------------------------------------------------------------------------------------







completa() {


clear


dialog  \
--backtitle 'Atualizando sistema' \
--msgbox 'Alguns programas depedendo da sua distribuição linux a instalação é via manual pelo site oficial do programa sem o uso de repositorio no caso do Slackware:



Google Chrome

Versão 71.0.3578.98 (Versão oficial) 64 bits


Corrigir problemas com o Chrome

    Tente desinstalar o Chrome e reinstalá-lo para corrigir problemas com seu mecanismo de pesquisa, o Flash, pop-ups ou atualizações do Chrome.


https://support.google.com/chrome/answer/95346?co=GENIE.Platform%3DDesktop&hl=pt-BR


Corrigir problemas na instalação do Chrome

https://support.google.com/chrome/answer/6315198


Atualizar o Google Chrome

https://support.google.com/chrome/answer/95414


Skype


Ammyy Admin.tar.xz
DANFE View
Funções ZZ
MPlayer-1.3.0
MPlayer-1.3.0.tar.xz
MPxConverterL
ProjectLibre
SweetHome3D
Telegram
Visualg
anydesk-4.0.1
dropbox
firefox
foo2zjs
foo2zjs.tar.gz
frostwire
frostwire-6.7.9
genymobile
genymotion
goldendict
google
java
jdk
jdk-8u151-linux-x64.tar.gz
jre-8u161-linux-x64.tar.gz
kdenlive
leocad
libextractor-1.6
libreoffice6.2
litemanager
maldetect-current.tar.gz
master-pdf-editor-5
net.downloadhelper.coapp-1.2.4
netbeans-8.2-linux.sh
otrs-6.0.tar.xz
parlatype
portugol
teamviewer
thunderbird
thunderbird-60.8.0.tar.bz2
tibia-11.30.4876
tor-browser_pt-BR
tsetup.1.1.23.tar.xz
ultradefrag-5.0.0AB.7
xmind
zandronum


Essa opção pode levar mais de 3:30 horas para terminar, depedendo do seu processador e memória RAM.

' 35 80


clear



# ----------------------------------------------------------------------------------------------------

# Chama a função verificar_sbopkg

verificar_sbopkg

# ----------------------------------------------------------------------------------------------------


clear


killall -9 slackpkg  2>> "$log"

killall -9 sbopkg    2>> "$log"


echo "What do you want (K/O/R/P)?
k
"

sleep 5

# ----------------------------------------------------------------------------------------------------

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

" | tee "$log"

du -lhs /var/cache/sbopkg | tee "$log"

du -lhs /tmp/SBo | tee "$log"

du -lhs /var/lib/sbopkg/queues | tee "$log"

du -lhs /var/log/sbopkg | tee "$log"

# ----------------------------------------------------------------------------------------------------

clear

echo "
Atualizar o Sbopkg (sbopkg -u).
" | tee "$log"

sbopkg -u | tee "$log"

# Essa opção demora muito



# date
# Seg Fev 26 00:18:02 -03 2018


# sbopkg -u

# Checking https://www.sbopkg.org for an update...

# Your version of sbopkg: 0.38.1

# Latest version of sbopkg found on sbopkg.org: 


# date
# Seg Fev 26 00:39:38 -03 2018


# ----------------------------------------------------------------------------------------------------

clear

echo "Rastrear todas as dependências de uma vez, de todos os programas (sqg -a).


Este procedimento pode levar 4 horas em uma cpu Phenom I de 2 Ghz.


/var/lib/sbopkg/queues = diretório que armazena o arquivo com extensão sqf que 
tem o mesmo nome do pacote especificado ao sqg e dentro dentro dele os nomes 
de todas as dependências sendo uma por linha.

Para os pacotes que não haja dependências para compilar, não será gerado um 
arquivo de mesmo nome do pacote neste diretório.

" | tee "$log"

sqg -a  2>> "$log"


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
# https://www.vivaolinux.com.br/dica/Resolvendo-dependencias-no-Sbopkg
# http://meumundotux.blogspot.com/2016/09/solucionando-dependencias-no-sbopkg.html
#
# ----------------------------------------------------------------------------------------------------


echo "

Arquivo de configuração do Sbopkg

/etc/sbopkg/sbopkg.conf

" | tee "$log"


echo "Diretorio dos arquivos de fila:
" | tee "$log"

cat /etc/sbopkg/sbopkg.conf  | grep -i QUEUEDIR  | tee "$log"


echo 'Sbopkg está configurado a não salvar LOGS? 

Usando a opção: KEEPLOG=${KEEPLOG:-NO} no arquivo /etc/sbopkg/sbopkg.conf


Por padrão ela vem setada para YES, assim caso você deixasse como o padrão, veria por exemplo logs como este:

https://gist.github.com/44be19e1eb89edf68fe2ebb3ab9746c9

** mas usando a opção NO, esta pasta estará sempre limpa.

' | tee "$log"

cat /etc/sbopkg/sbopkg.conf  | grep -i KEEPLOG | tee "$log"


# ----------------------------------------------------------------------------------------------------

echo "

Para checar quantos SBos você tem instalado:" | tee "$log"


# wc -l é um comando que serve para contar linhas.
#
# Quando você usa cat arquivo | wc -l, o conteúdo do arquivo é redirecionado para o comando wc -l, 
# que a partir da informação recebida, exibe a quantidade de linhas.


ls /var/log/packages/*_SBo* | wc -w | tee "$log"

# ou sbopkg -p


# ----------------------------------------------------------------------------------------------------

clear

echo "Para sincronizar o sbopkg com o repositório Slackbuilds.org (sbopkg -r)" | tee "$log"

sbopkg -r | tee "$log"


# ----------------------------------------------------------------------------------------------------

clear


echo "
Atualização do SlackBuild - sbopkg (sbopkg -c)
" | tee "$log"


echo "
Atualização do SlackBuild - sbopkg (sbopkg -c)
" | tee "$log"

sbopkg -c | tee "$log"


# ERROR
# Another instance of sbopkg appears to be running
# with process id 11365.  Running more than
# one instance of sbopkg is not recommended.
#
# If this is incorrect, you can delete the lockfile
# '/var/run/sbopkg.pid' and restart.  Exiting now.


# ----------------------------------------------------------------------------------------------------

cat /tmp/sbopkg.txt | tee "$log"

# cat /tmp/sbopkg.txt

rm /tmp/sbopkg.txt 2>> "$log"

# ----------------------------------------------------------------------------------------------------

echo "
Programas na pasta /opt
" | tee "$log"

ls -1 /opt/ | tee "$log"

# ----------------------------------------------------------------------------------------------------

# Chama a função simples para realizar atualização somente dos pacotes do Slackware

simples

# ----------------------------------------------------------------------------------------------------

cat "$log"

# ----------------------------------------------------------------------------------------------------


clear

echo "Verifique o arquivo $log."

sleep 5


}



# ----------------------------------------------------------------------------------------------------


# Atualização automática sem interação do usuário ideal para usar no gerenciador de tarefa (cron).


update(){


TIME="1"

clear


echo "
Instalando atualizações do sistema (Slackware)...
" | tee "$log"


sleep $TIME


# slackpkg update gpg && slackpkg update && slackpkg upgrade-all



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


killall -9 slackpkg

rm -Rf /var/lock/slackpkg.*



slackpkg update gpg && slackpkg -batch=on update && slackpkg upgrade-all   | tee "$log"
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





clear


echo "
Instalando atualizações do Clamav...
" | tee "$log"


sleep $TIME


freshclam                 | tee "$log"

clamav-unofficial-sigs.sh | tee "$log"


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

clear


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

Criando o diretório /tmp/SBo/ agora..." | tee "$log"

   mkdir -p /tmp/SBo | tee "$log"

fi
 

# https://www.vivaolinux.com.br/topico/Shell-Script/verificar-se-arquivo-existe
# https://www.vivaolinux.com.br/topico/Shell-Script/Script-Shell-para-verificar-infinitamente-se-diretorio-existe


sleep 2

clear


# sbopkg -rco

echo "
Executando sbopkg -r ...
" | tee "$log"

sbopkg -r | tee "$log"

echo "
Executando sbopkg -c ...
" | tee "$log"

# O comando tee, é usado para, ao mesmo tempo em que exibe a saída de um comando na tela, gravá-la em um arquivo de texto (/tmp/sbopkg.log).

sbopkg -c | tee  /tmp/sbopkg.log

echo "

Os dados do comando acima (sbpkg -c) esta também no arquivo /tmp/sbopkg.log
"

sleep 5


echo "
Executando sbopkg -o ...
"
sbopkg -o | tee "$log"



clear

echo "
Auditoria de sistemas com Lynis

" | tee "$log"


sleep $TIME


lynis  update info | tee "$log"

# lynis -c | tee "$log"



clear

echo "
Checando se há rootkits em seu sistema
" | tee "$log"

sleep $TIME

# chkrootkit


rkhunter --propupd | tee "$log"

rkhunter --update  | tee "$log"

# rkhunter -c        | tee "$log"

# rkhunter -c --rwo  | tee "$log"




# Fazer um for

# sbopkg -i $programas





# https://www.vivaolinux.com.br/artigo/Mantendo-a-seguranca-no-Linux
# https://www.linuxdescomplicado.com.br/2017/02/por-que-usuarios-linux-devem-se-preocupar-com-riscos-em-seguranca-e-o-que-pode-ser-feito-para-se-proteger.html
# https://e-tinet.com/linux/servidor-linux-dicas-seguranca/
# https://www.vivaolinux.com.br/artigo/Procurando-rootkits-no-seu-sistema
# http://ricardoolonca.blogspot.com/2013/10/auditoria-de-sistemas-com-lynis.html




}


# ----------------------------------------------------------------------------------------------------



# Atualização automática sem interação do usuário ideal para usar no gerenciador de tarefa (cron).


completanoquit(){


clear

verificar_root


# Chama a função verifica_internet

verifica_internet


# Chama a função verificar_sbopkg

verificar_sbopkg



killall -9 slackpkg  2>> "$log"

killall -9 sbopkg    2>> "$log"

# ----------------------------------------------------------------------------------------------------

clear

echo "Atualizar o Sbopkg (sbopkg -u)" | tee "$log"

sbopkg -u | tee "$log"

# ----------------------------------------------------------------------------------------------------

clear

echo "Rastrear todas as dependências de uma vez, de todos os programas (sqg -a)." | tee "$log"

sqg -a 2>> "$log"


# ----------------------------------------------------------------------------------------------------

clear

echo "
Para sincronizar o sbopkg com o repositório Slackbuilds.org (sbopkg -r)
" | tee "$log"

sbopkg -r | tee "$log"


# ----------------------------------------------------------------------------------------------------

clear

echo "
Atualização do SlackBuild - sbopkg (sbopkg -c)
" | tee "$log"

sbopkg -c | tee "$log"


# ----------------------------------------------------------------------------------------------------

clear

echo "
Atualizar a chave GPG usada para assinar os pacotes do mirror - (slackpkg update gpg).
" | tee "$log"

slackpkg update gpg | tee "$log"


# ----------------------------------------------------------------------------------------------------

clear

echo "
Para atualizar a lista dos pacotes - slackpkg (slackpkg update)
" | tee "$log"

slackpkg update | tee "$log"


# ----------------------------------------------------------------------------------------------------

clear

echo "
Verifica se há atualizações disponíveis para o seu sistema - slackpkg (slackpkg check-updates).
" | tee "$log"

slackpkg check-updates | tee "$log"


# ----------------------------------------------------------------------------------------------------

clear

echo "Atualiza TODO o sistema conforme o mirror selecionado - slackpkg (slackpkg upgrade-all).
#
# cat /etc/slackpkg/mirrors" | tee "$log"

slackpkg upgrade-all | tee "$log"


# ----------------------------------------------------------------------------------------------------


# Atualizar a base de dados dos programas (clamav, lynis, rkhunter, updatedb)

geral


# ----------------------------------------------------------------------------------------------------

cat /tmp/sbopkg.txt | tee "$log"

rm /tmp/sbopkg.txt

# ----------------------------------------------------------------------------------------------------



# Realiza uma limpeza geral no sistema

faxina


}











# ----------------------------------------------------------------------------------------------------


# Inicio do loop que mostra o menu principal
#
# while : ; do
#
#
# Mostra o menu na tela, com as ações disponíveis
#
# resposta=$( dialog --stdout  \
# --backtitle "$titulo" \
# --title "Interação com o usuário"   \
# --menu 'Escolha o tipo de atualização que você deseja fazer no Slackware:' \
# 8 200 0        \
# 1 'simples  (atualiza somente os pacotes do Slackware)'  \
# 2 'completa (atualiza Sbopkg, Slackware, base de dados dos programas Clamav, Lynis, Rkhunter e Updatedb)' \
# 0 'Sair' )
#
#
# Se o usuário apertar a tecla CANCELAR ou ESC, então vamos sair...
#
#    [ $? -ne 0 ] && break
#
#
# De acordo com a opção escolhida, dispara programas
#
#    case "$resposta" in
#         1) simples ;;
#         2) completa ;;
#         0) break ;;
#
# esac
#
# done
#
#
# Fim do loop


clear

case "$1" in 
      update)          update ;;         # Sem interação com o usuário atualiza todo o sistema
      simples)         simples ;;        # Interação com o usuário atualiza partialmente o sistema
      completa)        completa ;;       # Interação com o usuário atualiza todo o sistema
      sbopkg_qui)      sbopkg_qui ;;     # Interação com o usuário atualiza todos os pacotes do sbopkg no sistema
      completanoquit)  completanoquit ;; # Sem interação com o usuário atualiza todo o sistema
       *) echo "Função $1 inexistente


Modo de usar:

$0 slackware update          # Sem interação com o usuário atualiza todo o sistema (Slackware e Sbopkg)

$0 slackware simples         # Interação com o usuário atualiza parcialmente o sistema (Somente pacote do Slackware)

$0 slackware completa        # Interação com o usuário atualiza todo o sistema (Slackware e Sbopkg)

$0 slackware sbopkg_qui      # Interação com o usuário atualiza todos os pacotes do sbopkg e do Slackware no sistema

$0 slackware completanoquit  # Sem interação com o usuário atualiza todo o sistema (Slackware e Sbopkg)

" 

;;


   esac



# COMO INVOCAR UMA SUB-FUNÇÃO

# https://www.vivaolinux.com.br/topico/Shell-Script/Como-invocar-uma-sub-funcao/




# Mensagem final :)

echo "Tchau $USER!"


exit 0



}


# Fim da atualização do Slackware

# ====================================================================================================










# ---------------------------------------------------------

case "$1" in
"gentoo")         gentoo ;;
"debian")         debian ;;
"update")      update $2 ;;
"slackware")      slackware $2 ;;
"sbopkg_qui")     sbopkg_qui ;;
"completanoquit") completanoquit ;;
"centos")         centos ;;
"sabayon")        sabayon ;;
"voidlinux")      voidlinux ;;
"openSUSE")       openSUSE ;;
*) zenity --error --text="Error!

Esse script deve esta em alguma pasta path do sistema para melhor utilização:

$PATH


Modo de usar:


$0 debian

$0 gentoo

$0 slackware update          # Sem interação com o usuário atualiza todo o sistema (Slackware e Sbopkg)

$0 slackware simples         # Interação com o usuário atualiza parcialmente o sistema (Somente pacote do Slackware)

$0 slackware completa        # Interação com o usuário atualiza todo o sistema (Slackware e Sbopkg)

$0 slackware sbopkg_qui      # Interação com o usuário atualiza todos os pacotes do sbopkg e do Slackware no sistema

$0 slackware completanoquit  # Sem interação com o usuário atualiza todo o sistema (Slackware e Sbopkg)


$0 centos

$0 sabayon

$0 voidlinux

$0 openSUSE


O tempo de processamento dessas tarefas irá depender de quantos pacotes você atualizará, 
de sua banda de internet e do poder de seu hardware.


Dica:

No momento da atualização do sistema, se são muitos 
pacotes, 438 no total, com o 3G das operadoras de 
internet fica difícil, deixa para atualizar de 
madrugada, e no dia sequinte veja no que deu.


Repita o processo uma vez por semana, a fim de manter seu sistema atualizado.


" --width="1000" --height="600"   2>/dev/null  


;;


esac

# ---------------------------------------------------------


exit 0

