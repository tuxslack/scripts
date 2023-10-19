#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     19/10/2023 as 03:13
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL




# Problema com $HOME/backup/backup_Ocomon-4.0.sql_via_cron.gz não esta gerando o backup.   OK

# Problema com backup do OpenBox + temas (nome com espaço).


# ----------------------------------------------------------------------------------------

# Variaveis:



# Arquivo de log

log="/tmp/backup.log"

rm -Rf "$log"




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
# which rsync         2> /dev/null || { echo "Programa rsync não esta instalado."         ; exit ; }

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



sleep 5
clear

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


if [ -z $senha_mysql ]; then

		echo -ne "Você não forneceu a senha do mysql.\n" | tee -a "$log"
		
		exit
		
fi

# ----------------------------------------------------------------------------------------


if [ -z $log ]; then

		echo -ne "Você não forneceu um arquivo para log.\n" | tee -a "$log"
		
		exit
		
fi

# ----------------------------------------------------------------------------------------

echo 
echo "#============================================================#"
echo "#                                                            #"
echo "#          Fazendo backup em arquivos separados              #"
echo "#          Este script esta sob licenca GPL                  #"
echo "# Pode ser distribuido e alterado livremente deste que seja  #"
echo "# conservado o Autor e Comentadas as devidas alterações      #"
echo "#                                                            #"
echo "#============================================================#"
echo 

sleep 10

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


Arquivo de configuração: /etc/backup.conf


#-----------------------------------------------------------------------------------------

Inicío do backup: $DATAINICIO

" >> "$log"



# ----------------------------------------------------------------------------------------


# Para derivados do Debian (backup do cache do apt)


# Conteúdo do antigo script /usr/local/bin/backup-cache-apt.sh incorporado neste script.



# APTonCD
#
# Gostaria de replicar os mesmos pacotes em outra maquina.
#
# Faça BKP da pasta /var/cache/apt/archives que é onde os pacotes são salvos e depois 
# copie-os para a outra máquina nessa mesma pasta.



which apt


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


which qbittorrent


if [ $? == 0 ]; then



ps -aux | grep -i qbittorrent$ | grep -v grep > /dev/null

if [ $? == 0 ]; then

echo "
Existe processo do qBittorrent ativo no sistema:


`ps -aux | grep -i qbittorrent$ | grep -v grep`


Obs: Interromper(-se), momentânea os torrents e fecha o programa qbittorrent.

"  | tee -a "$log"


# Saindo...

# killall -9 qbittorrent

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


which picom


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



which pppd


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


which gimp


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

# Backup do Audacity configurado para salva no formato m4a
 
# 21  13 * * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "





which audacity


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



which openbox


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/.config/openbox existe.

    if [ -d "$pasta_usuario/.config/openbox" ]; then
    
        echo -e "A pasta $pasta_usuario/.config/openbox existe..."
        
        
echo "
Realizando o backup do OpenBox...
"


# Lista somente diretórios => ls -d

