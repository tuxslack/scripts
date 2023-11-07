#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     23/10/2023 as 02:00
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
# Versão:   20231023
# Script:   backup.sh
# Objetivo: Backup das configurações dos programas instalados e arquivos do usuário.
#
#
#
#                       Shell script para backups automáticos
#
#             Solução de proteção de dados que permita cópia de segurança - Backup
#
#
# A importancia de fazer backup:
#
# Protege de ransomware, vírus
# Problema com HD/SSD
# Problema com o sistema operacional
# Corromper as configs da interface grafica (KDE Plasma e etc...).
# Para que possam ser restaurados em caso da perda dos dados originais, o que pode 
# envolver apagamentos acidentais ou corrupção de dados.
#
#
#
# ATENÇÃO:
#
#
# Regra básica: Salva os backups em 2 ou mais locais diferentes. Ex: no Dropbox, 
# Google Drive, num HD/SSD e faça uma cópia mensal num DVD-RW. Além disso, faça cópia 
# semanal do disco com o Clonezilla ou com RescueZilla.
#
#
#
# Instalação:
#
#
# mv -i backup.sh  /usr/local/bin/
#
#
# chown -R root:root /usr/local/bin/backup.sh
#
# chmod 750 /usr/local/bin/backup.sh
#
# chmod +x /usr/local/bin/backup.sh
#
#
#
# Como usar:
#
# --------------------------------------------------
#
# Adicionar ao agendador de tarefas do Linux (CRONTAB).
#
#
# crontab -e
#
# O backup será executado às 13h00, do dia 30º de todos os meses.
#
# 00 13 30  * * /usr/local/bin/backup.sh
#
# --------------------------------------------------
# 
#
# ou manualmente
#
# backup.sh




# 1. /etc: Esse diretório contém arquivos de configuração do sistema e programas instalados. 
# É uma boa ideia fazer backup dos arquivos presentes aqui.
#
# 2. /home: Este diretório normalmente contém os arquivos pessoais do usuário, mas também 
# pode conter arquivos de configuração específicos de alguns programas. Faça backup dos 
# diretórios de usuário relevantes.
#
# 3. /var: Este diretório armazena arquivos de dados e logs de programas. Certifique-se de 
# fazer backup das pastas relevantes dentro deste diretório, dependendo dos programas que 
# você está executando.
#
# 4. /usr: Este diretório contém programas e bibliotecas instalados no sistema. Embora não 
# seja estritamente necessário fazer backup de todos os arquivos aqui,





# Realiza os backups: 
# 
# 
# Cache do apt
# qbittorrent
# Configurações do DNS
# Apache + PHP
# Arquivo hosts
# Compositor Picom
# Atalhos personalizado do teclado no XFCE
# ppp
# Modelos do Gimp - templates
# Audacity 
# OpenBox + temas
# i3wm
# Kdenlive
# Pasta autostart do usuário
# Dos arquivos .desktop local
# Configurações do servidor Samba
# Senha de rede salva no NetworkManager
# Do arquivo mimeapps.list
# Do arquivo rc.local
# Configurações do Wvdial
# Clamav
# jgmenu - menu iniciar para o painel Tint2
# Servidor X
# Das ações personalizadas do Thunar (Thunar custom actions)
# Dos e-mails no Thunderbird
# Do arquivo .bashrc
# Do arquivo fstab
# Das fontes 
# Cron
# Pasta "Modelos"
# Ocomon
# Pasta skel
# Firefox
# Backup dos scripts em /usr/local/bin
# Conky
# Fluxbox
# Sendto do Thunar
# VirtualBox (desativado por padrão)
# Configurações do Grub
# xmenu
# Google Chrome
# Pidgin
# Dropbox (desativado por padrão)
# NetBeans
# Hexchat
# LibreOffice
# Skype
# TeamViewer
# Anydesk
# Jogos (Steam)
# Stella - Emulador de Atari para PC - roms (jogos)
# Mame (jogos)
# PSX - Emulador de PlayStation 1 - (jogos)
# SNES9X -  Super Nintendo - (jogos)
# aMSN
# GoldenDict
# kodi
# gpodder - gerenciador de podcasts
# Clementine - gerenciador de podcasts
# Transmission
# Localizar arquivo XML da nota fiscal eletrônica (NFe)
# Wine
# Playonlinux
# Backup pessoal ("Área de Trabalho" Desktop Documentos Downloads Imagens Músicas Público Vídeos dwhelper)
# XFCE
# Chromium
# mpv
# OBS Studio
# VLC







# Problema com $HOME/backup/backup_Ocomon-4.0.sql_via_cron.gz não esta gerando o backup.   OK

# Problema com backup do OpenBox + temas (pastas e arquivos com nomes compostos).






# https://www.vivaolinux.com.br/dica/Backup-incremental-com-rsync
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Gravar-backup-em-segundo-hd
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=8660
# https://www.vivaolinux.com.br/script/Script-de-backup-Graylog
# https://diolinux.com.br/softwares/instalar-o-programa-da-receita-federal-no-linux.html
# https://www.explorandoti.com.br/como-criar-uma-rotina-de-backup-com-tar-no-linux/
# https://brunovellutini.com/posts/shell-script-backup-nova-versao/
# http://womni.blogspot.com/2011/04/adaptador-usb-para-hd.html
# https://plus.diolinux.com.br/t/como-fazer-backup-de-arquivos-e-das-configuracoes-do-terminal-sem-perder-nada/45130
# https://plus.diolinux.com.br/t/como-voce-organiza-seus-arquivos/47706
# https://plus.diolinux.com.br/t/script-de-pos-instalacao-sugestoes-e-correcoes/39003/19
# https://plus.diolinux.com.br/t/ja-possui-uma-estrategia-de-backup-e-recuperacao-de-dados-pro-pinguim/46154/2
# https://plus.diolinux.com.br/t/backup-com-rsync-duvida-como-automatizar-a-remocao-dos-mais-antigos/15520
# https://linuxdicasesuporte.blogspot.com/2017/05/resetar-as-configuracoes-do-gnome-shell.html
# https://linuxdicasesuporte.blogspot.com/2018/09/backup-de-dados-pessoais-e-do-sistema_1.html
# https://linuxdicasesuporte.blogspot.com/2022/08/backup-de-dados-pessoais-no-linux.html
# https://www.blogson.com.br/listar-usuarios-no-linux/
# https://caiosantesso.dev/bash-gerenciamento-de-usuarios/




# ----------------------------------------------------------------------------------------

# Variaveis:



# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor




# Arquivo de log

log="/tmp/backup.log"

rm -Rf "$log"




# Verificar se o arquivo existe

if [ -e "/etc/passwd" ] ; then

# Para listar todos os usuários do sistema

# grep /home/ /etc/passwd

# O comando "grep -v" exclui o usuário Root da lista.

todos_usuario=$(cat /etc/passwd | grep "/bin/bash" | cut -d : -f 1 | grep -v root)


fi



# Verificar se o arquivo existe

if [ -e "/etc/backup.conf" ] ; then

clear

source /etc/backup.conf



else

clear

echo "O arquivo /etc/backup.conf não existe." | tee -a "$log"

exit

fi



# https://unix.stackexchange.com/questions/175648/use-config-file-for-my-shell-script


# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados

clear


# which zenity        2> /dev/null || { echo "Programa Zenity não esta instalado."        ; exit ; }
# which yad           2> /dev/null || { echo "Programa Yad não esta instalado."           ; exit ; }

# which testdisk         2> /dev/null || { echo "Programa testdisk não esta instalado."   ; exit ; }


which inxi          2> /dev/null || { echo "Programa inxi não esta instalado."          ; exit ; }
which rsync         2> /dev/null || { echo "Programa rsync não esta instalado."         ; exit ; }
which tar           2> /dev/null || { echo "Programa tar não esta instalado."           ; exit ; }
which gzip          2> /dev/null || { echo "Programa gzip não esta instalado."          ; exit ; }
which xz            2> /dev/null || { echo "Programa xz não esta instalado."            ; exit ; }
which notify-send   2> /dev/null || { echo "Programa notify-send não esta instalado."   ; exit ; }
which find          2> /dev/null || { echo "Programa find não esta instalado."          ; exit ; }
which mkdir         2> /dev/null || { echo "Programa mkdir não esta instalado."         ; exit ; }
which chmod         2> /dev/null || { echo "Programa chmod não esta instalado."         ; exit ; }
which ps            2> /dev/null || { echo "Programa ps não esta instalado."            ; exit ; }
which xdg-open      2> /dev/null || { echo "Programa xdg-open não esta instalado."      ; exit ; }
which mysqldump     2> /dev/null || { echo "Programa mysqldump não esta instalado."     ; exit ; }
which mysql         2> /dev/null || { echo "Programa mysql não esta instalado."         ; exit ; }
which mysqlshow     2> /dev/null || { echo "Programa mysqlshow não esta instalado."     ; exit ; }
which ntfs-3g       2> /dev/null || { echo "Programa ntfs-3g não esta instalado."       ; exit ; }
which mount         2> /dev/null || { echo "Programa mount não esta instalado."         ; exit ; }
which umount        2> /dev/null || { echo "Programa umount não esta instalado."        ; exit ; }
which blkid         2> /dev/null || { echo "Programa blkid não esta instalado."         ; exit ; }
which chown         2> /dev/null || { echo "Programa chown não esta instalado."         ; exit ; }
which find          2> /dev/null || { echo "Programa find não esta instalado."          ; exit ; }
which sed           2> /dev/null || { echo "Programa sed não esta instalado."           ; exit ; }
which smartctl      2> /dev/null || { echo "Programa smartctl não esta instalado."      ; exit ; }



sleep 5
clear

# ----------------------------------------------------------------------------------------

# Cor das letras (Verde Claro)


echo -e " \033[1;32m 

Script de Backup
----------------

Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
Homepage: https://github.com/tuxslack/scripts
Licença:  GPL


Listar todos os usuários do sistema:

$todos_usuario


Configurações definidas no arquivo /etc/backup.conf:

Diretório dos backups: $backup
Usuário: $usuario
Grupo: $grupo

\e[0m"


# https://www.vivaolinux.com.br/dica/Shell-script-com-texto-colorido

# ----------------------------------------------------------------------------------------


# Se não for Root abortar

if [ $UID -gt 0 ]; then

	echo -e "\e[35;1m\n\nVocê deve utilizar o usuário Root para usar este script.\n \e[0m" 

else






# ----------------------------------------------------------------------------------------


# Verificar se as variaveis acima estão nulas.


if [ -z $backup ]; then

		echo -ne "Você não forneceu local onde vai ser salvo os backups.\n" | tee -a "$log"
		
		exit
		
fi


# ----------------------------------------------------------------------------------------

if [ -z $usuario ]; then

		echo -ne "Você não forneceu um usuário para o backup.\n" | tee -a "$log"
		
		exit
		
fi

# ----------------------------------------------------------------------------------------

if [ -z $grupo ]; then

		echo -ne "Você não forneceu o grupo principal do usuário $usuario.\n" | tee -a "$log"
		
		exit
		
fi

# ----------------------------------------------------------------------------------------


# if [ -z $senha_mysql ]; then

#		echo -ne "Você não forneceu a senha do mysql.\n" | tee -a "$log"
		
#		exit
		
# fi

# ----------------------------------------------------------------------------------------


if [ -z $log ]; then

		echo -ne "Você não forneceu um arquivo para log.\n" | tee -a "$log"
		
		exit
		
fi

# ----------------------------------------------------------------------------------------


echo 
echo "#=================================================================================#"
echo "#                                                                                 #"
echo "#                      Fazendo backup em arquivos separados                       #"
echo "#                                                                                 #"
echo "#                      Este script esta sob licença GPL.                          #"
echo "#                                                                                 #"
echo "# Pode ser distribuido e alterado livremente deste que seja conservado o          #"
echo "# autor e comentadas as devidas alterações.                                       #"
echo "#                                                                                 #"
echo "#    A Licença Pública Geral GNU está disponível nesses formatos:                 #"
echo "#                                                                                 #"
echo "#    https://www.gnu.org/licenses/gpl-3.0.txt                                     #"
echo "#    https://www.gnu.org/licenses/gpl-3.0.html                                    #" 
echo "#    https://www.gnu.org/licenses/gpl.odt                                         #"
echo "#                                                                                 #"
echo "#                                                                                 #"
echo "#                                                                                 #"
echo "# ATENÇÃO:                                                                        #"
echo "#                                                                                 #"
echo "#                                                                                 #"
echo "# Regra básica: Salva os backups em 2 ou mais locais diferentes.                  #"
echo "#                                                                                 #"
echo "# Ex: no Dropbox, Google Drive, num HD/SSD e faça uma cópia mensal num            #"
echo "# DVD-RW. Além disso, faça cópia semanal do disco com o Clonezilla.               #"
echo "#                                                                                 #"
echo "#                                                                                 #"
echo "#=================================================================================#"
echo 

sleep 40

# ----------------------------------------------------------------------------------------

# Criando a pasta de backup se não existir e alterando suas permissões


/usr/bin/mkdir -p "$backup" 2>> "$log"

chown -R "$usuario":"$grupo" "$backup"  2>> "$log"

chmod 750 "$backup"  2>> "$log"




cd "$backup"


# Remove todos os arquivos *.tar.gz e  *.log da pasta.

rm -Rf *.tar.gz 2>> "$log"

rm -Rf *.log    2>> "$log"


# ----------------------------------------------------------------------------------------


DATAINICIO=`date +%d/%m/%Y-%H:%M:%S`


echo " 

 Arquivo de log gerado pelo script $(basename $0)


Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
Data:     $(date +\%d/\%m/\%Y)
Homepage: https://github.com/tuxslack/scripts
Licença:  GPL


No arquivo .conf abaixo definimos o local onde será salvo os backups, o usuário que 
será backpeado e a senha do banco de dados MySQL.

Caso você não usa banco de dados MySQL deixa  a variavel em branco no arquivo.

 
Arquivo de configuração: /etc/backup.conf



Como usar:

# --------------------------------------------------

Adicionar ao agendador de tarefas do Linux (CRONTAB).

Exemplo:

# crontab -e

# O backup será executado às 13h00, do dia 30º de todos os meses.

00 13 30  * * /usr/local/bin/backup.sh

# --------------------------------------------------


ou manualmente

# backup.sh



ATENÇÃO:


Regra básica: Salva esses backups em 2 ou mais locais diferentes. Ex: no Dropbox, 
Google Drive, num HD/SSD e faça uma cópia mensal num DVD-RW. Além disso, faça cópia semanal 
do disco com o Clonezilla.


#-----------------------------------------------------------------------------------------

Inicío do backup: $DATAINICIO

" >> "$log"


# ----------------------------------------------------------------------------------------

echo "
"   >> "$log"


inxi -Fxz >> "$log"


echo "

==========================================================================================

"   >> "$log"

# ----------------------------------------------------------------------------------------


# Para derivados do Debian (backup do cache do apt)


# Conteúdo do antigo script /usr/local/bin/backup-cache-apt.sh incorporado neste script.



# APTonCD
#
# Gostaria de replicar os mesmos pacotes em outra maquina.
#
# Faça BKP da pasta /var/cache/apt/archives que é onde os pacotes são salvos e depois 
# copie-os para a outra máquina nessa mesma pasta.



which apt  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then




# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados

clear



which dpkg       2> /dev/null || { echo "Programa dpkg não esta instalado."     ; exit ; }
which apt-key    2> /dev/null || { echo "Programa apt-key não esta instalado."  ; exit ; }


# ----------------------------------------------------------------------------------------



# Para verificar se o diretório /var/cache/apt/archives/ existe
#
# -d nos ajuda a saber se o diretório existe, se mudarmos -d para -f é para verificar a existência de arquivos.


    if [ -d "/var/cache/apt/archives/" ]; then

    
    clear



find /etc/apt/ -iname "*.list" -exec ls {} \; > /tmp/repo.txt

sudo dpkg --get-selections > /tmp/pacotes_instalados.log

sudo apt-key exportall > /tmp/repositorio.keys


# while read repo; do

# cp "$repo" /tmp

# done < /tmp/repo.txt




# Removendo backup caso ele existe

rm -Rf "$backup"/APTonCD.tar.xz



echo "
Realizando o backup do cache do apt...
"
    
        echo -e "A pasta /var/cache/apt/archives/ existe..."
        
        
        # tar -zcvf APTonCD.tgz
        #
        # tar -zxvf "$backup"/APTonCD.tgz  -C /
        
        
        # Compactando...
               
        cd "$pasta_usuario" && /usr/bin/tar -cJvf "$backup"/APTonCD.tar.xz  /var/cache/apt/archives/*.deb  /var/lib/apt/lists  /etc/apt  $(cat /tmp/repo.txt)  /tmp/pacotes_instalados.log  /tmp/repositorio.keys 2> "$log"



sleep 2
clear



echo "
Backup do apt finalizado em `date +%d/%m/%Y-%H:%M:%S` salvo na pasta $backup


Para limpar os pacotes .deb da pasta /var/cache/apt/archives/

sudo apt clean ; sudo apt autoclean



Restaurando seu backup
=======================


# Descompactando o arquivo APTonCD.tar.xz na raiz do sistema

# tar Jxf $backup/APTonCD.tar.xz  -C /


# sudo apt-key add /tmp/repositorio.keys


# sudo apt update

# sudo dpkg --set-selections < /tmp/pacotes_instalados.log

" | tee -a "$log"





sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/hicolor/256x256/apps/gcr-gnupg.png  'Backup do cache do apt-get' '\n\nBackup finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n'


        
    else
    
        echo -e "
A pasta /var/cache/apt/archives/ não existe...
        
Essa parte do Shell Script é para o Debian e seus derivados para replicar os pacotes .deb em outra maquina.
        
        " | tee -a "$log"


       # exit 1
          

    fi
    




fi


# Pasta /var/cache/apt/archives lotada?

# https://www.vivaolinux.com.br/dica/Pasta-var-cache-apt-archives-lotada


# https://www.vivaolinux.com.br/dica/Comandos-de-compactacaodescompactacao
# https://unix.stackexchange.com/questions/608207/how-to-use-multi-threading-for-creating-and-extracting-tar-xz
# https://www.hardware.com.br/guias/ubuntu/cache-apt.html
# https://br.ccm.net/faq/2269-como-ler-um-arquivo-linha-por-linha
# https://askubuntu.com/questions/9135/how-to-backup-settings-and-list-of-installed-packages
# https://www.clubedohardware.com.br/forums/topic/188398-backup-no-apt-get/
# https://plus.diolinux.com.br/t/como-faco-becape-de-meu-linux/52330


# ----------------------------------------------------------------------------------------


# Conteúdo do antigo script /usr/local/bin/backup_qbittorrent_linux.sh incorporado neste script.


#
#
# Backup do qbittorrent no Linux
#
# backup_qbittorrent_linux.sh
#
#
# https://www.vivaolinux.com.br/topico/Criancas-adolecentes-no-VOL/Duvida-em-relacao-ao-qbitTorrent
#
#
# $ find ~/ | grep -i qbittorrent
# /home/master/.local/share/data/qBittorrent
# /home/master/.local/share/qBittorrent
# /home/master/.config/qBittorrent
# /home/master/.cache/qBittorrent


clear


which qbittorrent  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then



ps -aux | grep -i qbittorrent$ | grep -v grep > /dev/null

if [ $? == 0 ]; then

echo "
Existe processo do qBittorrent ativo no sistema:


`ps -aux | grep -i qbittorrent$ | grep -v grep`


Obs: Interromper(-se), momentânea os torrents e fecha o programa qbittorrent.

"  | tee -a "$log"


# Saindo...

# killall -9 qbittorrent 1> /dev/null 2> /dev/null

# exit 1

fi





# destino=$(zenity \
# --title="$titulo" \
# --text "Digite o diretorio de destino por completo." \
# --entry \
# --entry-text="$HOME/Downloads" --width=400 2> /dev/null)


# if [ $? == 1 ]; then

# clear

# echo "
# Sair...
# "

# exit 2
# fi


cd "$pasta_usuario"


echo -e "\nRealizando Backup do qBittorrent...\n"


# Barra de progresso em zenity

tar -Jcf "$backup"/backup-qBittorrent.tar.xz \
.local/share/data/qBittorrent \
.local/share/qBittorrent \
.config/qBittorrent \
.cache/qBittorrent \
2>> "$log" 

# | zenity --title='Realizando Backup do qBittorrent...' --progress  --text="" --pulsate --auto-close --auto-kill --width=450 2> /dev/null


if [ $? == 1 ]; then

echo "
Deve um problema em realizar o backup do qBittorrent  

" | tee -a "$log"

# Saindo...

# exit 3


fi


# https://sobrelinux.info/questions/63906/how-to-make-a-progress-bar-work-in-zenity
# https://askubuntu.com/questions/930994/how-to-make-a-progress-bar-work-in-zenity
# https://www.vivaolinux.com.br/topico/Shell-Script/progress-bar-1



# FINAL=`date +%d/%m/%Y-%H:%M:%S`
# $FINAL

# --icon=dialog-information 


sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/hicolor/128x128/apps/qbittorrent.png  'Atenção!' '\n\nBackup do qBittorrent finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \nVerifique o arquivo '$log' para mais informações.\n\n' 


fi



# ----------------------------------------------------------------------------------------




# Backup do DNS (O comando será executado às 11h31, do dia 19º de todos os meses.)

# 31 11 19 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



# Verificar se o arquivo existe

if [ -e "/etc/resolv.conf" ] ; then

clear

echo "O arquivo /etc/resolv.conf existe."

/usr/bin/tar -czf "$backup"/backup-do_DNS_via_cron.tar.gz  /etc/resolv.conf*  2>> "$log"

else

clear

echo "O arquivo /etc/resolv.conf não existe." | tee -a "$log"



fi


# https://linuxdicasesuporte.blogspot.com/2022/10/remover-bloqueio-de-operadora-sites.html

# ----------------------------------------------------------------------------------------

# O comando para gera o backup dos arquivos do Servidor Apache + PHP + mysql será executado às 11h49, do dia 9º de todos os meses.

# 49 11 9 * * su fernando -c  "cd ~/  && /usr/bin/mkdir -p ~/backup &&  "


php -v > php-versao-atual.txt && /usr/bin/tar -czf "$backup"/backup-Apache-PHP-mysql_via_cron.tar.gz  /etc/apache/httpd.conf  /etc/php*/php.ini  php-versao-atual.txt && rm -Rf php-versao-atual.txt  2>> "$log"


# ----------------------------------------------------------------------------------------


# Para evitar ransomware, vírus, trojan ou qualquer outro tipo de malware que pode comprometer a sua máquina ou até mesmo a sua rede. (O comando será executado às 12h20, do dia 3º de todos os meses.)


# 20 12 3 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



# Verificar se o arquivo existe

if [ -e "/etc/hosts" ] ; then

clear

echo "O arquivo /etc/hosts existe."

/usr/bin/tar -czf "$backup"/backup_bloquear_sites_indesejados_via_cron.tar.gz    /etc/hosts 2>> "$log"

else

clear

echo "O arquivo /etc/hosts não existe." | tee -a "$log"



fi

# ----------------------------------------------------------------------------------------

# Compositor Picom (O comando será executado às 12:40)

# 40 12 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "


which picom  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Verificar se o arquivo existe

if [ -e "$pasta_usuario/.config/picom/picom.conf" ] ; then

clear

echo "O arquivo $pasta_usuario/.config/picom/picom.conf existe."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup_picom_via_cron.tar.gz    .config/picom/picom.conf 2>> "$log"


else

clear

echo "O arquivo $pasta_usuario/.config/picom/picom.conf não existe." | tee -a "$log"



fi



fi


# https://www.vivaolinux.com.br/dica/Resolvendo-tearing-com-o-picom


# ----------------------------------------------------------------------------------------

# Backup

# Backup dos atalhos personalizado do teclado no XFCE

# 39  12 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "




# Verificar se o arquivo existe

if [ -e "$pasta_usuario/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml" ] ; then

clear

echo "O arquivo $pasta_usuario/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml existe."


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-atalhos-personalizado-do-teclado-no-XFCE_via_cron.tar.gz  .config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml  2>> "$log"


else

clear

echo "O arquivo $pasta_usuario/.config/xfce4/xfconf/xfce-perchannel-xml/xfce4-keyboard-shortcuts.xml não existe." | tee -a "$log"



fi


# ----------------------------------------------------------------------------------------

# Backup do Modem 3G da Claro (Huawei E156b)
#
# lsusb
#
# Bus 004 Device 004: ID 12d1:1003 Huawei Technologies Co., Ltd. E220 HSDPA Modem / E230/E270/E870 HSDPA/HSUPA Modem
#
#

# 10  13 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



which pppd  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do ppp...
"


# Para verificar se o diretório /etc/ppp/ existe.

    if [ -d "/etc/ppp/" ]; then
    
        echo -e "A pasta /etc/ppp/ existe..."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-Modem3G-Claro_via_cron.tar.gz   /etc/ppp/peers/E220  /etc/ppp/chat-E220-nopin  /etc/ppp/chat-E220-pin   /etc/rc.local   .config/autostart/Testar\ Internet.desktop  2>> "$log"
        
    else
    
        echo -e "A pasta /etc/ppp/ não existe..."
        

    fi
    




fi

# ----------------------------------------------------------------------------------------


# Backup dos modelos do Gimp - templates (O comando será executado às 13h20)

# 20 13 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "


which gimp  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear


# Verificar se o arquivo existe

if [ -e "$pasta_usuario/.config/GIMP/2.10/templaterc" ] ; then

clear

echo "O arquivo $pasta_usuario/.config/GIMP/2.10/templaterc  existe."


echo "
Realizando o backup dos modelos do Gimp...
"

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-dos_modelos_do_Gimp_via_cron.tar.gz   .config/GIMP/2.10/templaterc 2>> "$log"



else

clear

echo "O arquivo $pasta_usuario/.config/GIMP/2.10/templaterc não existe." | tee -a "$log"



fi




fi

# ----------------------------------------------------------------------------------------

# OpenShot


# which openshot



# https://linuxdicasesuporte.blogspot.com/2019/12/openshot-nao-abre-no-debian-e-derivados.html

# ----------------------------------------------------------------------------------------

# Backup do Audacity configurado para salva no formato m4a
 
# 21  13 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "





which audacity  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear


# Verificar se o arquivo existe

if [ -e "$pasta_usuario/.audacity-data/audacity.cfg" ] ; then

clear

echo "O arquivo $pasta_usuario/.audacity-data/audacity.cfg  existe."


echo "
Realizando o backup do Audacity...
"


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-audacity-nao-salva-em-m4a_via_cron.tar.gz    .audacity-data/audacity.cfg  2>> "$log"


else

clear

echo "O arquivo $pasta_usuario/.audacity-data/audacity.cfg não existe." | tee -a "$log"



fi




fi


# ----------------------------------------------------------------------------------------


# Conteúdo do antigo script /usr/local/bin/backup-openbox.sh incorporado neste script.


# crontab -e
#
# ...
#
# Backup do OpenBox + temas (O comando será executado às 13:48)
#
#
# Openbox é um gerenciador de janelas livre para sistemas Unix-like com X Window System, 
# licenciado sob GNU General Public License. Openbox foi derivado originalmente de 
# Blackbox 0.65.0, mas foi reescrito totalmente em C e, desde a versão 3.0, não é baseado 
# em nenhum código do Blackbox.
#
# Página oficial: http://openbox.org/
#
#
# 48 13 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && /usr/bin/tar -czf ~/backup/backup-do_OpenBox_via_cron.tar.gz   .themes/*.obt  .themes/*/openbox-3  .config/obmenu-generator  .config/openbox  .config/tint2  .config/rofi   .local/share/applications/Tint2  .conky/.conkyrc-edps-openbox   .config/i3/i3lock.png   /usr/local/bin/xmenu.sh   /usr/local/bin/showdesktop.sh"



# while read tema; do echo -e ".themes/$tema"; done < /tmp/openbox.log


# https://br.ccm.net/faq/2269-como-ler-um-arquivo-linha-por-linha
# https://www.delete.com.br/shell-script-para-transformar-linhas-em-colunas/
# https://www.freecodecamp.org/portuguese/news/o-comando-ls-do-linux-como-listar-arquivos-em-um-diretorio-e-flags-de-opcao/
# https://www.certificacaolinux.com.br/comando-linux-sed/



which openbox  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/.config/openbox existe.

    if [ -d "$pasta_usuario/.config/openbox" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/openbox existe..."
        
        
echo "
Realizando o backup do OpenBox...
"


# Lista somente diretórios => ls -d

ls -d "$pasta_usuario"/.themes/*/openbox-3 | sed 's#.*es/##;s#/o.*##' > /tmp/openbox.log


# O uso da conta-barra foi necessário para indicar que o caracter "/" do caminho não é o separador de substituição do sed

sed -i 's/^/.themes\//' /tmp/openbox.log


# Coloca todas as linhas em uma só com espaço

sed -i ':a;$!N;s/\n/ /;ta;' /tmp/openbox.log





cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_OpenBox_via_cron.tar.gz  $(cat /tmp/openbox.log) .themes/*.obt  .config/obmenu-generator  .config/openbox  .config/tint2  .config/rofi   .local/share/applications/Tint2  /opt/conky/conkyrc-edps-openbox   .config/i3/i3lock.png   /usr/local/bin/xmenu.sh   /usr/local/bin/showdesktop.sh  2>> "$log"




# Problema com tema com espaço no nome:

# O comando tar não compacta pasta com nome composto

# /usr/bin/tar: Daily: Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: Frost: Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: Light: Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: .themes/Retro: Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: 7: Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: (Aero): Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: .themes/XP: Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: Blue: Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: .themes/XP: Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: Olive: Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: .themes/XP: Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: Silver: Função stat falhou: Arquivo ou diretório inexistente
# /usr/bin/tar: Saindo com status de falha em razão de erros anteriores


# .themes/Numix Daily


sleep 2

rm -Rf /tmp/openbox.log


        
    else
    
        echo -e "A pasta $pasta_usuario/.config/openbox não existe..." | tee -a "$log"
        

    fi
    



fi



# http://www.zago.eti.br/tar.html
# https://ubuntuforum-br.org/index.php?topic=4518.0
# https://pt.stackoverflow.com/questions/364889/como-passar-resultado-de-comando-para-uma-vari%C3%A1vel-em-bash


# ----------------------------------------------------------------------------------------


# Backup dos arquivos de configuração do i3wm (O comando será executado todos os dias às 14h05.)
#
# Vai fazer backup das configurações do teclado e do monitor que esta no servidor X.
#
# i3wm: Não utilize a configuração padrão!
#
# 
# 05 14 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "


which i3status  2>> "$log"

which polybar   2>> "$log"

which i3blocks  2>> "$log"

# ~/.config/i3/i3blocks.conf



which i3  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/.config/i3 existe.

    if [ -d "$pasta_usuario/.config/i3" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/i3 existe..."
        
        
            
echo "
Realizando o backup do i3wm...
"

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_i3_via_cron.tar.gz  .config/i3  .config/i3status  /etc/X11/xorg.conf.d  .config/polybar  2>> "$log"




    else
    
        echo -e "A pasta $pasta_usuario/.config/i3 não existe..." | tee -a "$log"
        

    fi
    
    



fi

# ----------------------------------------------------------------------------------------

# Liferea

# xbps-install -y liferea
# xbps-query -S liferea





which liferea  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/.config/liferea existe.

    if [ -d "$pasta_usuario/.config/liferea" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/liferea existe..."
        
        
            
echo "
Realizando o backup do Liferea...
"


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do-Liferea_via_cron.tar.gz   .config/liferea/  2>> "$log"



    else
    
        echo -e "A pasta $pasta_usuario/.config/liferea não existe..." | tee -a "$log"
        

    fi
    
    



fi




# https://linuxdicasesuporte.blogspot.com/2023/03/liferea-1141-com-correcao-critica-de.html


# ----------------------------------------------------------------------------------------

# Pitivi  - Editor de vídeo open source

# https://linuxdicasesuporte.blogspot.com/2023/03/editor-de-video-open-source-pitivi.html

# ----------------------------------------------------------------------------------------

# Shotcut


# https://linuxdicasesuporte.blogspot.com/2023/04/editor-de-video-shotcut-2304-beta-com.html

# ----------------------------------------------------------------------------------------

# Backup do kdenlive da versão 22.04.2  x86_x64 via arquivo .AppImage   (tema usado na interface, efeitos salvos pelo usuário)

# 10  14 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



# Verificar se o arquivo existe

if [ -e "$pasta_usuario/.config/kdenlive-appimagerc" ] ; then

clear

echo "O arquivo $pasta_usuario/.config/kdenlive-appimagerc existe."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do-kdenlive_via_cron.tar.gz   .config/kdenlive-appimagerc  2>> "$log"


else

clear

echo "O arquivo $pasta_usuario/.config/kdenlive-appimagerc não existe." | tee -a "$log"



fi

# ----------------------------------------------------------------------------------------


# A pasta autostart do usuário contém todos os programas que são automaticamente executados ao iniciar 
# a interface grafica (XFCE). É recomendado adicionar à pasta aplicativos de antivírus e de backup para 
# fornecer maior segurança ao sistema.


# Na pasta $HOME/.config/autostart ficam os arquivos de incialização de serviços quando 
# faço login. também os copio pois tem persoanlizações minhas como som no login.


# 12  14 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



# Para verificar se o diretório $pasta_usuario/.config/autostart existe.

    if [ -d "$pasta_usuario/.config/autostart" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/autostart existe..."
        
        cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-da-pasta_autostart_via_cron.tar.gz    .config/autostart  /etc/xdg/autostart   /usr/local/bin/habilitar_xhost.sh   /usr/local/bin/testarinternet.sh  2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/autostart não existe..." | tee -a "$log"
        

    fi




# ----------------------------------------------------------------------------------------

# Estas pastas ( /usr/share/applications/  ou ~/.local/share/applications/ ) apenas contém os lançadores (arquivos.desktop) dos programas!
# Em tese, se vc deletou apenas isso, os programas em si continuam intactos...
#
# Para recriar os lançadores "padrões" da distro copie a pasta da ISO de instalação. Ou seja, inicie o Ubuntu em modo Live e copie a pasta 
# dele para o HD onde está o sistema instalado. Quanto aos programas adicionais, que foram instalados após a instalação do sistema, 
# vc pode reinstalá-los para restaurar os lançadores.
#
#
# Você pode criar os arquivos .desktop na mão mesmo, um a um ;)
# É demorado, mas é uma solução também.


# 14  14 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "





# Para verificar se o diretório $pasta_usuario/.local/share/applications/ existe.

    if [ -d "$pasta_usuario/.local/share/applications/" ]; then
    
        echo -e "A pasta $pasta_usuario/.local/share/applications/ existe..."
        
        cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-lançadores_dos_programas_via_cron.tar.gz    .local/share/applications/   .icons/extras/  2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.local/share/applications/ não existe..." | tee -a "$log"
        

    fi
    

# ----------------------------------------------------------------------------------------

# Backup dos itens criado pelo usuário para o Gerenciador de configurações do XFCE (O comando será executado às 14h20)
#
# No arquivo .desktop, deixei assim a opção de Categories:
#
# Categories=Settings;X-XFCE-SettingsDialog;X-XFCE-SystemSettings;
#
#
# 20 14 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-gerenciador_de_configurações_do_XFCE_via_cron.tar.gz   .local/share/applications/Gerenciador\ de\ configurações\ do\ XFCE/   2>> "$log"


# ----------------------------------------------------------------------------------------

# Backup do Servidor Samba (O comando será executado às 14h38 do dia 8 do mes)


# 38 14 8 * *  cd /home/fernando/  && /usr/bin/mkdir -p backup && chown -R fernando:fernando backup  && 





# Para verificar se o diretório /etc/samba/ existe.

    if [ -d "/etc/samba/" ]; then
    
        echo -e "A pasta /etc/samba/ existe..."
        
        /usr/bin/tar -czf "$backup"/backup-do_servidor_Samba_via-cron.tar.gz  /etc/samba/  2>> "$log"
        
    else
    
        echo -e "A pasta /etc/samba/ não existe..." | tee -a "$log"
        

    fi
    

# ----------------------------------------------------------------------------------------

# Backup das senhas de rede (O comando será executado às 14h46, do dia 27º de todos os meses.)
#
# Cannot open: Permission denied


# 46 14 27 * * cd /home/fernando/  && /usr/bin/mkdir -p backup && chown -R fernando:fernando backup  && 




which nm-connection-editor  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup das configurações do NetworkManager...
"


# Para verificar se o diretório /etc/NetworkManager/system-connections existe.

    if [ -d "/etc/NetworkManager/system-connections" ]; then
    
        echo -e "A pasta /etc/NetworkManager/system-connections existe..."
        
        /usr/bin/tar -czf "$backup"/backup_das_senhas_de_rede_via_cron.tar.gz  /etc/NetworkManager/system-connections  2>> "$log"
        
    else
    
        echo -e "A pasta /etc/NetworkManager/system-connections não existe..." | tee -a "$log"
        

    fi
    
    

fi



# ----------------------------------------------------------------------------------------

# Backup do arquivo mimeapps.list onde é definido os programas como padrão  (O comando será executado às 14h56)


# 56 14 * * *  cd /home/fernando/  && /usr/bin/mkdir -p backup && chown -R fernando:fernando backup  && 




# Verificar se o arquivo existe

if [ -e "$pasta_usuario/.config/mimeapps.list" ] ; then

clear

echo "O arquivo $pasta_usuario/.config/mimeapps.list existe."


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-programa-padrao_via-cron.tar.gz  .config/mimeapps.list  2>> "$log"

else

clear

echo "O arquivo $pasta_usuario/.config/mimeapps.list não existe." | tee -a "$log"



fi

# ----------------------------------------------------------------------------------------

# Backup do arquivo rc.local responsável por executar um script na inicialização do Void Linux - O comando será executado às 15:05


# 05 15 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "





# Verificar se o arquivo existe

if [ -e "/etc/rc.local" ] ; then

clear

echo "O arquivo /etc/rc.local existe."

/usr/bin/tar -czf "$backup"/backup-do-rc.local_via_cron.tar.gz    /etc/rc.local  2>> "$log"

else

clear

echo "O arquivo /etc/rc.local não existe." | tee -a "$log"



fi


# ----------------------------------------------------------------------------------------

# Backup das configurações do Wvdial (O comando será executado às 15h36, do dia 11º de todos os meses.)


# 36 15 11 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "





which wvdial  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear


# Verificar se o arquivo existe

if [ -e "/etc/wvdial.conf" ] ; then

clear

echo "O arquivo /etc/wvdial.conf  existe."


echo "
Realizando o backup do Wvdial...
"


/usr/bin/tar -czf "$backup"/backup-do_wvdial_via_cron.tar.gz  /etc/wvdial.conf  2>> "$log"


else

clear

echo "O arquivo /etc/wvdial.conf não existe." | tee -a "$log"



fi




fi



# ----------------------------------------------------------------------------------------

# Backup da base de dados do Clamav via cron - O comando será executado às 15h38
#
#
# cat /etc/freshclam.conf  | grep DatabaseCustomURL
#
#
# 38 15 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "





which freshclam  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear


# Verificar se o arquivo existe

if [ -e "/etc/freshclam.conf" ] ; then

clear

echo "O arquivo /etc/freshclam.conf existe."


echo "
Realizando o backup das configurações do Clamav (freshclam)...
"  | tee -a "$log"

ls -lh $(cat /etc/freshclam.conf | grep -i DatabaseDirectory | cut -d" " -f2)  | tee -a "$log"

echo "

" >> "$log"


# /usr/bin/tar -czf "$backup"/backup_da-base-de-dados-do-Clamav-via_cron.tar.gz   /etc/freshclam.conf  $(cat /etc/freshclam.conf | grep -i DatabaseDirectory | cut -d" " -f2)  2>> "$log"


else

clear

echo "O arquivo /etc/freshclam.conf não existe." | tee -a "$log"



fi




fi


# ----------------------------------------------------------------------------------------

# Backup do jgmenu - um menu iniciar para o Tint2 (O comando será executado às 15h40)
#
# Uso:    jgmenu_run
# Arquivo de configuração em: ~/.config/jgmenu/
# Manual: man jgmenu

# 40 15 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



which jgmenu  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear


# Para verificar se o diretório $pasta_usuario/.config/jgmenu/ existe.

    if [ -d "$pasta_usuario/.config/jgmenu/" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/jgmenu/ existe..."
        
        cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_jgmenu_via_cron.tar.gz  .config/jgmenu/  2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/jgmenu/ não existe..." | tee -a "$log"
        

    fi


fi

# https://jgmenu.github.io/integration.html


# ----------------------------------------------------------------------------------------


#
# Usando arquivos .conf (Servidor X) 
#
# O diretório /etc/X11/xorg.conf.d/ guarda configurações específicas do usuário. Você é livre para adicionar 
# arquivos de configuração, mas eles deve ter o sufixo .conf: os arquivos são lidos na ordem ASCII, e por 
# convenção seus nomes começam com XX- (dois dígitos e um hífen, e por exemplo, 10 é lido antes de 20). Estes 
# arquivos são analisados pelo servidor X e são tratados como parte do arquivo de configuração tradicional 
# xorg.conf. Note que em caso de configuração conflitante, o arquivo lido por último será processado. Por esta 
# razão os arquivos de configuração genéricos devem ser ordenados primeiro por nome. As configurações no arquivo 
# xorg.conf são processadas no final. 
#
#
# lspci -k 
#
# 00:01.0 VGA compatible controller: Advanced Micro Devices, Inc. [AMD/ATI] Sumo [Radeon HD 6550D]
#	Subsystem: Elitegroup Computer Systems Device 05a6
#	Kernel driver in use: radeon
#	Kernel modules: radeon, amdgpu
#
# cp  /usr/share/X11/xorg.conf.d/10-radeon.conf /etc/X11/xorg.conf.d/
#
#
# ls -l /usr/share/X11/xorg.conf.d/
# total 32
# -rw-r--r-- 1 root root   92 mai  9  2022 10-amdgpu.conf
# -rw-r--r-- 1 root root 1099 fev  7  2022 10-evdev.conf
# -rw-r--r-- 1 root root 1350 abr  3 09:20 10-quirks.conf
# -rw-r--r-- 1 root root   92 fev  7  2022 10-radeon.conf
# -rw-r--r-- 1 root root 1429 fev 25  2022 40-libinput.conf
# -rw-r--r-- 1 root root  115 fev  7  2022 50-vmmouse.conf
# -rw-r--r-- 1 root root 1753 jun 17  2018 70-synaptics.conf
# -rw-r--r-- 1 root root 3458 mai  1 04:25 70-wacom.conf
#
#
#
# ls -l /etc/X11/xorg.conf.d/
# total 12
# -rw-r--r-- 1 root root  332 set 26  2022 10-keyboard.conf
# -rw-r--r-- 1 root root 3653 mai  9 23:40 10-monitor.conf
# -rw-r--r-- 1 root root   92 mai 10 15:22 10-radeon.conf
#
#
# Backup do Servidor X (O comando será executado às 15h42, do dia 10º de todos os meses.)

# 42 15 10 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "






# Para verificar se o diretório /etc/X11/xorg.conf.d/ existe.

    if [ -d "/etc/X11/xorg.conf.d/" ]; then
    
        echo -e "A pasta /etc/X11/xorg.conf.d/ existe..."
        
        /usr/bin/tar -czf "$backup"/backup-do-Servidor-X_via_cron.tar.gz    /etc/X11/xorg.conf.d/   2>> "$log"
        
    else
    
        echo -e "A pasta /etc/X11/xorg.conf.d/ não existe..." | tee -a "$log"
        

    fi
    
    
#
#
# 
# https://wiki.archlinux.org/title/Xorg_(Portugu%C3%AAs)
# https://wiki.archlinux.org/title/Xorg/Keyboard_configuration
# https://www.hardware.com.br/livros/ferramentas-linux/configurando-video-etcx11xorg.conf.html
# https://askubuntu.com/questions/4662/where-is-the-x-org-config-file-how-do-i-configure-x-there







# ----------------------------------------------------------------------------------------


# Backup das ações personalizadas do Thunar (Thunar custom actions) - O comando será executado às 15h48
#
#
# O gerenciador de arquivos Thunar do Xfce4 tem um ótimo recurso, que permite configurar uma ação 
# (quando clicarmos com o botão direito dentro do Thunar) a ser feita em arquivos e diretórios selecionados 
# permitindo assim novas ações, dentro do Thunar, com recursos que ele não tinha incorporado dentro dele. 
#
#
# A documentação oficial fala de várias ações de customizações que podemos ter em nosso gerenciador, entre elas a 
# está a funcionalidade que eu estava buscando, abrir o thunar como Root.
#
# Basta abrir o Thunar e clicar em Editar e clicamos em Configurar ações personalizadas.
#
#
#
# cat ~/.config/Thunar/uca.xml | grep -i .sh
#
#
# https://www.vivaolinux.com.br/topico/XFCE/Colocar-uma-opcao-no-service-menu-do-Thunar-para-selecionar-tudo
# https://www.vivaolinux.com.br/dica/Incrementando-o-Thunar-com-acoes-personalizadas
# http://meumundotux.blogspot.com/2015/07/integrando-o-catfish-ao-thunar.html
# https://alesonmedeiros.dev.br/configurar-acoes-personalizadas-do-thunar
# https://manjaro-linux.com.br/forum/-t5847.html
# https://plus.diolinux.com.br/t/acrescentando-funcoes-ao-thunar-gerenciador-de-arquivos/36016
# https://linuxdicasesuporte.blogspot.com/2015/06/adicionar-pesquisa-por-arquivos-no-seu.html
# https://forum.archlinux-br.org/viewtopic.php?id=4303
# https://alesonmedeiros.dev.br/configurar-acoes-personalizadas-do-thunar


# 48 15 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



which thunar 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear


# Verificar se o arquivo existe

if [ -e "$pasta_usuario/.config/Thunar/uca.xml" ] ; then

clear

echo "O arquivo $pasta_usuario/.config/Thunar/uca.xml existe."


echo "
Realizando o backup do arquivo $pasta_usuario/.config/Thunar/uca.xml...
"


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup_das_acoes_personalizadas_do_Thunar-via_cron.tar.gz   .config/Thunar/uca.xml  .config/Thunar/leia.txt /usr/local/bin/codec-audio.sh  /usr/local/bin/moveparabin.sh  /usr/local/bin/convert-image.sh  /usr/local/bin/remova\ audio\ do\ video.sh  /usr/local/bin/baixaaudio.sh  /usr/local/bin/baixar_videos_da_internet.sh  /usr/local/bin/gera_assinatura_virus_clamav.sh   /usr/local/bin/removedor-de-metadados-de-arquivos.sh  /usr/local/bin/montar_iso.sh  /usr/local/bin/verificar-hash.sh  /usr/local/bin/rmvb_para_avi.sh /usr/local/bin/analise-do-relatorio-malwarebytes.sh  /usr/local/bin/fonts.sh   2>> "$log"


else

clear

echo "O arquivo $pasta_usuario/.config/Thunar/uca.xml não existe." | tee -a "$log"



fi




fi


# ----------------------------------------------------------------------------------------

# Backup dos e-mails no Thunderbird (O comando será executado às 16h06, do dia 1º de todos os meses.)

# 06 16 1 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "


which thunderbird  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/.thunderbird/ existe.

    if [ -d "$pasta_usuario/.thunderbird/" ]; then
    
        echo -e "A pasta $pasta_usuario/.thunderbird/ existe..."
        
        echo "
Realizando o backup do Thunderbird...
"

cd "$pasta_usuario" &&  killall  -9 thunderbird 1> /dev/null 2> /dev/null ; /usr/bin/tar -czf "$backup"/backup-Thunderbird_via_cron.tar.gz   .thunderbird/  2>> "$log"  &&  sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/hicolor/128x128/apps/thunderbird.png  'Atenção!' '\n\nBackup do Thunderbird finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n\n' 

        
    else
    
        echo -e "A pasta $pasta_usuario/.thunderbird/ não existe..." | tee -a "$log"
        

    fi
    


fi


# https://www.dicas-l.com.br/arquivo/automatizacao_de_tarefas_com_crontab_e_cron.php
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Backup-do-Thunderbitd
# https://neofenix.wordpress.com/2010/04/11/backup-dos-e-mails-no-thunderbird/

# ----------------------------------------------------------------------------------------



# Backup do super .bashrc (O comando será executado às 16h22)


# 22 16 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



# Verificar se o arquivo existe

if [ -e "$pasta_usuario/.bashrc" ] ; then

clear

echo "O arquivo $pasta_usuario/.bashrc existe."


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-bashrc_via_cron.tar.gz  .bashrc  .tutor  2>> "$log"


else

clear

echo "O arquivo $pasta_usuario/.bashrc não existe." | tee -a "$log"



fi

# ----------------------------------------------------------------------------------------

# Para executar o backup diariamente


# Para executar um trabalho cron como um usuário específico


# 59 16 * * *  su "$usuario" -c  ""
# 59 16 * * *  su "$usuario" -c  ""


su "$usuario" -c /usr/local/bin/OK/backup-painel-de-controle.sh   2>> "$log"
su "$usuario" -c /usr/local/bin/OK/FDTK/gera-FDTK-xfce.sh         2>> "$log"




# https://www.dicas-l.com.br/arquivo/automatizacao_de_tarefas_com_crontab_e_cron.php
# https://serverfault.com/questions/352835/crontab-running-as-a-specific-user



# ----------------------------------------------------------------------------------------


# Backup do arquivo fstab (O comando será executado às 17h00, do dia 30º de todos os meses.)


# 00 17 30 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



# Verificar se o arquivo existe

if [ -e "/etc/fstab" ] ; then

clear

echo "O arquivo /etc/fstab existe."

/usr/bin/tar -czf "$backup"/backup-do_fstab_via_cron.tar.gz  /etc/fstab  2>> "$log"


else

clear

echo "O arquivo /etc/fstab não existe." | tee -a "$log"



fi

# ----------------------------------------------------------------------------------------


# Backup das fontes (O comando será executado às 18h13, do dia 3º de todos os meses.)

# 13 18 3 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



# Para verificar se o diretório $pasta_usuario/.fonts/ existe.

    if [ -d "$pasta_usuario/.fonts/" ]; then
    
        echo -e "A pasta $pasta_usuario/.fonts/ existe..."

        cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-das_fontes_via_cron.tar.gz    .fonts/   2>> "$log"
        
        # /usr/share/fonts/
        
    else
    
        echo -e "A pasta $pasta_usuario/.fonts/ não existe..." | tee -a "$log"
        

    fi
    
# ----------------------------------------------------------------------------------------

# Backup do arquivo do crontab
#
# O arquivo crontab geralmente fica localizado no diretório /etc, mas também pode estar em um diretório 
# que cria um crontab para cada usuário do sistema (geralmente em /var/spool/cron/), tudo depende das 
# configurações do sistema operacional utilizado.

 
# 11  19 * * *  cd /home/fernando/  && /usr/bin/mkdir -p backup && chown -R fernando:fernando backup && 





# Para verificar se o diretório /var/spool/cron/ existe.

    if [ -d "/var/spool/cron/" ]; then
    
        echo -e "A pasta /var/spool/cron/ existe..."

        /usr/bin/tar -czf "$backup"/backup-do-crontab_via-cron.tar.gz   /var/spool/cron/  2>> "$log"
        
    else
    
        echo -e "A pasta /var/spool/cron/ não existe..." | tee -a "$log"
        

    fi

# ----------------------------------------------------------------------------------------

# Backup da pasta Modelos (O comando será executado às 19h10, do dia 1º de todos os meses.)
#
#
# Para que serve a Pasta "Modelos" no Linux: aprenda a usá-la para agilizar o seu trabalho.
#
# Dentro desta pasta ficam todos os modelos de documentos, ou tipos de arquivos que você pode criar rapidamente.
#
# Todo tipo de arquivo padrão que você colocar dentro da pasta Modelos na sua Home aparece no menu do botão direito do mouse.
#
#
# https://diolinux.com.br/tutoriais/para-que-serve-pasta-modelos-no-ubuntu.html


# 10 19 1 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "




# Para verificar se o diretório $pasta_usuario/Modelos/ existe.

    if [ -d "$pasta_usuario/Modelos/" ]; then
    
    
        echo -e "A pasta $pasta_usuario/Modelos/ existe..."

        cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-da_pasta_Modelos_via_cron.tar.gz    Modelos/  2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/Modelos/ não existe..." | tee -a "$log"
        

    fi
    
    
# ----------------------------------------------------------------------------------------
#
# Backup do Ocomon ($backup/backup_Ocomon.sql_via_cron.gz)
#
#
#
# Nota:
#
# O comando será executado às 19h10, do dia 27º de todos os meses.
#
# Comandos relacionado ao Void Linux para: sv down mysqld  e depois  sv up mysqld
# 
# Fecha os navegadores webs da maquina local (Firefox e Google Chrome)
#
# /srv/www/apache/ocomon/

# 10 19 27 * * 



# cd "$pasta_usuario" &&  killall  -9 /usr/bin/firefox ; killall  -9 /opt/google/chrome/chrome ; which mysqldump && which mysql && which tar && sv up mysqld  &&  /usr/bin/mysqldump -u root -p"$senha_mysql" -x -e -B ocomon | gzip > "$backup"/backup_Ocomon-4.0.sql_via_cron.gz  2>> "$log"  && sleep 2 &&  sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /home/"$usuario"/.icons/extras/ocomon.png  'Atenção!' '\n\nBackup do OcoMon finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n\n'




# httpd ou apachectl

which httpd  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



cd "$pasta_usuario"

killall  -9 /usr/bin/firefox           1> /dev/null 2> /dev/null
killall  -9 /opt/google/chrome/chrome  1> /dev/null 2> /dev/null






# Verificar se o arquivo /etc/apache/httpd.conf  existe

if [ -e "/etc/apache/httpd.conf" ] ; then

clear

echo "O arquivo /etc/apache/httpd.conf existe."








# No Void Linux:

# fail: mysqld: unable to change to service directory: file does not exist

# ls /var/service/ | grep mysqld


# ls /var/service/mysqld
# ls: não foi possível acessar '/var/service/mysqld': Arquivo ou diretório inexistente


# ln -s /etc/sv/mysqld /var/service/mysqld




# sv up mysqld
# 
# mysql
# Welcome to the MariaDB monitor.  Commands end with ; or \g.
# Your MariaDB connection id is 3
# Server version: 10.5.22-MariaDB-debug MariaDB Server
# 
# Copyright (c) 2000, 2018, Oracle, MariaDB Corporation Ab and others.
# 
# Type 'help;' or '\h' for help. Type '\c' to clear the current input statement.
# 
# MariaDB [(none)]> SHOW DATABASES;
# +--------------------+
# | Database           |
# +--------------------+
# | information_schema |
# | mysql              |
# | ocomon             |
# | performance_schema |
# +--------------------+
# 4 rows in set (0,065 sec)
# 
# MariaDB [(none)]> quit
# Bye
 




# Verificar se uma tabela existe na base de dados



# Executa o dump das bases

# -p "$senha_mysql"

LISTADB=$(/usr/bin/mysqlshow -u root |  grep  'ocomon' | sed 's/|//g' |  sed 's/ //g')


if [ "$LISTADB" == "ocomon" ]; then


clear

echo "
Backup do Ocomon (backup_Ocomon.sql_via_cron.gz)
" | tee -a "$log"

sleep 2









# ----------------------------------------------------------------------------------------

clear

# Tipos de distribuições Linux

distribuicao_linux=$(cat /etc/*-release | egrep "PRETTY_NAME" | cut -d = -f 2 | tr -d '"')



 if [[ "$distribuicao_linux" == *"Void Linux"* ]]; then

       echo -e "\n${GREEN}Void Linux.... ${NC}\n" 
 

# Para verificar se o diretório /var/service/mysqld existe.

if [ -d "/var/service/mysqld" ]; then
    

echo "
Localizado /var/service/mysqld
"

else
     
# Habilitando o serviço do MariaDB/mysql
 
ln -s /etc/sv/mysqld /var/service/mysqld


fi




ls -lh /var/service/mysqld

# lrwxrwxrwx 1 root root 14 out 18 18:36 /var/service/mysqld -> /etc/sv/mysqld


# Para saber com esta o estado do serviço

sv status mysqld

# Para iniciar o serviço

sv up mysqld



# https://medium.com/@leandroembu/lamp-no-void-linux-2019-6be1184b7c1e



 elif [[ "$distribuicao_linux" == *"Ubuntu"* || "$distribuicao_linux" == *"Debian"* || "$distribuicao_linux" == *"Kali"*  ]]; then

       echo -e "\n${GREEN}Distribuições Linux de base Debian.... ${NC}\n"  

      # PRETTY_NAME="Ubuntu 18.04.1 LTS"
      # PRETTY_NAME="Ubuntu 22.04.2 LTS"
      # PRETTY_NAME="Kali GNU/Linux Rolling"
      # PRETTY_NAME="Debian GNU/Linux 9 (stretch)"
      
                         
# Para verificar o status de um serviço usando o Systemd

systemctl status mysqld


# Para habilitar o serviço em sistemas systemd:

# systemctl enable mysqld


# Para iniciar um serviço

systemctl start mysqld


# https://pt.linux-console.net/?p=15468



 elif [[ "$distribuicao_linux" == *"Red Hat Enterprise Linux"* ]]; then
 
       echo -e "\n${GREEN}Red Hat Enterprise Linux.... ${NC}\n" 
             
       # PRETTY_NAME="Red Hat Enterprise Linux Server 7.6 (Maipo)"
 
       
# Exibição do status do serviço
  
systemctl status mysqld.service     


# Para iniciar um serviço

systemctl start mysqld.service


# https://access.redhat.com/documentation/pt-br/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing_services_with_systemd-services-start
# https://access.redhat.com/documentation/pt-br/red_hat_enterprise_linux/8/html/configuring_basic_system_settings/managing_services_with_systemd-services-status


 elif [[ "$distribuicao_linux" == *"Gentoo"* ]]; then
 
       echo -e "\n${GREEN}Gentoo.... ${NC}\n"  
            
       # PRETTY_NAME="Gentoo/Linux"
  
              
# Para disparar o processo mysqld em um sistema de inicialização OpenRC, execute o seguinte comando:

rc-service mysqld start      


# https://wiki.gentoo.org/wiki/Handbook:Parts/Full/Installation/pt-br


 elif [[ "$distribuicao_linux" == *"CentOS"* ]]; then
 
       echo -e "\n${GREEN}CentOS.... ${NC}\n"  
            
       # PRETTY_NAME="CentOS Linux 7 (Core)"
    
              
# Para verificar serviços 

systemctl status mysqld


# Serviço em execução enquanto o sistema operacional está sendo carregado.

# systemctl enable mysqld



# Para iniciar um serviço

systemctl start mysqld


# https://www.hostinger.com.br/tutoriais/listar-servicos-linux
# https://admininfo.info/how-to-activate-stop-restart-and-view-centos-8-services



 elif [[ "$distribuicao_linux" == *"SUSE Linux Enterprise"* ]]; then
 
       echo -e "\n${GREEN}openSUSE.... ${NC}\n"  
            
       # PRETTY_NAME="SUSE Linux Enterprise Server 12 SP4"

           
# Para verificar serviços 

systemctl status mysqld


# systemctl enable mysqld


# Para iniciar um serviço

systemctl start mysqld


# https://documentation.suse.com/pt-br/sles/12-SP5/html/SLES-all/cha-deployment-prep-boot.html



# elif [[ "$distribuicao_linux" == *""* ]]; then
 
#       echo -e "\n${GREEN}Sabayon.... ${NC}\n"  
            
       # PRETTY_NAME=""
              
              
# systemctl status mysqld

# systemctl enable mysqld

# systemctl start mysqld


                       
# https://www.vivaolinux.com.br/dica/systemd-no-Sabayon-Adicionando-servicos-manualmente
# https://semanickz.wordpress.com/2016/09/20/o-magnifico-sabayon-linux-comandos-pos-instalacao/
# https://www.vivaolinux.com.br/dica/Linux-avancado-Controle-de-inicializacao-em-Sabayon-Linux
# https://www.vivaolinux.com.br/dica/Atualizando-suporte-ao-Dropbox-em-Sabayon



 elif [[ "$distribuicao_linux" == *"Slackware"* ]]; then
 
       echo -e "\n${GREEN}Slackware.... ${NC}\n"  
  
            
# Todos os arquivos responsáveis pela inicialização são armazenados no diretório /etc/rc.d/.       
 
# Para que um script não seja executado durante a inicialização basta remover a permissão 
# de execução. As permissões são manipuladas através do comando chmod, lembre-se de 
# utilizar o usuário Root. 


# Adicionando a permissão de execução

chmod +x /etc/rc.d/rc.mysqld


ls -lh /etc/rc.d/rc.mysqld


# Para iniciar um serviço

/etc/rc.d/rc.mysqld start



# https://telazul.drusian.com.br/pt/artigo/entendendo-a-inicializacao-do-slackware       
# https://www.vivaolinux.com.br/topico/MySQL/Erro-ao-configurar-o-MYSQL.
# https://www.linux.org/threads/changing-data-directory-of-mysql-in-slackware.31038/
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/NetworkManager-iniciado-na-inicializacao-No-Slackware
# http://www.dicas-l.com.br/arquivo/iniciar_o_slackware_linux_no_modo_grafico_automaticamente.php

 
                                              	       			
 else

     echo -e "\n${RED}Não foi possível identificar sua distribuição Linux para atualizar...${NC}\n"
    
     # notify-send -i gtk-dialog-info -t 100000 "Atualizar sistema" "\nNão foi possível identificar sua distribuição Linux para atualizar..."
     
     # exit
     
 fi
 
 
# ---------------------------------------------------------------------------------------- 












# echo "
# Fazendo o backup do Ocomon (MySQL)...
# "

# /usr/bin/mysqldump -u root -p$senha_mysql -x -e -B ocomon | gzip > "$backup"/backup_Ocomon-4.0.sql_via_cron.gz  2>> "$log"  

/usr/bin/mysqldump -u root  ocomon > "$pasta_usuario"/backup_Ocomon.sql  2>> "$log"



# Remover aspas duplas no Bash usando o sed

pasta_do_apache=$(cat /etc/apache/httpd.conf | grep -i "DocumentRoot " | cut -d" " -f2 | sed 's/"//g'  2>> "$log" )

# /srv/www/apache

# https://pt.linux-console.net/?p=13765



cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup_Ocomon.sql_via_cron.gz   "$pasta_do_apache"/ocomon  backup_Ocomon.sql   2>> "$log"

sleep 1


rm -Rf "$pasta_usuario"/backup_Ocomon.sql


sleep 1


sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/extras/ocomon.png  'Atenção!' '\n\nBackup do OcoMon finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n\n'



else

clear

echo "O arquivo /etc/apache/httpd.conf não existe." | tee -a "$log"



fi





else


echo "
Ocomon não foi localizado no banco de dados MySQL.

" | tee -a "$log"



fi






fi





# https://techviewleo.com/install-mysql-mariadb-database-on-void-linux/
# https://medium.com/@jvnetobr/backup-e-restore-de-banco-de-dados-mysql-4e5c776d53a4
# http://www.bosontreinamentos.com.br/mysql/mysql-mysqldump-backup-e-restauracao-do-banco-de-dados-25/
# https://pt.stackoverflow.com/questions/329266/dump-de-todos-os-bancos-para-um-usu%C3%A1rio-especifico
# https://www.vivaolinux.com.br/topico/Shell-Script/Script-de-backup-5
# https://www.codigofonte.com.br/dicas/backup-e-restore-no-mysql-com-mysqldump
# https://linuxize.com/post/how-to-back-up-and-restore-mysql-databases-with-mysqldump/
# http://www.bosontreinamentos.com.br/mysql/mysql-mysqldump-backup-e-restauracao-do-banco-de-dados-25/


# ----------------------------------------------------------------------------------------


# Backup da pasta /etc/skel/  (O comando será executado às 19h30)
#
# Ao se criar um usuário utilizando o comando useradd, o comando copia os arquivos de um diretório especial 
# chamado de /etc/skel para o diretório home do usuário recém-criado.
#
# O diretório /etc/skel funciona como um diretório "home" modelo. Quando uma conta de usuário é criada com o 
# comando useradd, o conteúdo do diretório /etc/skel é copiado para o diretório HOME do usuário recém criado. 
# Funciona como uma cópia do "profile" no Windows.
#
# Geralmente neste diretório são colocados os scripts de login do bash que podem ser customizados, assim como 
# subdiretórios e outros arquivos que se deseja que façam parte do diretório HOME dos usuários quando eles 
# forem criados no sistema.
#
#
# Pode ser usado para: limpar as configurações dos usuários de um sistema quando o mesmo é reiniciado.
#
#
# https://www.certificacaolinux.com.br/comando-linux-skel/
# https://gnulinuxbr.wordpress.com/2009/12/03/diretorio-etcskel/


# 30 19 * * *  cd /home/fernando/  && /usr/bin/mkdir -p backup && chown -R fernando:fernando backup  && 





# Para verificar se o diretório /etc/skel/ existe.

    if [ -d "/etc/skel/" ]; then
    
    
        echo -e "A pasta /etc/skel/ existe..."

        /usr/bin/tar -czf "$backup"/backup-da_pasta_skel_via-cron.tar.gz  /etc/skel/   2>> "$log"
        
    else
    
        echo -e "A pasta /etc/skel/ não existe..." | tee -a "$log"
        

    fi
    
    
# ----------------------------------------------------------------------------------------

# Backup do Firefox (O comando será executado às 20h49, do dia 4º de todos os meses.)

# 49 20 4 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup &&"

which firefox  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Para verificar se o diretório  $pasta_usuario/.mozilla/ existe.

    if [ -d "$pasta_usuario/.mozilla/" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.mozilla/ existe..."

echo "
Realizando o backup do Firefox...
"

cd "$pasta_usuario" &&  killall  -9 firefox 1> /dev/null 2> /dev/null ; /usr/bin/tar -czf "$backup"/backup-Firefox_via_cron.tar.gz   .mozilla/  2>> "$log" &&  sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/hicolor/128x128/apps/firefox.png  'Atenção!' '\n\nBackup do Firefox finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n\n' 

        
        
    else
    
        echo -e "A pasta $pasta_usuario/.mozilla/ não existe..." | tee -a "$log"
        

    fi
    
    
fi



# ----------------------------------------------------------------------------------------


# Backup dos scripts em /usr/local/bin



# Todos os meus scripts salvo na pasta /usr/local/bin. e faço uma cópia dessa pasta para guardá-la externamente.



# Backup da pasta  /usr/local/bin/  (O comando será executado às 23h03) - Estava gerando um arquivo compactado com 26,6 GB
#
#
# Dentro da pasta /usr/local temos os programas que foram manualmente instalados (Programas de terceiros). 
# É quase um Arquivos de Programas (Windows), mas mais complexo.
#
#
# https://livrelinux.wordpress.com/2012/04/10/as-pastas-do-linux/


# 03 23 * * *  cd /home/fernando/  && /usr/bin/mkdir -p backup && chown -R fernando:fernando backup  && 




# Para verificar se o diretório  /usr/local/bin/ existe.

    if [ -d "/usr/local/bin/" ]; then
    
    
        echo -e "A pasta /usr/local/bin/ existe..."

echo "
Realizando o backup dos scripts em /usr/local/bin...
"

# cd "$pasta_usuario" &&  /usr/bin/tar -czf "$backup"/backup-scripts_via_cron.tar.gz   /usr/local/bin/  /etc/backup.conf  2>> "$log" &&  sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/hicolor/128x128/apps/uget-icon.png  'Atenção!' '\n\nBackup dos scripts em /usr/local/bin finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n\n' 

        
        
    else
    
        echo -e "A pasta /usr/local/bin/ não existe..." | tee -a "$log"
        

    fi
    
    

# ----------------------------------------------------------------------------------------


# Backup do Conky (O comando será executado às 00h58, do dia 2º de todos os meses.)
#
# 
# Neste caso, refere-se à sessão Xfce - ou poderia ser uma sessão KDE, LXDE, LXQt etc.
#
# Por exemplo, eu quero que o Conky (ou outro aplicativo) se inicie junto com cada nova sessão do 
# KDE, Xfce, MATE, Cinnamon, Gnome etc.
# 
# Então, eu tenho pelo menos 2 opções:
# 
#     Colocar o Conky (ou outro app) nos "Aplicativos de sessão", ou "Autostart" - o nome varia de 
# uma DE para outra. - Isso costuma estar nas Configurações de cada DE, em geral associado à 
# palavra "Sessão".
# 
#    Ou posso abrir o programa, e deixar o DE "salvar a sessão" - e isso bastará para que ele volte 
# a abrir automaticamente, a cada novo início de sessão.
# 
#
# "Salvar sessão na saída" indica pro sistema que, quando vc mandar fechar a sessão (através do logout, 
# reinicialização ou desligamento) ele vai anotar os aplicativos que estão abertos, tamanho das janelas e 
# localização delas. Na próxima vez que você iniciar a sessão, o sistema irá tentar reabrir os aplicativos.
#
# Eu não gosto de usar essa opção, pois quando eu fecho a sessão quero finalizar tudo que está aberto. 
# Porém se eu precisar interromper as atividade, eu prefiro suspender o computador e aí os aplicativos 
# continuam carregados no mesmo ponto onde estavam.
#
# 
# https://plus.diolinux.com.br/t/o-que-sao-sessions-e-o-que-signicar-save-session-on-logout/20908
# https://byteria.blogspot.com/2018/12/conkyrc-hardware-system-monitoring.html
#
#
#

# 58 00 2 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



which conky 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/.conky/ existe.

    if [ -d "$pasta_usuario/.conky/" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.conky/ existe..."


echo "
Realizando o backup do Conky...
"

       cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_Conky_via_cron.tar.gz    .conky/   2>> "$log"

        
        
    else
    
        echo -e "A pasta $pasta_usuario/.conky/ não existe..."  | tee -a "$log"
        

    fi
    



fi

# ----------------------------------------------------------------------------------------



which mpv 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/.config/mpv existe.

    if [ -d "$pasta_usuario/.config/mpv" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.config/mpv existe..."


echo "
Realizando o backup do mpv...
"

       cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-mpv_via_cron.tar.gz    .config/mpv   2>> "$log"

        
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/mpv não existe..."  | tee -a "$log"
        

    fi
    



fi


# https://github.com/mpv-player/mpv/wiki/User-Scripts
# https://ubuntuforum-br.org/index.php?topic=121307.0

# ----------------------------------------------------------------------------------------

# Opera


# https://www.youtube.com/watch?v=dQ_ZV4yptHs

# ----------------------------------------------------------------------------------------

echo "
VLC
" | tee -a "$log"


# VLC não toca Vídeos do YouTube [Resolvido]

# Publicado por Xerxes em 22/01/2019


# Dica testada no Slackware Current em 19/01/2019.

# Ao adicionar uma URL de YouTube no VLC (Menu => Mídia => Abrir Fluxo de Rede), dá erro 
# e não toca o vídeo!


# Algo como "VLC is unable to open the MRL..".

# ou

# lua error: Couldn't extract youtube video URL, please check for updates to this script


# Após uma busca no Google, descobri a solução em três etapas:

# 1. Feche o VLC.

# 2. Baixe o arquivo "youtube.lua" do GitHub do VLC:

# wget -c https://github.com/videolan/vlc/blob/master/share/lua/playlist/youtube.lua

# 3. Mova o arquivo para...

#    /usr/lib64/vlc/lua/playlist/ (se for 64-bits)
#    /usr/lib/vlc/lua/playlist/ (se for 32-bits)


# Exemplo:

# mv youtube.lua /usr/lib64/vlc/lua/playlist/

# Reabra o VLC e coloque a URL do YouTube.

# Agora vai!


# Fonte: https://www.vivaolinux.com.br/dica/VLC-nao-toca-Videos-do-YouTube-Resolvido





# killall -9 vlc

# xbps-install -Suvy vlc
# xbps-install -Suvy lua


# ls -lh /usr/lib64/vlc/lua/playlist/youtube.lua*


# rm -Rf /usr/lib64/vlc/lua/playlist/youtube.lua

# curl "https://code.videolan.org/videolan/vlc/-/raw/master/share/lua/playlist/youtube.lua?inline=false" -o /usr/lib64/vlc/lua/playlist/youtube.lua



# ========================================================================================

# Para identificar a arquitetura do seu processador (32 bits ou 64 bits)

echo "

" >> "$log"


arquitetura=$(uname -m)

 if [[ "$arquitetura" == "x86_64" ]]; then

# Para 64 bits 

ls -lh /usr/lib64/vlc/lua/playlist/ | tee -a "$log"
     
bibliotecas_de_sistema="lib64"     
                                         	       			
 else

# Para 32 bits 

bibliotecas_de_sistema="lib" 

ls -lh /usr/lib/vlc/lua/playlist/ | tee -a "$log"
    
    
    # echo -e "Não foi possível identificar a biblioteca do sistema..."

     
 fi 



echo "

" >> "$log"

# ========================================================================================
 
 

which vlc 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear


# Para verificar se o diretório $pasta_usuario/.config/vlc existe.

    if [ -d "$pasta_usuario/.config/vlc" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.config/vlc existe..."


echo "
Realizando o backup do VLC...
"

# ~/.local/share/vlc/lua/playlist/

# /usr/lib64/vlc/lua/playlist/


       cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-VLC_via_cron.tar.gz    .config/vlc  .local/share/vlc   /usr/"$bibliotecas_de_sistema"/vlc/lua/playlist/*.lua  2>> "$log"



# ----------------------------------------------------------------------------------------

sleep 2
clear

echo "
Buscando arquivos .xspf de playlist do VLC...
"  | tee -a "$log"

# Arquivos .xspf para playlist no VLC


# O "-type f"  no find é para busca somente  os arquivos.


# -type c
#        File is of type c:
# 
#        b      block (buffered) special
# 
#        c      character (unbuffered) special
# 
#        d      directory
# 
#        p      named pipe (FIFO)
# 
#        f      regular file
# 
#        l      symbolic link; this is never true if the -L option or the  -follow  option  is  in  effect,
#               unless the symbolic link is broken.  If you want to search for symbolic links when -L is in
#               effect, use -xtype.
# 
#        s      socket
# 
#        D      door (Solaris)
       

# Método 1

# find / -iname "*.xspf" >  VLC_playlist_YouTube.txt

# tar -czvf VLC_playlist.tar.gz -T VLC_playlist_YouTube.txt




# Resultado:

# $ tar -czvf VLC_playlist.tar.gz -T VLC_playlist_YouTube.txt
# tar: Removendo "/" inicial dos nomes dos membros
# /home/fernando/linux.xspf
# tar: Removendo "/" inicial dos alvos de links físicos
# /home/fernando/.local/share/vlc/ml.xspf
# /home/fernando/Desktop/lista-vlc.xspf



# ou


# Método 2

cd "$pasta_usuario" &&  find / -iname "*.xspf" -exec tar -czvf "$backup"/VLC_playlist.tar.gz {} + 2>> "$log"



# Resultado:

# $ find / -iname "*.xspf" -exec tar -czvf VLC_playlist.tar.gz {} + 2>/dev/null 
# /home/fernando/linux.xspf
# /home/fernando/.local/share/vlc/ml.xspf
# /home/fernando/Desktop/lista-vlc.xspf





# https://www.baeldung.com/linux/find-tar-files
# https://stackoverflow.com/questions/5891866/find-files-and-tar-them-with-spaces
# https://explainshell.com/explain?cmd=find+-name+%22*.bak%22+-exec+%22rm+-f+%7B%7D%22
# https://explainshell.com/explain?cmd=find+-name+%22*.bak%22+-type+f++-exec+%22rm+-f+%7B%7D%22
# http://www.sharktime.com/en_wList.html
# https://stackoverflow.com/questions/5891866/find-files-and-tar-them-with-spaces
# http://ptcomputador.com/Software/digital-video-software/122797.html


# ----------------------------------------------------------------------------------------

        
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/vlc não existe..."  | tee -a "$log"
        

    fi
    



fi


# https://code.videolan.org/videolan/vlc/-/issues/27827
# https://askubuntu.com/questions/197739/vlc-youtube-videos-wont-play-anymore
# https://www.vivaolinux.com.br/dica/VLC-nao-toca-Videos-do-YouTube-Resolvido

# ----------------------------------------------------------------------------------------

backup_contabilidade(){

sleep 2
clear

echo "
Dica:

Direciona os e-mails com os arquivos .xml para uma pasta específica no sistema.

Separando os XML por meses e anos para não demora a leitura dos arquivos pelo gerenciador 
de arquivo do sistema.


Buscando arquivos .xml relacionado a Contabilidade (nota fiscal)...
"  | tee -a "$log"

sleep 2

# Método 1

# O problema é que o Linux usa também arquivo xml

# cd "$pasta_usuario" &&  find / -iname "*.xml" -exec tar -czvf "$backup"/Contabilidade_XML.tar.gz {} + 2>> "$log"


# Método 2


# find / -iname "*.xml" 




# Verificar se as variavel "$contabilidade_XML" em /etc/backup.conf esta nula.


if [ -z "$contabilidade_XML" ]; then

   echo -ne "Você não informou o local onde é salvo os arquivos .xml relacionado a Contabilidade (nota fiscal) em /etc/backup.conf.\n" | tee -a "$log"
		
		
else

# Quando falamos sobre o arquivo XML das Notas Fiscais, muitos ainda ficam com dúvidas 
# sobre o que é e para que serve. Mas é de suma importância ter o conhecimento sobre 
# esse tipo de arquivo, visto que ele é essencial nas empresas e para a contabilidade. 
#
# Implementado em 2006, o arquivo XML trouxe, desde então, muitos benefícios para todos 
# os setores que são diretamente ligados a ele. Sem contar a tecnologia, a agilidade para 
# obter informações, a segurança dos dados contidos no XML e, não menos importante, a 
# dispensa de acúmulo de papéis dentro das organizações.
#
# Além disso, ficou mais rápida e fácil a fiscalização por parte da Receita Federal, já 
# que a emissão e o armazenamento do XML é completamente de forma eletrônica e em tempo 
# real.
#
# O XML é a sigla para eXtensible Markup Language, mas é apenas um tipo de linguagem de 
# marcação que define regras para codificar os documentos.
#
# Ele é utilizado na NF-e para armazenar os dados e ainda solicitar uma assinatura 
# digital para a emissão da nota através do Certificado Digital, assim garantindo 
# segurança e confiabilidade nas informações contidas no arquivo, já que a NF-e não é 
# autorizada caso tenha algum preenchimento incorreto.
#
# Pode ser lido em vários programas, como o visualizador DF-e (Documento Fiscal 
# Eletrônico), disponível no próprio site da Nota Fiscal eletrônica.
#
# É preciso destacar que, por ser o único documento que possui validade fiscal e 
# jurídica, é necessário manter o arquivo XML por um período mínimo de cinco anos após a 
# sua emissão.
#
# Mas não se engane! Caso emita uma NF-e com informações incorretas, a Receita Federal 
# terá conhecimento e ficará de olho na sua empresa. Por isso, o melhor caminho é conferir 
# todos os dados e impostos contidos na Nota Fiscal eletrônica emitida.
#
# Imagina ainda ter que lidar com aqueles talões de notas fiscais que eram rasurados no 
# momento da emissão, ou com as notas fiscais que se perdiam no meio do caminho e, quando 
# chegavam no fiscal, estavam num estado horrível. Sem falar na falta de sustentabilidade, 
# já que, dependendo do tipo de nota fiscal, era necessária a impressão de 3 vias.
#
# Tenha todos os arquivos XML das suas notas fiscais em um mesmo lugar.
#
# Porém, com a implementação do arquivo XML, tudo isso mudou. A rotina fiscal agora é 
# automatizada e o acesso às notas fiscais emitidas ocorre em tempo real. O que é ótimo, 
# pois, se tiver alguma informação incorreta, a NF-e pode ser cancelada ou pode ser 
# emitida uma CC-e (Carta de Correção Eletrônica) antes da saída da mercadoria ou 
# prestação de serviço.
#
# Junto com a NF-e, foi implantado o Danfe (Documento Auxiliar de Nota Fiscal eletrônica), 
# que tem o intuito de facilitar a leitura e o entendimento das informações contidas no 
# arquivo XML da NF-e.
#
# O Danfe traz de maneira resumida todos os dados informados no XML, sendo obrigatório no 
# trânsito da mercadoria. Então, caso a transportadora seja parada pelo fisco e não tenha 
# o Danfe junto com a mercadoria, a empresa pode ser multada pelo descumprimento da Lei.
#
# Além disso, diferente da NF-e, o Danfe não possui validade jurídica. Dessa forma, é 
# necessária uma maior atenção no momento de arquivar esses documentos, não podendo 
# confundir e descartar o arquivo XML e salvar o Danfe em PDF.


  cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-Contabilidade_XML_via_cron.tar.gz  "$contabilidade_XML"   2>> "$log"

		
fi



# https://arquivei.com.br/blog/arquivo-xml-rotina-fiscal/
# https://olhardigital.com.br/2023/07/08/dicas-e-tutoriais/como-criar-pastas-e-filtros-no-gmail-para-organizar-e-mails/


}


backup_contabilidade


# ----------------------------------------------------------------------------------------


# Backup do Fluxbox (O comando será executado às 01h26, do dia 3º de todos os meses.)
#
# 
# Minhas configurações do Fluxbox
# 
# Além de instalar o Fluxbox, também instalo alguns pacotes de suporte essenciais
# 
# 
# No Void Linux
#
# xbps-install -Suy fluxbox lxappearance volumeicon parcellite idesktop plank compton xfce4-terminal xfce4-screenshooter scrot qmmp
#
# dunst suckless-tools  hsetroot xsettingsd  
# 
#
#      Fluxbox é um gerenciador de janelas livre para X Window System baseado no código do BlackBox 0.61.1. O Fluxbox se encontra na versão 1.3.7, lançada em 
#      8 de fevereiro de 2015. É escrito em C++. Uma de suas capacidades é o suporte para abas de janelas.
#     Compton é um compositor para fornecer alguns efeitos de área de trabalho, como sombra, transparência, fade e transição.
#
#
#     Hsetroot é um manipulador de papel de parede. O Fluxbox não possui um manipulador de papel de parede por padrão. Fluxbox vem com fbsetroot& fbsetbgpor padrão. 
#    Mas eles não são um manipulador de papel de parede real. Eles são apenas scripts wrapper para encontrar qualquer manipulador de papel de parede disponível e usá-lo 
#    como manipulador de papel de parede fluxbox. Quando instalo o Debian, começo com uma instalação mínima. Portanto, não tenho nenhum gerenciador de papel de parede 
#    que suporte JPG/PNG por padrão. Então, eu escolho hsetroot.
#    Suckless Tools são vários utilitários feitos por suckless.org , mas na verdade eu só preciso dmenu. Infelizmente o pacote não está dividido, então preciso puxar todos eles.
#    Xsettingsd é um daemon de configurações simples para carregar fontconfig e algumas outras opções. Sem isso, as fontes pareceriam rasterizadas em alguns aplicativos.
#   
# 
#     LXAppearance é usado para alterar os ícones do tema GTK, fontes e algumas outras preferências.
#     Scrot é um aplicativo simples de captura de tela.
#     xfce4-screenshooter
#    xfce4-terminal como terminal padrão
#    Volumeicon é um aplicativo de volume
#    Parcellite é um aplicativo da área de transferência
#    Navegador web é o Firefox  não achei outro leve e funcional ate agora. Adequado para hardware de baixa potência.
#    Dunst como daemon de notificação.
#    Qmmp como reprodutor de música. Tem também o ncmpcpp
#
#
# Por favor, inspecione o código antes de usar.
#
# Extraia o arquivo backup-do_Fluxbox_via_cron.tar.gz para o seu diretório pessoal. Assim, você receberá o .fluxbox e outros diretórios.
#
#
# 26 01 3 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



which compton      2>> "$log"
which idesk        2>> "$log"
which volumeicon   2>> "$log"
which plank        2>> "$log"



which fluxbox 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/.fluxbox/ existe.

    if [ -d "$pasta_usuario/.fluxbox/" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.fluxbox/ existe..."



echo "
Realizando o backup do Fluxbox...
"

# Nota:
#
# O Picom é um compositor para X11, fork do abandonado Compton (~/.config/compton.conf)


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_Fluxbox_via_cron.tar.gz  .fluxbox  .idesktop  .ideskrc  .config/volumeicon   .config/plank  .config/picom  .Xresources   2>> "$log"

       
               
        
    else
    
        echo -e "A pasta $pasta_usuario/.fluxbox/ não existe..." | tee -a "$log"
        

    fi
    
    
    



fi



#
#
#
# https://addy-dclxvi.github.io/post/my-fluxbox/
# https://addy-dclxvi.github.io/file/fluxbox.tar.gz
# http://fluxbox.org/
# https://terminalroot.com.br/2019/07/instale-e-configurar-o-ncmpcpp-e-mpd-no-seu-linux.html
# https://addy-dclxvi.github.io/post/fish-shell/
# https://addy-dclxvi.github.io/post/dunst/
# https://addy-dclxvi.github.io/post/configuring-urxvt/
# https://askubuntu.com/questions/901077/where-does-compton-look-for-its-conf-file
# https://linuxdicasesuporte.blogspot.com/2021/01/picom-compositor-para-x11-no-linux.html
# https://github.com/chjj/compton

# ----------------------------------------------------------------------------------------

# IceWm

# ~/.icewm/


which icewm 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/.icewm existe.

    if [ -d "$pasta_usuario/.icewm" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.icewm existe..."



echo "
Realizando o backup do IceWm...
" | tee -a "$log"


ls -lh "$pasta_usuario"/.icewm >> "$log"


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_IceWm_via_cron.tar.gz  .icewm  /usr/local/share/icewm/  2>> "$log"

       
               
        
    else
    
        echo -e "A pasta $pasta_usuario/.icewm não existe..." | tee -a "$log"
        

    fi
    
    
    



fi


# https://linuxdicasesuporte.blogspot.com/2022/10/gerenciador-de-janelas-icewm-31.html
# http://byteria.blogspot.com/2018/05/antix-icewm-learning.html
# https://forum.tinycorelinux.net/index.php/topic,1861.30.html
# https://www.antixforum.com/forums/topic/de-is-broken-icewm-space-no-menu-items/

# ----------------------------------------------------------------------------------------

# Telegram


# https://linuxdicasesuporte.blogspot.com/2023/02/telegram-desktop-461-e-lancado.html

# ----------------------------------------------------------------------------------------

# Audacious - player de áudio 


# https://linuxdicasesuporte.blogspot.com/2023/03/o-player-de-audio-audacious-43-adiciona.html

# ----------------------------------------------------------------------------------------

# qmmp - player de áudio 

which qmmp 1> /dev/null 2> /dev/null

if [ $? == 0 ]; then

clear


# Para verificar se o diretório $pasta_usuario/.qmmp existe.

    if [ -d "$pasta_usuario/.qmmp" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.qmmp existe..."
        
echo "
Realizando o backup do qmmp...
"

       cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_qmmp_via_cron.tar.gz  .qmmp   2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/.qmmp não existe..." | tee -a "$log"
        

    fi
    
    

fi
# ----------------------------------------------------------------------------------------

# vokoscreen

# xbps-query -Rs vokoscreen
# [-] vokoscreen-2.5.0_1 Easy to use screencast creator


# https://www.youtube.com/watch?v=H5Zrl20tHEc

# ----------------------------------------------------------------------------------------

# Simple Screen Recorder


which simplescreenrecorder 1> /dev/null 2> /dev/null

if [ $? == 0 ]; then

clear


# Para verificar se o diretório $pasta_usuario/.ssr existe.

    if [ -d "$pasta_usuario/.ssr" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.ssr existe..."
        
echo "
Realizando o backup do Simple Screen Recorder...
"

       cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_ssr_via_cron.tar.gz  .ssr   2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/.ssr não existe..." | tee -a "$log"
        

    fi
    
    

fi

# ----------------------------------------------------------------------------------------

# Sendto do Thunar  (O comando será executado às 23h52, do dia 5º de todos os meses.)
#
# /usr/share/Thunar/sendto/
# ~/.local/share/Thunar/sendto/
#
#
#

# 52 23 5 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "


which thunar 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/.local/share/Thunar/sendto existe.

    if [ -d "$pasta_usuario/.local/share/Thunar/sendto" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.local/share/Thunar/sendto existe..."
        
echo "
Realizando o backup do Sendto do Thunar...
"

       cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_Sendto-do-Thunar_via_cron.tar.gz  .local/share/Thunar/sendto    /usr/share/Thunar/sendto   2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/.local/share/Thunar/sendto não existe..." | tee -a "$log"
        

    fi
    
    


fi


#
#
# https://www.vivaolinux.com.br/dica/ClamAV-no-sendto-do-Thunar


# ----------------------------------------------------------------------------------------

# Fazer o backup das máquinas virtuais (VirtualBox)

which VirtualBox 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/VirtualBox\ VMs/ existe.

    if [ -d "$pasta_usuario"/VirtualBox\ VMs/ ]; then
    
    
        echo -e "A pasta $pasta_usuario/VirtualBox\ VMs/ existe..."
        
echo "
Realizando o backup do VirtualBox...
"

      # cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_VirtualBox_via_cron.tar.gz   VirtualBox\ VMs/   .config/VirtualBox/ 2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/VirtualBox\ VMs/ não existe..." | tee -a "$log"
        

    fi
    
    


fi


# https://www.vivaolinux.com.br/topico/Backup-Exec/Como-fazer-backup-de-VMs-do-XCP-NG-em-drives-remotos/
# https://www.vivaolinux.com.br/dica/Backup-de-uma-VM-do-VirtualBox


# ----------------------------------------------------------------------------------------


# Backup do tema do Grub  (O comando será executado às 00h19, do dia 11º de todos os meses.)

# 19 00 11 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "




which update-grub 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear


# Verificar se o arquivo existe

if [ -e "/etc/default/grub" ] ; then

clear

echo "O arquivo /etc/default/grub existe."


   cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_tema_do_grub_via_cron.tar.gz  /etc/default/grub  /boot/grub/themes   2>> "$log" 
   
   
else

clear

echo "O arquivo  /etc/default/grub não existe." | tee -a "$log"



fi



fi

# ----------------------------------------------------------------------------------------




# Backup do xmenu - Um menu para os programas no i3 (O comando será executado às 00h45)
#
# Ele oferece um menu estilo openbox que pode ser navegado com o teclado ou com o mouse.
#

# 45 00 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "



which xmenu 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_xmenu_via_cron.tar.gz  /usr/local/bin/xmenu.sh  .icons/xmenu/  .config/polybar/config   2>> "$log"


fi

# ----------------------------------------------------------------------------------------

# Fazer backup de um servidor Zabbix





# https://www.zabbix.com/br
# https://educapes.capes.gov.br/bitstream/capes/206308/2/Monitoramento_Redes_Zabbix.pdf
# https://tiparaleigo.wordpress.com/2020/01/08/zabbix-backup/
# https://www.vivaolinux.com.br/script/Script-de-backup-Zabbix

# ----------------------------------------------------------------------------------------

# PostgreSQL




# https://www.vivaolinux.com.br/dica/PostgreSQL-Fazendo-backup-de-um-servidor-inteiro
# https://www.tecmint.com/backup-and-restore-postgresql-database/

# ----------------------------------------------------------------------------------------

# GLPI


# https://www.vivaolinux.com.br/topico/GLPI/restaurar-backup-GLPI

# ----------------------------------------------------------------------------------------

# Backup do Nagios



# https://www.vivaolinux.com.br/dica/Backup-do-Nagios

# ----------------------------------------------------------------------------------------

# Backup do WPS Office


# sudo find / -type d -iname office


# ~/.local/share/Kingsoft/office6

# ~/.var/app/com.wps.Office/.kingsoft/
# ~/.kingsoft
# ~/.config/Kingsoft/


# C:\Users\admin\AppData\Roaming\kingsoft\


# cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_WPS_Office_via_cron.tar.gz  .kingsoft  .local/share/Kingsoft/  .config/Kingsoft/  .var/app/com.wps.Office/.kingsoft/    2>> "$log"


# https://github.com/flathub/com.wps.Office/issues/34
# https://wiki.archlinux.org/title/WPS_Office
# https://support.kingsoft.jp/wps/backup.html
# https://youtu.be/7PQOaezjkcY
# https://www.youtube.com/watch?v=PIXZw_iIHMo
# https://youtu.be/PIXZw_iIHMo


# ----------------------------------------------------------------------------------------

# Backup do Google Chrome


which google-chrome-stable  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear




# Para verificar se o diretório $pasta_usuario/.config/google-chrome/ existe.

    if [ -d "$pasta_usuario/.config/google-chrome/" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.config/google-chrome/ existe..."
        
echo "
Realizando o backup do Google Chrome...
"

       cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_Google-Chrome_via_cron.tar.gz  .config/google-chrome/   .cache/google-chrome/  2>> "$log" &&  sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/hicolor/128x128/apps/google-chrome.png  'Atenção!' '\n\nBackup do Google Chrome finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n\n' 
        
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/google-chrome/ não existe..." | tee -a "$log"
        

    fi
    
    



fi



# https://www.vivaolinux.com.br/topico/Navegadores/Fazer-backup-do-historico-do-chrome

# ----------------------------------------------------------------------------------------


# Backup do Pidgin


which pidgin 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear




# Para verificar se o diretório $pasta_usuario/.purple existe.

    if [ -d "$pasta_usuario/.purple" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.purple existe..."
        
echo "
Realizando o backup do Pidgin...
"

       cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_Pidgin_via_cron.tar.gz  .purple  2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/.purple não existe..." | tee -a "$log"
        

    fi
    
    



fi


# https://www.vivaolinux.com.br/dica/Backup-do-historico-de-mensagens-do-Pidgin-2.6.2-no-Ubuntu-9.10


# ----------------------------------------------------------------------------------------


# Backup do Dropbox


which dropbox 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear




# Para verificar se o diretório $pasta_usuario/Dropbox existe.

    if [ -d "$pasta_usuario/Dropbox" ]; then
    
    
        echo -e "A pasta $pasta_usuario/Dropbox existe..."
        
echo "
Realizando o backup do Dropbox...
"

      # cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_Dropbox_via_cron.tar.gz  Dropbox  .dropbox  2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/Dropbox não existe..." | tee -a "$log"
        

    fi
    
    



fi


# ----------------------------------------------------------------------------------------

# Backup do NetBeans


which netbeans 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear




# Para verificar se o diretório $pasta_usuario/NetBeansProjects existe.

    if [ -d "$pasta_usuario/NetBeansProjects" ]; then
    
    
        echo -e "A pasta $pasta_usuario/NetBeansProjects existe..."
        
echo "
Realizando o backup do NetBeans...
"

      cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_NetBeans_via_cron.tar.gz  NetBeansProjects  .netbeans  2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/NetBeansProjects não existe..." | tee -a "$log"
        

    fi
    
    



fi


# ----------------------------------------------------------------------------------------

# Backup do Hexchat


which hexchat 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear




# Para verificar se o diretório $pasta_usuario/.config/hexchat existe.

    if [ -d "$pasta_usuario/.config/hexchat" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.config/hexchat existe..."
        
echo "
Realizando o backup do Hexchat...
"

      cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_hexchat_via_cron.tar.gz  .config/hexchat/  2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/hexchat não existe..." | tee -a "$log"
        

    fi
    
    



fi


# ----------------------------------------------------------------------------------------


# Backup do LibreOffice


which libreoffice 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear




# Para verificar se o diretório $pasta_usuario/.config/libreoffice existe.

    if [ -d "$pasta_usuario/.config/libreoffice" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.config/libreoffice existe..."
        
echo "
Realizando o backup do LibreOffice...
"

      cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_libreoffice_via_cron.tar.gz  .config/libreoffice/  2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/libreoffice não existe..." | tee -a "$log"
        

    fi
    
    



fi


# ----------------------------------------------------------------------------------------


# Backup do Skype


which skypeforlinux 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear




# Para verificar se o diretório $pasta_usuario/.config/skypeforlinux existe.

    if [ -d "$pasta_usuario/.config/skypeforlinux" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.config/skypeforlinux existe..."
        
echo "
Realizando o backup do Skype...
"

      cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_skype_via_cron.tar.gz  .config/skypeforlinux/  2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/skypeforlinux não existe..." | tee -a "$log"
        

    fi
    
    



fi


# ----------------------------------------------------------------------------------------

# Backup do TeamViewer


which teamviewer 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear




# Para verificar se o diretório $pasta_usuario/.local/share/teamviewer.*/ existe.

    if [ -d "$pasta_usuario"/.local/share/teamviewer*/ ]; then
    
    
        echo -e "A pasta $pasta_usuario/.local/share/teamviewer*/ existe..."
        
echo "
Realizando o backup do TeamViewer...
"

      cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_TeamViewer_via_cron.tar.gz  .local/share/teamviewer*/  2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/.local/share/teamviewer*/ não existe..." | tee -a "$log"
        

    fi
    
    



fi


# ----------------------------------------------------------------------------------------

# Backup do Anydesk


which anydesk 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear




# Para verificar se o diretório $pasta_usuario/.anydesk existe.

    if [ -d "$pasta_usuario/.anydesk" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.anydesk existe..."
        
echo "
Realizando o backup do Anydesk...
"

      cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_Anydesk_via_cron.tar.gz  .anydesk   2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/.anydesk não existe..." | tee -a "$log"
        

    fi
    
    



fi


# ----------------------------------------------------------------------------------------

# Backup dos jogos (Steam)


which steam 1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear




# Para verificar se o diretório $pasta_usuario/.steam existe.

    if [ -d "$pasta_usuario/.steam" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.steam existe..."
        
echo "
Realizando o backup do Steam...
"

      cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_Steam_via_cron.tar.gz  .steam   2>> "$log"
        
        
    else
    
        echo -e "A pasta $pasta_usuario/.steam não existe..." | tee -a "$log"
        

    fi
    
    



fi


# https://diolinux.com.br/tutoriais/como-fazer-backup-steam-linux.html
# https://youtu.be/Hziqu5s1M-g
# https://www.vivaolinux.com.br/topico/Steam-e-Desura/Localizacao-da-pasta-onde-sao-instalados-jogos

# ----------------------------------------------------------------------------------------


which amsn  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do aMSN...
"


# Para verificar se o diretório $pasta_usuario/.amsn existe.

    if [ -d "$pasta_usuario/.amsn" ]; then
    
        echo -e "A pasta $pasta_usuario/.amsn existe..."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-aMSN_via_cron.tar.gz  .amsn   2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.amsn não existe..."
        

    fi
    




fi

# https://www.vivaolinux.com.br/dica/Instalando-o-aMSN-0.971-no-Famelix-2.0


# ----------------------------------------------------------------------------------------

# GoldenDict


which goldendict  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do GoldenDict...
"


# Para verificar se o diretório $pasta_usuario/.goldendict existe.

    if [ -d "$pasta_usuario/.goldendict" ]; then
    
        echo -e "A pasta $pasta_usuario/.goldendict existe..."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-GoldenDict_via_cron.tar.gz  .goldendict   2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.goldendict não existe..."
        

    fi
    



fi

# http://goldendict.org/download.php


# ----------------------------------------------------------------------------------------

# Popcorn Time


# Popcorn Time foi um cliente Torrent em multiplataforma livre e de código aberto que 
# inclui um tocador de mídia. O programa destina-se como uma alternativa gratuita para 
# serviços de vídeo sob demanda em assinatura, como o Netflix.
#
# A plataforma de streaming Popcorn Time anunciou em 4. jan. 2022 o fim das atividades.

# ----------------------------------------------------------------------------------------

# Kodi


# xbps-install -Suvy kodi  kodi-addon-pvr-zattoo  kodi-addon-pvr-iptvsimple



which kodi  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do Kodi...
"


# Para verificar se o diretório $pasta_usuario/.kodi existe.

    if [ -d "$pasta_usuario/.kodi" ]; then
    
        echo -e "A pasta $pasta_usuario/.kodi existe..."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-kodi_via_cron.tar.gz  .kodi  kodi_crashlog-*.log  2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.kodi não existe..."
        

    fi
    



fi

# https://kodi.tv/download/


# ----------------------------------------------------------------------------------------


# Stella - Emulador de Atari para PC - Roms (jogos)



which stella  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do Stella...
"


# Para verificar se o diretório $pasta_usuario/.config/stella existe.

    if [ -d "$pasta_usuario/.config/stella" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/stella existe..."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-Stella_via_cron.tar.gz  .config/stella  2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/stella não existe..."
        

    fi
    



fi



# https://pt.wikipedia.org/wiki/Stella_(emulador)
# http://www.bosontreinamentos.com.br/linux/como-jogar-jogos-do-atari-no-linux-com-emulador-stella/
# https://rggames.com.br/stella-emulador-para-atari-2600-1442-jogos/
# https://stella-emu.github.io/



# ----------------------------------------------------------------------------------------


# Mame (jogos)



which mame  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do Mame...
"


# Para verificar se o diretório $pasta_usuario/.mame existe.

    if [ -d "$pasta_usuario/.mame" ]; then
    
        echo -e "A pasta $pasta_usuario/.mame existe..."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-Mame_via_cron.tar.gz  .mame  2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.mame não existe..."
        

    fi
    



fi


# ----------------------------------------------------------------------------------------


# PSX - Emulador de PlayStation 1 - (jogos)



# xbps-install -Suvy pcsxr


which pcsxr  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do PSX...
"


# Para verificar se o diretório $pasta_usuario/.pcsxr existe.

    if [ -d "$pasta_usuario/.pcsxr" ]; then
    
        echo -e "A pasta $pasta_usuario/.pcsxr existe..."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-PSX_via_cron.tar.gz  .pcsxr  2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.pcsxr não existe..."
        

    fi
    



fi



# https://rggames.com.br/psx-o-melhor-emulador-de-ps1-para-pc/



# ----------------------------------------------------------------------------------------

# SNES9X -  Super Nintendo - (jogos)


# xbps-install -Suvy snes9x-gtk


which snes9x-gtk  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do SNES9X...
"


# Para verificar se o diretório $pasta_usuario/.config/snes9x existe.

    if [ -d "$pasta_usuario/.config/snes9x" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/snes9x existe..."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-SNES9X_via_cron.tar.gz  .config/snes9x  2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/snes9x não existe..."
        

    fi
    



fi


# https://rggames.com.br/top-8-melhores-emuladores-para-pc/

# ----------------------------------------------------------------------------------------

# gpodder - gerenciador de podcasts


# gpodder: um gerenciador de podcasts com suporte para sincronização com dispositivos móveis.

# xbps-install -Suvy gpodder


# .config/gpodder/

# ----------------------------------------------------------------------------------------

# Clementine - gerenciador de podcasts

# xbps-install -Suvy clementine 


which clementine  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do Clementine...
"


# Para verificar se o diretório $pasta_usuario/.config/Clementine existe.

    if [ -d "$pasta_usuario/.config/Clementine" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/Clementine existe..."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-Clementine_via_cron.tar.gz  .config/Clementine  Podcasts 2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/Clementine não existe..."
        

    fi
    



fi



# Monja Coen
#
# Trazemos para você as palestras da mestra do ZEN Budismo Brasileiro, Monja Coen, 
# gravadas no templo Tenzui Zenji da comunidade ZEN do Brasil. Na íntegra, sem cortes, 
# tanto as mais antigas, que estão publicadas em vídeo no Canal MOVA, quanto as inéditas 
# e exclusivas.
#
# https://feeds.simplecast.com/jXIrwgMS



# Diocast
#
# https://anchor.fm/s/4c177cd4/podcast/rss  (Não funcionou no Clementine)
# https://castbox.fm/ch/1323408             (Funcionou no Clementine)
#
# https://diolinux.com.br/diocast

# ----------------------------------------------------------------------------------------

# Transmission


# Como posso fazer backup dos meus torrents em um disco rígido externo que pode 
# ser movido de um sistema para outro? Estou usando Transmission.



# mova ~/.config/transmissionpara a unidade externa.
#
# crie um link simbólico no novo sistema apontando para uma unidade externa.
#
# Tenha em mente que se você desconectar a unidade, a transmissão se comportaria mal 
# (seu diretório de configuração apontaria para um local inexistente sem acesso de gravação).



which transmission  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do Transmission...
"


# Para verificar se o diretório $pasta_usuario/.config/transmission existe.

    if [ -d "$pasta_usuario/.config/transmission" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/transmission existe..."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-Transmission_via_cron.tar.gz  .config/transmission 2>> "$log"
        
    else
    
        echo -e "A pasta $pasta_usuario/.config/transmission não existe..."
        

    fi
    



fi


# https://askubuntu.com/questions/1166544/how-to-backup-and-restore-transmission-torrents
# https://unix.stackexchange.com/questions/545285/how-to-backup-transmission-downloads-and-torrents
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/remotar-o-download-no-transmission-depois-de-reinstalar-o-SO


# ----------------------------------------------------------------------------------------

# Contabilidade


# echo "Localizar arquivo XML da nota fiscal eletrônica (NFe)" | tee -a "$log"


# Podemos pesquisar todos os arquivos que terminam em .xml desta forma:

# find / -type f -iname "*.xml" >> "$log"



# https://blog.bling.com.br/xml-nota-fiscal/
# https://www.digitalocean.com/community/tutorials/how-to-use-find-and-locate-to-search-for-files-on-linux-pt
# http://www.nfe.fazenda.gov.br/portal/principal.aspx

# ----------------------------------------------------------------------------------------

# Wallpaper, Temas e ícones de backup



# Backup dos pacotes de ícones e temas que instalamos no sistema.

# irá arquivar e copiar todos os temas instalados e os ícones dos caminhos /usr/share/themes e /usr/share/icons.


# cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-Temas_via_cron.tar.gz    .themes  /usr/share/themes 2>> "$log"

# cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-icones_via_cron.tar.gz   .icons   /usr/share/icons  2>> "$log"


# cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-wallpaper_via_cron.tar.gz   /usr/share/backgrounds/  /usr/share/wallpaper/  2>> "$log"


# https://blog.desdelinux.net/pt/aptik-realiza-un-backup-de-tus-repositorios-temas-programas-y-configuraciones/

# ----------------------------------------------------------------------------------------

# Wine



# which wine  1> /dev/null 2> /dev/null

which winecfg  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do Wine...
"



# Para verificar se o diretório $pasta_usuario/.wine existe.

    if [ -d "$pasta_usuario/.wine" ]; then
    
        echo -e "A pasta $pasta_usuario/.wine existe..."

cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-Wine_via_cron.tar.gz  .wine 2>> "$log"


# tar -czvf backup-wine.tar.gz ~/.wine/


        
    else
    
        echo -e "A pasta $pasta_usuario/.wine não existe..."
        

    fi
    
    
fi
 
 
    
# https://linuxdicasesuporte.blogspot.com/2023/10/wine-818-lancado-com-melhorias-para-o.html
# https://superuser.com/questions/1692789/backup-wine-configurations-in-linux
# https://askubuntu.com/questions/1188484/wine-installation-can-not-find-winecfg
# https://linuxconfig.org/configuring-wine-with-winecfg
# https://www.addictivetips.com/ubuntu-linux-tips/back-up-wine-apps/
# https://www.hardware.com.br/guias/windows-linux/dicas-winecfg.html


# ----------------------------------------------------------------------------------------

# Playonlinux


# ~/.PlayOnLinux


# https://www.vivaolinux.com.br/topico/UbuntuBR/Fazer-backup-de-programas
# https://askubuntu.com/questions/235511/how-to-backup-virtual-drives-with-playonlinux

# ----------------------------------------------------------------------------------------

# Proton é uma camada de compatibilidade para que jogos de Microsoft Windows rodem em 
# sistemas operacionais baseados em Linux. Proton é desenvolvido pela Valve em cooperação 
# com desenvolvedores da CodeWeavers sob contrato. 


# https://linuxdicasesuporte.blogspot.com/2023/10/valve-proton-80-4-lancado-com-suporte.html

# ----------------------------------------------------------------------------------------

# FreeCAD


# https://linuxdicasesuporte.blogspot.com/2023/08/freecad-021-e-lancado-com-melhorias.html

# ----------------------------------------------------------------------------------------

# xmind


# ----------------------------------------------------------------------------------------

# Inkscape

# Inkscape é um software de código aberto e alternativa ao Adobe Illustrator



# https://linuxdicasesuporte.blogspot.com/2023/07/inkscape-13-lancado-com-melhorias-e.html

# ----------------------------------------------------------------------------------------

# Gerenciador de login (Lightdm)


# /etc/lightdm/lightdm.conf


# https://linuxdicasesuporte.blogspot.com/2023/07/autologin-para-o-gerenciador-de-sessao.html

# ----------------------------------------------------------------------------------------

# Snap

# Formato de empacotamento de software criado pela Canonical (empresa por trás da famosa distro Ubuntu).
#
# Trata-se de uma tecnologia que, assim como o Flatpak, facilita a instalação de programas no sistema operacional.
#
# É executado de forma isolada. 




which snap  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

# echo "
# Realizando o backup dos Snaps instalados...
# "



echo "
Listar Snaps instalados
" | tee -a "$log"

# Para descobrir todos os Snaps instalados em seu sistema, você pode utilizar o seguinte comando:

snap list >> "$log"



fi


# https://teclinux.com/o-que-e-snap-no-linux-aprenda-a-usar-o-formato-em-varias-distribuicoes/


# ----------------------------------------------------------------------------------------

# Navegador Brave




# ----------------------------------------------------------------------------------------

# Backup pessoal ("Área de Trabalho" Desktop Documentos Downloads Imagens Músicas Público Vídeos dwhelper)



# cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-pessoal-"$usuario"_via_cron.tar.gz   \
# "Área de Trabalho" \
# Desktop \
# Documentos \
# Downloads \
# Imagens \
# Músicas \
# Público \
# Vídeos \
# dwhelper \
# 2>> "$log"



# https://cursos.alura.com.br/forum/topico-erro-ao-cria-um-script-de-backup-194167
# https://help.ubuntu.com/stable/ubuntu-help/backup-how.html.pt-BR


# ----------------------------------------------------------------------------------------

# Backup do Whatsapp



# ----------------------------------------------------------------------------------------

# Chromium


# cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-chromium_via_cron.tar.gz   .config/chromium   2>> "$log"


# Se foi instalado por pacote Flatpak deve estar em $HOME/.var/app/com.github.Eloston.UngoogledChromium/config/chromium.


# O caminho você também pode encontrar pelo endereço chrome://profile-internals.


# https://plus.diolinux.com.br/t/como-fazer-backup-de-um-profile-do-chromium/50362

# ----------------------------------------------------------------------------------------


# Instalação de programas via Flatpak


# Pacotes flatpacks salvam as configurações em $HOME/.var/app. No caso do google chrome, 
# por exemplo, com.google.Chrome; microsoft edge: com.microsoft.Edge e assim por diante. 
# Para aproveitar esses arquivos, depois de uma instalação limpa deve-se criar as pasta 
# onde ficarão: mkdir -p $HOME/.var/app


# Onde ficam os apps e runtimes do usuário?
#
# Por padrão, ficam em ~/.local/share/flatpak


# Mas e a pasta ~/.var/app?
# 
# Na Home do usuário existe um diretório .var/app que ficou cheio de subdiretórios com os 
# apps. Esse diretório não é onde os apps estão instalados, mas sim onde ficam suas 
# configurações. Podemos comparar com o diretório ~/.config, que é onde ficam as 
# configurações dos programas tradicionais (quase sempre).
# 
# Vejam o conteúdo de ~/.var/app



# Erro ao instalar programas flatpak
#
# ln -s /var/lib/flatpak/exports/share/applications /usr/share/applications/flatpak
#
# A instalação segue normalmente, mas ao fim dela os programas não são encontrados no lançador.
#
# na primeira vez precisa reiniciar



# victorff
#
# Existe alguma ferramente, script ou algo do tipo para fazer backup de flatpaks ou pelo 
# menos automatizar a instalação desses apps? Toda vez que eu troco de distro é horrível 
# ter de instalar tudo de novo manualmente.
#
#
# Tem 4 mecanismos:
#
# Você cria uma instalação paralela do flatpak em uma partição separada
#
# Você faz uma imagem (ou cópia) de /var/lib/flatpak
#
# Você faz bundle do repositório ostree (junto com a primeira é o mais indicado)
#
# Você para de usar flatpak e passa a usar uma forma de distribuição portável, como 
# os Snaps e AppImages.





which flatpak  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do Flatpak...
"


# Para verificar se o diretório $pasta_usuario/.var/app existe.

    if [ -d "$pasta_usuario/.var/app" ]; then
    
        echo -e "A pasta $pasta_usuario/.var/app existe..."


ls -lh "$pasta_usuario"/.var/app | tee -a "$log"

echo "$XDG_DATA_DIRS" | tee -a "$log"

# $HOME/.local/share/flatpak/exports/share:/var/lib/flatpak/exports/share:/usr/local/share:/usr/share



cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-Flatpak_via_cron.tar.gz   .var/app  /var/lib/flatpak  .local/share/flatpak  2>> "$log"




        
    else
    
        echo -e "A pasta $pasta_usuario/.var/app não existe..."
        

    fi
    



fi



# https://plus.diolinux.com.br/t/como-faco-becape-de-meu-linux/52330
# https://plus.diolinux.com.br/t/backup-de-flatpak/7534
# https://www.vivaolinux.com.br/topico/openSUSE-Linux-Brasil/Instalacao-do-Flatpak
# https://plus.diolinux.com.br/t/erro-ao-instalar-programas-flatpak/12992
# https://leandroramos.debxp.org/como-manter-os-flatpaks-somente-na-home/
# https://linuxdicasesuporte.blogspot.com/2019/01/mandar-o-diretorio-dos-flatpak-para_7.html
# https://community.endlessos.com/t/duvidas-sobre-o-aplicativo-biblioteca/6591/5


# ----------------------------------------------------------------------------------------

# Spotify



# https://ubuntuforum-pt.org/index.php?topic=125076.0

# ----------------------------------------------------------------------------------------

# Lutris



# https://forum.biglinux.com.br/d/772-dica-adicionando-jogos-do-flatpak-ou-snap-na-sua-biblioteca-de-jogos-do-lutris
# https://community.endlessos.com/t/duvidas-sobre-o-aplicativo-biblioteca/6591/5
# https://linuxdicasesuporte.blogspot.com/2023/05/o-gerenciador-de-jogos-lutris-0513-e.html

# ----------------------------------------------------------------------------------------

# Nextcloud


# https://www.ubuntubuzz.com/search?q=backup

# ----------------------------------------------------------------------------------------

# onlyoffice


# https://linuxdicasesuporte.blogspot.com/2023/01/suite-de-escritorio-onlyoffice-730.html
# https://linuxdicasesuporte.blogspot.com/2023/01/suite-de-escritorio-onlyoffice-appimage.html

# ----------------------------------------------------------------------------------------

# QEMU


# https://linuxdicasesuporte.blogspot.com/2023/04/software-de-virtualizacao-qemu-80.html

# ----------------------------------------------------------------------------------------

# virt-manager

# ----------------------------------------------------------------------------------------

# HandBrake


# https://linuxdicasesuporte.blogspot.com/2022/12/conversor-de-video-open-source.html

# ----------------------------------------------------------------------------------------

# SweetHome3D

# profile SweetHome3D




# https://www.sweethome3d.com/pt/download.jsp
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Problema-da-Execucao-de-Software-Retorna-Mensagem-usrbinjava-not-found
# https://ubuntuforum-br.org/index.php?topic=110854.0

# ----------------------------------------------------------------------------------------

# Evolution / Google Tasks 



# As tarefas da minha lista local estavam armazenadas no arquivo 
# ~/.local/share/evolution/tasks/system/tasks.ics
#
# Usando o Evolution eu consegui mover as tarefas (uma a uma) da lista local para a lista 
# do Google Tasks associada a minha conta de e-mail.
#
# Ao fazer isso, as informações de prioridade foram perdidas, pois o Google Tasks não tem 
# opção de definir prioridade para uma tarefa.
#
# Tentei usar o Todoist mas achei confuso, pois ele mostrava os eventos do Google Calendar 
# como tarefas, isto é, misturava minhas tarefas (sem data e/ou horário definido) com meus 
# compromissos (reuniões, aulas, etc.) em uma única lista. Vou tentar fuçar mais, mas 
# aceito conselhos! :slight_smile:
#
# Pelo que andei lendo, a integração do Todoist com o Gnome e com o Gnome To Do foi 
# removida em versões mais recentes. Ou seja, não sei se eu conseguiria visualizar as 
# tarefas do Todoist no Task Widget do Gnome.







which evolution  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do Evolution...
"


# Para verificar se o diretório $pasta_usuario/.local/share/evolution existe.

    if [ -d "$pasta_usuario/.local/share/evolution" ]; then
    
        echo -e "A pasta $pasta_usuario/.local/share/evolution existe..."


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-Evolution_via_cron.tar.gz   .local/share/evolution   2>> "$log"

        
    else
    
        echo -e "A pasta $pasta_usuario/.local/share/evolution não existe..."
        

    fi
    



fi

# https://plus.diolinux.com.br/t/gnome-to-do-como-fazer-backup-da-lista-de-tarefas/25550/3
# https://en.wikipedia.org/wiki/Google_Tasks
# https://assistant.google.com/tasks


# ----------------------------------------------------------------------------------------

# OBS Studio


# Habilitar webcam no OBS Studio
#
# https://youtu.be/nf6epciZYsY
#
# https://ceduc.unifei.edu.br/tutoriais/obs-studio-mixer-de-audio-e-habilitar-webcam/
#
# https://www.youtube.com/watch?v=s8AmkkV8Vlc&ab_channel=CosmonautaVirtual



# find ~/ -iname obs*


# ~/.config/obs-studio



which obs  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do OBS Studio...
"


# Para verificar se o diretório $pasta_usuario/.config/obs-studio existe.

    if [ -d "$pasta_usuario/.config/obs-studio" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/obs-studio existe..."


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-obs-studio_via_cron.tar.gz   .config/obs-studio  2>> "$log"

        
    else
    
        echo -e "A pasta $pasta_usuario/.config/obs-studio não existe..."
        

    fi
    



fi


# https://plus.diolinux.com.br/t/obs-studio-nao-esta-exibindo-tela-inteira-no-debian/16222

# ----------------------------------------------------------------------------------------

# LXQt


# https://linuxdicasesuporte.blogspot.com/2023/04/ambiente-de-desktop-lxqt-13-lancado-com.html

# ----------------------------------------------------------------------------------------

# XFCE

# cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-XFCE_via_cron.tar.gz   .config/xfce4   2>> "$log"



# https://plus.diolinux.com.br/t/como-fazer-backup-dos-arquivos-de-aparencia-do-xfce/55416
# https://linuxdicasesuporte.blogspot.com/2023/02/resetar-o-xfce4-para-restaurar-as.html
# https://youtu.be/lHMFK6tkgxE

# ----------------------------------------------------------------------------------------

# Cinnamon


which dconf  1> /dev/null 2> /dev/null



if [ $? == 0 ]; then

clear


echo "
Realizando o backup do Cinnamon...
"

# Backup e restauração apenas das configurações do Cinnamon.

# OBS: O nome que utilizei é um exemplo, altere para nomes que você melhor se identifique.

# Para fazer o backup execute o comando abaixo no terminal.

# cd "$pasta_usuario" &&     dconf dump /org/cinnamon/ > "$backup"/backup-Cinnamon-`date +%d-%m-%Y-%H-%M`



# Para restaurar o backup utilize o comando abaixo.

#    dconf load /org/cinnamon/ < "$backup"/backup-Cinnamon-`date +%d-%m-%Y-%H-%M`



fi

# https://linuxdicasesuporte.blogspot.com/2020/03/fazer-backup-e-restauracao-das.html
# https://linuxdicasesuporte.blogspot.com/2022/09/resetar-o-linux-mint.html

# ----------------------------------------------------------------------------------------

# MATE

which dconf  1> /dev/null 2> /dev/null



if [ $? == 0 ]; then

clear


echo "
Realizando o backup do Mate...
"


# Backup e restauração apenas das configurações do Mate.

# OBS: O nome que utilizei é um exemplo, altere para nomes que você melhor se identifique.

# Para fazer o backup execute o comando abaixo no terminal.

# cd "$pasta_usuario" &&   dconf dump /org/mate/ > "$backup"/backup-Mate-`date +%d-%m-%Y-%H-%M`


# Para restaurar o backup utilize o comando abaixo.

#    dconf load /org/mate/ < "$backup"/backup-Mate-`date +%d-%m-%Y-%H-%M`


fi


# https://linuxdicasesuporte.blogspot.com/2020/03/fazer-backup-e-restauracao-das.html


# ----------------------------------------------------------------------------------------

# Gnome

which dconf  1> /dev/null 2> /dev/null



if [ $? == 0 ]; then

clear


echo "
Realizando o backup do Gnome...
"


# Para realizar o backup das configurações do seu Gnome de o comando abaixo no terminal.
#
# Em backup-Gnome você pode adicionar uma data, assim você pode ter vários backups 
# guardados.



# ========================================================================================


# Para verificar se o diretório $pasta_usuario/.local/share/gnome-shell/extensions existe.


    if [ -d "$pasta_usuario/.local/share/gnome-shell/extensions" ]; then
    
        echo -e "A pasta $pasta_usuario/.local/share/gnome-shell/extensions existe..."

# Backup and Restore GNOME Shell Extensions (GNOME 3.28 over Ubuntu 18.04 LTS)

# .local/share/gnome-shell/extensions/


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-extensoes_do_Shell_do_GNOME_via_cron.tar.gz   .local/share/gnome-shell/extensions  2>> "$log"

        
    else
    
        echo -e "A pasta $pasta_usuario/.local/share/gnome-shell/extensions não existe..."
        

    fi
    
        
# ========================================================================================

    
    
# cd "$pasta_usuario" &&  dconf dump / > "$backup"/backup-Gnome-`date +%d-%m-%Y-%H-%M`






# Como podem ver o meu backup foi criado em $backup com o nome de "backup-Gnome-26-10-2023-14-47".


# Para realizar um teste vamos resetar as configurações do Gnome ao ponto de fabrica, 
# para isso execute o comando abaixo no terminal.
#
# OBS: Nenhum dado pessoais e ou configurações dos seus programas serão afetados, apenas 
# as configurações do Gnome.
#
#  dconf reset -f /
    
    
# Ai está o Gnome como veio ao mundo, veio de doer hehehhe



# Sem desespero, você tem o backup das suas customizações do seu Gnome e rapidamente ele 
# volta ao que você gosta e fez.

# Para restaurar o backup execute o comando abaixo no terminal.

#  dconf load / < gnome_09-03-2020-desktop


# Gnome restaurado.



fi




# https://documentation.suse.com/pt-br/sles/12-SP5/html/SLES-all/cha-userbackup.html
# https://linuxdicasesuporte.blogspot.com/2020/03/fazer-backup-e-restauracao-das.html
# https://askubuntu.com/questions/1056386/how-do-i-backup-all-gnome-tweaks-configuration
# https://www.addictivetips.com/ubuntu-linux-tips/back-up-the-gnome-shell-desktop-settings-linux/
# https://www.ubuntubuzz.com/2018/08/backup-and-restore-gnome-shell-extensions.html
# https://forum.xerolinux.xyz/thread-61.html
# https://linuxdicasesuporte.blogspot.com/2017/05/instalando-e-fazendo-backup-de.html
# https://linuxdicasesuporte.blogspot.com/2022/03/restauracao-do-sistema-com-timeshift.html
# https://linuxdicasesuporte.blogspot.com/2019/11/criptografar-sua-particao-home-no.html
# https://linuxdicasesuporte.blogspot.com/2017/11/usando-mesma-particao-de-dados-para.html
# https://linuxdicasesuporte.blogspot.com/2022/10/usar-as-mesmas-pastas-de-usuario.html


# ----------------------------------------------------------------------------------------

# KDE Plasma

# o arquivo de configuração em si sobre posição de painel, widgets da tela e painel, o 
# arquivo é o .config/plasma-org.kde.plasma.desktop-appletsrc O restante do esquema de 
# cores, icones e tal é só anotar o nome e depois instalar no outro computador.

# .cache/krunner/
# .cache/kamoso



# cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-KDE_Plasma_via_cron.tar.gz \
# .config/plasma-org.kde.plasma.desktop-appletsrc \
# .config/kdeglobals \
# .config/kscreenlockerrc \
# .config/kwinrc \
# .config/gtkrc \
# .config/gtkrc-2.0 \
# .config/gtk-4.0/* \
# .config/gtk-3.0/* \
# .config/ksplashrc \
# .config/kdeglobals \
# .config/plasmarc \
# .config/kdeglobals \
# .config/Trolltech.conf \
# .config/breezerc \
# .config/kwinrc \
# .config/kdeglobals \
# .config/kcmfonts \
# .config/kdeglobals \
# .config/kcminputrc \
# .config/klaunchrc \
# .config/kfontinstuirc \
# .config/ksplashrc \
# .config/plasmarc \
# .config/kwinrc \
# .config/kwinrc \
# .config/kglobalshortcutsrc \
# .config/kscreenlockerrc \
# .config/kactivitymanagerdrc \
# .config/kactivitymanagerd-switcher \
# .config/kactivitymanagerd-statsrc \
# .config/kactivitymanagerd-pluginsrc \
# .config/kglobalshortcutsrc \
# .config/plasma-org.kde.plasma.desktop-appletsrc \
# .config/kwinrc \
# .config/kwinrulesrc \
# .config/kwinrc \
# .config/khotkeysrc \
# .config/kglobalshortcutsrc \
# .config/kded5rc \
# .config/ksmserverrc \
# .config/krunnerrc \
# .config/baloofilerc \
# .local/share/plasma-systemmonitor \
# .config/plasmanotifyrc \
# .config/plasma-localerc \
# .config/ktimezonedrc \
# .config/kaccessrc \
# .config/mimeapps.list \
# .config/mimeapps.list \
# .config/PlasmaUserFeedback \
# .config/kcminputrc \
# .config/kxkbrc \
# .config/kxkbrc \
# .config/touchpadxlibinputrc \
# .config/kcminputrc \
# .config/kgammarc \
# .config/kwinrc \
# .config/powermanagementprofilesrc \
# .config/bluedevilglobalrc \
# .config/kdeconnect \
# .config/device_automounter_kcmrc \
# .config/kded5rc \
# .config/kded_device_automounterrc \
# .config/krusaderrc \
# 2>> "$log"





# https://plus.diolinux.com.br/t/backup-no-kde-plasma/32900
# https://plus.diolinux.com.br/t/backup-config-plasma/35833
# https://github.com/shalva97/kde-configuration-files
# https://gitlab.com/cscs/transfuse/-/blob/master/transfuse.sh?ref_type=heads

# ----------------------------------------------------------------------------------------

# Backup do Gpick


which gpick  1> /dev/null 2> /dev/null


if [ $? == 0 ]; then

clear

echo "
Realizando o backup do Gpick...
"


# Para verificar se o diretório $pasta_usuario/.config/gpick existe.

    if [ -d "$pasta_usuario/.config/gpick" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/gpick existe..."


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-Gpick_via_cron.tar.gz  .config/gpick/  2>> "$log"

        
    else
    
        echo -e "A pasta $pasta_usuario/.config/gpick não existe..."
        

    fi
    



fi


# ----------------------------------------------------------------------------------------


chown -R "$usuario":"$grupo" "$backup" 


chown -R "$usuario":"$grupo" "$log"



DATAFINAL=`date +%d/%m/%Y-%H:%M:%S`


echo "

Termino do backup: $DATAFINAL

#-----------------------------------------------------------------------------------------



Arquivos gerados:

`ls -lh $backup`


" >> "$log"



# ----------------------------------------------------------------------------------------


mv "$log" "$backup"

rm -Rf "$log"


# Backup realizado com Sucesso

sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/hicolor/48x48/status/uninterruptible-power-supply.png  'Atenção!' '\n\nBackup finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n\nVerifique o arquivo de log: '$backup'/backup.log\n\n'



# su "$usuario" -c 'xdg-open "$backup/$log"'



# ----------------------------------------------------------------------------------------



fi



exit 0