ls -d ~/.themes/*/openbox-3 | sed 's#.*es/##;s#/o.*##' > /tmp/openbox.log


# O uso da conta-barra foi necessário para indicar que o caracter "/" do caminho não é o separador de substituição do sed

sed -i 's/^/.themes\//' /tmp/openbox.log


# Coloca todas as linhas em uma só com espaço

sed -i ':a;$!N;s/\n/ /;ta;' /tmp/openbox.log


tema="$(cat /tmp/openbox.log)"




cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_OpenBox_via_cron.tar.gz   .themes/*.obt "$tema" .config/obmenu-generator  .config/openbox  .config/tint2  .config/rofi   .local/share/applications/Tint2  /opt/conky/conkyrc-edps-openbox   .config/i3/i3lock.png   /usr/local/bin/xmenu.sh   /usr/local/bin/showdesktop.sh  2>> "$log"



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


rm -Rf /tmp/openbox.log


        
    else
    
        echo -e "A pasta $pasta_usuario/.config/openbox não existe..." | tee -a "$log"
        

    fi
    



fi



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



which i3


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




which nm-connection-editor


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





which wvdial


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





which freshclam


if [ $? == 0 ]; then

clear


# Verificar se o arquivo existe

if [ -e "/etc/freshclam.conf" ] ; then

clear

echo "O arquivo /etc/freshclam.conf existe."


echo "
Realizando o backup das configurações do freshclam...
"


/usr/bin/tar -czf "$backup"/backup_da-base-de-dados-do-Clamav-via_cron.tar.gz   /etc/freshclam.conf  2>> "$log"


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



which jgmenu


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



which thunar


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


which thunderbird


if [ $? == 0 ]; then

clear



# Para verificar se o diretório $pasta_usuario/.thunderbird/ existe.

    if [ -d "$pasta_usuario/.thunderbird/" ]; then
    
        echo -e "A pasta $pasta_usuario/.thunderbird/ existe..."
        
        echo "
Realizando o backup do Thunderbird...
"

cd "$pasta_usuario" &&  killall  -9 thunderbird ; /usr/bin/tar -czf "$backup"/backup-Thunderbird_via_cron.tar.gz   .thunderbird/  2>> "$log"  &&  sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/hicolor/128x128/apps/thunderbird.png  'Atenção!' '\n\nBackup do Thunderbird finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n\n' 

        
    else
    
        echo -e "A pasta $pasta_usuario/.thunderbird/ não existe..." | tee -a "$log"
        

    fi
    


fi

# https://www.dicas-l.com.br/arquivo/automatizacao_de_tarefas_com_crontab_e_cron.php


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
# Backup do Ocomon ($backup/backup_Ocomon-4.0.sql_via_cron.gz)
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



cd "$pasta_usuario"

killall  -9 /usr/bin/firefox
killall  -9 /opt/google/chrome/chrome



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

LISTADB=$(/usr/bin/mysqlshow -u root -p"$senha_mysql" |  grep  'ocomon' | sed 's/|//g' |  sed 's/ //g')


if [ "$LISTADB" == "ocomon" ]; then


clear

echo "
Backup do Ocomon ($backup/backup_Ocomon-4.0.sql_via_cron.gz)
" | tee -a "$log"

sleep 2


# No Void Linux:

sv status mysqld

sv up mysqld



/usr/bin/mysqldump -u root -p$senha_mysql -x -e -B ocomon | gzip > "$backup"/backup_Ocomon-4.0.sql_via_cron.gz  2>> "$log"  

sleep 2 

sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/extras/ocomon.png  'Atenção!' '\n\nBackup do OcoMon finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n\n'


else


echo "
Ocomon não foi localizado no banco de dados.

" | tee -a "$log"



fi






# https://techviewleo.com/install-mysql-mariadb-database-on-void-linux/
# https://medium.com/@jvnetobr/backup-e-restore-de-banco-de-dados-mysql-4e5c776d53a4
# http://www.bosontreinamentos.com.br/mysql/mysql-mysqldump-backup-e-restauracao-do-banco-de-dados-25/
# https://pt.stackoverflow.com/questions/329266/dump-de-todos-os-bancos-para-um-usu%C3%A1rio-especifico


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

which firefox


if [ $? == 0 ]; then

clear



# Para verificar se o diretório  $pasta_usuario/.mozilla/ existe.

    if [ -d "$pasta_usuario/.mozilla/" ]; then
    
    
        echo -e "A pasta $pasta_usuario/.mozilla/ existe..."

echo "
Realizando o backup do Firefox...
"

cd "$pasta_usuario" &&  killall  -9 firefox ; /usr/bin/tar -czf "$backup"/backup-Firefox_via_cron.tar.gz   .mozilla/  2>> "$log" &&  sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/hicolor/128x128/apps/firefox.png  'Atenção!' '\n\nBackup do Firefox finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n\n' 

        
        
    else
    
        echo -e "A pasta $pasta_usuario/.mozilla/ não existe..." | tee -a "$log"
        

    fi
    
    
fi



# ----------------------------------------------------------------------------------------



# Backup da pasta  /usr/local/bin/  (O comando será executado às 23h03) - Estava gerando um arquivo compactado com 26,6 GB
#
#
# Dentro da pasta /usr/local temos os programas que foram manualmente instalados (Programas de terceiros). 
# É quase um Arquivos de Programas (Windows), mas mais complexo.
#
#
# https://livrelinux.wordpress.com/2012/04/10/as-pastas-do-linux/


# 03 23 * * *  cd /home/fernando/  && /usr/bin/mkdir -p backup && chown -R fernando:fernando backup  && 


# /usr/bin/tar -czf "$backup"/backup-da_pasta_bin_via-cron.tar.gz  /usr/local/bin/  2>> "$log"


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



which conky


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



which fluxbox


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


# Sendto do Thunar  (O comando será executado às 23h52, do dia 5º de todos os meses.)
#
# /usr/share/Thunar/sendto/
# ~/.local/share/Thunar/sendto/
#
#
#

# 52 23 5 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "


which thunar


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


# Backup do tema do Grub  (O comando será executado às 00h19, do dia 11º de todos os meses.)

# 19 00 11 * * su fernando -c  "cd ~/ && /usr/bin/mkdir -p ~/backup && "




which update-grub


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



which xmenu


if [ $? == 0 ]; then

clear


cd "$pasta_usuario" && /usr/bin/tar -czf "$backup"/backup-do_xmenu_via_cron.tar.gz  /usr/local/bin/xmenu.sh  .icons/xmenu/  .config/polybar/config   2>> "$log"


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


sudo -u "$usuario" DISPLAY=:0.0  notify-send -t 100000 -i /usr/share/icons/hicolor/48x48/status/uninterruptible-power-supply.png  'Atenção!' '\n\nBackup finalizado em '$(date +\%d/\%m/\%Y_\%H:\%M:\%S)' \nsalvo na pasta: '$backup'... \n\nVerifique o arquivo de log: '$log'\n\n'



mv "$log" "$backup"



# su "$usuario" -c 'xdg-open "$backup/$log"'


rm -Rf "$log"


# ----------------------------------------------------------------------------------------



fi



exit 0


