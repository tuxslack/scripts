#!/bin/bash
#
# Por Fernando Souza
# Data: 04/03/2018
# Licença: GPL <https://www.gnu.org/>
# Versão: 0.1
# Script: adm_slack.sh
#
# Atualização em https://notabug.org/meianoite
#
# Programa de manutenção para Slackware 14x.
#
#
# Aqui estão as ferramentas de configuração incluídas no Slackware. Todos estes programas 
# rodam em modo texto, caso o sistema tenha sido configurado para inicializar direto em 
# modo gráfico, pressiona Ctrl + Alt + F6 para mudar para o terminal:
#
#
# Como usar:
#
# mv adm_slack.sh /usr/local/bin/
#
# chmod +x /usr/local/bin/adm_slack.sh
#
# # adm_slack.sh 
#
#
# Para verificar o md5sum do arquivo adm_slack.sh
#
# $ md5sum adm_slack.sh 
# 
#
#
# Problemas:
#
#
# cat /var/log/Xorg.0.log | grep -i "Using O_TMPFILE"
#
#
# [ 44527.204] Using O_TMPFILE
# [ 44528.027] Using O_TMPFILE
# [ 44528.028] Using O_TMPFILE
# [ 44528.245] Using O_TMPFILE
# [ 44528.246] Using O_TMPFILE
# [ 44528.256] Using O_TMPFILE
# [ 44528.293] Using O_TMPFILE
# [ 44528.340] Using O_TMPFILE
# [ 44528.349] Using O_TMPFILE
# [ 44537.762] Using O_TMPFILE
# [ 44537.763] Using O_TMPFILE
# [ 44538.368] Using O_TMPFILE
# [ 44538.370] Using O_TMPFILE
# [ 44538.479] Using O_TMPFILE
# [ 44538.481] Using O_TMPFILE
# [ 44538.507] Using O_TMPFILE
# [ 44538.509] Using O_TMPFILE
#
# .......
#
#
# cat /etc/os-release 
# NAME=Slackware
# VERSION="14.2"
# ID=slackware
# VERSION_ID=14.2
# PRETTY_NAME="Slackware 14.2"
# ANSI_COLOR="0;34"
# CPE_NAME="cpe:/o:slackware:slackware_linux:14.2"
# HOME_URL="http://slackware.com/"
# SUPPORT_URL="http://www.linuxquestions.org/questions/slackware-14/"
# BUG_REPORT_URL="http://www.linuxquestions.org/questions/slackware-14/"
#
#
# Desativando o tint2, e o wallpaper aleatório (feh e fbsetbg)
#
# Para cada roda do feh e fbsetbg aparece um "Using O_TMPFILE" no arquivo => tail -f /var/log/Xorg.0.log
#
# fbsetbg %f via Thunar similar ao RWindows. rsrsrs
#
# Usando o Nitrogen não apareceu "Using O_TMPFILE" no arquivo /var/log/Xorg.0.log
# 
#
# 
# ls -l /var/log/packages/ | grep imlib2
# -rw-r--r-- 1 root root    3614 Out 30 12:26 imlib2-1.7.0-x86_64-1_SBo
#
#
# ................................................................................................
#
# É Yu Yu Hakusho "Rapadura é doce, mas não é mole não!"
#
#
#
#
#
# https://www.linuxquestions.org/questions/slackware-14/some-strange-output-from-x11-4175626697/
# https://www.vivaolinux.com.br/topico/Slackware/Muitos-Using-O-TMPFILE-no-X/?pagina=1
# https://under-linux.org/showthread.php?t=72816
# https://slackwarecafe.wordpress.com/2017/12/22/instalando-o-slim-gerenciador-de-login-no-slackware/
# https://slackwarecafe.wordpress.com/2017/12/22/como-traduzir-o-slackware-para-portugues/
# https://www.hardware.com.br/comunidade/interface-grafica/178977/
# http://telazul.drusian.com.br/pt/artigo/configurando-e-usando-slackpkg
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=17001
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Com-oconfigurar-teclado-slack-12
# https://www.vivaolinux.com.br/dica/Configurando-rede-DHCP-no-Slackware
# https://www.vivaolinux.com.br/topico/Slackware/Atualizacao-do-Slackware-1
# https://giofilth.wordpress.com/2010/12/21/atualizando-o-slackware/
# http://slackbookptbr.sourceforge.net/slackbookptbr-1.0.2.pdf
# https://www.hardware.com.br/tutoriais/slackware3/
# http://www.dicas-l.com.br/arquivo/iniciar_o_slackware_linux_no_modo_grafico_automaticamente.php
# http://www.dicas-l.com.br/arquivo/slackbuilds.org_instalando_pacotes_para_o_slackware_linux.php
# https://edpsblog.wordpress.com/2015/04/04/how-to-instalacao-do-sbopkg-no-slackware/
# https://qastack.com.br/ubuntu/517078/any-volume-control-applet-for-openbox
#
#
#
#
#
########################################################################################################


# Variaveis do programa

log="/tmp/relatorio.log"


clear

# ======================================================================================================

# ps -aux


which tint2
which volumeicon
which conky
which xfce4-terminal
which thunar
which gedit
which slim
which fluxbox
which compton
which plank
which pulseaudio
which kppp
which xpad
which xfce4-clipman
which qbittorrent
which alsamixer
which ntfs-3g
which mplayer
which nitrogen
which xdotool
which wmctrl
which mpv
which xdotool
which feh
which parcellite
which perl


echo "
Bloqueador e protetor de tela para X com uma coleção repleta de protetores diferentes (xScreensaver).
"
which xscreensaver


sleep 10


echo "Testando se a conexão com a Internet está ativa..."

ping www.google.com.br -c 1 >/dev/null


if [ "$?" = "0" ] ;
then
   echo "Conexao ativa..."

sleep 3
clear



else

clear

   echo "Conexão não esta ativa...

Alguns recursos estarão indisponíveis no momento como:

Atualização da distro;
Atualização dos repositórios;
Acessos a sites na internet;
Atualização do relogio.


Espere 30s ..."

sleep 30

fi


# ======================================================================================================




dialog --msgbox '
Slackware é o nome da mais antiga e conhecida distribuição Linux mantida ainda em evidência. 
Seu criador e responsável pela manutenção, Patrick Volkerding, estabelece uma meta de produção 
da distribuição baseada em simplicidade e estabilidade, alcançando o padrão de distribuição 
mais Unix-like ao manter seus usuários nas camadas de configuração em console de modo texto 
para uma total personalização do ambiente. Além de seu uso profissional, é considerado também 
como uma distribuição de nível acadêmico, mantendo uma vasta documentação atualizada em sua 
raiz, para os usuários que necessitem de maior conhecimento para dominá-lo.

Desenvolvedor 	Patrick Volkerding
Lançado em 	16 de julho de 1993
Licença 	GNU GPL
Website 	www.slackware.com 
Origem comum 	Estados Unidos


Filosofia kiss

KISS - Acrônimo de  Keep It Simple, Stupid!, ou seja, "Mantenha Simples, Estúpido!". 

Trata-se de um princípio que, em resumo, diz: quanto mais simples for o sistema (só deve ter o necessário), melhor ele será. 


https://pt.wikipedia.org/wiki/Slackware
https://pt.wikipedia.org/wiki/Keep_It_Simple


Experimente, mas tome cuidado com a maldição de "Bob" Dobbs.

https://www.vivaolinux.com.br/artigo/Curiosidades-e-mitos-sobre-Slackware


A vocês, muitas compilações longas e prósperas! 

' 40 100



# Usuários do Slackware tradicional, preferem instalar seus pacotes pelo pkgtools ou slackpkg porem não lidam com dependencias.

# No SlackBuilds https://slackbuilds.org, você procura o programa, e ao clicar nele mostra as dependências, e ai você instala uma por uma.



# Loop que mostra o menu principal
while : ; do

    # Mostra o menu na tela, com as ações disponíveis
    resposta=$(
      dialog --stdout               \
             --title 'Menu - administração do Slackware'  \
             --menu 'Oi '$USER', escolha o quê você quer fazer:' \
            0 0 0                   \
            1 'Mudar o gerenciador de login grafico no Slackware (Slim)' \
            2 'Iniciar o Slackware no modo texto'    \
            3 'Abrir o arquivo /etc/fstab'     \
            4 'Configurar a Linguagem/Idioma do Sistema para Português do Brasil (Traduzir o Slackware)'        \
            5 'Mudar de interface grafica no Slackware para '$USER''     \
            6 'Abrir repositórios (escolher um mirror)'        \
            7 'Coloca um pacote na blacklist'        \
            8 'Ver a versão do meu Slackware'        \
            9  'Abrir o site do SlackBuild'        \
            10 'Abrir o site oficial do Slackware'        \
            11 'Abrir o arquivo de configuração do LILO (gerenciador de boot padrão do Slackware)'        \
            12 'Configurar o teclado para Português Brasileiro padrão ABNT2 no Slackware'    \
            13 'Abrir o arquivo /etc/rc.d/rc.local'    \
            14 'Ver os serviços iniciados com o sistema.' \
            15 'Ver os usuários no sistema.' \
            16 'Configurar a rede no Slackware.' \
            17 'Configurar DNS.' \
            18 'Atualizar o Slackware (slackpkg)' \
            19 'Recuperando a instalação do Slackware (slackpkg clean-system)' \
            20 'Para você que não lembra do nome do pacote que quer instalar (slackpkg file-search libqca.so.2)' \
            21 'Listar as resoluções suportada do seu monitor' \
            22 'Configurar o som e ajustar o volume (alsamixer).' \
            23 'Som parou de funcionar (/etc/rc.d/rc.pulseaudio restart).' \
            24 'Para gravar sua voz em um arquivo .wav de 10 segundos de duração' \
            25 'Configurar impressora (cups e HP)' \
            26 'Configurar Scanner (XSane).' \
            27 'Testar Webcam (640 X 480).' \
            28 'Adicionar usuario no sistema.' \
            29 'Remove usuario no sistema.' \
            30 'Listar as regras do iptables.' \
            31 'Listando as portas abertas (localhost)' \
            32 'Identifique todas as máquinas na rede' \
            33 'Adicionando usuário no grupo' \
            34 'Removendo usuário do grupo' \
            35 'Altera a senha de um usuário no sistema' \
            36 'Listar os diretórios compartilhados de uma máquina windows na rede' \
            37 'Atualizar relogio (ntpdate -u pool.ntp.org)' \
            38 'Verificar falta de alguma biblioteca no programa' \
            39 'Desativar alguns serviços do Slackware' \
            40 'Ver todos os programas instalados' \
            41 'Recupere o LILO na MBR após uma instalação do Windows (Usar via chroot essa parte do script)' \
            42 'Recupere o Grub na MBR após uma instalação do Windows (Usar via chroot essa parte do script)' \
            43 'Listar os grupos atualmente no sistema' \
            44 'Listar somente pacote oficial' \
            45 'Listar somente pacote SBo' \
            46 'Listar somente pacote 32bit (Multilib no Slackware)' \
            47 'Para gerir slackbuilds com slpkg (adiciona na blacklist um pacote)' \
            48 'Para gerir slackbuilds com slpkg (remove da blacklist um pacote)' \
            49 'Verificar dependências do programa (SlackBuilds.org)' \
            50 'Abrir o gerenciado de pacotes do Slackware - Pkgtool (installpkg; updatepkg; removepkg)' \
            51 'Instala diretamente um pacote (installpkg)' \
            52 'Remove diretamente um pacote (removepkg)' \
            53 'Converte pacotes RPM para o formato TGZ' \
            54 'Atualizar os pacotes do SlackBuilds.org no Slackware (sbopkg)' \
            55 'Instalar programas no Slackware (Compilação)' \
            56 'Instalar programas no Slackware (sbopkg)' \
            57 'Reinstalar um programa no Slackware (slackpkg)' \
            58 'Como saber a versão do xorg? => Xorg -version  ou X -version' \
            59 'Ajustando horário no Slackware ' \
            60 'Firewall' \
            61 'Atualização do kernel' \
            62 'Configurar mouse (PS2 ou USB)' \
            63 'Configuração do modem e regras de discagem (pppsetup)' \
            64 'Configurar o X ' \
            65 'Verificar se existe pacotes rpm instalados no sistema' \
            66 'Realizar uma consultar dos pacotes requeridos para a instalação do programa via Sbopkg' \
            67 'Para remove um programa instalado de forma manual no Slackware' \
            68 'Monitorar o sistema (tail -f /var/log/messages)' \
            69 'Gerenciador de janelas (xfwm4) esta sem os itens de fechar, minimizar e restaurar no Xfce' \
            70 'Checando ocupação de disco dos diretórios a partir da raiz' \
            71 'Que pastas são essas na raiz do HD? (/net e /misc)' \
            72 'Configurando o Slackware como desktop (recomendações)' \
            73 'Dica: Ajustando a aparência de aplicativos QT em ambientes GTK' \
            74 'Informação sobre um pacote do Slackware' \
            75 'Informação sobre um pacote do Sbopkg' \
            76 'Modificar o tempo de espera do LILO' \
            77 'Para listar todos os usuários do servidor Samba' \
            78 'Para listar todos os usuários do sistema' \
            79 'Eliminando terminais virtuais inúteis' \
            80 'Site https://packages.slackonly.com/' \
            81 'Site http://slackware.uk/' \
            82 'Tarefas agendadas do sistema' \
            83 'Tarefas agendadas do usuário ('$USER')' \
            84 'Mostra o conteúdo do crontab ('$USER')' \
            85 'Remove o arquivo atual do crontab para o usuário ('$USER')' \
            86 'Verificar logs de execução da crontab (tail -f /var/log/cron)' \
            87 'Obtém a lista de tarefas agendadas do cron para um usuário do sistema' \
            88 'Redefinindo o Gerenciador de Arquivos padrão' \
            89 'Harmonizando Compton com Xfce4-screenshooter' \
            90 'Configurar o Plank para o usuário '$USER' (plank --preferences)' \
            91 'Gerenciar sua impressão via Cups' \
            92 'Executar update-desktop-database' \
            93 'Muda o papel de parede - Nitrogen' \
            94 'Muda o papel de parede - Feh' \
            95 'Muda o papel de parede - Fbsetbg' \
            96 'Bloqueador e protetor de tela para X com uma coleção repleta de protetores diferentes (xscreensaver)' \
            97 'Qual repositório que estou usado?' \
            98 'Atualiza certificados - update-ca-certificates -f' \
            99 'Gera kernel generico no Slackware - Kernel generic' \
            100 'Emblema das pastas do Thunar não aparecem' \
            101 'Thunar não exibe miniaturas dos arquivos' \
            102 '' \
            103 '' \
            104 '' \
            105 '' \
            106 '' \
            107 '' \
            108 '' \
            109 '' \
            110 '' \
            0  'Sair'                )

    # Ela apertou CANCELAR ou ESC, então vamos sair...
    [ $? -ne 0 ] && break

    # De acordo com a opção escolhida, dispara programas
    case "$resposta" in
         1) clear
cat /etc/inittab | grep "id:4:initdefault:"
gksu gedit /etc/rc.d/rc.4  ;;
         2) clear
cat /etc/inittab | grep "id:3:initdefault:"
gksu gedit /etc/inittab ;;
         3) clear
gksu gedit /etc/fstab ;;
         4) 
# Configurar a Linguagem/Idioma do Sistema para Português do Brasil (Traduzir o Slackware)

clear

cat  /etc/profile.d/lang.sh | grep "export LANG=pt_BR.UTF-8"

gksu gedit /etc/profile.d/lang.sh

echo "Reinicie a maquina e pronto seu Slackware está em portugues." ;;


         5) clear

# xwmconfig : Para alterar a interface gráfica que é inicializada com o comando startx. 
# O comando só permite escolher entre as interfaces instaladas e não instalar/desinstalar.
#
# O xwcconfig é um utilitario para editar o .xinitrc.

which xwmconfig
# /usr/bin/xwmconfig

cat ~/.xinitrc

xwmconfig

cat ~/.xinitrc


   ;;


         6) clear
gksu gedit  /etc/slackpkg/mirrors

slackpkg update

  ;;

         7) clear

echo "Coloca o pacote na blacklist, evitando que este seja instalado, atualizado ou removido com o comando slackpkg. Para remover 
um pacote da blacklist é preciso editar o arquivo /etc/slackpkg/blacklist."

gksu gedit  /etc/slackpkg/blacklist

  ;;
         8) clear

cat /etc/slackware-version 

  ;;
         9) clear

firefox "https://slackbuilds.org/"
  ;;
         10) clear
firefox "http://www.slackware.com/"
  ;;
         11) clear
gksu gedit  /etc/lilo.conf

lilo

  ;;
         12) # Configurar o teclado para Português Brasileiro padrão ABNT2 no Slackware

clear

cat /etc/rc.d/rc.keymap | grep "/usr/bin/loadkeys br-abnt2.map"
gksu gedit /etc/rc.d/rc.keymap

# setxkbmap -model abnt2 -layout br

# loadkeys br-abnt2




# cat ~/.bashrc | grep -i setxkbmap
#
# echo "setxkbmap -model abnt2 -layout br -variant abnt2" >> ~/.bashrc
#
# https://www.vivaolinux.com.br/topico/Slackware/Teclado-Abnt2-4
# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/-Configurar-teclado-do-Slackware-para-portugues


  ;;

         13) clear

gksu gedit /etc/rc.d/rc.local 

  ;;

         14) clear

ls --color -l /etc/rc.d/

  ;;

         15) clear

cat /etc/passwd

  ;;

         16) clear

# Configuração da placa de rede.

# netconfig


echo "Configurar DNS"

gksu gedit /etc/resolv.conf

clear


# Para IP manual e dhcp

echo "Editando o arquivo /etc/rc.d/rc.inet1.conf"

gksu gedit /etc/rc.d/rc.inet1.conf

clear

echo "Reiniciar toda a rede no Slackware"

/etc/rc.d/rc.inet1 restart



echo "Redes wireless"

which iwconfig

iwconfig

iwlist scan


# Agora que já sabe o nome da rede e a interface rode o comando abaixo:

# iwconfig wlan0 essid <NOME-DA-REDE> mode managed

# Depois gere o IP da rede:

# dhclient wlan0

# https://sempreupdate.com.br/como-conectar-wifi-via-terminal-linux/




# Kppp (Modem 3G)

# gedit  ~/.kde/share/config/kppprc


# Wvdial (Modem 3G)

# gksu gedit  /etc/wvdial.conf



# DHCP

interface="eth0"

which dhclient 

dhclient "$interface"


ifconfig -a



# Problemas do SlackWare no Dell Inspiron 15 5000 

cat /etc/modprobe.d/blacklist.conf 
# blacklist radeon


# Basicamente o IPv4 estava em conflito com o IPv6. A solução foi colocar o IPv6 no blacklist:

# echo "blacklist ipv6" >> /etc/modprobe.d/blacklist.conf 

# E dar um reboot na máquina. Resolvido.

# reboot


# https://www.vivaolinux.com.br/topico/Slackware/Resolvendo-problemas-do-SlackWare-no-Dell-Inspiron-15-5000-Brilho-travamento-e-WIFI/
# https://www.youtube.com/watch?v=0OLlX174LdQ


  ;;

         17) clear

gksu gedit /etc/resolv.conf

  ;;

         18) clear

which slackpkg

echo "
Utilizando o slackpkg
"

# A ordem dos comandos:

echo "
Atualiza as gpgs
"
slackpkg update gpg 
 
echo "
Download da lista dos pacotes
"
slackpkg update  
  
echo "
Atualiza TODO o sistema conforme o mirror selecionado. 
"   
slackpkg upgrade-all  

# echo "
# Instala algum novo pacote adicionado por dependência a outro atualizado
# "
# slackpkg install-new 


  ;;

         19) clear

echo "
Recuperando a instalação do Slackware


    corrigir um upgrade desastroso;
    contornar uma instalação de kernel problemática.
    zerar o sistema

"

ls /var/log/packages > /tmp/pacotes.txt

# pkgtool


echo "Zerar o sistema (slackpkg clean-system)


Isso remove todos os pacotes que não são aqueles que se encontram no DVD do Slackware (exceto, é claro, os blacklistados).

Um comando muito importante. Ele compara os pacotes instalados no seu sistema com o current e lhe diz quais os pacotes instalados 
NÃO fazem parte do current, dando a opção de removê-los, deixando em seu sistema apenas os pacotes oficiais.

"

slackpkg clean-system 

slackpkg install-new

ls /var/log/packages >> /tmp/pacotes.txt


# http://rra.etc.br/MyWorks/2012/05/31/recuperando-a-instalacao-do-slackware/
# https://www.vivaolinux.com.br/dica/Recuperando-inicializacao-do-Slackware-apos-atualizacao-do-kernel-via-slackpkg
# https://www.vivaolinux.com.br/topico/Slackware/Desinstalar-Pacotes?pagina=02
# https://www.vivaolinux.com.br/dica/Usando-o-slackpkg
# https://www.vivaolinux.com.br/topico/Duvidas-em-Geral/Qual-e-o-equivalente-do-comando-slackpkg-clean-system-nas-Debian-like
# https://www.vivaolinux.com.br/topico/Conhecimento-Livre/Como-eu-formato-meu-slackware...
# https://www.vivaolinux.com.br/topico/Slackware/Nao-esta-funcionando-o-slackpkg-download

  ;;


         20) clear


echo "
Atualiza as gpgs
"
slackpkg update gpg 
 
echo "
Download da lista dos pacotes
"
slackpkg update 


# sbopkg -r

clear

echo "
Procurar por pacotes

Informe o nome do pacote"
read pacote

slackpkg search $pacote

slackpkg file-search $pacote

sbopkg -g $pacote


echo "Enter para continuar..."
read pausa

 ;;
         21) clear
# Encontrar as resoluções possíveis

xrandr -q

# https://sejalivre.org/resolvendo-problemas-de-resolucao-de-tela-com-xrandr/

 ;;

         22) clear

which pulseaudio

which pavucontrol

which alsamixer


echo "
Serviços:
"

ls --color -l  /etc/rc.d/rc.pulseaudio
# -rwxr-xr-x 1 root root 1171 Jun 22  2016 /etc/rc.d/rc.pulseaudio


 ls --color -l  /etc/rc.d/rc.alsa*
# -rw-r--r-- 1 root root 2556 Abr  1  2016 /etc/rc.d/rc.alsa
# -rw-r--r-- 1 root root  999 Abr  1  2016 /etc/rc.d/rc.alsa-oss


echo "Ajustes de volume

Aparecerá uma tela com várias opções de volume. Use as setas para navegar e ajustar o 
volume conforme sua necessidade e pressione ESC para sair.

"

sleep 20

alsamixer


echo "Salvando os ajustes..."

# Para salvar e não precisar fazer os ajustes novamente.

alsactl store

# Quando iniciar ficará tudo como deixou anteriormente.


echo "Usuarios no grupo audio"

cat /etc/group | grep -i audio


# Identificar sua placa de som

echo "Placa de som"

lspci | grep -i audio



# https://pt.wikipedia.org/wiki/Alsamixer
# https://www.vivaolinux.com.br/dica/Configurar-som-no-Linux-atraves-do-ALSA
# https://www.linuxbrasil.org.br/configuracoes_iniciantes/som/configuracao_do_som.html
# http://www.dicas-l.com.br/arquivo/configurar_som_no_linux_atraves_do_alsa.php


 ;;

         23) clear

which pulseaudio

which pavucontrol

# /etc/rc.d/rc.pulseaudio stop
# /etc/rc.d/rc.pulseaudio start
/etc/rc.d/rc.pulseaudio restart

# pavucontrol

 ;;
         24) clear

which audacity

which arecord

arecord -t wav -f cd -d 10 ~/teste.wav

aplay ~/teste.wav

# https://www.linuxbrasil.org.br/configuracoes_iniciantes/som/configuracao_do_som.html

 ;;
         25) clear

ls --color -l /etc/rc.d/rc.cups*

chmod +x /etc/rc.d/rc.cups
/etc/rc.d/rc.cups restart

chmod +x /etc/rc.d/rc.cups-browsed 
/etc/rc.d/rc.cups-browsed restart


# Verificar se os pacotes estão instalados

ls /var/log/packages/ | grep cups
ls /var/log/packages/ | grep hplip


echo "Localização do seu dispositivo"

ls /dev/lp*


firefox "http://localhost:631/admin"

# https://www.vivaolinux.com.br/artigo/Configurando-impressora-HP692C-no-Slackware

 ;;
         26) clear 

lsusb

# scanimage -L

which xsane

xsane

# http://www.sane-project.org/sane-mfgs.html
# https://www.edivaldobrito.com.br/como-usar-scanner-de-multifuncional/
# https://www.hardware.com.br/dicas/configurando-scanners-linux.html
# https://linuxdicasesuporte.blogspot.com/2018/06/scanner-com-sane-para-debian-e-ubuntu.html
# https://help.ubuntu.com/community/ScanningHowTo
# http://wiki.nosdigitais.teia.org.br/Scanner_em_rede_em_Linux

;;

         27) clear 

echo "Testar Webcam (gspca, spca5xx, uvcvideo, Ov51x, ov518)

Obs: Antes confira se webcam está ligada pelas teclas Fn + F10, Fn + F7 ou outra combinação de teclas Fn + F... (Notebook - Web integrada).

Abra o Skype, cheese ou guvcview para testar sua webcam.


Webcams externas:

São as câmaras Web que se ligam ao PC para utilização. Normalmente através da utilização de um cabo USB.


webcam e mic interno não funcionam

A webcam só funciona com pajelanças?

"

uname -m

# Kernel (plug and Play)
uname -r


# Instalar V4L2

ls /var/log/packages/ | grep -i V4L
# v4l-utils-1.10.0-x86_64-1
# v4l-utils-compat32-1.10.0-x86_64-1compat32
# xf86-video-v4l-0.2.0-x86_64-13



cat /etc/group | grep -i video

ls -l /dev/video*

# Este comando imprime informações sobre todos os dispositivos conectados ao barramento USB. As informações sobre a sua câmara Web estarão na lista.

# lsusb -v

lsusb


lspci

# sudo lshw -short


dmesg | grep -i gspca

lsmod | grep -i gspca


echo "
Resolução: 640 X 480 pixels
"
gst-launch v4l2src device=/dev/video0 ! 'video/x-raw-yuv,width=640,height=480,framerate=30/1' ! ffmpegcolorspace ! ximagesink


# https://www.vivaolinux.com.br/topico/Webcam/Acabei-de-instalar-o-Linux-Mint-no-meu-Noebook-mas-a-WebCam-nao-funciona/?pagina=1
# http://www.ideasonboard.org/uvc/
# https://www.dell.com/support/article/br/pt/brdhs1/sln298412/um-guia-para-webcams-em-computadores-port%C3%A1teis-e-desktops-dell-com-sistemas-operativos-ubuntu?lang=pt
# https://wiki.ubuntu.com/HardwareSupportComponentsMultimediaWebCamerasCreative
# http://mxhaard.free.fr/download.html

;;

         28) clear 

echo "Informe o nome do usuario"
read usuario

adduser $usuario


ls -al /home/$usuario/


# https://www.vivaolinux.com.br/topico/Slackware/Criar-usuario-no-Slackware-142

;;
         29) clear 

ls -al /home/

echo "Informe o nome do usuario"
read usuario


echo "Remover o usuário sem excluir seus arquivos."
userdel $usuario

# echo "Remover o usuário e seus arquivos"
# userdel -r $usuario


# -r - Ao usarmos essa opção o diretório HOME e Mailbox do usuário será removido. É importante ter certeza ao fazer 
# isso, pois muitas vezes é melhor remover apenas o usuário ou até mesmo suspendê-lo mantendo seus arquivos para auditoria. 


ls -al /home/

# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Deletar-um-usuario
# https://www.vivaolinux.com.br/topico/vivaolinux/como-excluir-um-usuario-1
# http://www.dicas-l.com.br/arquivo/comando_adduser_completo.php

;;
         30) clear 

iptables -L

iptables -t nat -L

;;
         31) clear 

which nmap

# O nmap por padrão lista apenas as portas conhecidas, deixando uma grande quantidade de portas sem checar, as quais podem estar abertas.

nmap -v -p1-65535 localhost

lsof -i

netstat -lptu

# https://www.vivaolinux.com.br/dica/Listando-as-portas-abertas
# https://www.vivaolinux.com.br/artigo/Como-verificar-conexoes-abertas-no-Linux

;;
         32) clear

# Identifique todas as máquinas na rede

echo "Informe o ip da rede (Ex: 192.168.1.0)"
read ip

nmap -p "*" $ip/24

# Scan todas as portas usando coringas 


# https://pplware.sapo.pt/linux/angry-ip-scanner-identifique-todas-as-maquinas-na-rede/
# https://rodrigolira.eti.br/nmap-30-exemplos-de-comandos-para-administradores-de-rede/

;;

         33) clear

cat /etc/passwd

echo "Informe o nome do usuario no sistema"
read $usuario

clear

cat /etc/group

groups $usuario

echo "Informe o grupo para adicionar o usuário $usuario"
read $grupo

gpasswd -a "$usuario" "$grupo"

# https://www.vivaolinux.com.br/topico/Slackware/adicionando-usuario-no-grupo

 ;;


         34) clear

cat /etc/passwd

echo "Informe o nome do usuario no sistema"
read $usuario

clear

cat /etc/group

groups $usuario

echo "Informe o grupo para remove o usuário $usuario"
read $grupo

gpasswd -d "$usuario" "$grupo"

# https://www.vivaolinux.com.br/topico/Slackware/adicionando-usuario-no-grupo

 ;;

         35) clear

cat /etc/passwd

echo "Informe o nome do usuario no sistema para altera a senha"
read $usuario

passwd "$usuario"

# https://www.vivaolinux.com.br/topico/vivaolinux/Criando-usuarios-1

 ;;

         36) clear

ls /var/log/packages/ | grep -i gvfs
# gvfs-1.26.3-x86_64-1

which smbclient

echo "Informe o ip do computador na rede para listar as pastas compartilhadas (Ex: localhost)"
read ip

smbclient -L $ip

echo "Enter para continuar..."
read pausa

# https://www.vivaolinux.com.br/topico/Redes/Como-faco-para-conseguir-acessar-pastas-de-uma-rede-windows
# https://www.hardware.com.br/comunidade/listar-diretorios/274183/
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=4867

;;

         37) clear


which ntpdate

# Ao usar um firewall no servidor, certifique-se de que a porta 123/UDP usada pelo NTP está aberta 
# (o NTP usa apenas UDP). É necessário que ela fique aberta tanto para a rede loca, quanto para a 
# internet, já que o servidor precisa sincronizar o horário em relação aos servidores externos. Caso 
# necessário, você pode acrescentar uma regra como a abaixo no seu script de firewall, de forma a 
# manter a porta aberta:
#
# iptables -A INPUT -p udp --dport 123 -j ACCEPT
#
# -----------------------------------------------------------------------------------------------------
#
# Transforme-o em executável:
#
# chmod +x /etc/cron.hourly/ntpdate
#
#
# Para facilitar as coisas, existe o servidor "pool.ntp.org", que serve como um load balancer, encaminhando 
# as requisições para um servidor geograficamente próximo de você. Ao invés de ficar caçando servidores 
# públicos no Google, você pode sincronizar diretamente a partir dele:

ntpdate -u pool.ntp.org


sleep 30

;;

 38) clear

echo "


# ldd (List Dynamic Dependencies, em português Listar Dependências Dinâmicas) é um utilitário de sistemas operacionais 
# do tipo Unix que imprime as bibliotecas compartilhadas necessárias por cada programa ou biblioteca compartilhada 
# especificada na linha de comando.[1] Foi desenvolvido por Roland McGrath e Ulrich Drepper.[2] ldd é um script shell 
# que executa o programa passado como argumento e não deve ser usado com binários não confiáveis. Se alguma biblioteca 
# compartilhada estiver faltando para qualquer programa, este programa não executará. 
#
# Segurança
#
# O ldd é um shell script que executa o programa fornecido como argumento e não deve ser usado com binários não confiáveis. A 
# página de manual do ldd sugere usar como alternativa o seguinte comando, usando os utilitários objdump e grep: 
#
# $ objdump -p /caminho/do/programa | grep NEEDED
#
#
# https://pt.wikipedia.org/wiki/Ldd_(Unix)


As vezes encaramos seguinte problema, rodamos ou acabamos de instalar um software qualquer (as vezes previamente compilado 
em outro ambiente) e quando o executamos, aparecem mensagens do tipo:

  ld.so.1: cantata: fatal: libxvl.so: can't open file: errno=2 Killed  
           ^^^
  	   ^
  	   |___ nome do programa


Uma alternativa para resolver problemas desta natureza seria descobrir que biblioteca a aplicação acima estaria reclamando. Isto 
pode ser resolvido incluindo-se na variável de ambiente LD_LIBRARY_PATH o caminho para a biblioteca que ocasionou o problema.

O comando ldd gera uma lista de dependência dinâmica de arquivos executáveis ou objetos que são compartilhados.

Considerando o exemplo, digite:

  	% ldd ""which cantata""

"


which ldd

echo "Informe o nome do programa. Ex: vlc"
read programa

which $programa


# echo "Copia o caminho completo do programa acima. Ex: /usr/bin/vlc"
# read caminho_completo

# ldd $caminho_completo


ldd `which $programa`

# Desta forma são identificados todos os módulos que a aplicação necessita para funcionar. Para resolver o problema 
# basta identificar a localização destas bibliotecas em seu sistema e definir a variável de ambiente LD_LIBRARY_PATH 
# de forma a que sua aplicação consiga localizar tudo o que necessita em tempo de execução. 
#
#
# http://www.dicas-l.com.br/arquivo/ldd.php#.XJaWLqNv-PQ


;;


 39) 

# Ativando e desativando serviços

clear


dialog \
--title ''  \
--msgbox '

A forma mais simples de desativar um serviço no Slackware é tirar a permissão de execução do script correspondente.

Para verificar quais serviços estão ativos, use o comando ls /etc/rc.d/. Os que aparecem em verde são os com 
permissão de execução, os que estão ativos; enquanto os em branco são os desativados.


rc.acpid: O acpid é responsável por ativar o suporte a ACPI, que por sua vez é o responsável pelos recursos de economia de energia, suspender, hibernar e outras funções. Ele é um recurso básico em qualquer PC atual, sobretudo nos notebooks.

rc.alsa: Como vimos anteriormente, o Alsa é o responsável pelo suporte a placas de som. O rc.alsa é o script que carrega os módulos do Alsa, fazendo com que a placa de som seja ativada durante o boot. Mesmo com o serviço desativado, existe a possibilidade de fazer a placa funcionar carregando os módulos e ativando os componentes manualmente, mas, naturalmente, é muito mais fácil simplesmente manter o serviço ativo. 🙂

rc.atalk: O talk é um serviço antigo, que permite enviar mensagens para outros micros da rede local. Ele é pouco usado atualmente e fica desativado por padrão.

rc.bind: O Bind é um servidor DNS. Se ele estiver ativo, você pode usar o endereço “127.0.0.1” como DNS na configuração da rede, sem depender do DNS do provedor. Em um servidor, ele pode ser configurado para responder pelos domínios hospedados.

rc.cups: O Cups controla o suporte a impressão. Ele é necessário tanto para usar impressoras locais quanto impressoras de rede. Ele pode ser desativado para economizar recursos da máquina, mas, naturalmente, você só vai conseguir usar uma impressora depois de ativá-lo novamente.

rc.dnsmasq: O dnsmasq é um servidor DHCP e DNS reduzido, que pode substituir o bind e o dhcpd. Se seu objetivo é simplesmente compartilhar a conexão com os micros da rede local, ele pode ser uma boa opção, já que é mais leve e mais simples. Lembre-se de que ao usar o dnsmasq você não deve ativar nem o bind nem o dhcpd, e vice-versa.

rc.firewall: Este é um script opcional, que pode ser usado para incluir (manualmente) regras de firewall, para fechar as portas do seu micro, compartilhar a conexão, encaminhar portas para micros da rede interna (no caso de compartilhar a conexão) e assim por diante.


rc.gpm: O gpm permite usar o mouse em modo texto, facilitando o uso de aplicativos como o links e o mc. Em alguns casos ele pode conflitar com o X, tornando o movimento do rastro do mouse errático, de forma que muitos preferem mantê-lo desativado.

rc.httpd: Este script ativa ou desativa o servidor Apache, caso instalado. Caso ativo, você pode testar o servidor web instalado na sua máquina acessando o endereço “127.0.0.1:80” no navegador.

rc.inet1: Este script tem a função de ativar a ou as placas de rede durante o boot. Ele lê a configuração de cada placa (IP, máscara, etc.) a partir do arquivo “/etc/rc.d/rc.inet1.conf”, que, por sua vez, é gerado automaticamente ao configurar a rede usando o netconf. Lembre-se de que a configuração dos servidores DNS usados para acessar a internet não vai nestes arquivos, mas sim no “/etc/resolv.conf”.

rc.inet2: Este script é responsável por carregar vários outros servidores, como o SSH, NFS e NIS (caso habilitados), carregar o inetd e também montar compartilhamentos de rede NFS ou Samba que você tenha eventualmente incluído no “/etc/fstab”.

rc.ip_forward: Ativa o compartilhamento da conexão com os outros micros da rede local. Normalmente, você usa este serviço em conjunto com o dnsmasq ou com o bind e dhcpd.

rc.local: Este script pode ser usado para incluir comandos diversos que você quer que sejam executados durante o boot. Se o sistema não estiver ativando o DMA para o HD, por exemplo, você poderia incluir o comando “hdparm -c1 -d1 /dev/hda” para forçar a ativação.

rc.modules: Este arquivo é usado para carregar módulos de kernel adicionais durante o boot. Como (fora as funções normais do HAL e de utilitários básicos, como o alsaconf) o Slackware não inclui muitas funções de detecção de hardware, em alguns casos você pode precisar editar este arquivo para ativar algum componente. Para facilitar, ele vem com vários comentários e vários módulos separados por categorias.

rc.nfsd: O NFS é um protocolo usado para compartilhar arquivos entre máquinas Linux. Este script ativa o servidor NFS, que é, por sua vez, configurado através do arquivo “/etc/exports”. Ao ativar o nfsd, é necessário ativar também o portmap.

rc.pcmcia: Este script ativa o suporte genérico a placas PCMCIA. Pode ser desativado se você não está usando um notebook, ou se não pretende usar nenhuma placa PCMCIA/PC-Card.

rc.portmap: O portmap é usado pelo NFS e também pelo NIS (um serviço de autenticação, pouco usado atualmente). O portmap recebe as conexões dos clientes e as envia para os servidores propriamente ditos. Sem ele, nenhum dos dois funciona.

rc.samba: O samba permite compartilhar arquivos com máquinas Windows e também com outras máquinas Linux, que tenham o cliente samba instalado. Ao instalar o pacote “samba” no Slackware você instala ambos, mas em outras distribuições é mais comum encontrar o samba dividido em dois ou mais pacotes, permitindo que você instale apenas o cliente, ou apenas o servidor.

Este script inicia o servidor Samba. Você não precisa dele se deseja apenas acessar compartilhamentos de outras máquinas, sem compartilhar nada. O Samba é configurado através do arquivo “/etc/samba/smb.conf” ou através do Swat. É possível usar o Samba para, desde simplesmente compartilhar algumas pastas numa rede ponto a ponto, até configurar um servidor de domínio. Você pode ver mais detalhes sobre a configuração do Samba e outros servidores no meu livro Servidores Linux, Guia Prático.

rc.sendmail: O Sendmail é um servidor de e-mails completo, que permite tanto enviar, quanto receber e-mails via SMTP. Alguns usuários das antigas deixam o Sendmail ativo para poder enviar e-mails diretamente, sem depender do SMTP do provedor, mas hoje em dia isso tem se tornado problemático devido aos diversos tipos de filtros e bloqueios que os provedores e empresas de hospedagem passaram a usar graças ao problema do spam. Muitos e-mails enviados através de conexões domésticas ficarão retidos em algum filtro e não chegarão ao destinatário.

O Sendmail possui um histórico de segurança complicado, com muitos problemas graves descobertos ao longo de sua história. Se você não pretende realmente configurar um servidor de e-mails, é importante desativá-lo. Hoje em dia o Sendmail vem perdendo espaço para outros servidores, como o Postfix e o Qmail.

rc.serial: Este script ativa as portas seriais do micro. Ele é usado apenas em micros antigos, que ainda possuem portas seriais.

rc.sshd: O SSH permite acessar sua máquina remotamente, seja para administrar e resolver problemas remotamente, seja para rodar programas. Assim como o Samba, o SSH é composto de um cliente e um servidor, que é ativado por este script.

A configuração do servidor SSH (feita na máquina que será acessada remotamente) vai no arquivo “/etc/ssh/sshd_config”. No Slackware o suporte ao uso de aplicativos gráficos remotamente vem desabilitado por padrão. Para reativar, adicione a linha “X11Forwarding yes” no final do arquivo.

Aproveite para adicionar a linha “ForwardX11 yes” também no arquivo “/etc/ssh/ssh_config” da máquina cliente. Apesar do nome ser parecido (apenas uma letra a menos), ele é bem diferente do sshd_config, contendo a configuração do cliente SSH.

rc.syslog: O syslog é responsável por gerar os logs do sistema, que podem ser acompanhados através do arquivo “/var/log/syslog”. Embora não seja obrigatório, é recomendável mantê-lo ativo.

rc.sysvinit: O Slackware usa uma estrutura de scripts de inicialização diferente de outras distribuições, similar à organização dos BSDs. É por isso que no Slackware os scripts vão na pasta “/etc/rc.d” ao invés da “/etc/init.d” e todos começam com “rc.”. Este script cria uma camada de compatibilidade que permite que muitos programas escritos para outras distribuições possam funcionar no Slackware.

rc.udev: O udev é o responsável por detectar periféricos (incluindo periféricos USB e dispositivos removíveis em geral), carregando os módulos apropriados, criando os devices de acesso e executando outras funções necessárias para ativá-lo, tarefa que em distribuições antigas era executado pelo hotplug. O udev é um dos serviços essenciais do sistema em qualquer distribuição atual, por isso você nunca deve desativá-lo.

rc.yp: Este script ativa o NIS, um sistema de autenticação para máquinas Linux, que permite configurar um servidor central, onde os clientes passam a fazer login, como ao usar um servidor de domínio em uma rede Microsoft. O NIS vem perdendo terreno para o LDAP e outros protocolos, pois as informações são transmitidas em texto puro pela rede e podem ser facilmente interceptadas. Assim como no caso do Sendmail, este script só deve ficar ativo caso você realmente utilize o NIS, seja como servidor, ou como cliente. Em ambos os casos, é necessário editar o script, colocando as informações da sua rede.



Obs: Na cor verde são os serviços ativo no seu sistema.

Desativa serviços que você não utiliza:



' 35 100

clear

ls -l /etc/rc.d/ >> $log

ls --color -l /etc/rc.d/


# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço Alsa da inicialização"

/etc/rc.d/rc.alsa stop

chmod -x /etc/rc.d/rc.alsa


/etc/rc.d/rc.alsa-oss stop

chmod -x /etc/rc.d/rc.alsa-oss


# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço Atalk da inicialização"

/etc/rc.d/rc.atalk  stop

chmod -x /etc/rc.d/rc.atalk


/etc/rc.d/rc.atalk.new  stop

chmod -x /etc/rc.d/rc.atalk.new

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço avahidaemon da inicialização"

/etc/rc.d/rc.avahidaemon  stop

chmod -x /etc/rc.d/rc.avahidaemon

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço avahidnsconfd da inicialização"

/etc/rc.d/rc.avahidnsconfd  stop

chmod -x /etc/rc.d/rc.avahidnsconfd

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço Bind da inicialização"

/etc/rc.d/rc.bind  stop

chmod -x /etc/rc.d/rc.bind

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço Bluetooth da inicialização"

/etc/rc.d/rc.bluetooth stop

chmod -x /etc/rc.d/rc.bluetooth

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço gpm  da inicialização"

/etc/rc.d/rc.gpm  stop

chmod -x /etc/rc.d/rc.gpm

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço networkmanager da inicialização"

/etc/rc.d/rc.networkmanager  stop

chmod -x /etc/rc.d/rc.networkmanager

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço openvpn da inicialização"

/etc/rc.d/rc.openvpn  stop

chmod -x /etc/rc.d/rc.openvpn

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço pcmcia da inicialização"

/etc/rc.d/rc.pcmcia  stop

chmod -x /etc/rc.d/rc.pcmcia

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço postgresql da inicialização"

/etc/rc.d/rc.postgresql  stop

chmod -x /etc/rc.d/rc.postgresql


/etc/rc.d/rc.postgresql.new  stop

chmod -x /etc/rc.d/rc.postgresql.new

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço rpc da inicialização"

/etc/rc.d/rc.rpc  stop

chmod -x /etc/rc.d/rc.rpc

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço do Servidor Samba da inicialização"

/etc/rc.d/rc.samba  stop

chmod -x /etc/rc.d/rc.samba

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço sendmail da inicialização"

/etc/rc.d/rc.sendmail  stop

chmod -x /etc/rc.d/rc.sendmail

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço serial da inicialização"

/etc/rc.d/rc.serial  stop

chmod -x /etc/rc.d/rc.serial

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço SSH da inicialização"

/etc/rc.d/rc.sshd stop

chmod -x /etc/rc.d/rc.sshd

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço timidity da inicialização"

/etc/rc.d/rc.timidity  stop

chmod -x /etc/rc.d/rc.timidity

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço vnstat da inicialização"

/etc/rc.d/rc.vnstat  stop

chmod -x /etc/rc.d/rc.vnstat

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço wicd da inicialização"

/etc/rc.d/rc.wicd  stop

chmod -x /etc/rc.d/rc.wicd

# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço wireless da inicialização"

/etc/rc.d/rc.wireless  stop

chmod -x /etc/rc.d/rc.wireless


/etc/rc.d/rc.wireless.conf stop

chmod -x /etc/rc.d/rc.wireless.conf 


# ---------------------------------------------------------------------------------------------------------

echo "Desativando serviço xrdp da inicialização"

/etc/rc.d/rc.xrdp  stop

chmod -x /etc/rc.d/rc.xrdp


# ---------------------------------------------------------------------------------------------------------


cat /etc/rc.d/rc.M


# https://www.hardware.com.br/livros/linux/ativando-desativando-servicos.html


;;


           40) 

clear

echo "
Programas instalados no seu sistema atualmente são:
" >> $log


du -lhs /var/log/packages/ >> $log

ls -l /var/log/packages/ >> $log


du -lhs /opt/ >> $log

ls -l /opt/ >> $log


cat $log


  ;;
      


           41) # Recuperando o LILO

clear


dialog \
--title ''  \
--msgbox '

Já aconteceu de acidentalmente você reinstalar o Windows após a instalação do Linux? Se você já 
fez isso, sabe que quando o Windows é instalado ele sobrescreve a MBR. Ou seja, ele sobrescreve 
o LILO que estava na MBR! 

O comando chroot para entrar na partição montada, a fim de editar o lilo.conf e gravar o 
lilo. Todos os comandos dados dentro do chroot são na verdade executados no sistema que 
está instalado na partição.


Recupere o LILO na MBR após uma instalação do Windows



É possível também remover o lilo, usando o comando “lilo -u” (“u” de uninstall). Ao ser 
instalado pela primeira vez, o lilo faz um backup do conteúdo da MBR e ao ser removido 
este backup é recuperado. Esta opção pode ser útil em casos onde você instala o lilo na 
MBR (sem querer) e precisa recuperar o sistema anterior.


Para apagar o lilo da mbr é só fazer assim:

# lilo -u /dev/hd(X)





Outro metodo:



Publicado em 05/06/2008


Configurar LILO facilmente


Bom, eu já vi várias pessoas pedindo como se faz para configurar o lilo ou o grub 
quando usam dois sistemas operacionais.

Até mesmo pessoas e técnicos que estão em níveis avançados de "sabedoria" (^^) apanham 
quando precisam configurar o gerenciador com mais de dois sistemas ou quando o último 
sistema instalado foi o Windows, que é anti-social, causando a reescrita da MBR, o que 
acaba deixando apenas o Windows como sistema.

Mas a maioria não sabe que com um pouco de inteligência você não precisa digitar sequer 
uma linha de código no arquivo do lilo para configurá-lo perfeitamente.

Eu descobri isso depois que fui instalar o Slackware aqui e então pensei um pouco (sim, 
eu penso) e tive essa idéia, e funciona perfeitamente.

Qualquer um conseguiria fazer isso, só precisa de:

    Conhecimento com partições;
    Um cd ou DVD do Slackware. 


Talvez funcione com outra distribuição que não seja live-cd, mas eu não sei, então 
não garanto nada se você tentar, porque é tudo diferente. Com esse artigo uma pessoa 
que entende bem, pode tirar suas próprias idéias e usar o cd que quiser.

PS: Com live-cd provavelmente não funciona.

Configurando
Bom, depois que você tiver o necessário, vem a parte mais fácil:

Primeiro, instale todos os sistemas e crie a partição que irá ser usada como swap.

Primeiro, dê boot pelo CD/DVD do Slackware. Depois que carregar, digite "1" e encontre 
o modelo do seu teclado (geralmente ABNT2). Dê um enter quando encontrar. Irá aparecer 
uma outra página, digite "1" e dê enter.

Agora vamos configurar o sistema.

Selecione "ADDSWAP". Irá aparecer uma página, selecione a partição que você deseja 
usar como "SWAP". Depois disso você irá ter todas as outras partições dos outros 
sistemas, selecione aqueles que você quer que seja usado no lilo, só que claro, 
não formate!

Depois que você adicionar todos os sistemas para o lilo, clique em "Continue".

Quando aparecer a janela para selecionar onde você quer que o lilo seja instalado, 
selecione "MBR".

Pronto, agora é só ir cancelando as telas para instalação do Slackware e esperar 
finalizar. Depois selecione Exit e digite "reboot".

Tire o CD, veja o lilo configurado e seja feliz.



Tutorial retirado de:

    Configurar lilo sem digitar uma linha de código 

http://defland.forumeiros.com/geral-f24/configurar-lilo-sem-digitar-uma-linha-de-codigo-t152.htm#448



' 35 100

clear


echo "
Descobrindo em que partição está o Linux:


sudo fdisk -l


Isso listará todas as partições do HD. Procure pela partição do Linux na coluna System e sua respectiva partição em Device Boot ou Dispositivo Boot.

Pronto: agora você sabe em que dispositivo está o Linux. Anote-o para não esquecer. Pode reiniciar o sistema e recomeçar os passos.

"

sudo fdisk -l | grep /dev/hd

sudo fdisk -l | grep /dev/sd

echo "
Informe a partição do HD para gravar o lilo na MBR. Ex: hda5 ou sda4"
read particao

# Para gravar o lilo na partição use:

lilo -b /dev/$particao




# Você dá boot pelo CD/DVD/USB que usou para instalar.
#
# hugesmp.s root=/dev/$particao rdinit= ro  
#
# Após carregar o Linux, em qualquer terminal, use o seguinte comando para reescrever o LILO na MBR:
#
# lilo -C /etc/lilo.conf (com o C maiúsculo mesmo)
#
# Aparecerá uma mensagem assim:
#
# Warning: LBA32 addressing assumed
# Added Linux * One warning was issued.
#
# Reinicie o sistema e seja feliz. 



echo "

Espere 10s..."
sleep 10


echo "Reinicie o Sistema para que as mudanças sejam aplicadas." 


echo "Deseja reiniciar a máquina agora?[s/n]"
read resp

if [ $resp = s ]; then

sudo reboot

else

echo "Você optou por não reiniciar neste momento"

exit 1

fi


# Ou

# Tenta configurar automaticamente o LILO para inicializar

# liloconfig


# https://www.hardware.com.br/comunidade/gravar-lilo/239934/
# https://www.hardware.com.br/guias/usando-slackware/lilo.html
# https://www.vivaolinux.com.br/dica/Configurar-LILO-facilmente
# https://www.vivaolinux.com.br/dica/Recuperando-o-LILO-em-3-passos-no-Slackware
# https://www.vivaolinux.com.br/topico/Slackware/Slackware-nao-da-boot-depois-da-instalacao


  ;;


           42) 

clear

echo "

O comando chroot para entrar na partição montada, a fim de gravar o Grub. Todos os comandos dados 
dentro do chroot são na verdade executados no sistema que está instalado na partição.


Recupere o Grub na MBR após uma instalação do Windows
"

sudo fdisk -l | grep /dev/hd

sudo fdisk -l | grep /dev/sd


echo "
Informe a partição do HD para gravar o Grub na MBR. Ex: hda5 ou sda4"
read particao



blkid | grep $particao

echo "
Informe o sistema de arquivo da $particao. Ex: ext4"
read sistema_de_arquivo


umount /dev/$particao


sudo mkdir -p /media/$particao

sudo mount -t $sistema_de_arquivo /dev/$particao /media/$particao

sudo grub-install --root-directory=/media/$particao /dev/sda


umount /media/$particao

rm -Rf /media/$particao


echo "Reinicie o Sistema para que as mudanças sejam aplicadas." 


echo "

Espere 10s..."
sleep 10



echo "Deseja reiniciar a máquina agora?[s/n]"
read resp

if [ $resp = s ]; then

sudo reboot

else

echo "Você optou por não reiniciar neste momento"

exit 2

fi


# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=12504

  ;;


           43) 

clear

echo "Os grupos atualmente no sistema são:

"

cat /etc/group 


  ;;


           44) 

clear

echo "Listar somente pacote oficial:

"

ls -l  /var/log/packages/ | grep slack*

  ;;


           45) 

clear

echo "Listar somente pacote SBo:

"

ls -l  /var/log/packages/ | grep _SBo

  ;;


           46) 

clear

echo "Listar somente pacote 32bit (Multilib no Slackware):

"

ls -l  /var/log/packages/ | grep compat32

  ;;


           47) 

clear

# Enviado em 22/03/2019 - 13:41h
# 
# Estou tentando instalar programas do repositório sbo "slackbuilds" com o slpkg porém quando o 
# programa tem como dependência algum pacote que já existe na distro “oficial”, ele marca para 
# atualizar substituindo o pacote oficial pela versão do sbo fazendo downgrade ou upgrade se 
# necessário. Existe algum jeito do slpkg não tocar nos pacotes oficiais da distro? Estou 
# utilizando ele apenas para gerir slackbuilds. Para os pacotes oficiais e pacotes do 
# alienbob utilizo o slackpkg com slackpkg+
# 
# Estou utilizando o Slackware64 current.
# 
# 

echo "Para gerir slackbuilds com slpkg (adiciona na blacklist um pacote)

"

ls -l  /var/log/packages/


echo "Qual pacote que deseja adiciona na blacklist?"
read pacote

slpkg -b $pacote --add

# https://www.vivaolinux.com.br/topico/Slackware/slpkg-atualizando-pacotes-oficiais-da-distro

  ;;


           48) 

clear

echo "Para gerir slackbuilds com slpkg (remove da blacklist um pacote)

"

ls -l  /var/log/packages/


echo "Qual pacote que deseja remove da blacklist?"
read pacote

slpkg -b $pacote --remove


# https://www.vivaolinux.com.br/topico/Slackware/slpkg-atualizando-pacotes-oficiais-da-distro
# https://www.vivaolinux.com.br/artigo/Conhecendo-o-Slpkg-gerenciador-de-pacotes-para-Slackware

  ;;


           49) # Verificar dependências do programa (SlackBuilds.org)

clear

echo "Verificar dependências do programa (SlackBuilds.org)

"

ls -l  /var/log/packages/


echo "Qual pacote que deseja verificar a dependência?"
read pacote

sqg -p $pacote

sbopkg -g $pacote



# Este comando irá exibir os arquivos README, Slackbuild, .info e slack-desc para o pacote consultado. 
# Para consultar somente as dependências utilize o comando abaixo:

echo '
Ser aparece essa mensagem usar a letra q

Hit any key to continue: q


REQUIRES=" XXXXXXXXXX  YYYYYYYY ZZZZZZZ  "

'

sbopkg -s $pacote |grep REQUIRES


# https://www.hardware.com.br/comunidade/dependencias-slackware/935066/
# https://tuxtoriais.wordpress.com/2007/11/22/instalando-pacotes-no-slackware/

  ;;


           50) 

clear

echo "Abrir o gerenciado de pacotes do Slackware - Pkgtool (installpkg; updatepkg; removepkg).

"

sleep 2

which pkgtool

pkgtool

# http://www.dicas-l.com.br/arquivo/instalando_pacotes_binarios_no_slackware.php

  ;;


           51) 

clear

echo " Instala diretamente um pacote (installpkg)

"

which installpkg

echo "Informe a localização completa do arquivo .tgz. Ex: /tmp/pacote.tgz ou $HOME/Downloads/pacote.tgz"
read pacote

installpkg "$pacote"


echo "A lista de pacotes instalados pode ser vista em: /var/log/packages/"

ls -l /var/log/packages/


# http://www.dicas-l.com.br/arquivo/instalando_pacotes_binarios_no_slackware.php
# https://www.hardware.com.br/guias/usando-slackware/instalacao-programas.html

  ;;


           52) 

clear

echo " Remove diretamente um pacote (removepkg)

"

which removepkg


ls -l /var/log/packages/

echo "Informe o pacote que deseja remove."
read pacote

removepkg $pacote


echo "A lista de pacotes instalados pode ser vista em: /var/log/packages/"

ls -l /var/log/packages/


# http://www.dicas-l.com.br/arquivo/instalando_pacotes_binarios_no_slackware.php

  ;;


           53) 

clear

echo "Converte pacotes RPM para o formato TGZ.


Rpm2tgz

Este utilitário converte pacotes RPM para o formato TGZ. Para rodar digite em um terminal:

  root@darkstar# rpm2tgz pacote.rpm

Ele cria um pacote.tgz no diretório em que foi executado. Para instalar esse pacote basta usar umas das opções no menu.

"

which rpm2tgz

cd /tmp/

echo "Informe a localização completa do pacote .rpm . Ex: /tmp/pacote.rpm ou $HOME/Downloads/pacote.rpm"
read pacote

rpm2tgz "$pacote"


echo "Pacote .tgz gerado em /tmp/"


ls -l /tmp/ | grep *.tgz


# http://www.dicas-l.com.br/arquivo/instalando_pacotes_binarios_no_slackware.php

  ;;

           54) 

clear

echo "

Atualizar os pacotes do SlackBuilds.org no Slackware (sbopkg)
"

sbopkg -r

sqg -a

sbopkg -c


  ;;



           55) 

clear

echo "


Instalar Programas no Slackware (Compilação)

cd pasta_do_programa

./configure

make

make install



"


  ;;


           56) 

clear

echo "

Para instalar utilizando o sbopkg. 

"

echo "Qual pacote que deseja instalar?"
read pacote

sbopkg -g $pacote

sqg -p $pacote


echo "
Quando perguntado tecle Q para executar a QUEUE (fila de dependências).

E para não compilar novamente um pacote que já esteja instalado, você adiciona a opção -k, como em:
"

sbopkg -k -i $pacote


# http://telazul.drusian.com.br/pt/artigo/sbopkg-gerenciamento-de-pacotes-no-slackware
# https://www.vivaolinux.com.br/topico/Linux-Basico/como-gerir-dependencias-no-slack

  ;;


           57) 

clear

echo "

Reinstalar um programa no Slackware (slackpkg)

"

echo "Qual pacote que deseja reinstalar?"
read pacote

echo "
Atualizando a lista de pacotes ...
"
slackpkg update


slackpkg file-search $pacote

sleep 20

slackpkg reinstall $pacote

  ;;


       58) 

clear

echo "

# Exploit Title: xorg-x11-server 1.20.3 - Privilege Escalation

# CVE-2018-14665
#
#
# Uma falha foi encontrada no xorg-x11-server antes de 1.20.3. Uma permissão incorreta
# check for opções -modulepath e -logfile ao iniciar o Xorg. Servidor X
# permite que usuários sem privilégios tenham a capacidade de efetuar login no sistema via
# console físico para escalonar seus privilégios e executar código arbitrário sob
# privilégios de root (CVE-2018-14665).
#
# Este exploit visa o cron do OpenBSD para escalar privilégios para
# root no OpenBSD 6.3 e 6.4. Você não precisa estar conectado a um físico
# console, funciona perfeitamente em pseudo-terminais conectados via SSH também.

# https://www.exploit-db.com/exploits/45742/


#  Xorg < 1.20.3

"



Xorg -version 

# 
# X.Org X Server 1.18.3
# Release Date: 2016-04-04
# X Protocol Version 11, Revision 0
# Build Operating System: Slackware 14.2 Slackware Linux Project
# Current Operating System: Linux kuru 4.4.157 #2 SMP Fri Sep 21 00:36:59 CDT 2018 x86_64
# Kernel command line: auto BOOT_IMAGE=Linux ro vt.default_utf8=1 root=PARTUUID=000e9f23-03
# Build Date: 18 October 2017  12:21:16PM
#  
# Current version of pixman: 0.34.0
# 	Before reporting problems, check http://wiki.x.org
# 	to make sure that you have the latest version.



# X -version
#
# X.Org X Server 1.18.3
# Release Date: 2016-04-04
# X Protocol Version 11, Revision 0
# Build Operating System: Slackware 14.2 Slackware Linux Project
# Current Operating System: Linux kuru 4.4.157 #2 SMP Fri Sep 21 00:36:59 CDT 2018 x86_64
# Kernel command line: auto BOOT_IMAGE=Linux ro vt.default_utf8=1 root=PARTUUID=000e9f23-03
# Build Date: 18 October 2017  12:21:16PM
#  
# Current version of pixman: 0.34.0
# 	Before reporting problems, check http://wiki.x.org
# 	to make sure that you have the latest version.


# https://www.vivaolinux.com.br/perguntas/verPergunta.php?codigo=63806
# https://www.diolinux.com.br/2018/10/nova-falha-de-seguranca-afeta-distros-linux-bsd.html





echo "Para verificar sistema todo, arq. versão kernel e bla bla bla..."

uname -a

echo "versão do kernel utilizada"

uname -r



echo "Verificar seu Linux!"

cat /etc/os-release 
# NAME=Slackware
# VERSION="14.2"
# ID=slackware
# VERSION_ID=14.2
# PRETTY_NAME="Slackware 14.2"
# ANSI_COLOR="0;34"
# CPE_NAME="cpe:/o:slackware:slackware_linux:14.2"
# HOME_URL="http://slackware.com/"
# SUPPORT_URL="http://www.linuxquestions.org/questions/slackware-14/"
# BUG_REPORT_URL="http://www.linuxquestions.org/questions/slackware-14/"


# https://www.vivaolinux.com.br/topico/Kernel-Linux/Como-Verificar-a-versao-do-kernelxorg-e-mesa-no-ubuntu-ou-linuxmint
# https://www.vivaolinux.com.br/topico/Seguranca-Linux/CVE-2018-14665-Xorg-1203


  ;;


         59) clear

# Ajustando horário no Slackware

which timeconfig
# /usr/sbin/timeconfig


echo 'Para desativar o UTC no Slackware

Escolha "No- hardware clock is set to local time" e a localidade "America/São_Paulo".


ou



$ su
Senha : 

# pkgtool => setup

ou

# timeconfig


Obs: Verifique se precisa trocar a bateria CR2032 de 3V da sua placa-mãe ou clear CMOS.

'

# Altera o fuso-horário do micro.

timeconfig


# http://www.dicas-l.com.br/arquivo/how-to_data_e_hora_no_linux.php


 ;;



         60) clear

# Firewall



# Verificar se o arquivo /etc/rc.d/rc.firewall existe

if [ -e "/etc/rc.d/rc.firewall" ] ; then

echo "O arquivo /etc/rc.d/rc.firewall existe"





# opcao=$(zenity  --list  --text "Selecione o que deseja fazer" \
#    --radiolist \
#    --column "" \
#    --column "" \
#    FALSE "1" TRUE "2" FALSE "3" FALSE "4");


# Capturando as escolhas do usuario.
#
# Note a presenca do --stdout e do subshell $(comando)

opcao=$(dialog \
--stdout \
--radiolist 'Escolha sua opção' \
0 0 0 \
1 'Iniciar Firewall'          off \
2 'Parar Firewall'            on \
3 'Reiniciar Firewall'        off \
4 'Listar regras do Firewall' off)


case $opcao in
	1) # Iniciar Firewall:
            clear

	/etc/rc.d/rc.firewall start

       echo "
Enter para continuar..."
       read pausa

	;;

	2) # Parar Firewall:
            clear

	/etc/rc.d/rc.firewall stop

       echo "
Enter para continuar..."
       read pausa

	;;

	3) # Reiniciar Firewall:
            clear

	/etc/rc.d/rc.firewall restart

       echo "
Enter para continuar..."
       read pausa

	;;

	4) # Listar regras do Firewall:
            clear

	/etc/rc.d/rc.firewall lista

       echo "
Enter para continuar..."
       read pausa

	;;


	*) clear && exit 1
esac



else

clear

echo "Não existe o arquivo /etc/rc.d/rc.firewall"

exit 

fi


# http://dailson.blogspot.com/2014/02/shell-script-com-dialog-usando-o_8307.html

 ;;


         61) clear

         echo "Atualização do kernel

https://www.kernel.org/
"


echo "
Kernel usado atualmente:
"
uname -r


echo "
Kerneis instalados no sistema:

"

ls /var/log/packages/ | grep kernel
# kernel-firmware-20190726_dff98c6-noarch-1
# kernel-generic-4.4.189-x86_64-1
# kernel-headers-4.4.189-x86-1
# kernel-huge-4.4.189-x86_64-1
# kernel-modules-4.4.189-x86_64-1
# kernel-source-4.4.189-noarch-1
# virtualbox-kernel-5.0.40_4.4.186-x86_64-2_SBo


echo "
Link do kernel atual para o arquivo vmlinuz:
"

ls -l /boot/vmlinuz
# lrwxrwxrwx 1 root root 20 Ago 15 13:46 /boot/vmlinuz -> vmlinuz-huge-4.4.189



echo '

Altera o nome do kernel na opção label do arquivo /etc/lilo.conf

# cat /etc/lilo.conf


Antes:

------------------------------------------------

# Linux bootable partition config begins

#   image = /boot/vmlinuz
# #  root = /dev/sda4
#   addappend = "root=PARTUUID=000e9f23-03"
#   label = Kernel_4.4.172
#   read-only


------------------------------------------------

Depois:

# Linux bootable partition config begins

   image = /boot/vmlinuz
#  root = /dev/sda4
   addappend = "root=PARTUUID=000e9f23-03"
   label = kernel_huge_4.4.189
   read-only

------------------------------------------------


# lilo
Warning: LBA32 addressing assumed
Fatal: Image name, label, or alias is too long: kernel_huge_4.4.189



# cat /etc/lilo.conf


# Linux bootable partition config begins

   image = /boot/vmlinuz
#  root = /dev/sda4
   addappend = "root=PARTUUID=000e9f23-03"
   label = kernel_4.4.189
   read-only




# lilo
Warning: LBA32 addressing assumed
Added kernel_4.4.189  *
Added memtest86+
Added Windows
One warning was issued.



Enter para continuar ....

'
read pausa

# https://www.vivaolinux.com.br/topico/Slackware/Atualizando-o-Kernel-do-Slackware-Linux-sem-dar-break-no-sistema


 ;;

         62) clear

# Configurar mouse

# Configurando um mouse USB no Slackware

echo "Verificar os módulos USBs

Carregando os módulos do kernel. Note que isto é para o kernel padrão, se você estiver compilando um 
kernel customizado, certifique-se de que os módulos apropriados estejam compilados ou façam parte do kernel."

lsmod | grep usb
# snd_usb_audio         159620  2
# snd_usbmidi_lib        21893  1 snd_usb_audio
# snd_rawmidi            21764  1 snd_usbmidi_lib
# usbhid                 38927  0
# hid                   108091  2 hid_generic,usbhid
# usb_wwan                8254  1 option
# usbserial              28120  5 option,usb_wwan
# usb_storage            56486  1 uas
# snd_hwdep               6656  2 snd_usb_audio,snd_hda_codec
# snd_pcm                93314  5 snd_usb_audio,snd_hda_codec_hdmi,snd_hda_codec,snd_hda_intel,snd_hda_core
# snd                    69793  35 #snd_usb_audio,snd_hwdep,snd_timer,snd_hda_codec_hdmi,snd_pcm,snd_rawmidi,snd_hda_codec_generic,snd_usbmidi_lib,snd_hda_codec,snd_hda_intel,snd_seq_device




echo "
Certifique-se que este arquivo /etc/rc.d/rc.gpm é executável
"

chmod +x /etc/rc.d/rc.gpm 

echo "
Reiniciando o gpm...
"
/etc/rc.d/rc.gpm restart
# Restarting gpm...
# O0o.oops(): [daemon/check_kill.c(38)]: Could not open /var/run/gpm.pid.


echo "
Dispositivo:
"
ls -l /dev/mouse 
# lrwxrwxrwx 1 root root 10 Ago 18 13:45 /dev/mouse -> input/mice

# Agora você pode usar o seu mouse USB no console, apenas destacar algum texto, mantendo pressionado o 
# botão esquerdo do mouse enquanto arrasta, em seguida, colá-lo para o local do cursor com o botão direito do mouse. 



# https://www.linuxquestions.org/questions/slackware-14/setting-up-a-usb-mouse-in-slackware-401496/


;;


         63) clear

# Configuração do modem e regras de discagem.

pppsetup

;;


         64) clear

# Configurando o X


echo "

domingo, 30 de outubro de 2016


Instalando NVIDIA no Slackware


Tendo selecionado as categorias A, AP, D, K, L, N, X, XAP, XFCE contido no DVD do Slackware que são 
essenciais para uso em Desktop. As categoriais D e K são as mais importantes para realizar a instalação 
do driver da Nvidia, nos procedimentos a seguir, essas categorias importantes correspondente os pacotes 
de desenvolvimento, incluindo compiladores C(gcc), C++(g++), libc, make, etc e o source do Kernel Linux 
localizado em /usr/src:


Primeiramente acesse o site http://www.nvidia.com e faça o download do driver NVIDIA da versão correspondente 
e sua placa de vídeo que deve ser o binário .run 

Remove o drive que ocorre conflito 

# removepkg xf86-video-nouveau 


Reinicie o sistema 

# reboot 


Os demais procedimentos deve ser realizado em init 3 (sem o X) 

instale o pacote xf86-video-nouveau-blacklist-noarch-1-txz localizado no DVD extra/xf86-video-nouveau-blacklist 


# ls -l  /var/log/packages/ | grep xf86-video-nouveau
-rw-r--r-- 1 root root    1150 Jul  7  2017 xf86-video-nouveau-1.0.12-x86_64-1



Verifique se tem a entrada dvdrom no arquivo /etc/fstab 

Caso não tiver, adicione a linha 

/dev/cdrom /mnt/cdrom auto noauto,owner,ro,comment=x-gvfs-show 0 0 


Note que no arquivo /etc/fstab está configurado a montagem no diretório /mnt/cdrom no dispositivo /dev/cdrom 
O diretório de montagem pode ser outro de sua preferência, mas nesse Howto será utilizado o /mnt/cdrom 

Montar o DVD no /mnt/dvdrom 

# mount /mnt/cdrom/ 


Instalação do pacote contido no DVD 

# installpkg /mnt/cdrom/extra/xf86-video-nouveau-blacklist/xf86-video-nouveau-blacklist-noarch-1.txz 



Acessar o diretório onde salvou o binário do driver NVIDIA e setar permissão 
# chmod +x NVIDIA-Linux-x86-xx.xx.xx-pkg1.run 

Executar o binário 
# ./NVIDIA-Linux-x86-xx.xx.xx-pkg1.run 

Reinicie o sistema e execute $ startx 

Feito!


====================================================================================================================


Ao tentar configurar o xorg pos instalaçao da esse erro:

# xorgsetup


                                     ┌─────────────────────CONFIGURE X SERVER?────────────────────────┐
                                     │ If you like, X can attempt to probe for your video hardware    │  
                                     │ and mouse, and write an initial configuration file to          │  
                                     │ /etc/X11/xorg.conf.  Would you like to do this now?            │  
                                     ├────────────────────────────────────────────────────────────────┤  
                                     │                   < Sim >          < Não >                     │  
                                     └────────────────────────────────────────────────────────────────┘  
                                       

(EE) 
Fatal server error:
(EE) Server is already active for display 0
	If this server is no longer running, remove /tmp/.X0-lock
	and start again.
(EE) 
(EE) 
Please consult the The X.Org Foundation support 
	 at http://wiki.x.org
 for help. 
(EE)

----------------------------------------------------------------------------------------------------------------


# sudo Xorg -configure
(EE) 
Fatal server error:
(EE) Server is already active for display 0
	If this server is no longer running, remove /tmp/.X0-lock
	and start again.
(EE) 
(EE) 
Please consult the The X.Org Foundation support 
	 at http://wiki.x.org
 for help. 
(EE) 




Ao que tudo indica, você está tentando rodar o xorgsetup com o X ativo.

O xorgsetup só consegue configurar o X quando este não está ativo.

Edite o /etc/inittab para voltar ao modo texto puro (altere o runlevel de 4 para 3), reinicie a máquina e 
rode esse comando como root. Aí você volta o /etc/inittab para 4 e reinicia a máquina de novo.


Talvez por isso não tenho este tipo de problema. Sou adepto do xwmconfig e do starx.

"


clear


ls -l  /var/log/packages/ | grep vesa
# -rw-r--r-- 1 root root    1115 Jul  7  2017 xf86-video-vesa-2.3.4-x86_64-2
 


 ls -l  /var/log/packages/ | grep xf86
# -rw-r--r-- 1 root root    1842 Jul  7  2017 libXxf86dga-1.1.4-x86_64-2
# -rw-r--r-- 1 root root    1046 Out 18  2017 libXxf86dga-compat32-1.1.4-x86_64-2compat32
# -rw-r--r-- 1 root root    1351 Jul  7  2017 libXxf86misc-1.0.3-x86_64-2
# -rw-r--r-- 1 root root    1073 Out 18  2017 libXxf86misc-compat32-1.0.3-x86_64-2compat32
# -rw-r--r-- 1 root root    2006 Jul  7  2017 libXxf86vm-1.1.4-x86_64-2
# -rw-r--r-- 1 root root    1025 Out 18  2017 libXxf86vm-compat32-1.1.4-x86_64-2compat32
# -rw-r--r-- 1 root root    1154 Jul  7  2017 xf86-input-acecad-1.5.0-x86_64-9
# -rw-r--r-- 1 root root    1355 Jul  7  2017 xf86-input-evdev-2.10.3-x86_64-1
# -rw-r--r-- 1 root root    1325 Jul  7  2017 xf86-input-joystick-1.6.1-x86_64-9
# -rw-r--r-- 1 root root    1173 Jul  7  2017 xf86-input-keyboard-1.8.1-x86_64-2
# -rw-r--r-- 1 root root    1241 Jul  7  2017 xf86-input-mouse-1.9.1-x86_64-4
# -rw-r--r-- 1 root root    1196 Jul  7  2017 xf86-input-penmount-1.5.0-x86_64-9
# -rw-r--r-- 1 root root    1554 Jul  7  2017 xf86-input-synaptics-1.8.3-x86_64-2
# -rw-r--r-- 1 root root    1634 Jul  7  2017 xf86-input-vmmouse-13.1.0-x86_64-4
# -rw-r--r-- 1 root root    1094 Jul  7  2017 xf86-input-void-1.4.0-x86_64-9
# -rw-r--r-- 1 root root    1715 Jul  7  2017 xf86-input-wacom-0.33.0-x86_64-1
# -rw-r--r-- 1 root root    1244 Jul  7  2017 xf86-video-amdgpu-1.1.0-x86_64-1
# -rw-r--r-- 1 root root    1092 Jul  7  2017 xf86-video-apm-1.2.5-x86_64-8
# -rw-r--r-- 1 root root    1039 Jul  7  2017 xf86-video-ark-0.7.5-x86_64-8
# -rw-r--r-- 1 root root    1053 Jul  7  2017 xf86-video-ast-1.1.5-x86_64-2
# -rw-r--r-- 1 root root    1206 Jul  7  2017 xf86-video-ati-7.7.0-x86_64-1
# -rw-r--r-- 1 root root    1135 Jul  7  2017 xf86-video-chips-1.2.6-x86_64-2
# -rw-r--r-- 1 root root    1402 Jul  7  2017 xf86-video-cirrus-1.5.3-x86_64-2
# -rw-r--r-- 1 root root    1053 Jul  7  2017 xf86-video-dummy-0.3.7-x86_64-5
# -rw-r--r-- 1 root root     987 Ago  3 22:30 xf86-video-fbdev-0.4.4-x86_64-4
# -rw-r--r-- 1 root root    1182 Jul  7  2017 xf86-video-glint-1.2.8-x86_64-8
# -rw-r--r-- 1 root root    1119 Jul  7  2017 xf86-video-i128-1.3.6-x86_64-8
# -rw-r--r-- 1 root root    1113 Jul  7  2017 xf86-video-i740-1.3.5-x86_64-3
# -rw-r--r-- 1 root root    1594 Jul  7  2017 xf86-video-intel-git_20160601_b617f80-x86_64-1
# -rw-r--r-- 1 root root    1105 Jul  7  2017 xf86-video-mach64-6.9.5-x86_64-2
# -rw-r--r-- 1 root root    1129 Jul  7  2017 xf86-video-mga-1.6.4-x86_64-3
# -rw-r--r-- 1 root root    1242 Jul  7  2017 xf86-video-neomagic-1.2.9-x86_64-2
# -rw-r--r-- 1 root root    1150 Jul  7  2017 xf86-video-nouveau-1.0.12-x86_64-1
# -rw-r--r-- 1 root root    1114 Jul  7  2017 xf86-video-nv-2.1.20-x86_64-9
# -rw-r--r-- 1 root root    1386 Jul  7  2017 xf86-video-openchrome-0.4.0-x86_64-1
# -rw-r--r-- 1 root root    1122 Jul  7  2017 xf86-video-r128-6.10.1-x86_64-1
# -rw-r--r-- 1 root root    1295 Jul  7  2017 xf86-video-rendition-4.2.6-x86_64-1
# -rw-r--r-- 1 root root    1076 Jul  7  2017 xf86-video-s3-0.6.5-x86_64-8
# -rw-r--r-- 1 root root    1226 Jul  7  2017 xf86-video-s3virge-1.10.7-x86_64-2
# -rw-r--r-- 1 root root    1158 Jul  7  2017 xf86-video-savage-2.3.8-x86_64-2
# -rw-r--r-- 1 root root    1311 Jul  7  2017 xf86-video-siliconmotion-1.7.8-x86_64-2
# -rw-r--r-- 1 root root    1099 Jul  7  2017 xf86-video-sis-0.10.8-x86_64-2
# -rw-r--r-- 1 root root    1157 Jul  7  2017 xf86-video-sisusb-0.9.6-x86_64-8
# -rw-r--r-- 1 root root    1107 Jul  7  2017 xf86-video-tdfx-1.4.6-x86_64-3
# -rw-r--r-- 1 root root    1046 Jul  7  2017 xf86-video-tga-1.2.2-x86_64-8
# -rw-r--r-- 1 root root    1179 Jul  7  2017 xf86-video-trident-1.3.7-x86_64-3
# -rw-r--r-- 1 root root    1136 Jul  7  2017 xf86-video-tseng-1.2.5-x86_64-8
# -rw-r--r-- 1 root root    1043 Jul  7  2017 xf86-video-v4l-0.2.0-x86_64-13
# -rw-r--r-- 1 root root    1115 Jul  7  2017 xf86-video-vesa-2.3.4-x86_64-2
# -rw-r--r-- 1 root root    1126 Jul  7  2017 xf86-video-vmware-13.1.0-x86_64-7
# -rw-r--r-- 1 root root    1191 Jul  7  2017 xf86-video-voodoo-1.2.5-x86_64-9
# -rw-r--r-- 1 root root    1084 Jul  7  2017 xf86-video-xgi-1.6.1-x86_64-2
# -rw-r--r-- 1 root root    1123 Jul  7  2017 xf86-video-xgixp-1.8.1-x86_64-8
# -rw-r--r-- 1 root root    1046 Jul  7  2017 xf86bigfontproto-1.2.0-noarch-1
# -rw-r--r-- 1 root root     806 Jul  7  2017 xf86dga-1.0.3-x86_64-2
# -rw-r--r-- 1 root root    1123 Jul  7  2017 xf86dgaproto-2.1-noarch-1
# -rw-r--r-- 1 root root    1006 Jul  7  2017 xf86driproto-2.1.1-noarch-1
# -rw-r--r-- 1 root root     977 Jul  7  2017 xf86miscproto-0.9.3-noarch-1
# -rw-r--r-- 1 root root    1115 Jul  7  2017 xf86vidmodeproto-2.3.1-noarch-1



# O xorgsetup é um script que, entre outros comandos, invoca o X -configure.

# Se houver algo errado com o seu teclado, mouse, tela ou placa de vídeo

xorgsetup


# Arquivo de configuração do X

# nano /etc/X11/xorg.conf

# nano /etc/X11/xorg.conf-vesa


# Reinicie o X agora

# reboot



# https://www.vivaolinux.com.br/topico/Slackware/Erro-no-xorgsetup
# https://www.hardware.com.br/dicas/slackware-configurandox.html
# https://www.hardware.com.br/tutoriais/mini-manual-slackware/
# https://mundodacomputacaointegral.blogspot.com/2016/10/instalando-nvidia-no-slackware.html


;;




65)

# Verificar se existe pacotes rpm instalados no sistema

clear

echo '

USANDO O RPM


O RPM é um gerenciador de pacotes que serve para construir, instalar, verificar, consultar, atualizar e desinstalar pacotes. 


opções de instalação:

rpm -ivh [nome do pacote]


rpm -qa                      - Mostra todos os pacotes rpm instalados na máquina
rpm -qR <nome_do_pacote>     - Informa quais pacotes fazem dependência para o pacote a ser instalado
rpm -qf <arquivo>            - Verifica de qual pacote um certo arquivo pertence
rpm -ql                      - Lista todos os arquivos pertencentes à um pacote




Instalando o LibreOffice no Slackware 14.1

https://www.vivaolinux.com.br/dica/Instalando-o-LibreOffice-no-Slackware-141

'

echo "

Todos os pacotes rpm instalados na sua máquina atualmente:

"
rpm -qa


echo "Todos os pacotes rpm instalados na máquina
" >> $log

rpm -qa >> $log


echo "

Verifique o arquivo $log

Enter para voltar ao menu ..."
read pause

# https://www.vivaolinux.com.br/dica/Usando-o-RPM/

;;



66)

# Realizar uma consultar dos pacotes requeridos para a instalação do programa via Sbopkg

clear


which sbopkg
# /usr/sbin/sbopkg




echo '

Sbopkg - Gerenciamento de pacotes no Slackware

Ferramenta que automatiza a compilação e instalação de programas a partir do repositório slackbuilds.org.

O gerenciamento de pacotes no Slackware tem a reputação de ser bastante manual. Os pacotes oficiais são 
distribuídos como binários com o código fonte incluso e podem ser manipulados através do comando slackpkg.


Faça o download em https://sbopkg.org/



Inspecionando

Seguindo o padrão Slackware o utilitário sbopkg não resolve dependências porém é possível consultar os pacotes requeridos 
para a instalação. O sbopkg considera que você tenha a instalação completa do Slackware e não exibirá dependências de 
pacotes oficiais.

sbopkg -s FlightGear

Este comando irá exibir os arquivos README, Slackbuild, .info e slack-desc para o pacote consultado. Para consultar somente 
as dependências utilize o comando abaixo:

sbopkg -s FlightGear |grep REQUIRES
REQUIRES="FlightGear-data SimGear"


'

echo "
Informe o nome do pacote"
read pacote

sbopkg -s $pacote | grep REQUIRES


# http://telazul.drusian.com.br/pt/artigo/sbopkg-gerenciamento-de-pacotes-no-slackware

;;




67)

# Para remove um programa instalado de forma manual no Slackware.


clear

echo "
Para remove um programa instalado de forma manual no Slackware.
"

# Baixei esse tal HexChat do site https://hexchat.github.io/downloads.html na parte de "Source Archive".



# Verificação basica no sistema


# É basicamente um indexador, cataloga os arquivos no sistema.
#
# $ man updatedb
#
# DESCRIPTION
#       updatedb creates or updates a database used by locate(1).  If the database already exists, its data is
#       reused to avoid rereading directories that have not changed. 
#
#
# Em alguns sistema o nome do pacote é mlocate noutras é o slocate


which updatedb
# /usr/bin/updatedb



which locate
# /usr/bin/locate

which rm
# /usr/bin/rm


echo "
Informe o nome do programa para desinstalar. Ex: hexchat"
read programa

updatedb

locate "$programa" > /tmp/programa.txt



# Ler arquivo txt e executar ação para cada linha dele.
 

# Laço while


# Muitas vezes precisamos ler um arquivo linha por linha para fazer um processamento batch. Apesar de existirem 
# várias formas de se fazer isso, a forma mais simples que encontrei foi esta.


while read linha 
do 


# Ponha seu comando aqui

echo "$linha"

# rm -Rf "$linha"


done < /tmp/programa.txt



# O comando read lê sempre uma linha de cada vez, independentemente do comprimento que essas linhas tenham. Como isso funciona? 
# Em algum lugar dentro do shell (ou das bibliotecas que ele usa), ele lê caráter por caráter, e vai acumulando os caracteres 
# lidos num buffer, até encontrar um caráter que corresponda à marca de fim de linha (que no mundo UNIX é o byte que tem o valor 10). 
# Na próxima ocorrência de read sobre a mesma fonte de dados, a leitura continua do ponto onde parou (i.e. do caráter após a marca 
# de fim de linha que significou o fim da linha anterior).
#
# O shell não conta a quantidade de linhas ou de caracteres lidos (a não ser que você peça para ler uma quantidade limitada de 
# caracteres -- veja na documentação do comando read sobre a opção -N). Mas o fato de ele não o fazer não o impede de implementar 
# um contador por conta própria.


# https://www.vivaolinux.com.br/topico/Shell-Script/Ler-arquivo-e-executar-acao-para-cada-linha
# https://www.vivaolinux.com.br/topico/Shell-Script/ler-de-arquivo-txt-e-executar-um-comando
# https://www.vivaolinux.com.br/script/Ler-arquivo-linha-por-linha
# https://www.vivaolinux.com.br/topico/Shell-Script/Ao-utilizarmos-o-comando-while-para-ler-um-arquivo-e-possivel-isolar-as-linhas-manipulando-as-como-indices





dialog                                                     \
   --title 'Visualizando o arquivo /tmp/programa.txt'       \
   --textbox /tmp/programa.txt                               \
   0 0


# Ou roda um find, mas eu prefiro pegar o resultado do locate, jogar num .txt, selecionar o que quero remover e tascar um rm -rf neles.
#
#
# https://www.vivaolinux.com.br/topico/Slackware/Arquivo-Source-Archive-do-HexChat-como-usar/?pagina=1


;;



68) 

# Monitorar o sistema (tail -f /var/log/messages)

clear

echo "

Para sair usar crtrl + c

"

tail -f /var/log/messages

clear

;;




69) 

# Gerenciador de janelas (xfwm4) esta sem os itens de fechar, minimizar e restaurar no Xfce

clear

# Gerenciador de janelas do Xfce (xfwm4)
#
#
# Percebi que as janelas estavam sem os itens de fechar, minimizar e restaurar janelas. Fui até configurações e tentei 
# restaurar os padrões. Para minha surpresa o gerenciador de janelas não está abrindo. Reinicializei o sistema e nada. 


which xfwm4
# /usr/bin/xfwm4


xfwm4 --replace


# https://www.vivaolinux.com.br/topico/Debian/gerenciador-de-janelas-do-xfce

;;




70)

# Checando ocupação de disco dos diretórios a partir da raiz


# Entre no seu diretório raiz:

cd /



# for i in `ls -l | awk '{print $8}' | grep -v "var"`; do du -sh $i; done

# Ao executar no terminal será listado toda sua árvore de diretórios a partir da raiz com o tamanho que cada um ocupa no disco:

# Obs.: O comando grep -v "var" tem função de excluir o diretório /var da checagem, pode ser modificado para qualquer um outro diretório, 
# para checar todos retire esse comando.



# E execute:

for i in `ls -l | awk '{print $9}'` ; do du -sh $i; done



echo "

Enter para voltar ao menu principal ..."
read pausa

# https://www.vivaolinux.com.br/dica/Checando-ocupacao-de-disco-dos-diretorios-a-partir-da-raiz

;;




71)

# Que pastas são essas na raiz do HD? (/net e /misc)

clear


which rm umount ls mount ps kill lsof cat cp nano reboot


whereis fuse
# fuse: /usr/include/fuse.h /usr/include/fuse


sleep 10

clear


dialog \
--title ''  \
--msgbox "

Que pastas são essas na raiz do HD? (/net e /misc)





Entendendo a árvore de diretórios


# ls -la / 
total 2168
drwxr-xr-x  22 root root    4096 Set  9 13:47 .
drwxr-xr-x  22 root root    4096 Set  9 13:47 ..
drwxr-xr-x   2 root root    4096 Jul 19 20:24 bin
drwxr-xr-x   4 root root    4096 Set  2 22:32 boot
drwxr-xr-x  20 root root    5740 Set  9 13:53 dev
drwxr-xr-x 135 root root   12288 Set  9 13:53 etc
drwxr-xr-x   6 root root    4096 Ago 29 22:54 home
drwxr-xr-x   7 root root    4096 Set  3 12:32 lib
drwxr-xr-x   2 root root   12288 Jul 19 20:30 lib64
drwx------   2 root root   16384 Jul  7  2017 lost+found
drwxr-xr-x  18 root root    4096 Dez 25  2018 media
drwxr-xr-x  10 root root    4096 Nov  7  2018 mnt
drwxr-xr-x  40 root root    4096 Set  8 17:41 opt
dr-xr-xr-x 226 root root       0 Set  9 10:52 proc
drwx------  17 root root    4096 Set  9 15:29 root
drwxr-xr-x  14 root root     560 Set  9 14:01 run
drwxr-xr-x   2 root root   12288 Dez  3  2018 sbin
drwxr-xr-x   2 root root    4096 Abr  6 16:30 srv
dr-xr-xr-x  13 root root       0 Set  9 13:55 sys
drwxrwxrwt  16 root root 2109440 Set  9 16:12 tmp
drwxr-xr-x  19 root root    4096 Set  8 18:24 usr
drwxr-xr-x  16 root root    4096 Ago 26 15:07 var





# cd /home/master  && ls -la  .
total 180
drwx------ 23 master users  4096 Ago 28 23:51 .
drwxr-xr-x  6 root   root   4096 Ago 29 22:54 ..
-rw-------  1 master users   624 Ago 28 23:51 .ICEauthority
-rw-------  1 master users    49 Ago 28 23:49 .Xauthority
-rwx------  1 master users   247 Ago 28 20:22 .bash_history
-rwxr-xr-x  1 master users  2199 Set 24  2017 .bashrc
drwx------  8 master users  4096 Ago 28 23:51 .cache
drwx------ 11 master users  4096 Ago 28 20:41 .config
-rwxr-xr-x  1 master users 15126 Jun 28  2018 .conkyrc
drwx------  3 master users  4096 Jul 29 05:02 .dbus
-rw-------  1 master users    16 Jul 29 05:02 .esd_auth
drwxr-xr-x  3 master users  4096 Jul 29 05:03 .gnome2
drwx------  3 master users  4096 Jul 29 05:02 .gnupg
-rwxr-xr-x  1 master users   131 Out  5  2017 .gtkrc-2.0
drwx------  2 master users  4096 Jul 29 02:03 .gvfs
drwx------  4 master users  4096 Jul 29 05:06 .kde
drwxr-xr-x  3 master users  4096 Jul 29 05:02 .local
drwxr-xr-x  5 master users  4096 Ago 28 20:23 .masterpdfeditor
drwxr-xr-x  5 master users  4096 Jul 29 05:06 .mozilla
drwxr-xr-x  5 master users  4096 Ago 28 20:28 .ssr
drwxr-xr-x  3 master users  4096 Jul 29 05:02 .thumbnails
-rw-r--r--  1 master users 12918 Ago 28 23:51 .xfce4-session.verbose-log
-rw-r--r--  1 master users 20005 Ago 28 20:36 .xfce4-session.verbose-log.last
-rwx------  1 master users  1198 Jul 29  2017 .xinitrc
drwx------  2 master users  4096 Ago 28 20:31 Desktop
drwx------  2 master users  4096 Jul 27 17:10 Documentos
drwx------  2 master users 12288 Ago 28 23:50 Downloads
drwx------  2 master users  4096 Jul 27 14:34 Imagens
drwx------  2 master users  4096 Jul 29 05:05 Modelos
drwx------  2 master users  4096 Jul 16  2017 Música
drwx------  2 master users  4096 Jul 16  2017 Público
drwx------  2 master users  4096 Ago 28 20:34 Vídeos
drwxr-xr-x 10 master users  4096 Jul 29 05:05 xmind





# cd /home/fernando  && ls -la  .
ls: não é possível acessar '.gvfs': Permissão negada
total 540
drwx------ 61 fernando users  4096 Set  9 14:01 .
drwxr-xr-x  6 root     root   4096 Ago 29 22:54 ..
drwx------  3 fernando users  4096 Out 20  2018 .Genymobile
-rw-------  1 fernando users   930 Set  9 13:53 .ICEauthority
drwx------ 12 fernando users  4096 Ago 30 20:40 .PlayOnLinux
-rw-------  1 fernando users    49 Set  9 13:53 .Xauthority
-rwx------  1 fernando users 16168 Set  9 14:38 .bash_history
-rwx------  1 fernando users  2199 Set 24  2017 .bashrc
-rwx------  1 fernando users  2199 Set 24  2017 .bashrc-backup
drwxr-xr-x  9 fernando users  4096 Set  9 15:55 .cache
drwxr-xr-x  6 fernando users  4096 Set  9 03:59 .clamtk
drwx------ 41 fernando users  4096 Set  9 14:00 .config
-rwx------  1 fernando users  6309 Jul 12  2016 .conkyrc-backup
-rwx------  1 fernando users  2697 Jul 26 15:23 .conkyrc-original
-rwx------  1 fernando users 16585 Dez  1  2018 .conkyrc1-backup
-rwx------  1 fernando users 16585 Dez  1  2018 .conkyrc2
drwx------  3 fernando users  4096 Set  5 11:25 .dbus
drwx------  7 fernando users  4096 Set  8 03:12 .dropbox
drwxrwxr-x  3 fernando users  4096 Ago 13 08:34 .dropbox-dist
drwxr-xr-x  3 fernando users  4096 Ago 25 17:52 .dvdcss
-rw-r--r--  1 fernando users   160 Set  8 17:18 .dvdstyler
-rw-------  1 fernando users    16 Set  7 20:41 .esd_auth
drwx------  3 fernando users  4096 Set 15  2018 .eteks
drwx------  2 fernando users 20480 Set  8 21:06 .fonts
lrwxrwxrwx  1 fernando users    44 Dez 20  2018 .fonts.conf -> /home/fernando/.config/fontconfig/fonts.conf
drwx------  6 fernando users  4096 Ago 23 02:49 .frostwire5
drwxr-xr-x 24 fernando users  4096 Set  8 05:32 .gimp-2.8
-rwx------  1 fernando users    62 Mar 12 16:56 .gitconfig
-rw-r-----  1 fernando users     0 Set  9 14:01 .gksu.lock
drwxr-xr-x  3 fernando users  4096 Set  5 11:28 .gnome2
drwx------  3 fernando users  4096 Jul 25 17:59 .gnupg
drwx------  4 fernando users  4096 Mai 26 15:57 .goldendict
-rw-r--r--  1 fernando users   105 Ago 19 01:29 .goonies.cfg
-rw-r--r--  1 fernando users     4 Ago 19 01:29 .goonies.hi
-rwx------  1 fernando users   131 Out  5  2017 .gtkrc-2.0
d?????????  ? ?        ?         ?            ? .gvfs
drwx------  4 fernando users  4096 Out 22  2018 .icons
drwx------  4 fernando users  4096 Ago 20 11:46 .kde
drwx------  3 fernando users  4096 Jul  1  2018 .local
drwx------  6 fernando users  4096 Nov 10  2018 .mame
drwxr-xr-x  3 fernando users  4096 Set  5 12:02 .masterpdfeditor
drwx------  5 fernando users  4096 Nov  6  2018 .mozilla
drwxr-xr-x  2 fernando users  4096 Ago 26 14:05 .mplayer
-rw-r--r--  1 fernando users     1 Set  7 17:05 .muttrc
-rwx------  1 fernando users  3082 Jan  2  2019 .mysql_history
drwx------  3 fernando users  4096 Jul  1  2018 .netbeans
drwx------  3 fernando users  4096 Jan  1  2019 .netbeans-derby
drwxr-xr-x  2 fernando users  4096 Set  5 11:33 .oracle_jre_usage
drwx------  8 fernando users  4096 Nov  9  2018 .pcsxr
drwx------  3 fernando users  4096 Set  7 22:33 .pki
drwx------  5 fernando users  4096 Dez  5  2018 .purple-Pidgin
drwxr-xr-x  5 fernando users  4096 Set  5 16:02 .ssr
drwx------  2 fernando users  4096 Jul 25 03:27 .steam
lrwxrwxrwx  1 fernando users    33 Jul 25 03:27 .steampath -> /home/fernando/.steam/bin32/steam
lrwxrwxrwx  1 fernando users    31 Jul 25 03:27 .steampid -> /home/fernando/.steam/steam.pid
drwx------ 22 fernando users  4096 Out 23  2018 .themes
drwxr-xr-x  4 fernando users  4096 Ago 17 16:39 .thumb
drwxr-xr-x  3 fernando users  4096 Set  8 02:04 .thumbnails
drwx------  5 fernando users  4096 Set  8 17:41 .thunderbird
-rw-------  1 fernando users   855 Set  8 19:22 .viminfo
drwx------  4 fernando users  4096 Ago 30 20:44 .wine
-rw-r--r--  1 fernando users 25264 Set  9 16:02 .xfce4-session.verbose-log
-rw-r--r--  1 fernando users 21870 Set  9 13:51 .xfce4-session.verbose-log.last
-rw-r--r--  1 fernando users  1198 Set  8 03:18 .xinitrc
-rw-r--r--  1 fernando users   627 Set  8 03:11 .xinitrc-backup
-rwxr-xr-x  1 fernando users  1198 Set  8 03:18 .xsession
-rwxr-xr-x  1 fernando users   627 Set  8 03:11 .xsession-backup
drwx------  2 fernando users  4096 Set  8 03:18 .xwmconfig
drwx------  4 fernando users  4096 Set  9 14:43 Desktop
drwx------  2 fernando users  4096 Set  8 05:35 Documentos
drwx------  8 fernando users 32768 Set  9 16:12 Downloads
drwx------ 14 fernando users  4096 Ago 13 14:44 Dropbox
drwx------  4 fernando users  4096 Nov  7  2018 FrostWire
drwx------  4 fernando users  4096 Nov 26  2018 GNUstep
drwx------  2 fernando users 20480 Ago 31 03:12 Imagens
drwx------  2 fernando users  4096 Ago 21 19:38 Modelos
drwx------  4 fernando users  4096 Mai 23 02:34 Música
drwx------ 72 fernando users  4096 Mai 18 13:31 NetBeansProjects
lrwxrwxrwx  1 fernando users    40 Fev 26  2019 PlayOnLinux's virtual drives -> /home/fernando/.PlayOnLinux//wineprefix/
drwx------  2 fernando users  4096 Jul 16  2017 Público
drwx------  2 fernando users  4096 Out 24  2018 VirtualBox VMs
drwx------  3 fernando users  4096 Set  9 14:00 Vídeos
drwx------  2 fernando users 20480 Set  8 23:31 dwhelper
drwx------  4 fernando users  4096 Dez  3  2018 game
-rw-r--r--  1 fernando users  1993 Set  4 17:12 icons.screen0-1424x853.rc
drwx------ 10 fernando users  4096 Jul  1  2018 xmind





https://www.hardware.com.br/dicas/linux-entendendo-arvore-diretorios.html






Problema:

# rm -Rf /net
rm: não foi possível remover '/net': Dispositivo ou recurso está ocupado


Ver o dono da pasta /net

# ls -l / | grep net
drwxr-xr-x   2 root root       0 Set  8 23:40 net



# ls -la /net
total 4
drwxr-xr-x  2 root root    0 Set  8 23:40 .
drwxr-xr-x 24 root root 4096 Set  8 18:25 ..



Ver o ponto de montagem da pasta /net

# mount | grep -i net




Programas instalados no sistema no dia 08/09/2019

# ls -l /var/log/packages/ | grep '"'Set  8'"'
-rw-r--r-- 1 root root   17042 Set  8 17:12 dvdstyler-3.0.4-x86_64-1_SBo
-rw-r--r-- 1 root root    2456 Set  8 18:22 httplib2-0.11.3-x86_64-1_SBo
-rw-r--r-- 1 root root    9946 Set  8 18:24 pcre2-10.33-x86_64-1_SBo
-rw-r--r-- 1 root root    1793 Set  8 18:24 python-certifi-2019.6.16-x86_64-2_SBo
-rw-r--r-- 1 root root    8169 Set  8 17:04 wxsvg-1.5.12-x86_64-1_SBo
-rw-r--r-- 1 root root  240105 Set  8 18:25 youtube-dl-2019.09.01-x86_64-1_SBo



# ls -la /
total 2168
drwxr-xr-x  24 root root    4096 Set  8 18:25 .
drwxr-xr-x  24 root root    4096 Set  8 18:25 ..
drwxr-xr-x   2 root root    4096 Jul 19 20:24 bin
drwxr-xr-x   4 root root    4096 Set  2 22:32 boot
drwxr-xr-x  19 root root    5700 Set  8 23:40 dev
drwxr-xr-x 135 root root   12288 Set  8 23:41 etc
drwxr-xr-x   6 root root    4096 Ago 29 22:54 home
drwxr-xr-x   7 root root    4096 Set  3 12:32 lib
drwxr-xr-x   2 root root   12288 Jul 19 20:30 lib64
drwx------   2 root root   16384 Jul  7  2017 lost+found
drwxr-xr-x  18 root root    4096 Dez 25  2018 media
drwxr-xr-x   2 root root       0 Set  8 23:40 misc             <========================  Pasta misc em /
drwxr-xr-x  10 root root    4096 Nov  7  2018 mnt
drwxr-xr-x   2 root root       0 Set  8 23:40 net              <========================  Pasta net em /
drwxr-xr-x  40 root root    4096 Set  8 17:41 opt
dr-xr-xr-x 209 root root       0 Set  8 20:40 proc
drwx------  14 root root    4096 Set  8 23:34 root
drwxr-xr-x  14 root root     560 Set  8 23:42 run
drwxr-xr-x   2 root root   12288 Dez  3  2018 sbin
drwxr-xr-x   2 root root    4096 Abr  6 16:30 srv
dr-xr-xr-x  13 root root       0 Set  8 23:42 sys
drwxrwxrwt   9 root root 2109440 Set  8 23:48 tmp
drwxr-xr-x  19 root root    4096 Set  8 18:24 usr
drwxr-xr-x  16 root root    4096 Ago 26 15:07 var




Ver todos os processos relacionados com net no sistema

#  ps -aux | grep net
root        23  0.0  0.0      0     0 ?        S<   23:40   0:00 [netns]
root      1674  0.0  0.0   9672  1828 pts/1    S+   23:50   0:00 grep net




Desmontando um dispositivo ocupado


Às vezes quando vou desmontar meu chaveiro USB (USB Flash Drive), o comando umount retorna a mensagem 'umount: /mnt/flash: o dispositivo está ocupado', e o dispositivo não é desmontado. Como faço para desmontá-lo?

Resposta:

O comando não consegue desmontar dispositivos que estão sendo usados. Então para desmontar o dispositivo é necessário fechar todos os programas que estão usando arquivos do dispositivo, como por exemplo: editores, navegadores, visualizadores de imagens etc. Além disso, caso exista algum terminal com caminho corrente igual a uma pasta do dispositivo, o caminho corrente deste deve ser modificado, ou o terminal deve ser fechado. 


Se você não conseguir localizar os programas que estão usando o dispositivo, não se desespere, o comando 'fuser' irá lhe auxiliar. Exemplo de uso: 


# fuser -vm /net
                     USUÁRIO     PID ACESSO COMANDO
/net:                root     kernel mount /net
                     root       1261 f.... automount



Agora você tem uma lista dos programas (na verdade processos) que estão usando o dispositivo montado em '/mnt/flash'. Você poderá fechá-los manualmente, caso não consiga, poderá matar os processos, uma vez que agora você conhece os identificadores dos processos (PID).

Exemplo de como matar os processos que estão utilizando o dispositivo montado em '/mnt/flash':

# kill -9 kernel

# kill -9 1261


# fuser -vm /net
                     USUÁRIO     PID ACESSO COMANDO
/net:                root     kernel mount /net




# kill -9 kernel
bash: kill: kernel: arguments must be process or job IDs


# rm -Rf /net
rm: não foi possível remover '/net': Dispositivo ou recurso está ocupado


# umount /net/

# rm -Rf /net




Veja qual processo tá usando ela.

# lsof /net
lsof: WARNING: can't stat() fuse.gvfsd-fuse file system /home/$USER/.gvfs
      Output information may be incomplete.
COMMAND    PID USER   FD   TYPE DEVICE SIZE/OFF  NODE NAME
automount 1216 root   16r   DIR   0,36        0 14340 /net




https://www.vivaolinux.com.br/dica/Desmontando-um-dispositivo-ocupado




# cat /etc/auto.master
#
# Sample auto.master file
# This is an automounter map and it has the following format
# key [ -mount-options-separated-by-comma ] location
# For details of the format look at autofs(5).
#
/misc	/etc/auto.misc
#
# NOTE: mounts done from a hosts map will be mounted with the
#	'nosuid' and 'nodev' options unless the 'suid' and 'dev'
#	options are explicitly given.
#
/net	-hosts
#
# Include /etc/auto.master.d/*.autofs
#
+dir:/etc/auto.master.d
#
# Include central master map if it can be found using
# nsswitch sources.
#
# Note that if there are entries for /net or /misc (as
# above) in the included master map any keys that are the
# same will not be seen as the first read key seen takes
# precedence.
#
+auto.master


https://serverfault.com/questions/568504/where-is-linux-automounts-config

https://www.dicas-l.com.br/arquivo/usando_o_autofs_e_automunt.php


https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/4/html/System_Administration_Guide/Mounting_NFS_File_Systems-Mounting_NFS_File_Systems_using_autofs.html




# ls -l  /var/log/packages/ | grep autofs
-rw-r--r-- 1 root root    3176 Jul  7  2017 autofs-5.0.7-x86_64-2


https://www.vivaolinux.com.br/artigo/Configuracao-do-Autofs

https://www.ibm.com/developerworks/community/blogs/752a690f-8e93-4948-b7a3-c060117e8665/entry/dica_rapida_automount_mais_inteligente?lang=en





Realizando o backup do arquivo /etc/auto.master

# cp -a /etc/auto.master  /etc/auto.master-backup




# Altera o arquivo /etc/auto.master

# nano  /etc/auto.master




# cat  /etc/auto.master
#
# Sample auto.master file
# This is an automounter map and it has the following format
# key [ -mount-options-separated-by-comma ] location
# For details of the format look at autofs(5).
#
# /misc	/etc/auto.misc
#
# NOTE: mounts done from a hosts map will be mounted with the
#	'nosuid' and 'nodev' options unless the 'suid' and 'dev'
#	options are explicitly given.
#
# /net	-hosts
#
# Include /etc/auto.master.d/*.autofs
#
+dir:/etc/auto.master.d
#
# Include central master map if it can be found using
# nsswitch sources.
#
# Note that if there are entries for /net or /misc (as
# above) in the included master map any keys that are the
# same will not be seen as the first read key seen takes
# precedence.
#
+auto.master




# fuser -vm /net
                     USUÁRIO     PID ACESSO COMANDO
/net:                root     kernel mount /net
                     root       1216 f.... automount



Mata o processo relacionado ao net

# kill -9 1216


# Desmonta a pasta /net

# umount /net/


# Remove a pasta /net

# rm -Rf /net/


# Desmonta a pasta /misc/
# umount /misc/


# Remove a pasta /misc/

# rm -Rf /misc/



# Verificação

# ls -la  /
total 2168
drwxr-xr-x  22 root root    4096 Set  9 13:47 .
drwxr-xr-x  22 root root    4096 Set  9 13:47 ..
drwxr-xr-x   2 root root    4096 Jul 19 20:24 bin
drwxr-xr-x   4 root root    4096 Set  2 22:32 boot
drwxr-xr-x  20 root root    5740 Set  9 12:37 dev
drwxr-xr-x 135 root root   12288 Set  9 13:47 etc
drwxr-xr-x   6 root root    4096 Ago 29 22:54 home
drwxr-xr-x   7 root root    4096 Set  3 12:32 lib
drwxr-xr-x   2 root root   12288 Jul 19 20:30 lib64
drwx------   2 root root   16384 Jul  7  2017 lost+found
drwxr-xr-x  18 root root    4096 Dez 25  2018 media
drwxr-xr-x  10 root root    4096 Nov  7  2018 mnt
drwxr-xr-x  40 root root    4096 Set  8 17:41 opt
dr-xr-xr-x 223 root root       0 Set  9 09:28 proc
drwx------  16 root root    4096 Set  9 13:05 root
drwxr-xr-x  14 root root     600 Set  9 12:54 run
drwxr-xr-x   2 root root   12288 Dez  3  2018 sbin
drwxr-xr-x   2 root root    4096 Abr  6 16:30 srv
dr-xr-xr-x  13 root root       0 Set  9 12:45 sys
drwxrwxrwt  14 root root 2109440 Set  9 13:44 tmp
drwxr-xr-x  19 root root    4096 Set  8 18:24 usr
drwxr-xr-x  16 root root    4096 Ago 26 15:07 var



# Reinicia o sistema

# reboot



# Verificação

# ls -la  /
total 2168
drwxr-xr-x  22 root root    4096 Set  9 13:47 .
drwxr-xr-x  22 root root    4096 Set  9 13:47 ..
drwxr-xr-x   2 root root    4096 Jul 19 20:24 bin
drwxr-xr-x   4 root root    4096 Set  2 22:32 boot
drwxr-xr-x  20 root root    5740 Set  9 13:53 dev
drwxr-xr-x 135 root root   12288 Set  9 13:53 etc
drwxr-xr-x   6 root root    4096 Ago 29 22:54 home
drwxr-xr-x   7 root root    4096 Set  3 12:32 lib
drwxr-xr-x   2 root root   12288 Jul 19 20:30 lib64
drwx------   2 root root   16384 Jul  7  2017 lost+found
drwxr-xr-x  18 root root    4096 Dez 25  2018 media
drwxr-xr-x  10 root root    4096 Nov  7  2018 mnt
drwxr-xr-x  40 root root    4096 Set  8 17:41 opt
dr-xr-xr-x 228 root root       0 Set  9 10:52 proc
drwx------  16 root root    4096 Set  9 13:05 root
drwxr-xr-x  14 root root     560 Set  9 14:01 run
drwxr-xr-x   2 root root   12288 Dez  3  2018 sbin
drwxr-xr-x   2 root root    4096 Abr  6 16:30 srv
dr-xr-xr-x  13 root root       0 Set  9 13:55 sys
drwxrwxrwt  14 root root 2109440 Set  9 14:03 tmp
drwxr-xr-x  19 root root    4096 Set  8 18:24 usr
drwxr-xr-x  16 root root    4096 Ago 26 15:07 var




Programas instalados no sistema (Oficialmente)

# ls -la /var/log/packages/ > /tmp/programas.txt



# cat /tmp/programas.txt

total 33660
drwxr-xr-x  2 root root  110592 Set  8 18:25 .
drwxr-xr-x 22 root root   12288 Set  9 13:53 ..
-rw-r--r--  1 root root    6907 Set 14  2018 BeautifulSoup4-4.6.1-x86_64-1_SBo
-rw-r--r--  1 root root    3476 Jul  7  2017 ConsoleKit2-1.0.0-x86_64-3
-rw-r--r--  1 root root   28149 Jul  7  2017 Cython-0.23.4-x86_64-1
-rw-r--r--  1 root root    3763 Dez 14  2017 FreeImage-3.17.0-x86_64-1_SBo
-rw-r--r--  1 root root   12502 Jul  7  2017 GConf-3.2.6-x86_64-3
-rw-r--r--  1 root root    1676 Set 17  2017 GeoGebra-5.0.361.0-x86_64-1_SBo
-rw-r--r--  1 root root    1494 Out 13  2018 GeoIP-1.6.12-x86_64-1_SBo
-rw-r--r--  1 root root    3110 Jul 25 21:12 I-Nex-7.6.0-x86_64-1_SBo
-rw-r--r--  1 root root    8441 Jul 20 12:34 Jinja2-2.10.1-x86_64-2_SBo
-rw-r--r--  1 root root    1849 Jul  7  2017 LibRaw-0.17.2-x86_64-1
-rw-r--r--  1 root root    6601 Jul  7  2017 M2Crypto-0.23.0-x86_64-1
-rw-r--r--  1 root root    2419 Jul 20 12:40 MarkupSafe-1.1.1-x86_64-1_SBo
-rw-r--r--  1 root root    9156 Jul 20 12:47 MasterPDFEditor-5.4.38-x86_64-1_SBo
-rw-r--r--  1 root root    8416 Jul  7  2017 ModemManager-1.4.14-x86_64-1
-rw-r--r--  1 root root    6700 Jul 22 17:04 Net-SSLeay-1.81-x86_64-1_SBo
-rw-r--r--  1 root root   38450 Out 29  2017 NetworkManager-1.8.4-x86_64-1_slack14.2
-rw-r--r--  1 root root    5094 Jan 25  2018 ORBit2-2.14.19-x86_64-3_SBo
-rw-r--r--  1 root root   17982 Jul 20 12:48 OWSLib-0.18.0-x86_64-1_SBo
-rw-r--r--  1 root root    1563 Out 18  2017 OpenAL-1.18.0-x86_64-1_SBo
-rw-r--r--  1 root root    2194 Jul 20 12:52 ProjectLibre-1.9.1-noarch-1_SBo
-rw-r--r--  1 root root   96189 Jul  7  2017 PyQt-4.11.4-x86_64-1
-rw-r--r--  1 root root   45274 Jul 22 16:54 PyQt5-5.9.2-x86_64-1_SBo
-rw-r--r--  1 root root    2635 Jul 23 15:42 PyYAML-3.13-x86_64-1_SBo
-rw-r--r--  1 root root   60106 Jul 20 12:57 Pygments-2.4.2-x86_64-1_SBo
-rw-r--r--  1 root root    7714 Jul  7  2017 QScintilla-2.9.1-x86_64-1
-rw-r--r--  1 root root    4848 Ago 19 00:00 SDL2-2.0.9-x86_64-1_SBo
-rw-r--r--  1 root root     963 Ago 18 23:49 SDL2_image-2.0.4-x86_64-2_SBo
-rw-r--r--  1 root root    1166 Ago 18 23:51 SDL2_mixer-2.0.4-x86_64-2_SBo
-rw-r--r--  1 root root     941 Jul 15  2017 SDL2_ttf-2.0.14-x86_64-1_SBo
-rw-r--r--  1 root root    1205 Fev  4  2018 TauDEM-5.2.0-x86_64-1_SBo
-rw-r--r--  1 root root   10432 Jul 29  2017 Thunar-1.6.10-x86_64-3
-rw-r--r--  1 root root    2464 Jan 20  2019 TiMidity++-2.15.0-x86_64-1_SBo
-rw-r--r--  1 root root    2302 Out 21  2018 Xfce-Theme-Manager-0.3.4-x86_64-1_SBo
-rw-r--r--  1 root root   12347 Jul  7  2017 a2ps-4.14-x86_64-5
-rw-r--r--  1 root root    1407 Jul  7  2017 a52dec-0.7.4-x86_64-2
-rw-r--r--  1 root root    2249 Jul  7  2017 aaa_base-14.2-x86_64-2
-rw-r--r--  1 root root    2704 Jul  7  2017 aaa_elflibs-14.2-x86_64-23
-rw-r--r--  1 root root    2754 Out 18  2017 aaa_elflibs-compat32-14.2-x86_64-23compat32
-rw-r--r--  1 root root   13009 Jul  7  2017 aaa_terminfo-5.9-x86_64-1
-rw-r--r--  1 root root    3933 Jul  7  2017 aalib-1.4rc5-x86_64-5
-rw-r--r--  1 root root    1423 Jul  7  2017 acct-6.5.4-x86_64-2
-rw-r--r--  1 root root    3003 Jul  7  2017 acl-2.2.52-x86_64-1
-rw-r--r--  1 root root     779 Fev 25  2019 acpi-1.7-x86_64-1_SBo
-rw-r--r--  1 root root     859 Jul  8  2017 acpica-20170531-x86_64-1_SBo
-rw-r--r--  1 root root    1197 Jul  7  2017 acpid-2.0.26-x86_64-1
-rw-r--r--  1 root root  375889 Jul  7  2017 adwaita-icon-theme-3.18.0-noarch-1
-rw-r--r--  1 root root    6440 Mai 20  2018 agg-2.5-x86_64-3_SBo
-rw-r--r--  1 root root    4234 Jul 22 18:42 aircrack-ng-1.5.2-x86_64-1_SBo
-rw-r--r--  1 root root    3359 Jul  7  2017 akonadi-1.13.0-x86_64-2
-rw-r--r--  1 root root    1845 Out 24  2017 alien-8.95-x86_64-1_SBo
-rw-r--r--  1 root root    2195 Jul  7  2017 alpine-2.20-x86_64-2
-rw-r--r--  1 root root    7192 Jul  7  2017 alsa-lib-1.1.1-x86_64-2
-rw-r--r--  1 root root    1481 Out 18  2017 alsa-lib-compat32-1.1.1-x86_64-2compat32
-rw-r--r--  1 root root    1114 Jul  7  2017 alsa-oss-1.0.28-x86_64-1
-rw-r--r--  1 root root    1228 Out 18  2017 alsa-oss-compat32-1.0.28-x86_64-1compat32
-rw-r--r--  1 root root    2815 Jul  7  2017 alsa-plugins-1.1.1-x86_64-1
-rw-r--r--  1 root root    2272 Out 18  2017 alsa-plugins-compat32-1.1.1-x86_64-1compat32
-rw-r--r--  1 root root    3110 Jul  7  2017 alsa-utils-1.1.1-x86_64-1
-rw-r--r--  1 root root     835 Jul  7  2017 amp-0.7.6-x86_64-1
-rw-r--r--  1 root root    1394 Ago 31  2017 amrnb-11.0.0.0-x86_64-1_SBo
-rw-r--r--  1 root root    1520 Jul 14  2017 amrwb-11.0.0.0-x86_64-1_SBo
-rw-r--r--  1 root root    2039 Jul  7  2017 anthy-9100h-x86_64-1
-rw-r--r--  1 root root  129243 Jul  8  2017 apache-ant-1.9.9-noarch-1_SBo
-rw-r--r--  1 root root     848 Jul  7  2017 appres-1.0.4-x86_64-2
-rw-r--r--  1 root root    8900 Mar  8  2019 appstream-glib-0.7.15-x86_64-1_SBo
-rw-r--r--  1 root root    2346 Jul  7  2017 apr-1.5.2-x86_64-1
-rw-r--r--  1 root root    2108 Jul  7  2017 apr-util-1.5.4-x86_64-2
-rw-r--r--  1 root root    1198 Dez  3  2017 arp-scan-1.9-x86_64-1_SBo
-rw-r--r--  1 root root     899 Jul  7  2017 ash-0.4.0-x86_64-2
-rw-r--r--  1 root root    6976 Jul  7  2017 aspell-0.60.6.1-x86_64-1
-rw-r--r--  1 root root    3456 Jul  7  2017 aspell-en-7.1_0-x86_64-1
-rw-r--r--  1 root root    1113 Jul  7  2017 at-3.1.19-x86_64-2
-rw-r--r--  1 root root    1291 Jul  7  2017 at-spi2-atk-2.18.1-x86_64-1
-rw-r--r--  1 root root   12580 Jul  7  2017 at-spi2-core-2.18.3-x86_64-1
-rw-r--r--  1 root root   14521 Jul  7  2017 atk-2.18.0-x86_64-1
-rw-r--r--  1 root root     901 Out 18  2017 atk-compat32-2.18.0-x86_64-1compat32
-rw-r--r--  1 root root    3207 Jul  7  2017 atkmm-2.24.2-x86_64-1
-rw-r--r--  1 root root    2282 Jul  7  2017 attica-0.4.2-x86_64-1
-rw-r--r--  1 root root    2495 Jul  7  2017 attr-2.4.47-x86_64-1
-rw-r--r--  1 root root    1222 Out 18  2017 attr-compat32-2.4.47-x86_64-1compat32
-rw-r--r--  1 root root   11224 Jul 20 20:18 audacity-2.3.2-x86_64-1_SBo
-rw-r--r--  1 root root    2191 Jul  7  2017 audiofile-0.3.6-x86_64-1
-rw-r--r--  1 root root    1095 Out 18  2017 audiofile-compat32-0.3.6-x86_64-1compat32
-rw-r--r--  1 root root    3723 Jul  7  2017 autoconf-2.69-noarch-1
-rw-r--r--  1 root root    3176 Jul  7  2017 autofs-5.0.7-x86_64-2
-rw-r--r--  1 root root    5701 Jul  7  2017 automake-1.15-noarch-1
-rw-r--r--  1 root root     886 Jul  7  2017 automoc4-0.9.88-x86_64-1
-rw-r--r--  1 root root   11762 Ago  3 15:49 avahi-0.7-x86_64-1_SBo
-rw-r--r--  1 root root    2452 Jul  7  2017 babl-0.1.14-x86_64-1
-rw-r--r--  1 root root    4985 Set 24  2017 bash-4.3.048-x86_64-1_slack14.2
-rw-r--r--  1 root root    1821 Jul  7  2017 bc-1.06.95-x86_64-3
-rw-r--r--  1 root root     997 Jul  7  2017 bdftopcf-1.0.5-x86_64-2
-rw-r--r--  1 root root    1022 Jun 27  2018 beep-1.3-x86_64-1_SBo
-rw-r--r--  1 root root    1048 Jul  7  2017 beforelight-1.0.5-x86_64-2
-rw-r--r--  1 root root    1151 Jul  7  2017 biff+comsat-0.17-x86_64-1
-rw-r--r--  1 root root    1202 Jul  7  2017 bigreqsproto-1.1.2-noarch-1
-rw-r--r--  1 root root    1132 Jul  7  2017 bin-11.1-x86_64-1
-rw-r--r--  1 root root   13867 Ago 20 12:18 bind-9.11.9-x86_64-1_slack14.2
-rw-r--r--  1 root root   11796 Jul  7  2017 binutils-2.26-x86_64-3
-rw-r--r--  1 root root    7611 Jul  7  2017 bison-3.0.4-x86_64-1
-rw-r--r--  1 root root    1378 Jul  7  2017 bitmap-1.0.8-x86_64-2
-rw-r--r--  1 root root    2482 Jul  7  2017 blackbox-0.70.1-x86_64-7
-rw-r--r--  1 root root   12571 Jul 23 14:37 bleachbit-2.2-x86_64-1_SBo
-rw-r--r--  1 root root   41022 Set 14  2018 blueman-2.0.6-x86_64-3_slack14.2
-rw-r--r--  1 root root    2718 Set 24  2017 bluez-5.47-x86_64-1_slack14.2
-rw-r--r--  1 root root    1123 Jul  7  2017 bluez-firmware-1.2-x86_64-1
-rw-r--r--  1 root root  619592 Jul  7  2017 boost-1.59.0-x86_64-1
-rw-r--r--  1 root root    1205 Jul  7  2017 bootp-2.4.3-x86_64-2
-rw-r--r--  1 root root     769 Jul  7  2017 bpe-2.01.00-x86_64-2
-rw-r--r--  1 root root    1493 Jul  7  2017 bridge-utils-1.5-x86_64-1
-rw-r--r--  1 root root    2722 Jul 26 15:02 brotli-1.0.7-x86_64-1_SBo
-rw-r--r--  1 root root    1867 Fev  4  2018 brutalchess-0.5.2-x86_64-2_SBo
-rw-r--r--  1 root root    1080 Jul  7  2017 bsd-finger-0.17-x86_64-1
-rw-r--r--  1 root root    6411 Jul  7  2017 bsd-games-2.13-x86_64-12
-rw-r--r--  1 root root    2419 Jul  7  2017 btrfs-progs-v4.5.3-x86_64-1
-rw-r--r--  1 root root     968 Nov 24  2018 bubblewrap-0.3.1-x86_64-1_SBo
-rw-r--r--  1 root root    1378 Jul 19 20:24 bzip2-1.0.8-x86_64-1_slack14.2
-rw-r--r--  1 root root    1126 Out 18  2017 bzip2-compat32-1.0.6-x86_64-1compat32
-rw-r--r--  1 root root   10285 Set  2 21:21 ca-certificates-20190826-noarch-1_slack14.2
-rw-r--r--  1 root root    1408 Jul 20 13:22 cabextract-1.9.1-x86_64-1_SBo
-rw-r--r--  1 root root    5983 Jul  7  2017 cairo-1.14.6-x86_64-2
-rw-r--r--  1 root root    1901 Out 18  2017 cairo-compat32-1.14.6-x86_64-2compat32
-rw-r--r--  1 root root    2548 Jul  7  2017 cairomm-1.12.0-x86_64-1
-rw-r--r--  1 root root    6820 Jul 30 23:00 catfish-1.4.2-x86_64-1_SBo
-rw-r--r--  1 root root     928 Jul  7  2017 ccache-3.2.4-x86_64-1
-rw-r--r--  1 root root    1137 Nov  6  2018 ccrypt-1.10-x86_64-1_SBo
-rw-r--r--  1 root root    1443 Jul  7  2017 cdparanoia-III_10.2-x86_64-1
-rw-r--r--  1 root root    2160 Jul  7  2017 cdrdao-1.2.3-x86_64-2
-rw-r--r--  1 root root    5082 Jun 24  2018 cdrkit-1.1.11-x86_64-2_SBo
-rw-r--r--  1 root root    5854 Jul  7  2017 cdrtools-3.01-x86_64-3
-rw-r--r--  1 root root    1350 Set  3 17:45 celt-0.11.3-x86_64-1_SBo
-rw-r--r--  1 root root     839 Set  3 15:47 cfourcc-0.1.2-x86_64-1_SBo
-rw-r--r--  1 root root    1505 Jul  7  2017 cgmanager-0.39-x86_64-1
-rw-r--r--  1 root root    1054 Jul 20 13:37 chessx-1.5.0-x86_64-1_SBo
-rw-r--r--  1 root root    1530 Jul  9  2017 chkrootkit-0.52-x86_64-1_SBo
-rw-r--r--  1 root root    1100 Jul  7  2017 chmlib-0.40-x86_64-2
-rw-r--r--  1 root root    1080 Jul 19  2017 chntpw-110511-x86_64-1_SBo
-rw-r--r--  1 root root    1019 Mar 17  2018 chromaprint-1.4.3-x86_64-1_SBo
-rw-r--r--  1 root root    1557 Jul  7  2017 cifs-utils-6.4-x86_64-2
-rw-r--r--  1 root root    6070 Set  2 03:25 clamav-0.101.4-x86_64-1_SBo
-rw-r--r--  1 root root    1613 Jul  7  2017 clamav-unofficial-sigs-5.6.2-noarch-2_SBo
-rw-r--r--  1 root root    7487 Jan  4  2019 clamtk-5.26-x86_64-1_SBo
-rw-r--r--  1 root root     884 Set  2 13:47 clipgrab-3.8.4-x86_64-1_SBo
-rw-r--r--  1 root root   12995 Jul  7  2017 clisp-2.49-x86_64-3
-rw-r--r--  1 root root   21006 Jul  7  2017 clucene-2.3.3.4-x86_64-2
-rw-r--r--  1 root root  112939 Jul  7  2017 cmake-3.5.2-x86_64-1
-rw-r--r--  1 root root   69269 Jan 25  2018 codeblocks-17.12-x86_64-1_SBo
-rw-r--r--  1 root root     986 Out 18  2017 compat32-tools-3.7-noarch-11alien
-rw-r--r--  1 root root    9656 Jul  7  2017 compiz-0.8.8-x86_64-4
-rw-r--r--  1 root root    1125 Jul  7  2017 compositeproto-0.4.2-noarch-1
-rw-r--r--  1 root root    1542 Fev 24  2018 conky-1.10.8-x86_64-1_SBo
-rw-r--r--  1 root root    2865 Jul  7  2017 conntrack-tools-1.4.3-x86_64-1
-rw-r--r--  1 root root    1093 Jul 10  2017 convmv-1.15-x86_64-1_SBo
-rw-r--r--  1 root root    9094 Jul  7  2017 coreutils-8.25-x86_64-2
-rw-r--r--  1 root root    3514 Jul  7  2017 cpio-2.12-x86_64-1
-rw-r--r--  1 root root    1719 Nov 27  2018 cpu-g-0.9.0-noarch-1_SBo
-rw-r--r--  1 root root    1802 Jul  7  2017 cpufrequtils-008-x86_64-1
-rw-r--r--  1 root root    5377 Jul 11  2017 cracklib-2.9.6-x86_64-2_SBo
-rw-r--r--  1 root root    1280 Jul  7  2017 crda-3.18-x86_64-3
-rw-r--r--  1 root root     793 Mar  4  2019 crunch-3.6-x86_64-1_SBo
-rw-r--r--  1 root root    3148 Jul  7  2017 cryptsetup-1.7.1-x86_64-1
-rw-r--r--  1 root root     916 Jul  7  2017 cscope-15.8b-x86_64-1
-rw-r--r--  1 root root   31594 Jul  7  2017 cups-2.1.4-x86_64-1
-rw-r--r--  1 root root    2822 Out 18  2017 cups-compat32-2.1.4-x86_64-1compat32
-rw-r--r--  1 root root    5367 Jul  7  2017 cups-filters-1.9.0-x86_64-2
-rw-r--r--  1 root root    2353 Out 18  2017 cups-filters-compat32-1.9.0-x86_64-2compat32
-rw-r--r--  1 root root   23647 Jul 20 12:11 curl-7.65.3-x86_64-1_slack14.2
-rw-r--r--  1 root root    1286 Out 18  2017 curl-compat32-7.55.0-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    2138 Jul  7  2017 cvs-1.11.23-x86_64-2
-rw-r--r--  1 root root    5545 Jul  7  2017 cyrus-sasl-2.1.26-x86_64-1
-rw-r--r--  1 root root    1528 Out 18  2017 cyrus-sasl-compat32-2.1.26-x86_64-1compat32
-rw-r--r--  1 root root    1082 Jul  7  2017 damageproto-1.2.1-noarch-1
-rw-r--r--  1 root root    1314 Jul 24 20:14 daq-2.0.6-x86_64-1_SBo
-rw-r--r--  1 root root    1147 Jul  7  2017 db42-4.2.52-x86_64-3
-rw-r--r--  1 root root    1271 Jul  7  2017 db44-4.4.20-x86_64-3
-rw-r--r--  1 root root    1238 Jul  7  2017 db48-4.8.30-x86_64-2
-rw-r--r--  1 root root    4068 Jul 29  2017 dbus-1.10.8-x86_64-2_slack14.2
-rw-r--r--  1 root root    1608 Out 18  2017 dbus-compat32-1.10.8-x86_64-2_slack14.2compat32
-rw-r--r--  1 root root    2801 Jul  7  2017 dbus-glib-0.106-x86_64-1
-rw-r--r--  1 root root     961 Out 18  2017 dbus-glib-compat32-0.106-x86_64-1compat32
-rw-r--r--  1 root root    4301 Jul  7  2017 dbus-python-1.2.4-x86_64-1
-rw-r--r--  1 root root    5036 Fev  9  2018 dbus-python3-1.2.4-x86_64-1_SBo
-rw-r--r--  1 root root    5649 Jul  7  2017 dc3dd-7.2.641-x86_64-1
-rw-r--r--  1 root root    2836 Jul  7  2017 dconf-0.24.0-x86_64-1
-rw-r--r--  1 root root    8200 Jul  7  2017 dconf-editor-3.18.2-x86_64-1
-rw-r--r--  1 root root    1369 Jul  7  2017 dcron-4.5-x86_64-5
-rw-r--r--  1 root root    2588 Jul  7  2017 ddd-3.3.12-x86_64-4
-rw-r--r--  1 root root    1062 Jul  7  2017 ddrescue-1.21-x86_64-1
-rw-r--r--  1 root root     761 Out 24  2017 deb2tgz-0.2-noarch-1_SBo
-rw-r--r--  1 root root    2538 Jul  7  2017 dejavu-fonts-ttf-2.34-noarch-1
-rw-r--r--  1 root root    1659 Jul  7  2017 desktop-file-utils-0.22-x86_64-1
-rw-r--r--  1 root root    5137 Jul  7  2017 dev86-0.16.21-x86_64-1
-rw-r--r--  1 root root  143793 Jul  7  2017 devs-2.3.1-noarch-25
-rw-r--r--  1 root root    1850 Mar  3  2018 dhcp-4.4.1-x86_64-1_slack14.2
-rw-r--r--  1 root root    1516 Jul  7  2017 dhcpcd-6.8.2-x86_64-2
-rw-r--r--  1 root root   96171 Nov 15  2017 dia-0.97.3-x86_64-2_SBo
-rw-r--r--  1 root root    6367 Jul  7  2017 dialog-1.2_20130523-x86_64-1
-rw-r--r--  1 root root     830 Jul  7  2017 diffstat-1.60-x86_64-1
-rw-r--r--  1 root root    4170 Jul  7  2017 diffutils-3.3-x86_64-1
-rw-r--r--  1 root root   28310 Jul 15  2017 dirac-1.0.2-x86_64-3_SBo
-rw-r--r--  1 root root    5730 Jul  7  2017 dirmngr-1.1.1-x86_64-3
-rw-r--r--  1 root root    5375 Jul  7  2017 distcc-3.1-x86_64-1
-rw-r--r--  1 root root    4537 Jul  7  2017 djvulibre-3.5.27-x86_64-1
-rw-r--r--  1 root root     938 Jul  7  2017 dmapi-2.2.12-x86_64-1
-rw-r--r--  1 root root    1074 Jul  7  2017 dmidecode-3.0-x86_64-1
-rw-r--r--  1 root root     902 Jul  7  2017 dmxproto-2.3.1-noarch-1
-rw-r--r--  1 root root    2194 Out 13  2017 dnsmasq-2.78-x86_64-1_slack14.2
-rw-r--r--  1 root root    1213 Jul  7  2017 dosfstools-3.0.28-x86_64-1
-rw-r--r--  1 root root   65303 Jul  7  2017 doxygen-1.8.9.1-x86_64-1
-rw-r--r--  1 root root    5885 Fev  4  2018 dreamchess-0.2.1_RC2-x86_64-1_SBo
-rw-r--r--  1 root root     980 Jul  7  2017 dri2proto-2.8-x86_64-2
-rw-r--r--  1 root root     911 Jul  7  2017 dri3proto-1.0-x86_64-2
-rw-r--r--  1 root root   10940 Ago  3 16:02 dropbox-77.4.131-x86_64-1_SBo
-rw-r--r--  1 root root     899 Jul  7  2017 dvd+rw-tools-7.1-x86_64-2
-rw-r--r--  1 root root    1340 Set  3 18:34 dvdauthor-0.7.2-x86_64-1_SBo
-rw-r--r--  1 root root   17042 Set  8 17:12 dvdstyler-3.0.4-x86_64-1_SBo
-rw-r--r--  1 root root    1104 Ago 31  2017 dvgrab-3.5-x86_64-1_SBo
-rw-r--r--  1 root root     839 Jan 25  2018 dvtm-0.15-x86_64-1_SBo
-rw-r--r--  1 root root    4854 Jul  7  2017 e2fsprogs-1.43.1-x86_64-1
-rw-r--r--  1 root root    1384 Out 18  2017 e2fsprogs-compat32-1.43.1-x86_64-1compat32
-rw-r--r--  1 root root     915 Jul  7  2017 ebook-tools-0.2.2-x86_64-3
-rw-r--r--  1 root root    1602 Jul  7  2017 ebtables-2.0.10-x86_64-1
-rw-r--r--  1 root root     896 Jul  7  2017 ed-1.13-x86_64-1
-rw-r--r--  1 root root     916 Jul  7  2017 editres-1.0.6-x86_64-2
-rw-r--r--  1 root root    1034 Jul  7  2017 efibootmgr-0.5.4-x86_64-1
-rw-r--r--  1 root root    7391 Jul  7  2017 eigen2-2.0.17-x86_64-1
-rw-r--r--  1 root root   23764 Jul  7  2017 eigen3-3.2.7-x86_64-2
-rw-r--r--  1 root root    1864 Jul  7  2017 eject-2.1.5-x86_64-4
-rw-r--r--  1 root root    2638 Jul  7  2017 electricsheep-20090306-x86_64-4
-rw-r--r--  1 root root    3367 Jul  7  2017 elfutils-0.163-x86_64-1
-rw-r--r--  1 root root    2208 Out 18  2017 elfutils-compat32-0.163-x86_64-1compat32
-rw-r--r--  1 root root    1803 Set 14  2018 elilo-3.16-x86_64-3_slack14.2
-rw-r--r--  1 root root    1686 Jul  7  2017 elm-2.5.8-x86_64-3
-rw-r--r--  1 root root    4633 Jul  7  2017 elvis-2.2_0-x86_64-2
-rw-r--r--  1 root root    1556 Jul  7  2017 enchant-1.6.0-x86_64-1
-rw-r--r--  1 root root    3264 Jul  7  2017 encodings-1.0.4-noarch-1
-rw-r--r--  1 root root    7771 Jul  7  2017 enscript-1.6.6-x86_64-1
-rw-r--r--  1 root root   47502 Jul  7  2017 epic5-2.0-x86_64-1
-rw-r--r--  1 root root   10089 Ago  3 16:02 epson-inkjet-printer-escpr2-1.1.1-x86_64-1_SBo
-rw-r--r--  1 root root    1810 Jul  7  2017 esound-0.2.41-x86_64-2
-rw-r--r--  1 root root    1480 Out 18  2017 esound-compat32-0.2.41-x86_64-2compat32
-rw-r--r--  1 root root   12185 Jan 22  2019 espeak-1.48.04-x86_64-1_SBo
-rw-r--r--  1 root root    1108 Jul  7  2017 etc-14.2-x86_64-7
-rw-r--r--  1 root root     963 Jul  7  2017 ethtool-4.5-x86_64-1
-rw-r--r--  1 root root    3523 Jul  7  2017 eudev-3.1.5-x86_64-8
-rw-r--r--  1 root root    1093 Out 18  2017 eudev-compat32-3.1.5-x86_64-8compat32
-rw-r--r--  1 root root     889 Jul  7  2017 evieext-1.1.1-noarch-1
-rw-r--r--  1 root root    3889 Jul  7  2017 exiv2-0.25-x86_64-1
-rw-r--r--  1 root root   13475 Jul 29  2017 exo-0.10.7-x86_64-1
-rw-r--r--  1 root root     942 Jul 19  2017 expat-2.2.2-x86_64-1_slack14.2
-rw-r--r--  1 root root     945 Out 18  2017 expat-compat32-2.2.2-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    4383 Jul  7  2017 expect-5.45-x86_64-1
-rw-r--r--  1 root root    1014 Jul  8  2017 extundelete-0.2.4-x86_64-1_SBo
-rw-r--r--  1 root root    1077 Set  3 16:51 faac-1.28-x86_64-3_SBo
-rw-r--r--  1 root root    1189 Set  3 16:52 faad2-2.7-x86_64-2_SBo
-rw-r--r--  1 root root     834 Fev 21  2018 fbcat-0.5.1-x86_64-1_SBo
-rw-r--r--  1 root root    2421 Fev  4  2018 fcgi-2.4.0-x86_64-1_SBo
-rw-r--r--  1 root root     916 Mai 30  2018 fcrackzip-1.0-x86_64-2_SBo
-rw-r--r--  1 root root    6417 Jul  7  2017 fetchmail-6.3.26-x86_64-2
-rw-r--r--  1 root root    9553 Set  4 20:12 ffmpeg-3.2.4-x86_64-1_SBo
-rw-r--r--  1 root root     979 Jul 15  2017 ffmpeg2theora-0.30-x86_64-1_SBo
-rw-r--r--  1 root root    1929 Nov  3  2017 ffmpegthumbnailer-2.2.0-x86_64-1_SBo
-rw-r--r--  1 root root    9582 Jul  7  2017 fftw-3.3.4-x86_64-1
-rw-r--r--  1 root root    2106 Out 18  2017 fftw-compat32-3.3.4-x86_64-1compat32
-rw-r--r--  1 root root    7516 Fev 25  2019 file-5.36-x86_64-1_slack14.2
-rw-r--r--  1 root root   30802 Jul  8  2017 file-roller-3.24.1-x86_64-1_SBo
-rw-r--r--  1 root root    4983 Jul  7  2017 findutils-4.4.2-x86_64-1
-rw-r--r--  1 root root    1019 Jul  7  2017 fixesproto-5.0-x86_64-2
-rw-r--r--  1 root root    2859 Jul  7  2017 flac-1.3.1-x86_64-1
-rw-r--r--  1 root root    1563 Out 18  2017 flac-compat32-1.3.1-x86_64-1compat32
-rw-r--r--  1 root root    3429 Jul  7  2017 flex-2.6.0-x86_64-1
-rw-r--r--  1 root root    2388 Jul  7  2017 floppy-5.5-x86_64-1
-rw-r--r--  1 root root    1834 Jul 15  2017 fluidsynth-1.1.6-x86_64-1_SBo
-rw-r--r--  1 root root   14691 Jul  7  2017 fluxbox-1.3.7-x86_64-1
-rw-r--r--  1 root root   46718 Jul  7  2017 font-adobe-100dpi-1.0.3-noarch-1
-rw-r--r--  1 root root   45730 Jul  7  2017 font-adobe-75dpi-1.0.3-noarch-1
-rw-r--r--  1 root root   10812 Jul  7  2017 font-adobe-utopia-100dpi-1.0.4-noarch-1
-rw-r--r--  1 root root   10590 Jul  7  2017 font-adobe-utopia-75dpi-1.0.4-noarch-1
-rw-r--r--  1 root root    1426 Jul  7  2017 font-adobe-utopia-type1-1.0.4-noarch-1
-rw-r--r--  1 root root    1010 Jul  7  2017 font-alias-1.0.3-noarch-1
-rw-r--r--  1 root root    1005 Jul  7  2017 font-arabic-misc-1.0.3-noarch-1
-rw-r--r--  1 root root   27056 Jul  7  2017 font-bh-100dpi-1.0.3-noarch-1
-rw-r--r--  1 root root   26474 Jul  7  2017 font-bh-75dpi-1.0.3-noarch-1
-rw-r--r--  1 root root    7911 Jul  7  2017 font-bh-lucidatypewriter-100dpi-1.0.3-noarch-1
-rw-r--r--  1 root root    7748 Jul  7  2017 font-bh-lucidatypewriter-75dpi-1.0.3-noarch-1
-rw-r--r--  1 root root    1373 Jul  7  2017 font-bh-ttf-1.0.3-noarch-1
-rw-r--r--  1 root root    1786 Jul  7  2017 font-bh-type1-1.0.3-noarch-1
-rw-r--r--  1 root root    2142 Jul  7  2017 font-bitstream-100dpi-1.0.3-noarch-1
-rw-r--r--  1 root root    2092 Jul  7  2017 font-bitstream-75dpi-1.0.3-noarch-1
-rw-r--r--  1 root root    1397 Jul  7  2017 font-bitstream-speedo-1.0.2-noarch-1
-rw-r--r--  1 root root    1646 Jul  7  2017 font-bitstream-type1-1.0.3-noarch-1
-rw-r--r--  1 root root    3621 Jul  7  2017 font-cronyx-cyrillic-1.0.3-noarch-1
-rw-r--r--  1 root root    1003 Jul  7  2017 font-cursor-misc-1.0.3-noarch-1
-rw-r--r--  1 root root    1081 Jul  7  2017 font-daewoo-misc-1.0.3-noarch-1
-rw-r--r--  1 root root     980 Jul  7  2017 font-dec-misc-1.0.3-noarch-1
-rw-r--r--  1 root root    1222 Jul  7  2017 font-ibm-type1-1.0.3-noarch-1
-rw-r--r--  1 root root    1035 Jul  7  2017 font-isas-misc-1.0.3-noarch-1
-rw-r--r--  1 root root     984 Jul  7  2017 font-jis-misc-1.0.3-noarch-1
-rw-r--r--  1 root root     982 Jul  7  2017 font-micro-misc-1.0.3-noarch-1
-rw-r--r--  1 root root    1623 Jul  7  2017 font-misc-cyrillic-1.0.3-noarch-1
-rw-r--r--  1 root root    1201 Jul  7  2017 font-misc-ethiopic-1.0.3-noarch-1
-rw-r--r--  1 root root    1878 Jul  7  2017 font-misc-meltho-1.0.3-noarch-1
-rw-r--r--  1 root root   15235 Jul  7  2017 font-misc-misc-1.1.2-noarch-1
-rw-r--r--  1 root root    1232 Jul  7  2017 font-mutt-misc-1.0.3-noarch-1
-rw-r--r--  1 root root    2803 Jul  7  2017 font-schumacher-misc-1.1.2-noarch-1
-rw-r--r--  1 root root    1143 Jul  7  2017 font-screen-cyrillic-1.0.4-noarch-1
-rw-r--r--  1 root root    1066 Jul  7  2017 font-sony-misc-1.0.3-noarch-1
-rw-r--r--  1 root root    1085 Jul  7  2017 font-sun-misc-1.0.3-noarch-1
-rw-r--r--  1 root root    1674 Jul  7  2017 font-util-1.3.1-x86_64-2
-rw-r--r--  1 root root    1138 Jul  7  2017 font-winitzki-cyrillic-1.0.3-noarch-1
-rw-r--r--  1 root root    1077 Jul  7  2017 font-xfree86-type1-1.0.4-noarch-1
-rw-r--r--  1 root root    1039 Jul  7  2017 fontcacheproto-0.1.3-noarch-1
-rw-r--r--  1 root root    9522 Jul  7  2017 fontconfig-2.11.1-x86_64-2
-rw-r--r--  1 root root    1323 Out 18  2017 fontconfig-compat32-2.11.1-x86_64-2compat32
-rw-r--r--  1 root root    9989 Jul 24  2017 fontmatrix-20161216-x86_64-1_SBo
-rw-r--r--  1 root root    1292 Jul  7  2017 fontsproto-2.1.3-noarch-1
-rw-r--r--  1 root root     814 Jul  7  2017 fonttosfnt-1.0.4-x86_64-2
-rw-r--r--  1 root root  611978 Out 24  2017 foomatic-db-20170729-noarch-1_SBo
-rw-r--r--  1 root root    2609 Mai  5  2018 foomatic-db-engine-4.0.13-x86_64-1_SBo
-rw-r--r--  1 root root    1028 Jul  8  2017 foremost-1.5.7-x86_64-1_SBo
-rw-r--r--  1 root root  168777 Dez 14  2017 fpc-3.0.2-x86_64-1_SBo
-rw-r--r--  1 root root  868071 Fev 28  2019 fpc-source-3.0.4-x86_64-1_SBo
-rw-r--r--  1 root root    1033 Jan 19  2018 freedoom-0.11.3-noarch-1_SBo
-rw-r--r--  1 root root    1537 Jul  7  2017 freeglut-2.8.1-x86_64-1
-rw-r--r--  1 root root    1102 Out 18  2017 freeglut-compat32-2.8.1-x86_64-1compat32
-rw-r--r--  1 root root   10283 Mai  3  2018 freerdp-git20180405-x86_64-1_SBo
-rw-r--r--  1 root root    4201 Jul  7  2017 freetype-2.6.3-x86_64-2_slack14.2
-rw-r--r--  1 root root    1285 Out 18  2017 freetype-compat32-2.6.3-x86_64-2_slack14.2compat32
-rw-r--r--  1 root root    1057 Fev  4  2018 freexl-1.0.2-x86_64-1_SBo
-rw-r--r--  1 root root    5087 Mar 17  2018 frei0r-1.6.1-x86_64-1_SBo
-rw-r--r--  1 root root    2999 Jul  7  2017 fribidi-0.19.7-x86_64-1
-rw-r--r--  1 root root    1125 Out 18  2017 fribidi-compat32-0.19.7-x86_64-1compat32
-rw-r--r--  1 root root    1340 Jul 20 13:52 frostwire-6.7.9-noarch-1_SBo
-rw-r--r--  1 root root     861 Jul  7  2017 fslsfonts-1.0.5-x86_64-2
-rw-r--r--  1 root root     851 Jul  7  2017 fstobdf-1.0.6-x86_64-2
-rw-r--r--  1 root root    2125 Jul 15  2017 ftgl-2.1.3_rc5-x86_64-4_SBo
-rw-r--r--  1 root root    1725 Jul  7  2017 fuse-2.9.5-x86_64-1
-rw-r--r--  1 root root   12471 Jul  7  2017 fvwm-2.6.6-x86_64-1
-rw-r--r--  1 root root    5135 Jul  8  2017 galculator-2.1.4-x86_64-1_SBo
-rw-r--r--  1 root root   32187 Jul 25 20:02 gambas3-3.13.0-x86_64-1_SBo
-rw-r--r--  1 root root    2169 Jul  7  2017 gamin-0.1.10-x86_64-5
-rw-r--r--  1 root root    1318 Out 18  2017 gamin-compat32-0.1.10-x86_64-5compat32
-rw-r--r--  1 root root   15612 Dez  8  2018 gammu-1.38.3-x86_64-1_SBo
-rw-r--r--  1 root root    9864 Jul 29  2017 garcon-0.4.0-x86_64-2
-rw-r--r--  1 root root    4539 Jul  7  2017 gawk-4.1.3-x86_64-1
-rw-r--r--  1 root root    6519 Jul  7  2017 gc-7.4.2-x86_64-3
-rw-r--r--  1 root root    1170 Out 18  2017 gc-compat32-7.4.2-x86_64-3compat32
-rw-r--r--  1 root root    4251 Mai 18  2018 gcab-0.6-x86_64-1_SBo
-rw-r--r--  1 root root   44797 Out 18  2017 gcc-5.3.0_multilib-x86_64-3alien
-rw-r--r--  1 root root   41905 Out 18  2017 gcc-g++-5.3.0_multilib-x86_64-3alien
-rw-r--r--  1 root root    2762 Out 18  2017 gcc-gfortran-5.3.0_multilib-x86_64-3alien
-rw-r--r--  1 root root  251603 Out 18  2017 gcc-gnat-5.3.0_multilib-x86_64-3alien
-rw-r--r--  1 root root   20355 Out 18  2017 gcc-go-5.3.0_multilib-x86_64-3alien
-rw-r--r--  1 root root  236582 Out 18  2017 gcc-java-5.3.0_multilib-x86_64-3alien
-rw-r--r--  1 root root    2232 Out 18  2017 gcc-objc-5.3.0_multilib-x86_64-3alien
-rw-r--r--  1 root root     798 Jul  7  2017 gccmakedep-1.0.3-noarch-1
-rw-r--r--  1 root root   18656 Jul  7  2017 gcr-3.16.0-x86_64-2
-rw-r--r--  1 root root    1439 Mai  3  2018 gd-2.2.5-x86_64-1_slack14.2
-rw-r--r--  1 root root    6380 Jul  7  2017 gdb-7.11.1-x86_64-1
-rw-r--r--  1 root root    2017 Jul  7  2017 gdbm-1.12-x86_64-1
-rw-r--r--  1 root root   17905 Jul  7  2017 gdk-pixbuf2-2.32.3-x86_64-1
-rw-r--r--  1 root root    3273 Out 18  2017 gdk-pixbuf2-compat32-2.32.3-x86_64-1compat32
-rw-r--r--  1 root root   14475 Fev 25  2019 geany-1.34.1-x86_64-1_SBo
-rw-r--r--  1 root root   28377 Jul 11  2017 gedit-2.30.4-x86_64-2_SBo
-rw-r--r--  1 root root   11183 Out  2  2017 gegl-0.2.0-x86_64-4_slack14.2
-rw-r--r--  1 root root    4008 Ago  3 16:05 gelemental-2.0.0-x86_64-1_SBo
-rw-r--r--  1 root root    1272 Jul  7  2017 genpower-1.0.5-x86_64-2
-rw-r--r--  1 root root    2936 Jul 26 15:11 geoclue2-2.4.7-x86_64-1_SBo
-rw-r--r--  1 root root   20344 Jul 20 14:08 geos-3.7.2-x86_64-1_SBo
-rw-r--r--  1 root root    3358 Jul  7  2017 getmail-4.54.0-x86_64-1_slack14.2
-rw-r--r--  1 root root    7450 Jul  7  2017 gettext-0.19.8.1-x86_64-1
-rw-r--r--  1 root root   14401 Jul  7  2017 gettext-tools-0.19.8.1-x86_64-1
-rw-r--r--  1 root root    1951 Jul  7  2017 getty-ps-2.1.0b-x86_64-2
-rw-r--r--  1 root root   30087 Jul 19 20:24 ghostscript-9.26-x86_64-1_slack14.2
-rw-r--r--  1 root root    4150 Jul  7  2017 ghostscript-fonts-std-8.11-noarch-1
-rw-r--r--  1 root root    4932 Jul  7  2017 giflib-5.1.1-x86_64-1
-rw-r--r--  1 root root    1100 Out 18  2017 giflib-compat32-5.1.1-x86_64-1compat32
-rw-r--r--  1 root root  125354 Jul  7  2017 gimp-2.8.18-x86_64-1_slack14.2
-rw-r--r--  1 root root   61775 Out 17  2018 git-2.14.5-x86_64-1_slack14.2
-rw-r--r--  1 root root    3144 Jul  7  2017 gkrellm-2.3.10-x86_64-1_slack14.2
-rw-r--r--  1 root root    1150 Jul 22 17:47 gksu-2.0.2-x86_64-1_SBo
-rw-r--r--  1 root root   37537 Jan 23  2018 glade3-3.8.5-x86_64-2
-rw-r--r--  1 root root    1617 Jul  7  2017 glew-1.13.0-x86_64-1
-rw-r--r--  1 root root    1139 Out 18  2017 glew-compat32-1.13.0-x86_64-1compat32
-rw-r--r--  1 root root    1436 Jul  7  2017 glib-1.2.10-x86_64-3
-rw-r--r--  1 root root    8260 Jul  7  2017 glib-networking-2.46.1-x86_64-1
-rw-r--r--  1 root root   47206 Jul  7  2017 glib2-2.46.2-x86_64-3_slack14.2
-rw-r--r--  1 root root    1955 Out 18  2017 glib2-compat32-2.46.2-x86_64-3_slack14.2compat32
-rw-r--r--  1 root root   32582 Out 18  2017 glibc-2.23_multilib-x86_64-4alien
-rw-r--r--  1 root root  491578 Out 18  2017 glibc-i18n-2.23_multilib-x86_64-4alien
-rw-r--r--  1 root root    1325 Out 18  2017 glibc-profile-2.23_multilib-x86_64-4alien
-rw-r--r--  1 root root   15563 Out 18  2017 glibc-solibs-2.23_multilib-x86_64-4alien
-rw-r--r--  1 root root   71487 Jul 19 20:24 glibc-zoneinfo-2019b-noarch-1_slack14.2
-rw-r--r--  1 root root   21565 Jul  7  2017 glibmm-2.46.4-x86_64-1
-rw-r--r--  1 root root     987 Jul  7  2017 glproto-1.4.17-noarch-1
-rw-r--r--  1 root root     586 Jul  7  2017 glu-9.0.0-x86_64-1
-rw-r--r--  1 root root     703 Out 18  2017 glu-compat32-9.0.0-x86_64-1compat32
-rw-r--r--  1 root root    8183 Jul  7  2017 gmime-2.6.20-x86_64-1
-rw-r--r--  1 root root    2833 Jul  7  2017 gmm-4.2-noarch-1
-rw-r--r--  1 root root    1061 Jul  7  2017 gmp-6.1.1-x86_64-1
-rw-r--r--  1 root root    1042 Out 18  2017 gmp-compat32-6.1.1-x86_64-1compat32
-rw-r--r--  1 root root   10487 Mai 21  2018 gnash-0.8.10-x86_64-7_SBo
-rw-r--r--  1 root root   10762 Jul 11  2017 gnome-disk-utility-3.6.1-x86_64-1_SBo
-rw-r--r--  1 root root    8960 Jan 25  2018 gnome-mime-data-2.18.0-x86_64-2_SBo
-rw-r--r--  1 root root    4049 Fev  6  2018 gnome-python-2.28.1-x86_64-1_SBo
-rw-r--r--  1 root root  235069 Jul  7  2017 gnome-themes-standard-3.18.0-x86_64-1
-rw-r--r--  1 root root   20413 Jul 15  2017 gnome-vfs-2.24.4-x86_64-3_SBo
-rw-r--r--  1 root root    2391 Jul  7  2017 gnu-cobol-1.1-x86_64-1
-rw-r--r--  1 root root    2221 Jul  7  2017 gnu-efi-3.0.4-x86_64-1
-rw-r--r--  1 root root   14327 Jul  7  2017 gnuchess-6.2.2-x86_64-1
-rw-r--r--  1 root root    4467 Set 14  2018 gnupg-1.4.23-x86_64-1_slack14.2
-rw-r--r--  1 root root   14053 Set 14  2018 gnupg2-2.0.31-x86_64-1_slack14.2
-rw-r--r--  1 root root   12356 Jul  7  2017 gnuplot-5.0.3-x86_64-2
-rw-r--r--  1 root root   75746 Out 16  2018 gnustep-base-1.25.1-x86_64-1_SBo
-rw-r--r--  1 root root    8717 Out 17  2018 gnustep-make-2.7.0-x86_64-2_SBo
-rw-r--r--  1 root root   57602 Jul 19 20:24 gnutls-3.6.7-x86_64-1_slack14.2
-rw-r--r--  1 root root    1848 Out 18  2017 gnutls-compat32-3.5.8-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root   14299 Jul  7  2017 gobject-introspection-1.46.0-x86_64-1
-rw-r--r--  1 root root    2310 Fev  7  2018 goldendict-1.5.0_RC2-x86_64-1_SBo
-rw-r--r--  1 root root    4052 Jul 23 17:29 google-chrome-75.0.3770.142-x86_64-1
-rw-r--r--  1 root root   56632 Ago 19 00:07 goonies-1.4.1528-x86_64-1_SBo
-rw-r--r--  1 root root    2272 Jul  7  2017 gpa-0.9.9-x86_64-1
-rw-r--r--  1 root root     868 Dez 30  2017 gpart-0.3-x86_64-2_SBo
-rw-r--r--  1 root root    7974 Jul  7  2017 gparted-0.26.1-x86_64-1
-rw-r--r--  1 root root    1176 Jul  7  2017 gperf-3.0.4-x86_64-1
-rw-r--r--  1 root root    1706 Jul  7  2017 gpgme-1.6.0-x86_64-1
-rw-r--r--  1 root root    3697 Jul  7  2017 gphoto2-2.5.10-x86_64-1
-rw-r--r--  1 root root    1958 Jul  7  2017 gpm-1.20.7-x86_64-3
-rw-r--r--  1 root root    1488 Fev  4  2018 gpsbabel-1.5.4-x86_64-1_SBo
-rw-r--r--  1 root root    1176 Jul  7  2017 gptfdisk-1.0.0-x86_64-1
-rw-r--r--  1 root root    2750 Jul  7  2017 grantlee-0.5.1-x86_64-1
-rw-r--r--  1 root root   25244 Mai  5  2018 graphviz-2.40.1-x86_64-1_SBo
-rw-r--r--  1 root root    5118 Jul  7  2017 grep-2.25-x86_64-1
-rw-r--r--  1 root root   25220 Jul  7  2017 groff-1.22.3-x86_64-2
-rw-r--r--  1 root root    3341 Nov 27  2018 grsync-1.2.6-x86_64-1_SBo
-rw-r--r--  1 root root   53879 Jul  7  2017 grub-2.00-x86_64-5
-rw-r--r--  1 root root    9254 Jul  7  2017 gsettings-desktop-schemas-3.18.1-x86_64-1
-rw-r--r--  1 root root    9339 Fev  3  2018 gsl-2.1-x86_64-1
-rw-r--r--  1 root root    1155 Ago 31  2017 gsm-1.0.13-x86_64-2_SBo
-rw-r--r--  1 root root    3503 Out 17  2017 gsmartcontrol-1.0.1-x86_64-1_SBo
-rw-r--r--  1 root root    2686 Ago  6 04:12 gst-libav-1.6.2-x86_64-1_SBo
-rw-r--r--  1 root root   38767 Mai 19  2018 gst-plugins-bad-1.6.2-x86_64-2_SBo
-rw-r--r--  1 root root   33424 Jul  7  2017 gst-plugins-base-1.6.4-x86_64-1
-rw-r--r--  1 root root    5160 Out 18  2017 gst-plugins-base-compat32-1.6.4-x86_64-1compat32
-rw-r--r--  1 root root   33193 Jul  7  2017 gst-plugins-base0-0.10.36-x86_64-2
-rw-r--r--  1 root root    5849 Out 18  2017 gst-plugins-base0-compat32-0.10.36-x86_64-2compat32
-rw-r--r--  1 root root   35388 Jul  7  2017 gst-plugins-good-1.6.4-x86_64-1
-rw-r--r--  1 root root    5844 Out 18  2017 gst-plugins-good-compat32-1.6.4-x86_64-1compat32
-rw-r--r--  1 root root   11249 Jul  7  2017 gst-plugins-good0-0.10.31-x86_64-2
-rw-r--r--  1 root root    6161 Out 18  2017 gst-plugins-good0-compat32-0.10.31-x86_64-2compat32
-rw-r--r--  1 root root   10689 Mai 19  2018 gst-plugins-ugly-1.6.2-x86_64-1_SBo
-rw-r--r--  1 root root    1251 Mar 11 19:49 gst0-ffmpeg-0.10.13-x86_64-1_SBo
-rw-r--r--  1 root root    5180 Fev  6  2018 gst0-python-0.10.22-x86_64-1_SBo
-rw-r--r--  1 root root   23498 Jul  7  2017 gstreamer-1.6.4-x86_64-1
-rw-r--r--  1 root root    2286 Out 18  2017 gstreamer-compat32-1.6.4-x86_64-1compat32
-rw-r--r--  1 root root   20846 Jul  7  2017 gstreamer0-0.10.36-x86_64-1
-rw-r--r--  1 root root    2672 Out 18  2017 gstreamer0-compat32-0.10.36-x86_64-1compat32
-rw-r--r--  1 root root   89434 Jul 14  2017 gstreamermm-1.4.3-x86_64-1_SBo
-rw-r--r--  1 root root   10299 Jul  7  2017 gtk+-1.2.10-x86_64-5
-rw-r--r--  1 root root   61980 Jul  7  2017 gtk+2-2.24.31-x86_64-1_slack14.2
-rw-r--r--  1 root root    3614 Out 18  2017 gtk+2-compat32-2.24.31-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root   70733 Jul  7  2017 gtk+3-3.18.9-x86_64-1
-rw-r--r--  1 root root    3383 Jul 29  2017 gtk-xfce-engine-2.10.1-x86_64-2
-rw-r--r--  1 root root    4720 Nov 20  2017 gtkglext-1.2.0-x86_64-3_SBo
-rw-r--r--  1 root root   21062 Jul  7  2017 gtkmm2-2.24.4-x86_64-1
-rw-r--r--  1 root root   26034 Jul  7  2017 gtkmm3-3.18.1-x86_64-1
-rw-r--r--  1 root root   18710 Jul 11  2017 gtksourceview-2.10.5-x86_64-1_SBo
-rw-r--r--  1 root root   24921 Jul  8  2017 gtksourceview3-3.18.4-x86_64-1_SBo
-rw-r--r--  1 root root    6346 Jul  7  2017 gtkspell-2.0.16-x86_64-3
-rw-r--r--  1 root root   13418 Jul  7  2017 gucharmap-3.12.1-x86_64-2
-rw-r--r--  1 root root   33499 Jul  7  2017 guile-2.0.11-x86_64-2
-rw-r--r--  1 root root   23065 Jul  7  2017 gutenprint-5.2.11-x86_64-2
-rw-r--r--  1 root root    6346 Nov  4  2018 guvcview-2.0.6-x86_64-1_SBo
-rw-r--r--  1 root root    1116 Jul  7  2017 gv-3.7.4-x86_64-1
-rw-r--r--  1 root root   12379 Jul  7  2017 gvfs-1.26.3-x86_64-1
-rw-r--r--  1 root root    1267 Jul  7  2017 gzip-1.8-x86_64-1
-rw-r--r--  1 root root    3590 Dez  8  2018 hardinfo-0.5.1-x86_64-3_SBo
-rw-r--r--  1 root root    5931 Jul  7  2017 harfbuzz-1.2.7-x86_64-1
-rw-r--r--  1 root root    1147 Out 18  2017 harfbuzz-compat32-1.2.7-x86_64-1compat32
-rw-r--r--  1 root root    2075 Jul 18  2017 hddtemp-0.3beta15-x86_64-2_SBo
-rw-r--r--  1 root root    1132 Jul  7  2017 hdparm-9.48-x86_64-1
-rw-r--r--  1 root root    3939 Jul  7  2017 help2man-1.46.5-x86_64-1
-rw-r--r--  1 root root    5356 Jul  7  2017 herqq-1.0.0-x86_64-1
-rw-r--r--  1 root root    1629 Jul  7  2017 hfsutils-3.2.6-x86_64-5
-rw-r--r--  1 root root   16209 Jul  7  2017 hicolor-icon-theme-0.15-noarch-1
-rw-r--r--  1 root root   79668 Jul  7  2017 hplip-3.16.5-x86_64-3
-rw-r--r--  1 root root    7024 Jul  7  2017 htdig-3.2.0b6-x86_64-4
-rw-r--r--  1 root root    6063 Nov 24  2018 html5lib-1.0.1-x86_64-1_SBo
-rw-r--r--  1 root root    1078 Jul  7  2017 htop-2.0.1-x86_64-1
-rw-r--r--  1 root root   31715 Jul 19 20:25 httpd-2.4.39-x86_64-1_slack14.2
-rw-r--r--  1 root root    2456 Set  8 18:22 httplib2-0.11.3-x86_64-1_SBo
-rw-r--r--  1 root root    2725 Jul  7  2017 hunspell-1.3.3-x86_64-1
-rw-r--r--  1 root root     906 Jul  7  2017 hwdata-0.284-noarch-1
-rw-r--r--  1 root root    1443 Jan 20  2019 hydra-8.8-x86_64-1_SBo
-rw-r--r--  1 root root    1175 Jul 26 14:49 hyphen-2.8.8-x86_64-1_SBo
-rw-r--r--  1 root root     828 Jul  7  2017 iceauth-1.0.7-x86_64-2
-rw-r--r--  1 root root     814 Jul  7  2017 icmpinfo-1.11-x86_64-2
-rw-r--r--  1 root root     751 Jul  7  2017 ico-1.0.4-x86_64-2
-rw-r--r--  1 root root    1205 Jul  7  2017 icon-naming-utils-0.8.90-x86_64-2
-rw-r--r--  1 root root    1301 Nov 26  2017 icoutils-0.31.0-x86_64-1_SBo
-rw-r--r--  1 root root    7730 Jul  7  2017 icu4c-56.1-x86_64-2
-rw-r--r--  1 root root    1514 Out 18  2017 icu4c-compat32-56.1-x86_64-2compat32
-rw-r--r--  1 root root    2043 Set  2  2017 id3lib-3.8.3-x86_64-2_SBo
-rw-r--r--  1 root root    3365 Jan 25  2018 idna-2.6-x86_64-1_SBo
-rw-r--r--  1 root root    2215 Jul  7  2017 idnkit-1.0-x86_64-1
-rw-r--r--  1 root root     917 Jul  7  2017 iftop-1.0pre2-x86_64-1
-rw-r--r--  1 root root    3392 Jul  7  2017 ilmbase-2.2.0-x86_64-1
-rw-r--r--  1 root root   67739 Jul  7  2017 imagemagick-6.9.4_9-x86_64-1
-rw-r--r--  1 root root   14255 Mar 18 13:35 imagination-3.1-x86_64-1_SBo
-rw-r--r--  1 root root    1107 Jul  7  2017 imake-1.0.7-x86_64-2
-rw-r--r--  1 root root     786 Jul  7  2017 imapd-2.20-x86_64-2
-rw-r--r--  1 root root    3464 Mar 24  2018 imlib2-1.5.1-x86_64-1_SBo
-rw-r--r--  1 root root    2986 Jul  7  2017 indent-2.2.10-x86_64-1
-rw-r--r--  1 root root     906 Jul  7  2017 inetd-1.79s-x86_64-9
-rw-r--r--  1 root root    1549 Mar  2  2019 infozip-6.0-x86_64-4_slack14.2
-rw-r--r--  1 root root   58500 Fev  8  2019 inkscape-0.92.4-x86_64-1_SBo
-rw-r--r--  1 root root    1404 Jul  7  2017 inotify-tools-3.14-x86_64-1
-rw-r--r--  1 root root    1203 Jul  7  2017 inputproto-2.3.2-noarch-1
-rw-r--r--  1 root root    4953 Jul  7  2017 intel-gpu-tools-1.9-x86_64-2
-rw-r--r--  1 root root    1180 Jul  7  2017 intltool-0.51.0-x86_64-3_slack14.2
-rw-r--r--  1 root root    4997 Jul  7  2017 iproute2-4.4.0-x86_64-1
-rw-r--r--  1 root root     935 Set  2 14:07 ipscan-3.6.0-x86_64-1_SBo
-rw-r--r--  1 root root    1682 Jul  7  2017 ipset-6.20-x86_64-1
-rw-r--r--  1 root root    6646 Jul  7  2017 iptables-1.6.0-x86_64-2
-rw-r--r--  1 root root    5810 Jul  7  2017 iptraf-ng-1.1.4-x86_64-1
-rw-r--r--  1 root root    1188 Jul  7  2017 iputils-s20140519-x86_64-1
-rw-r--r--  1 root root     935 Jul  7  2017 ipw2100-fw-1.3-fw-1
-rw-r--r--  1 root root     996 Jul  7  2017 ipw2200-fw-3.1-fw-1
-rw-r--r--  1 root root    8046 Out 18  2017 irrlicht-1.8.4-x86_64-1_SBo
-rw-r--r--  1 root root   11945 Jul 19 20:25 irssi-1.1.3-x86_64-1_slack14.2
-rw-r--r--  1 root root     798 Dez 31  2017 irssi_otr-1.0.2-x86_64-1_SBo
-rw-r--r--  1 root root    1328 Dez 11  2017 iscan-firmware-2.8.0.1-noarch-3_SBo
-rw-r--r--  1 root root    1640 Dez 11  2017 iscan-proprietary-drivers-2.10.0.1-x86_64-1_SBo
-rw-r--r--  1 root root   31437 Jul  7  2017 iso-codes-3.67-noarch-1
-rw-r--r--  1 root root    1513 Jul  7  2017 ispell-3.2.06-x86_64-1
-rw-r--r--  1 root root    1204 Jul  7  2017 itstool-2.0.2-x86_64-1
-rw-r--r--  1 root root     802 Jul  7  2017 iw-4.3-x86_64-1
-rw-r--r--  1 root root   10265 Fev 10  2018 jack-audio-connection-kit-0.125.0-x86_64-1_SBo
-rw-r--r--  1 root root    1889 Set  2  2017 jack-rack-1.4.7-x86_64-3_SBo
-rw-r--r--  1 root root    1731 Jul  7  2017 jasper-1.900.1-x86_64-5
-rw-r--r--  1 root root    1134 Out 18  2017 jasper-compat32-1.900.1-x86_64-5compat32
-rw-r--r--  1 root root    7237 Jul  7  2017 jed-0.99_19-x86_64-2
-rw-r--r--  1 root root    1012 Jul  7  2017 jemalloc-3.6.0-x86_64-1
-rw-r--r--  1 root root    1301 Jul  7  2017 jfsutils-1.1.15-x86_64-1
-rw-r--r--  1 root root    3589 Jul  7  2017 joe-4.1-x86_64-1
-rw-r--r--  1 root root    1404 Out 17  2017 john-1.8.0-x86_64-2_SBo
-rw-r--r--  1 root root    1476 Jul  7  2017 jove-4.16.0.73-x86_64-1
-rw-r--r--  1 root root    3313 Jul  7  2017 js185-1.0.0-x86_64-1
-rw-r--r--  1 root root    4986 Jul  7  2017 json-c-0.12-x86_64-1
-rw-r--r--  1 root root     928 Out 18  2017 json-c-compat32-0.12-x86_64-1compat32
-rw-r--r--  1 root root   10073 Jul 26 15:10 json-glib-1.2.8-x86_64-1_SBo
-rw-r--r--  1 root root    3424 Jul  7  2017 judy-1.0.5-x86_64-1
-rw-r--r--  1 root root   37003 Jul  7  2017 k3b-2.0.3-x86_64-2
-rw-r--r--  1 root root    4304 Jul 22  2017 kactivities-4.13.3-x86_64-2
-rw-r--r--  1 root root   34980 Jul  7  2017 kbd-1.15.3-x86_64-2
-rw-r--r--  1 root root    2291 Jul  7  2017 kbproto-1.0.7-noarch-1
-rw-r--r--  1 root root    2341 Ago 31  2017 kde-base-artwork-4.14.3-x86_64-2
-rw-r--r--  1 root root   24593 Ago 31  2017 kde-baseapps-4.14.3-x86_64-2
-rw-r--r--  1 root root   52565 Jul  7  2017 kde-l10n-en_GB-4.14.3-noarch-1
-rw-r--r--  1 root root   84665 Jul  7  2017 kde-l10n-pl-4.14.3-noarch-1
-rw-r--r--  1 root root   88758 Jul  7  2017 kde-l10n-pt-4.14.3-noarch-1
-rw-r--r--  1 root root  120557 Jul  7  2017 kde-l10n-pt_BR-4.14.3-noarch-1
-rw-r--r--  1 root root   93789 Jul 22  2017 kde-runtime-4.14.3-x86_64-3
-rw-r--r--  1 root root  111053 Set  2  2017 kde-workspace-4.11.22-x86_64-4
-rw-r--r--  1 root root  374622 Set  2  2017 kdeartwork-4.14.3-x86_64-2
-rw-r--r--  1 root root    1216 Jul 23  2017 kdegraphics-mobipocket-4.14.3-x86_64-2
-rw-r--r--  1 root root  160629 Ago 15 13:45 kdelibs-4.14.38-x86_64-1_slack14.2
-rw-r--r--  1 root root   58746 Jul 22  2017 kdepimlibs-4.14.10-x86_64-2
-rw-r--r--  1 root root   76097 Set  2 21:22 kernel-firmware-20190821_c0fb3d9-noarch-1
-rw-r--r--  1 root root     980 Set  2 21:22 kernel-generic-4.4.190-x86_64-1
-rw-r--r--  1 root root   25057 Set  2 21:22 kernel-headers-4.4.190-x86-1
-rw-r--r--  1 root root     976 Set  2 21:22 kernel-huge-4.4.190-x86_64-1
-rw-r--r--  1 root root  257869 Set  2 21:23 kernel-modules-4.4.190-x86_64-1
-rw-r--r--  1 root root 3481118 Set  2 21:27 kernel-source-4.4.190-noarch-1
-rw-r--r--  1 root root    4389 Jul  7  2017 keybinder-0.3.1-x86_64-1
-rw-r--r--  1 root root    2248 Jul  7  2017 keyutils-1.5.9-x86_64-1
-rw-r--r--  1 root root    1748 Nov 19  2017 kismet-2016_07_R1-x86_64-1_SBo
-rw-r--r--  1 root root    2441 Jul  7  2017 kmod-22-x86_64-1
-rw-r--r--  1 root root   12775 Jul  7  2017 kolourpaint-4.14.3-x86_64-2
-rw-r--r--  1 root root   32676 Mar  3  2018 kppp-4.14.3-x86_64-2
-rw-r--r--  1 root root    1403 Jul  7  2017 ksh93-2012_08_01-x86_64-2
-rw-r--r--  1 root root    1515 Set  2  2017 ladspa_sdk-1.13-x86_64-4_SBo
-rw-r--r--  1 root root    1727 Set  3 17:09 lame-3.99.5-x86_64-2_SBo
-rw-r--r--  1 root root  794998 Dez 14  2017 lazarus-1.6.4-x86_64-1_SBo
-rw-r--r--  1 root root   13983 Jul  9  2017 lbreakout2-2.6.5-x86_64-1_SBo
-rw-r--r--  1 root root    1182 Jul  7  2017 lcms-1.19-x86_64-3
-rw-r--r--  1 root root    1011 Out 18  2017 lcms-compat32-1.19-x86_64-3compat32
-rw-r--r--  1 root root     965 Jul  7  2017 lcms2-2.7-x86_64-2
-rw-r--r--  1 root root     988 Out 18  2017 lcms2-compat32-2.7-x86_64-2compat32
-rw-r--r--  1 root root     901 Jul  7  2017 less-481-x86_64-1
-rw-r--r--  1 root root    3278 Set 14  2018 lftp-4.8.4-x86_64-1_slack14.2
-rw-r--r--  1 root root     830 Jul  7  2017 lha-114i-x86_64-1
-rw-r--r--  1 root root     918 Jul  7  2017 libFS-1.0.7-x86_64-1
-rw-r--r--  1 root root     914 Out 18  2017 libFS-compat32-1.0.7-x86_64-1compat32
-rw-r--r--  1 root root    1404 Jul  7  2017 libICE-1.0.9-x86_64-2
-rw-r--r--  1 root root     963 Out 18  2017 libICE-compat32-1.0.9-x86_64-2compat32
-rw-r--r--  1 root root    1211 Jul  7  2017 libSM-1.2.2-x86_64-2
-rw-r--r--  1 root root     938 Out 18  2017 libSM-compat32-1.2.2-x86_64-2compat32
-rw-r--r--  1 root root   50240 Set 14  2018 libX11-1.6.6-x86_64-1_slack14.2
-rw-r--r--  1 root root    1064 Out 18  2017 libX11-compat32-1.6.4-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1587 Jul  7  2017 libXScrnSaver-1.2.2-x86_64-2
-rw-r--r--  1 root root    1070 Out 18  2017 libXScrnSaver-compat32-1.2.2-x86_64-2compat32
-rw-r--r--  1 root root    1380 Jul  7  2017 libXau-1.0.8-x86_64-2
-rw-r--r--  1 root root    1119 Out 18  2017 libXau-compat32-1.0.8-x86_64-2compat32
-rw-r--r--  1 root root    4858 Jul  7  2017 libXaw-1.0.13-x86_64-1
-rw-r--r--  1 root root     907 Out 18  2017 libXaw-compat32-1.0.13-x86_64-1compat32
-rw-r--r--  1 root root    3554 Jul  7  2017 libXaw3d-1.6.2-x86_64-3
-rw-r--r--  1 root root    3875 Jul  7  2017 libXaw3dXft-1.6.2d-x86_64-2
-rw-r--r--  1 root root    1376 Jul  7  2017 libXcm-0.5.2-x86_64-2
-rw-r--r--  1 root root    1684 Jul  7  2017 libXcomposite-0.4.4-x86_64-2
-rw-r--r--  1 root root    1123 Out 18  2017 libXcomposite-compat32-0.4.4-x86_64-2compat32
-rw-r--r--  1 root root    2350 Dez  2  2017 libXcursor-1.1.15-x86_64-1_slack14.2
-rw-r--r--  1 root root    1061 Out 18  2017 libXcursor-compat32-1.1.14-x86_64-2compat32
-rw-r--r--  1 root root    1086 Jul  7  2017 libXdamage-1.1.4-x86_64-2
-rw-r--r--  1 root root    1057 Out 18  2017 libXdamage-compat32-1.1.4-x86_64-2compat32
-rw-r--r--  1 root root    1142 Jul  7  2017 libXdmcp-1.1.2-x86_64-2
-rw-r--r--  1 root root    1015 Out 18  2017 libXdmcp-compat32-1.1.2-x86_64-2compat32
-rw-r--r--  1 root root    1218 Jul  7  2017 libXevie-1.0.3-x86_64-2
-rw-r--r--  1 root root    1020 Out 18  2017 libXevie-compat32-1.0.3-x86_64-2compat32
-rw-r--r--  1 root root    4590 Jul  7  2017 libXext-1.3.3-x86_64-2
-rw-r--r--  1 root root    1002 Out 18  2017 libXext-compat32-1.3.3-x86_64-2compat32
-rw-r--r--  1 root root    1068 Jul  7  2017 libXfixes-5.0.3-x86_64-1_slack14.2
-rw-r--r--  1 root root    1053 Out 18  2017 libXfixes-compat32-5.0.3-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1668 Dez  2  2017 libXfont-1.5.1-x86_64-2_slack14.2
-rw-r--r--  1 root root    1251 Out 18  2017 libXfont-compat32-1.5.1-x86_64-2compat32
-rw-r--r--  1 root root    1273 Jul  7  2017 libXfontcache-1.0.5-x86_64-2
-rw-r--r--  1 root root    1089 Out 18  2017 libXfontcache-compat32-1.0.5-x86_64-2compat32
-rw-r--r--  1 root root    1023 Jul  7  2017 libXft-2.3.2-x86_64-3
-rw-r--r--  1 root root     950 Out 18  2017 libXft-compat32-2.3.2-x86_64-3compat32
-rw-r--r--  1 root root    3832 Jul  7  2017 libXi-1.7.8-x86_64-1_slack14.2
-rw-r--r--  1 root root     935 Out 18  2017 libXi-compat32-1.7.8-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1298 Jul  7  2017 libXinerama-1.1.3-x86_64-2
-rw-r--r--  1 root root    1049 Out 18  2017 libXinerama-compat32-1.1.3-x86_64-2compat32
-rw-r--r--  1 root root    1874 Jul  7  2017 libXmu-1.1.2-x86_64-2
-rw-r--r--  1 root root    1041 Out 18  2017 libXmu-compat32-1.1.2-x86_64-2compat32
-rw-r--r--  1 root root    1923 Jul  7  2017 libXp-1.0.3-x86_64-2
-rw-r--r--  1 root root     904 Out 18  2017 libXp-compat32-1.0.3-x86_64-2compat32
-rw-r--r--  1 root root    1061 Jul  7  2017 libXpm-3.5.11-x86_64-2
-rw-r--r--  1 root root    1031 Out 18  2017 libXpm-compat32-3.5.11-x86_64-2compat32
-rw-r--r--  1 root root    1143 Jul  7  2017 libXpresent-1.0.0-x86_64-1
-rw-r--r--  1 root root    1597 Jul  7  2017 libXrandr-1.5.1-x86_64-1_slack14.2
-rw-r--r--  1 root root    1063 Out 18  2017 libXrandr-compat32-1.5.1-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1108 Jul  7  2017 libXrender-0.9.10-x86_64-1_slack14.2
-rw-r--r--  1 root root    1092 Out 18  2017 libXrender-compat32-0.9.10-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1207 Out 24  2017 libXres-1.2.0-x86_64-1_slack14.2
-rw-r--r--  1 root root     988 Out 18  2017 libXres-compat32-1.0.7-x86_64-2compat32
-rw-r--r--  1 root root   11929 Jul  7  2017 libXt-1.1.5-x86_64-1
-rw-r--r--  1 root root     912 Out 18  2017 libXt-compat32-1.1.5-x86_64-1compat32
-rw-r--r--  1 root root    1829 Jul  7  2017 libXtst-1.2.3-x86_64-1_slack14.2
-rw-r--r--  1 root root     990 Out 18  2017 libXtst-compat32-1.2.3-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1832 Jul  7  2017 libXv-1.0.11-x86_64-1_slack14.2
-rw-r--r--  1 root root     996 Out 18  2017 libXv-compat32-1.0.11-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1031 Jul  7  2017 libXvMC-1.0.10-x86_64-1_slack14.2
-rw-r--r--  1 root root    1025 Out 18  2017 libXvMC-compat32-1.0.10-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1842 Jul  7  2017 libXxf86dga-1.1.4-x86_64-2
-rw-r--r--  1 root root    1046 Out 18  2017 libXxf86dga-compat32-1.1.4-x86_64-2compat32
-rw-r--r--  1 root root    1351 Jul  7  2017 libXxf86misc-1.0.3-x86_64-2
-rw-r--r--  1 root root    1073 Out 18  2017 libXxf86misc-compat32-1.0.3-x86_64-2compat32
-rw-r--r--  1 root root    2006 Jul  7  2017 libXxf86vm-1.1.4-x86_64-2
-rw-r--r--  1 root root    1025 Out 18  2017 libXxf86vm-compat32-1.1.4-x86_64-2compat32
-rw-r--r--  1 root root    1008 Jul  7  2017 libaio-0.3.109-x86_64-1
-rw-r--r--  1 root root    1072 Out 18  2017 libaio-compat32-0.3.109-x86_64-1compat32
-rw-r--r--  1 root root    2926 Jul  7  2017 libao-1.2.0-x86_64-3
-rw-r--r--  1 root root    2675 Jul  7  2017 libarchive-3.2.1-x86_64-1
-rw-r--r--  1 root root    3298 Jul  7  2017 libart_lgpl-2.3.21-x86_64-1
-rw-r--r--  1 root root    1134 Out 18  2017 libart_lgpl-compat32-2.3.21-x86_64-1compat32
-rw-r--r--  1 root root     907 Jan 25  2018 libass-0.14.0-x86_64-1_SBo
-rw-r--r--  1 root root    1110 Jul  7  2017 libassuan-2.4.2-x86_64-1
-rw-r--r--  1 root root     960 Jul  7  2017 libasyncns-0.8-x86_64-1
-rw-r--r--  1 root root    1022 Out 18  2017 libasyncns-compat32-0.8-x86_64-1compat32
-rw-r--r--  1 root root    1213 Jul  7  2017 libatasmart-0.19-x86_64-2
-rw-r--r--  1 root root     964 Jul  8  2017 libaudclient-3.5_rc2-x86_64-1_SBo
-rw-r--r--  1 root root    1448 Set  3 16:43 libavc1394-0.5.4-x86_64-1_SBo
-rw-r--r--  1 root root    1000 Jul  7  2017 libbluedevil-2.1-x86_64-1
-rw-r--r--  1 root root    1376 Fev 27  2019 libbluray-1.1.0-x86_64-1_SBo
-rw-r--r--  1 root root   20896 Jan 25  2018 libbonobo-2.32.1-x86_64-3_SBo
-rw-r--r--  1 root root    1216 Out 17  2018 libburn-1.5.0-x86_64-1_SBo
-rw-r--r--  1 root root   16518 Jul  7  2017 libcaca-0.99.beta18-x86_64-2
-rw-r--r--  1 root root    3268 Jul  7  2017 libcanberra-0.30-x86_64-5
-rw-r--r--  1 root root    2100 Jul  7  2017 libcap-2.22-x86_64-1
-rw-r--r--  1 root root    2333 Jul  7  2017 libcap-ng-0.7.7-x86_64-1
-rw-r--r--  1 root root    1353 Jul  7  2017 libcddb-1.3.2-x86_64-3
-rw-r--r--  1 root root    3311 Jul  7  2017 libcdio-0.93-x86_64-1
-rw-r--r--  1 root root    1582 Jul  7  2017 libcdio-paranoia-10.2+0.93+1-x86_64-1
-rw-r--r--  1 root root    2546 Set 14  2018 libcgroup-0.41-x86_64-5_slack14.2
-rw-r--r--  1 root root    1623 Mai 16  2018 libconfig-1.7.2-x86_64-1_SBo
-rw-r--r--  1 root root    1174 Jul 25 20:07 libcpuid-0.4.1-x86_64-1_SBo
-rw-r--r--  1 root root    5074 Jul  7  2017 libcroco-0.6.11-x86_64-1
-rw-r--r--  1 root root     763 Jul 15  2017 libcuefile-r475-x86_64-1_SBo
-rw-r--r--  1 root root    1122 Ago  3 15:46 libdaemon-0.14-x86_64-1_SBo
-rw-r--r--  1 root root    5797 Jul  7  2017 libdbusmenu-qt-0.9.2-x86_64-2
-rw-r--r--  1 root root    2151 Out 17  2017 libdc1394-2.2.5-x86_64-1_SBo
-rw-r--r--  1 root root    1452 Jul 15  2017 libdca-0.0.5-x86_64-1_SBo
-rw-r--r--  1 root root    1073 Jul  7  2017 libdiscid-0.6.1-x86_64-1
-rw-r--r--  1 root root    1572 Jul  7  2017 libdmx-1.1.3-x86_64-2
-rw-r--r--  1 root root     949 Out 18  2017 libdmx-compat32-1.1.3-x86_64-2compat32
-rw-r--r--  1 root root    1607 Jul 24 20:12 libdnet-1.11-x86_64-1_SBo
-rw-r--r--  1 root root    2916 Jul  7  2017 libdrm-2.4.68-x86_64-1
-rw-r--r--  1 root root    1261 Out 18  2017 libdrm-compat32-2.4.68-x86_64-1compat32
-rw-r--r--  1 root root    1414 Set  3 17:09 libdv-1.0.0-x86_64-2_SBo
-rw-r--r--  1 root root    3141 Jul 15  2017 libdvbpsi-1.3.1-x86_64-1_SBo
-rw-r--r--  1 root root    2741 Jul 10  2017 libdvdcss-1.4.0-x86_64-2_SBo
-rw-r--r--  1 root root    1111 Jul  7  2017 libdvdnav-5.0.3-x86_64-1
-rw-r--r--  1 root root    1585 Jul  7  2017 libdvdread-5.0.3-x86_64-1
-rw-r--r--  1 root root    1950 Jan 23  2019 libebml-1.3.6-x86_64-1_SBo
-rw-r--r--  1 root root     942 Jul  7  2017 libepoxy-1.3.1-x86_64-1
-rw-r--r--  1 root root     893 Out 18  2017 libepoxy-compat32-1.3.1-x86_64-1compat32
-rw-r--r--  1 root root    2115 Jul  7  2017 liberation-fonts-ttf-1.07.4-noarch-1
-rw-r--r--  1 root root    1203 Jul  7  2017 libevdev-1.4.1-x86_64-1
-rw-r--r--  1 root root    2244 Jul  7  2017 libevent-2.0.22-x86_64-1
-rw-r--r--  1 root root    1441 Jul 21 20:35 libevtx-20181227-x86_64-1_SBo
-rw-r--r--  1 root root    4086 Jul  7  2017 libexif-0.6.21-x86_64-1
-rw-r--r--  1 root root    1064 Out 18  2017 libexif-compat32-0.6.21-x86_64-1compat32
-rw-r--r--  1 root root     860 Jul  7  2017 libfakekey-0.1-x86_64-1
-rw-r--r--  1 root root    1156 Ago  3 01:25 libfdk-aac-2.0.0-x86_64-1_SBo
-rw-r--r--  1 root root    1231 Jul  7  2017 libffi-3.2.1-x86_64-1
-rw-r--r--  1 root root    1130 Out 18  2017 libffi-compat32-3.2.1-x86_64-1compat32
-rw-r--r--  1 root root     993 Jul  7  2017 libfontenc-1.1.3-x86_64-1
-rw-r--r--  1 root root    1003 Out 18  2017 libfontenc-compat32-1.1.3-x86_64-1compat32
-rw-r--r--  1 root root    1210 Set 14  2018 libgcrypt-1.7.10-x86_64-1_slack14.2
-rw-r--r--  1 root root    1069 Out 18  2017 libgcrypt-compat32-1.7.8-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    2182 Jul 22 17:44 libgksu-2.0.12-x86_64-2_SBo
-rw-r--r--  1 root root    2561 Jan 23  2018 libglade-2.6.4-x86_64-5
-rw-r--r--  1 root root    1079 Out 18  2017 libglade-compat32-2.6.4-x86_64-5compat32
-rw-r--r--  1 root root   14857 Jan 25  2018 libgnome-2.32.1-x86_64-2_SBo
-rw-r--r--  1 root root   10758 Jul 30 21:51 libgnome-keyring-3.12.0-x86_64-1
-rw-r--r--  1 root root    3627 Jul  7  2017 libgpg-error-1.23-x86_64-1
-rw-r--r--  1 root root    1179 Out 18  2017 libgpg-error-compat32-1.23-x86_64-1compat32
-rw-r--r--  1 root root   33429 Jul  7  2017 libgphoto2-2.5.10-x86_64-1
-rw-r--r--  1 root root    6932 Out 18  2017 libgphoto2-compat32-2.5.10-x86_64-1compat32
-rw-r--r--  1 root root    3630 Jul  7  2017 libgpod-0.8.3-x86_64-2
-rw-r--r--  1 root root    9977 Jul  7  2017 libgsf-1.14.36-x86_64-1
-rw-r--r--  1 root root   13991 Jul 22 17:44 libgtop-2.38.0-x86_64-1_SBo
-rw-r--r--  1 root root    1349 Jul  7  2017 libgudev-230-x86_64-1
-rw-r--r--  1 root root    1074 Out 18  2017 libgudev-compat32-230-x86_64-1compat32
-rw-r--r--  1 root root    1273 Jul  7  2017 libhangul-0.1.0-x86_64-1
-rw-r--r--  1 root root    3340 Jul  7  2017 libical-2.0.0-x86_64-1
-rw-r--r--  1 root root    1018 Jul  7  2017 libid3tag-0.15.1b-x86_64-4
-rw-r--r--  1 root root    1204 Jul  7  2017 libidl-0.8.14-x86_64-1
-rw-r--r--  1 root root    6371 Abr  3  2018 libidn-1.34-x86_64-1_slack14.2
-rw-r--r--  1 root root    1221 Out 18  2017 libidn-compat32-1.33-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1553 Ago 31  2017 libiec61883-1.2.0-x86_64-2_SBo
-rw-r--r--  1 root root    2986 Jul  7  2017 libieee1284-0.2.11-x86_64-3
-rw-r--r--  1 root root    1298 Out 18  2017 libieee1284-compat32-0.2.11-x86_64-3compat32
-rw-r--r--  1 root root     926 Ago  6 03:25 libilbc-2.0.2-x86_64-2_SBo
-rw-r--r--  1 root root    3114 Jul  7  2017 libimobiledevice-1.2.0-x86_64-1
-rw-r--r--  1 root root    9009 Set  2 14:08 libinput-1.14.1-x86_64-1_SBo
-rw-r--r--  1 root root    1858 Jul  7  2017 libiodbc-3.52.10-x86_64-2
-rw-r--r--  1 root root    1277 Out 16  2018 libisofs-1.5.0-x86_64-1_SBo
-rw-r--r--  1 root root    1855 Jul  7  2017 libjpeg-turbo-1.5.0-x86_64-1
-rw-r--r--  1 root root    1460 Out 18  2017 libjpeg-turbo-compat32-1.5.0-x86_64-1compat32
-rw-r--r--  1 root root    1145 Jul  7  2017 libkarma-0.1.1-x86_64-2
-rw-r--r--  1 root root   11741 Jul 25  2017 libkate-0.4.1-x86_64-1_SBo
-rw-r--r--  1 root root    1668 Jul 22  2017 libkcddb-4.14.3-x86_64-2
-rw-r--r--  1 root root    1803 Jul 23  2017 libkexiv2-4.14.3-x86_64-2
-rw-r--r--  1 root root    1189 Jul  7  2017 libksba-1.3.3-x86_64-1
-rw-r--r--  1 root root    1575 Jul 23  2017 libkscreen-1.0.5-x86_64-2
-rw-r--r--  1 root root    1633 Jul  7  2017 liblastfm-1.0.9-x86_64-1
-rw-r--r--  1 root root    1258 Jul  7  2017 libmad-0.15.1b-x86_64-3
-rw-r--r--  1 root root    1935 Jan 23  2019 libmatroska-1.4.8-x86_64-1_SBo
-rw-r--r--  1 root root    2058 Jul  7  2017 libmbim-1.12.2-x86_64-2
-rw-r--r--  1 root root    1359 Jul  7  2017 libmcrypt-2.5.8-x86_64-1
-rw-r--r--  1 root root    1268 Jul  7  2017 libmcs-0.7.2-x86_64-1
-rw-r--r--  1 root root    4650 Ago  3 00:48 libmediainfo-19.04-x86_64-1_SBo
-rw-r--r--  1 root root     983 Fev 10  2018 libminizip-1.2.11-x86_64-1_SBo
-rw-r--r--  1 root root    1556 Jul  7  2017 libmng-2.0.3-x86_64-1
-rw-r--r--  1 root root    1118 Out 18  2017 libmng-compat32-2.0.3-x86_64-1compat32
-rw-r--r--  1 root root    1043 Jul  7  2017 libmnl-1.0.3-x86_64-1
-rw-r--r--  1 root root    1188 Jul 15  2017 libmodplug-0.8.9.0-x86_64-1_SBo
-rw-r--r--  1 root root    2286 Jul  7  2017 libmowgli-0.7.1-x86_64-1
-rw-r--r--  1 root root    1640 Ago 31  2017 libmp4v2-2.0.0-x86_64-1_SBo
-rw-r--r--  1 root root    1020 Jul  7  2017 libmpc-1.0.3-x86_64-1
-rw-r--r--  1 root root    1006 Out 18  2017 libmpc-compat32-1.0.3-x86_64-1compat32
-rw-r--r--  1 root root    1400 Jul 15  2017 libmpeg2-0.5.1-x86_64-1_SBo
-rw-r--r--  1 root root    1397 Jul  7  2017 libmsn-4.2.1-x86_64-2
-rw-r--r--  1 root root   10219 Set  3 16:45 libmspack-0.5alpha-x86_64-1_SBo
-rw-r--r--  1 root root    1757 Jul  7  2017 libmtp-1.1.11-x86_64-1
-rw-r--r--  1 root root     894 Jul  7  2017 libndp-1.6-x86_64-1
-rw-r--r--  1 root root    1029 Jul  7  2017 libnetfilter_acct-1.0.2-x86_64-1
-rw-r--r--  1 root root    1715 Jul  7  2017 libnetfilter_conntrack-1.0.5-x86_64-1
-rw-r--r--  1 root root    1274 Jul  7  2017 libnetfilter_cthelper-1.0.0-x86_64-1
-rw-r--r--  1 root root    1251 Jul  7  2017 libnetfilter_cttimeout-1.0.0-x86_64-1
-rw-r--r--  1 root root    1284 Jul  7  2017 libnetfilter_log-1.0.1-x86_64-1
-rw-r--r--  1 root root    1484 Jul  7  2017 libnetfilter_queue-1.0.2-x86_64-1
-rw-r--r--  1 root root    1178 Jul  7  2017 libnfnetlink-1.0.1-x86_64-1
-rw-r--r--  1 root root    1184 Jul  7  2017 libnftnl-1.0.6-x86_64-1
-rw-r--r--  1 root root    2340 Jul  7  2017 libnih-1.0.3-x86_64-2
-rw-r--r--  1 root root    8004 Jul  7  2017 libnjb-2.2.6-x86_64-5
-rw-r--r--  1 root root    2645 Jul  7  2017 libnl-1.1.4-x86_64-1
-rw-r--r--  1 root root    8972 Jul  7  2017 libnl3-3.2.27-x86_64-1
-rw-r--r--  1 root root    3628 Out 18  2017 libnl3-compat32-3.2.27-x86_64-1compat32
-rw-r--r--  1 root root    1904 Jul  7  2017 libnotify-0.7.6-x86_64-1
-rw-r--r--  1 root root    1034 Out 18  2017 libnotify-compat32-0.7.6-x86_64-1compat32
-rw-r--r--  1 root root    6884 Jul  8  2017 libobasis5.3-pt-BR-5.3.4.2-2.x86_64
-rw-r--r--  1 root root     714 Jul  8  2017 libobasis5.3-pt-BR-base-5.3.4.2-2.x86_64
-rw-r--r--  1 root root     573 Jul  8  2017 libobasis5.3-pt-BR-calc-5.3.4.2-2.x86_64
-rw-r--r--  1 root root     363 Jul  8  2017 libobasis5.3-pt-BR-math-5.3.4.2-2.x86_64
-rw-r--r--  1 root root    2496 Jul  8  2017 libobasis5.3-pt-BR-res-5.3.4.2-2.x86_64
-rw-r--r--  1 root root     376 Jul  8  2017 libobasis5.3-pt-BR-writer-5.3.4.2-2.x86_64
-rw-r--r--  1 root root    5567 Jul  7  2017 libodfgen-0.1.6-x86_64-1
-rw-r--r--  1 root root    4874 Jul  7  2017 libogg-1.3.2-x86_64-1
-rw-r--r--  1 root root     980 Out 18  2017 libogg-compat32-1.3.2-x86_64-1compat32
-rw-r--r--  1 root root    7309 Jul  7  2017 liboggz-1.1.1-x86_64-1
-rw-r--r--  1 root root    3777 Jul  7  2017 liboil-0.3.17-x86_64-1
-rw-r--r--  1 root root    3917 Jul 20 14:35 libopenshot-0.2.3-x86_64-1_SBo
-rw-r--r--  1 root root   62955 Jul 20 14:44 libopenshot-audio-0.1.8-x86_64-1_SBo
-rw-r--r--  1 root root    2024 Dez 31  2017 libotr-4.1.1-x86_64-1_SBo
-rw-r--r--  1 root root     963 Out 17  2018 libp11-0.4.9-x86_64-1_SBo
-rw-r--r--  1 root root    4098 Jul  7  2017 libpcap-1.8.1-x86_64-1_slack14.2
-rw-r--r--  1 root root    1088 Out 18  2017 libpcap-compat32-1.8.1-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1041 Jul  7  2017 libpciaccess-0.13.4-x86_64-1
-rw-r--r--  1 root root    1089 Out 18  2017 libpciaccess-compat32-0.13.4-x86_64-1compat32
-rw-r--r--  1 root root   12315 Jul 12  2017 libpeas-1.16.0-x86_64-1_SBo
-rw-r--r--  1 root root    1569 Nov 25  2017 libplist-2.0.0-x86_64-1_slack14.2
-rw-r--r--  1 root root    1460 Jul 19 20:30 libpng-1.6.37-x86_64-1_slack14.2
-rw-r--r--  1 root root    1239 Out 18  2017 libpng-compat32-1.6.27-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1051 Jul 25  2017 libpng-legacy12-1.2.57-x86_64-1_SBo
-rw-r--r--  1 root root    1928 Jul  7  2017 libproxy-0.4.12-x86_64-1
-rw-r--r--  1 root root   11242 Out 17  2018 libpst-0.6.72-x86_64-1_SBo
-rw-r--r--  1 root root     971 Jul  7  2017 libpthread-stubs-0.3-noarch-1
-rw-r--r--  1 root root    6585 Jul 11  2017 libpwquality-1.4.0-x86_64-1_SBo
-rw-r--r--  1 root root    2322 Jul  7  2017 libqmi-1.12.6-x86_64-1
-rw-r--r--  1 root root    6842 Set  3 17:48 libquicktime-1.2.4-x86_64-3_SBo
-rw-r--r--  1 root root    1322 Jul  7  2017 libraw1394-2.1.1-x86_64-1
-rw-r--r--  1 root root  977313 Set  4 22:12 libreoffice-6.3.0.4-x86_64-1
-rw-r--r--  1 root root  156697 Set  5 02:56 libreoffice-helppack_pt-BR-6.3.0.4-x86_64-1
-rw-r--r--  1 root root    4958 Set  5 02:22 libreoffice-langpack_pt-BR-6.3.0.4-x86_64-1
-rw-r--r--  1 root root     773 Jul 15  2017 libreplaygain-r475-x86_64-1_SBo
-rw-r--r--  1 root root    3637 Jul  7  2017 librevenge-0.0.4-x86_64-1
-rw-r--r--  1 root root    3092 Set 14  2018 librsvg-2.40.20-x86_64-1_slack14.2
-rw-r--r--  1 root root    2922 Jul  7  2017 libsamplerate-0.1.8-x86_64-1
-rw-r--r--  1 root root    1459 Out 18  2017 libsamplerate-compat32-0.1.8-x86_64-1compat32
-rw-r--r--  1 root root    2348 Jul 20 14:46 libseccomp-2.4.1-x86_64-1_SBo
-rw-r--r--  1 root root    9997 Jul  7  2017 libsecret-0.18.5-x86_64-1
-rw-r--r--  1 root root    1135 Jul 15  2017 libshout-2.3.1-x86_64-1_SBo
-rw-r--r--  1 root root    2989 Jul 15  2017 libsidplay2-2.1.1-x86_64-3_SBo
-rw-r--r--  1 root root    3900 Jul  7  2017 libsigc++-2.6.2-x86_64-1
-rw-r--r--  1 root root    1299 Jul  7  2017 libsigsegv-2.10-x86_64-1
-rw-r--r--  1 root root    2412 Jul  7  2017 libsndfile-1.0.26-x86_64-1
-rw-r--r--  1 root root    1384 Out 18  2017 libsndfile-compat32-1.0.26-x86_64-1compat32
-rw-r--r--  1 root root   13857 Ago 26  2017 libsoup-2.52.2-x86_64-3_slack14.2
-rw-r--r--  1 root root    2577 Fev  4  2018 libspatialindex-1.7.1-x86_64-1_SBo
-rw-r--r--  1 root root    1948 Fev  4  2018 libspatialite-4.2.0-x86_64-1_SBo
-rw-r--r--  1 root root    1398 Jul  7  2017 libspectre-0.2.7-x86_64-1
-rw-r--r--  1 root root    1423 Out 17  2018 libssh-0.7.6-x86_64-1_slack14.2
-rw-r--r--  1 root root    8185 Jul 19 20:30 libssh2-1.8.2-x86_64-1_slack14.2
-rw-r--r--  1 root root    3311 Jul 25  2017 libtar-1.2.20-x86_64-1_SBo
-rw-r--r--  1 root root    2785 Jul  7  2017 libtasn1-4.8-x86_64-1
-rw-r--r--  1 root root    1215 Out 18  2017 libtasn1-compat32-4.8-x86_64-1compat32
-rw-r--r--  1 root root    1125 Jul  7  2017 libtermcap-1.2.3-x86_64-7
-rw-r--r--  1 root root     978 Out 18  2017 libtermcap-compat32-1.2.3-x86_64-7compat32
-rw-r--r--  1 root root    1590 Jul  7  2017 libtheora-1.1.1-x86_64-1
-rw-r--r--  1 root root    3626 Nov 23  2018 libtiff-4.0.10-x86_64-1_slack14.2
-rw-r--r--  1 root root    1494 Out 18  2017 libtiff-compat32-4.0.7-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    2838 Jul 19  2017 libtirpc-1.0.2-x86_64-1_slack14.2
-rw-r--r--  1 root root    1207 Out 18  2017 libtirpc-compat32-1.0.2-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    3164 Mar  8  2018 libtool-2.4.6-x86_64-5_slack14.2
-rw-r--r--  1 root root    1223 Out 18  2017 libtool-compat32-2.4.6-x86_64-4compat32
-rw-r--r--  1 root root   19312 Jul 21 20:59 libtorrent-rasterbar-1.1.12-x86_64-1_SBo
-rw-r--r--  1 root root     709 Out 19  2017 libtxc_dxtn-1.0.1-x86_64-1_SBo
-rw-r--r--  1 root root    2429 Jul  9  2017 libunique-1.1.6-x86_64-5_SBo
-rw-r--r--  1 root root    2823 Jul  7  2017 libunistring-0.9.3-x86_64-1
-rw-r--r--  1 root root    1094 Out 18  2017 libunistring-compat32-0.9.3-x86_64-1compat32
-rw-r--r--  1 root root    2013 Mar 17  2018 libupnp-1.8.3-x86_64-2_SBo
-rw-r--r--  1 root root    1006 Jul  7  2017 libusb-1.0.20-x86_64-1
-rw-r--r--  1 root root    1192 Jul  7  2017 libusb-compat-0.1.5-x86_64-2
-rw-r--r--  1 root root     948 Out 18  2017 libusb-compat32-1.0.20-x86_64-1compat32
-rw-r--r--  1 root root     977 Jul  7  2017 libusbmuxd-1.0.10-x86_64-1
-rw-r--r--  1 root root    2315 Jul  7  2017 libva-1.6.2-x86_64-1
-rw-r--r--  1 root root    1728 Out 18  2017 libva-compat32-1.6.2-x86_64-1compat32
-rw-r--r--  1 root root    1038 Jul  7  2017 libva-intel-driver-1.6.2-x86_64-1
-rw-r--r--  1 root root    1157 Out 18  2017 libva-intel-driver-compat32-1.6.2-x86_64-1compat32
-rw-r--r--  1 root root    1349 Jul  7  2017 libvdpau-1.1.1-x86_64-1
-rw-r--r--  1 root root    1250 Out 18  2017 libvdpau-compat32-1.1.1-x86_64-1compat32
-rw-r--r--  1 root root   31952 Jul  7  2017 libvisio-0.1.5-x86_64-1
-rw-r--r--  1 root root    3604 Jul  7  2017 libvisual-0.4.0-x86_64-3
-rw-r--r--  1 root root   24250 Jul  7  2017 libvisual-plugins-0.4.0-x86_64-2
-rw-r--r--  1 root root    1392 Dez  4  2017 libvncserver-0.9.10-x86_64-2
-rw-r--r--  1 root root    8753 Mar 22  2018 libvorbis-1.3.6-x86_64-1_slack14.2
-rw-r--r--  1 root root    1409 Out 18  2017 libvorbis-compat32-1.3.5-x86_64-1compat32
-rw-r--r--  1 root root    6397 Jul  7  2017 libvpx-1.5.0-x86_64-1
-rw-r--r--  1 root root   12654 Set  2 14:08 libwacom-1.0-x86_64-1_SBo
-rw-r--r--  1 root root    3753 Set  2 04:32 libwebp-1.0.3-x86_64-1_SBo
-rw-r--r--  1 root root   14643 Mai  3  2018 libwmf-0.2.8.4-x86_64-7_slack14.2
-rw-r--r--  1 root root   12256 Jul  7  2017 libwmf-docs-0.2.8.4-noarch-6
-rw-r--r--  1 root root   12594 Jul  7  2017 libwnck-2.31.0-x86_64-2
-rw-r--r--  1 root root    1113 Jul  7  2017 libwpd-0.10.1-x86_64-1
-rw-r--r--  1 root root    7170 Jul  7  2017 libwpg-0.3.1-x86_64-1
-rw-r--r--  1 root root    2831 Jul 22 17:06 libwww-perl-6.13-x86_64-1_SBo
-rw-r--r--  1 root root     756 Jul  7  2017 libx86-1.1-x86_64-2
-rw-r--r--  1 root root  118180 Jul  7  2017 libxcb-1.11.1-x86_64-1
-rw-r--r--  1 root root    3218 Out 18  2017 libxcb-compat32-1.11.1-x86_64-1compat32
-rw-r--r--  1 root root   11754 Jul 29  2017 libxfce4ui-4.12.1-x86_64-2
-rw-r--r--  1 root root    9239 Jul 29  2017 libxfce4util-4.12.1-x86_64-2
-rw-r--r--  1 root root    4789 Jul 20 14:56 libxkbcommon-0.8.4-x86_64-1_SBo
-rw-r--r--  1 root root    1208 Jul  7  2017 libxkbfile-1.0.9-x86_64-1
-rw-r--r--  1 root root    2234 Jul  7  2017 libxklavier-5.4-x86_64-1
-rw-r--r--  1 root root   17271 Set 24  2017 libxml2-2.9.5-x86_64-1_slack14.2
-rw-r--r--  1 root root    1609 Out 18  2017 libxml2-compat32-2.9.4-x86_64-2compat32
-rw-r--r--  1 root root     976 Jul  7  2017 libxshmfence-1.2-x86_64-2
-rw-r--r--  1 root root    1048 Out 18  2017 libxshmfence-compat32-1.2-x86_64-2compat32
-rw-r--r--  1 root root    7271 Jul  7  2017 libxslt-1.1.29-x86_64-1
-rw-r--r--  1 root root    1263 Out 18  2017 libxslt-compat32-1.1.29-x86_64-1compat32
-rw-r--r--  1 root root    5353 Jul  7  2017 libyaml-0.1.6-x86_64-1
-rw-r--r--  1 root root   16426 Ago  3 00:37 libzen-0.4.37-x86_64-1_SBo
-rw-r--r--  1 root root    4339 Set 24  2017 libzip-1.0.1-x86_64-3_slack14.2
-rw-r--r--  1 root root   12099 Set  2 03:46 liferea-1.12.7-x86_64-1_SBo
-rw-r--r--  1 root root    5077 Jul  7  2017 lilo-24.2-x86_64-2
-rw-r--r--  1 root root   30493 Dez  9  2018 linkchecker-9.3-x86_64-2_SBo
-rw-r--r--  1 root root    1498 Jul  7  2017 links-2.12-x86_64-2
-rw-r--r--  1 root root    3850 Jul  7  2017 linux-faqs-20060228-noarch-1
-rw-r--r--  1 root root   18146 Jul  7  2017 linux-howtos-20160401-noarch-1
-rw-r--r--  1 root root  342989 Jul  7  2017 linuxdoc-tools-0.9.69-x86_64-5
-rw-r--r--  1 root root     729 Jul  7  2017 listres-1.0.3-x86_64-2
-rw-r--r--  1 root root   10112 Set  2 17:08 live555-2019.08.28-x86_64-1_SBo
-rw-r--r--  1 root root   70063 Out 17  2018 llvm-3.8.0-x86_64-2
-rw-r--r--  1 root root   12793 Out 18  2017 llvm-compat32-3.8.0-x86_64-2compat32
-rw-r--r--  1 root root    2342 Jul  7  2017 lm_sensors-3.4.0-x86_64-1
-rw-r--r--  1 root root     784 Jul  7  2017 lndir-1.0.3-x86_64-2
-rw-r--r--  1 root root    1148 Jul  7  2017 logrotate-3.8.9-x86_64-1
-rw-r--r--  1 root root    2728 Jul  7  2017 loudmouth-1.5.3-x86_64-1_slack14.2
-rw-r--r--  1 root root    1848 Jul  7  2017 lrzip-0.621-x86_64-1
-rw-r--r--  1 root root    2768 Fev 13  2018 lshw-B.02.18-x86_64-1_SBo
-rw-r--r--  1 root root    1039 Jul  7  2017 lsof-4.89-x86_64-1
-rw-r--r--  1 root root     914 Jul  7  2017 lsscsi-0.28-x86_64-1
-rw-r--r--  1 root root    2835 Jul  8  2017 lua-5.1.5-x86_64-1_SBo
-rw-r--r--  1 root root    2228 Set 16  2018 luajit-2.0.5-x86_64-2_SBo
-rw-r--r--  1 root root     826 Jul  7  2017 luit-1.1.1-x86_64-2
-rw-r--r--  1 root root    9043 Jul 14  2017 lv2-1.12.0-x86_64-1_SBo
-rw-r--r--  1 root root    3938 Jul  7  2017 lvm2-2.02.154-x86_64-1
-rw-r--r--  1 root root    8723 Fev 13  2019 lxc-2.0.9_d3a03247-x86_64-1_slack14.2
-rw-r--r--  1 root root   10375 Out 17  2017 lxdm-20170805_e3e7517-x86_64-1_SBo
-rw-r--r--  1 root root    7249 Nov 24  2018 lxml-4.2.5-x86_64-1_SBo
-rw-r--r--  1 root root    4505 Jul 20 15:03 lynis-2.7.5-x86_64-1_SBo
-rw-r--r--  1 root root    8609 Jul  7  2017 lynx-2.8.8rel.2-x86_64-3_slack14.2
-rw-r--r--  1 root root     973 Jul  7  2017 lzip-1.16-x86_64-1
-rw-r--r--  1 root root    1242 Jul  7  2017 lzo-2.09-x86_64-1
-rw-r--r--  1 root root     885 Out 18  2017 lzo-compat32-2.09-x86_64-1compat32
-rw-r--r--  1 root root   14183 Jul  7  2017 m17n-lib-1.6.1-x86_64-1
-rw-r--r--  1 root root    2984 Jul  7  2017 m4-1.4.17-x86_64-1
-rw-r--r--  1 root root    1484 Jul  7  2017 madplay-0.15.2b-x86_64-4
-rw-r--r--  1 root root    1119 Jul  7  2017 mailx-12.5-x86_64-2
-rw-r--r--  1 root root    3635 Jul  7  2017 make-4.1-x86_64-2
-rw-r--r--  1 root root     864 Jul  7  2017 makedepend-1.0.5-x86_64-2
-rw-r--r--  1 root root   89331 Jan 25  2019 mame-0.205-x86_64-1_SBo
-rw-r--r--  1 root root    5063 Jul  7  2017 man-1.6g-x86_64-3
-rw-r--r--  1 root root   68703 Jul  7  2017 man-pages-4.06-noarch-1
-rw-r--r--  1 root root   20697 Jul 19 20:58 mariadb-10.0.38-x86_64-2_slack14.2
-rw-r--r--  1 root root    3513 Out 18  2017 mariadb-compat32-10.0.32-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root   13952 Jul  7  2017 mc-4.8.16-x86_64-2
-rw-r--r--  1 root root   16777 Jul  7  2017 mcabber-1.0.5-x86_64-1_slack14.2
-rw-r--r--  1 root root    1584 Jul  7  2017 mcelog-128-x86_64-1
-rw-r--r--  1 root root    1272 Jul  7  2017 mdadm-3.3.4-x86_64-1
-rw-r--r--  1 root root    1577 Jul 19  2017 mdbtools-0.5-x86_64-1_SBo
-rw-r--r--  1 root root   13720 Jul  7  2017 media-player-info-18-noarch-1
-rw-r--r--  1 root root     809 Ago  3 00:49 mediainfo-19.04-x86_64-1_SBo
-rw-r--r--  1 root root   12879 Jul 31 00:55 meld-1.8.6-x86_64-1_SBo
-rw-r--r--  1 root root     950 Jul 20 15:03 memtest86+-5.01-i486-1_SBo
-rw-r--r--  1 root root   46962 Ago 26  2017 mercurial-4.3.1-x86_64-1_slack14.2
-rw-r--r--  1 root root    5298 Jul  7  2017 mesa-11.2.2-x86_64-1
-rw-r--r--  1 root root    2768 Out 18  2017 mesa-compat32-11.2.2-x86_64-1compat32
-rw-r--r--  1 root root   18995 Jul 21 21:06 meson-0.51.0-x86_64-1_SBo
-rw-r--r--  1 root root    2304 Jul  7  2017 metamail-2.7-x86_64-5
-rw-r--r--  1 root root    1366 Jul  7  2017 mhash-0.9.9.9-x86_64-3
-rw-r--r--  1 root root   24344 Jul 20 15:22 minetest-5.0.1-x86_64-1_SBo
-rw-r--r--  1 root root    4590 Jul  7  2017 minicom-2.7.1-x86_64-1_slack14.2
-rw-r--r--  1 root root    6089 Set  3 17:51 mjpegtools-2.1.0-x86_64-1_SBo
-rw-r--r--  1 root root    1006 Jul  7  2017 mkcomposecache-1.2.1-x86_64-2
-rw-r--r--  1 root root     923 Jul  7  2017 mkfontdir-1.0.7-noarch-1
-rw-r--r--  1 root root     789 Jul  7  2017 mkfontscale-1.1.2-x86_64-2
-rw-r--r--  1 root root    1517 Jul  7  2017 mkinitrd-1.4.10-x86_64-1_slack14.2
-rw-r--r--  1 root root    4473 Jul 20 15:35 mkvtoolnix-34.0.0-x86_64-1_SBo
-rw-r--r--  1 root root   25591 Jul 20 15:41 mlt-6.16.0-x86_64-1_SBo
-rw-r--r--  1 root root    1207 Jul  7  2017 mm-1.4.2-x86_64-2
-rw-r--r--  1 root root    1534 Jul  7  2017 mobile-broadband-provider-info-20151214-x86_64-1
-rw-r--r--  1 root root    1991 Jul  7  2017 moc-2.5.1-x86_64-1
-rw-r--r--  1 root root   19324 Jan 14  2018 mod_perl-2.0.10-x86_64-1_SBo
-rw-r--r--  1 root root     919 Jul  7  2017 most-5.0.0a-x86_64-2
-rw-r--r--  1 root root   34930 Jul  7  2017 motif-2.3.5-x86_64-1
-rw-r--r--  1 root root    5994 Dez  4  2018 mozilla-nss-3.40.1-x86_64-1_slack14.2
-rw-r--r--  1 root root    1563 Jul  7  2017 mpfr-3.1.4-x86_64-1
-rw-r--r--  1 root root    2808 Jul  7  2017 mpg123-1.23.4-x86_64-1
-rw-r--r--  1 root root    1607 Out 18  2017 mpg123-compat32-1.23.4-x86_64-1compat32
-rw-r--r--  1 root root    1045 Set  3 17:51 mpgtx-1.3.1-x86_64-2_SBo
-rw-r--r--  1 root root     999 Dez 30  2018 mplayer-codecs64-20061022-x86_64-1_SBo
-rw-r--r--  1 root root    1276 Nov  4  2017 mplayerthumbs-4.14.3-x86_64-2
-rw-r--r--  1 root root    1060 Jul  7  2017 mt-st-0.9b-x86_64-2
-rw-r--r--  1 root root    1226 Jul  7  2017 mtdev-1.1.5-x86_64-1
-rw-r--r--  1 root root     833 Jul  7  2017 mtr-0.86-x86_64-1
-rw-r--r--  1 root root    1099 Jul  7  2017 mtx-1.3.12-x86_64-1
-rw-r--r--  1 root root    1196 Mai 20  2018 murrine-0.98.2-x86_64-2_SBo
-rw-r--r--  1 root root   47052 Out 21  2018 murrine-themes-2.98.11-noarch-1_SBo
-rw-r--r--  1 root root    1150 Jul 15  2017 musepack-tools-r475-x86_64-2_SBo
-rw-r--r--  1 root root   11100 Jan 20  2019 mutagen-1.42.0-x86_64-1_SBo
-rw-r--r--  1 root root    6143 Set 14  2018 mutt-1.10.1-x86_64-1_slack14.2
-rw-r--r--  1 root root     958 Jan 20  2019 mxml-2.12-x86_64-1_SBo
-rw-r--r--  1 root root   54181 Nov  5  2017 mypaint-1.2.0-x86_64-1_SBo
-rw-r--r--  1 root root    5964 Jul  7  2017 nano-2.6.0-x86_64-1
-rw-r--r--  1 root root   14577 Abr  3  2018 nas-1.9.4-x86_64-1_SBo
-rw-r--r--  1 root root     928 Jul  7  2017 nasm-2.13.01-x86_64-1_slack14.2
-rw-r--r--  1 root root    1805 Jul  7  2017 nc-1.10-x86_64-1
-rw-r--r--  1 root root    1124 Jul  7  2017 ncompress-4.2.4.4-x86_64-1
-rw-r--r--  1 root root    1484 Fev 27  2019 ncrack-0.6-x86_64-1_SBo
-rw-r--r--  1 root root   58393 Jul  7  2017 ncurses-5.9-x86_64-4
-rw-r--r--  1 root root    1662 Out 18  2017 ncurses-compat32-5.9-x86_64-4compat32
-rw-r--r--  1 root root    7843 Jul  7  2017 neon-0.30.1-x86_64-2
-rw-r--r--  1 root root    9071 Set  2  2017 nepomuk-core-4.14.3-x86_64-2
-rw-r--r--  1 root root   26213 Jul  7  2017 net-snmp-5.7.3-x86_64-3
-rw-r--r--  1 root root    1595 Jul  7  2017 net-tools-1.60.20120726git-x86_64-1
-rw-r--r--  1 root root    3328 Dez 24  2018 netatalk-3.1.12-x86_64-1_slack14.2
-rw-r--r--  1 root root    1027 Jul  7  2017 netdate-bsd4-x86_64-1
-rw-r--r--  1 root root     984 Jul  7  2017 netkit-bootparamd-0.17-x86_64-2
-rw-r--r--  1 root root     981 Jul  7  2017 netkit-ntalk-0.17-x86_64-3
-rw-r--r--  1 root root    1089 Jul  7  2017 netkit-routed-0.17-x86_64-1
-rw-r--r--  1 root root    1046 Jul  7  2017 netkit-rsh-0.17-x86_64-1
-rw-r--r--  1 root root    1211 Jul  7  2017 netkit-rusers-0.17-x86_64-1
-rw-r--r--  1 root root     935 Jul  7  2017 netkit-rwall-0.17-x86_64-1
-rw-r--r--  1 root root    1222 Jul  7  2017 netkit-rwho-0.17-x86_64-2
-rw-r--r--  1 root root     853 Jul  7  2017 netkit-timed-0.17-x86_64-1
-rw-r--r--  1 root root   20417 Jul  7  2017 netpbm-10.66.02-x86_64-4
-rw-r--r--  1 root root    1574 Jul  7  2017 netpipes-4.2-x86_64-1
-rw-r--r--  1 root root    3039 Dez  7  2018 nettle-3.4.1-x86_64-1_slack14.2
-rw-r--r--  1 root root    1290 Out 18  2017 nettle-compat32-3.2-x86_64-1compat32
-rw-r--r--  1 root root     991 Jul  7  2017 netwatch-1.3.1_2-x86_64-1
-rw-r--r--  1 root root   16744 Out 29  2017 network-manager-applet-1.8.4-x86_64-1_slack14.2
-rw-r--r--  1 root root    1339 Jul  7  2017 network-scripts-14.2-noarch-1
-rw-r--r--  1 root root     953 Jul  7  2017 netwrite-0.17-x86_64-1
-rw-r--r--  1 root root     968 Jul  7  2017 newspost-2.1.1-x86_64-1
-rw-r--r--  1 root root    8251 Jul  7  2017 newt-0.52.19-x86_64-1
-rw-r--r--  1 root root     842 Jul  7  2017 nfacct-1.0.1-x86_64-1
-rw-r--r--  1 root root    1833 Jul  7  2017 nfs-utils-1.3.3-x86_64-2
-rw-r--r--  1 root root    1132 Jul  7  2017 nftables-0.6-x86_64-1
-rw-r--r--  1 root root    1202 Jul 26 15:00 ninja-1.9.0-x86_64-1_SBo
-rw-r--r--  1 root root   49258 Jul  7  2017 nmap-7.12-x86_64-1
-rw-r--r--  1 root root    2261 Jul  7  2017 nn-6.7.3-x86_64-3
-rw-r--r--  1 root root    1491 Jul  7  2017 normalize-0.7.7-x86_64-2
-rw-r--r--  1 root root    1524 Jul  7  2017 notify-python-0.1.1-x86_64-5
-rw-r--r--  1 root root    3319 Jul  7  2017 ntfs-3g-2016.2.22-x86_64-1
-rw-r--r--  1 root root   22871 Mar 10  2019 ntp-4.2.8p13-x86_64-1_slack14.2
-rw-r--r--  1 root root    3035 Jul 20 15:46 numactl-2.0.12-x86_64-1_SBo
-rw-r--r--  1 root root   13242 Mai  4  2018 numix-gtk-theme-20171027-noarch-1_SBo
-rw-r--r--  1 root root   42892 Set 16  2018 numpy-1.14.3-x86_64-1_SBo
-rw-r--r--  1 root root     762 Jul  7  2017 oclock-1.0.3-x86_64-2
-rw-r--r--  1 root root    1097 Mar  5  2019 odt2txt-0.5-x86_64-1_SBo
-rw-r--r--  1 root root    1042 Ago  8 16:16 ogmtools-1.5-x86_64-1_SBo
-rw-r--r--  1 root root   11196 Jul 23  2017 okular-4.14.3-x86_64-2
-rw-r--r--  1 root root    1409 Ago  6 01:56 opencore-amr-0.1.5-x86_64-1_SBo
-rw-r--r--  1 root root  809148 Ago 19 20:37 opencv-4.1.1-x86_64-2_SBo
-rw-r--r--  1 root root    5235 Out  2  2017 openexr-2.2.0-x86_64-2_slack14.2
-rw-r--r--  1 root root   62261 Fev  9  2019 openjdk-7u201-x86_64-1_SBo
-rw-r--r--  1 root root   63519 Set  2 02:35 openjdk7-7u221-x86_64-1_SBo
-rw-r--r--  1 root root    2010 Jul 19 20:30 openjpeg-2.3.1-x86_64-1_slack14.2
-rw-r--r--  1 root root    1711 Out 18  2017 openjpeg-compat32-2.1.0-x86_64-1compat32
-rw-r--r--  1 root root    3240 Jul  7  2017 openldap-client-2.4.42-x86_64-1
-rw-r--r--  1 root root    1527 Out 18  2017 openldap-client-compat32-2.4.42-x86_64-1compat32
-rw-r--r--  1 root root   26867 Set  2 04:18 openmpi-4.0.1-x86_64-2_SBo
-rw-r--r--  1 root root    4319 Jul  7  2017 openobex-1.7.1-x86_64-1
-rw-r--r--  1 root root  157559 Jul 22 20:09 openshot-2.4.4-x86_64-1_SBo
-rw-r--r--  1 root root    2059 Mar  8  2018 openssh-7.4p1-x86_64-2_slack14.2
-rw-r--r--  1 root root   36936 Jul 19 20:30 openssl-1.0.2s-x86_64-1_slack14.2
-rw-r--r--  1 root root    1732 Out 18  2017 openssl-compat32-1.0.2k-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    1575 Jul 19 20:30 openssl-solibs-1.0.2s-x86_64-1_slack14.2
-rw-r--r--  1 root root    1242 Out 18  2017 openssl-solibs-compat32-1.0.2k-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root    3675 Mai  3  2018 openvpn-2.4.6-x86_64-1_slack14.2
-rw-r--r--  1 root root   11822 Jul  7  2017 oprofile-1.1.0-x86_64-1
-rw-r--r--  1 root root    7507 Jul 20 16:46 opus-1.3.1-x86_64-1_SBo
-rw-r--r--  1 root root    8586 Jul 29  2017 orage-4.12.1-x86_64-3
-rw-r--r--  1 root root    4114 Jul  7  2017 orc-0.4.24-x86_64-1
-rw-r--r--  1 root root    1195 Out 18  2017 orc-compat32-0.4.24-x86_64-1compat32
-rw-r--r--  1 root root    2783 Jul  7  2017 os-prober-1.70-x86_64-1
-rw-r--r--  1 root root    4021 Nov 24  2018 ostree-2018.9-x86_64-1_SBo
-rw-r--r--  1 root root    1914 Jul  7  2017 oxygen-gtk2-1.4.6-x86_64-2
-rw-r--r--  1 root root  412338 Jul  7  2017 oxygen-icons-4.14.3-x86_64-2
-rw-r--r--  1 root root    3770 Jul  7  2017 p11-kit-0.23.2-x86_64-1
-rw-r--r--  1 root root    1392 Out 18  2017 p11-kit-compat32-0.23.2-x86_64-1compat32
-rw-r--r--  1 root root    1783 Jul  7  2017 p2c-1.21alpha2-x86_64-3
-rw-r--r--  1 root root    6006 Jul  8  2017 p7zip-16.02-x86_64-2_SBo
-rw-r--r--  1 root root     665 Jul  7  2017 pamixer-1.3.1-x86_64-1
-rw-r--r--  1 root root    6589 Jul  7  2017 pango-1.38.1-x86_64-1
-rw-r--r--  1 root root    1622 Out 18  2017 pango-compat32-1.38.1-x86_64-1compat32
-rw-r--r--  1 root root    4006 Jul  7  2017 pangomm-2.38.1-x86_64-1
-rw-r--r--  1 root root    1167 Nov 20  2017 pangox-compat-0.0.2-x86_64-1_SBo
-rw-r--r--  1 root root    7407 Ago  6 04:13 parole-0.9.1-x86_64-1_SBo
-rw-r--r--  1 root root    5074 Jul  8  2017 partclone-0.2.80-x86_64-1_SBo
-rw-r--r--  1 root root    4294 Jul  7  2017 parted-3.2-x86_64-2
-rw-r--r--  1 root root    2675 Jul  8  2017 partimage-0.6.9-x86_64-1_SBo
-rw-r--r--  1 root root    1043 Mai  3  2018 patch-2.7.6-x86_64-1_slack14.2
-rw-r--r--  1 root root    4725 Jul  7  2017 pavucontrol-3.0-x86_64-1
-rw-r--r--  1 root root    1325 Jul  7  2017 pciutils-3.4.1-x86_64-2
-rw-r--r--  1 root root    1526 Jul  7  2017 pcmciautils-018-x86_64-1
-rw-r--r--  1 root root    5577 Jul  7  2017 pcre-8.39-x86_64-1
-rw-r--r--  1 root root    9946 Set  8 18:24 pcre2-10.33-x86_64-1_SBo
-rw-r--r--  1 root root    3004 Jul 20 16:48 pcsxr-1.9.93-x86_64-3_SBo
-rw-r--r--  1 root root    2624 Ago 14 16:33 pdftk-2.02-x86_64-1_SBo
-rw-r--r--  1 root root  103257 Jul  7  2017 perl-5.22.2-x86_64-1
-rw-r--r--  1 root root    2116 Out 17  2017 perl-Archive-Zip-1.59-x86_64-1_SBo
-rw-r--r--  1 root root    1040 Jul 22 17:05 perl-IO-HTML-1.001-x86_64-1_SBo
-rw-r--r--  1 root root    1798 Jul 22 17:04 perl-IO-Socket-SSL-2.066-x86_64-1_SBo
-rw-r--r--  1 root root    1144 Jul 20 16:52 perl-JSON-4.02-x86_64-1_SBo
-rw-r--r--  1 root root    1149 Jul 22 17:10 perl-LWP-Protocol-https-6.07-x86_64-1_SBo
-rw-r--r--  1 root root    1121 Jul 22 17:04 perl-Mozilla-CA-20130114-x86_64-1_SBo
-rw-r--r--  1 root root    1169 Jul 22 17:04 perl-Net-LibIDN-0.12-x86_64-1_SBo
-rw-r--r--  1 root root    1324 Jul 22 17:04 perl-Test-RequiresInternet-0.05-x86_64-1_SBo
-rw-r--r--  1 root root    1006 Jan 20  2019 perl-Text-CSV-1.99-x86_64-1_SBo
-rw-r--r--  1 root root    1283 Set 17  2018 perl-Time-Piece-1.33-x86_64-1_SBo
-rw-r--r--  1 root root    1270 Jan 14  2018 perl-XML-LibXSLT-1.95-x86_64-1_SBo
-rw-r--r--  1 root root    1437 Jul 13  2017 perl-cairo-1.106-x86_64-1_SBo
-rw-r--r--  1 root root    1014 Jul 22 17:05 perl-encode-locale-1.05-x86_64-1_SBo
-rw-r--r--  1 root root    1026 Jul 22 17:05 perl-file-listing-6.04-x86_64-1_SBo
-rw-r--r--  1 root root    4582 Set  2 14:10 perl-glib-1.3291-x86_64-1_SBo
-rw-r--r--  1 root root   32219 Set  2 14:14 perl-gtk2-1.24993-x86_64-1_SBo
-rw-r--r--  1 root root    1840 Jul 22 17:05 perl-html-parser-3.71-x86_64-1_SBo
-rw-r--r--  1 root root     971 Jul 22 17:05 perl-html-tagset-3.20-x86_64-1_SBo
-rw-r--r--  1 root root    1290 Jul 22 17:05 perl-http-cookies-6.01-x86_64-1_SBo
-rw-r--r--  1 root root    1110 Jul 22 17:05 perl-http-daemon-6.01-x86_64-1_SBo
-rw-r--r--  1 root root     972 Jul 22 17:05 perl-http-date-6.02-x86_64-1_SBo
-rw-r--r--  1 root root    1727 Jul 22 17:05 perl-http-message-6.11-x86_64-1_SBo
-rw-r--r--  1 root root    1111 Jul 22 17:05 perl-http-negotiate-6.01-x86_64-1_SBo
-rw-r--r--  1 root root    1190 Jul 22 17:05 perl-lwp-mediatypes-6.02-x86_64-1_SBo
-rw-r--r--  1 root root    1251 Jul 22 17:05 perl-net-http-6.09-x86_64-1_SBo
-rw-r--r--  1 root root    6091 Jul 13  2017 perl-pango-1.227-x86_64-2_SBo
-rw-r--r--  1 root root    1314 Jul 22 17:04 perl-www-robotrules-6.02-x86_64-1_SBo
-rw-r--r--  1 root root    4624 Jan 14  2018 perl-xml-libxml-2.0107-x86_64-1_SBo
-rw-r--r--  1 root root    2553 Jul 30 23:00 pexpect-4.6.0-x86_64-1_SBo
-rw-r--r--  1 root root    8475 Jul  7  2017 phonon-4.8.3-x86_64-2
-rw-r--r--  1 root root    1983 Jul  7  2017 phonon-gstreamer-4.8.2-x86_64-1
-rw-r--r--  1 root root   25359 Fev 10  2019 php-5.6.40-x86_64-1_slack14.2
-rw-r--r--  1 root root  203971 Fev  9  2019 phpmyadmin-4.8.5-noarch-1_SBo
-rw-r--r--  1 root root    1277 Jul  7  2017 pidentd-3.0.19-x86_64-2
-rw-r--r--  1 root root   54653 Jul  7  2017 pidgin-2.12.0-x86_64-1_slack14.2
-rw-r--r--  1 root root    3594 Dez 31  2017 pidgin-otr-4.0.2-x86_64-1_SBo
-rw-r--r--  1 root root    1484 Dez 31  2017 pidgin-privacy-please-0.7.1-x86_64-1_SBo
-rw-r--r--  1 root root    4585 Dez 29  2017 pidgin-sipe-1.23.0-x86_64-1_SBo
-rw-r--r--  1 root root    1544 Dez 31  2017 pidgin-skypeweb-1.2.2-x86_64-1_SBo
-rw-r--r--  1 root root    1214 Dez 14  2017 pidgin-whatsapp-0.8.6-x86_64-1_SBo
-rw-r--r--  1 root root    5907 Jul  7  2017 pilot-link-0.12.5-x86_64-10
-rw-r--r--  1 root root    1041 Jul  7  2017 pinentry-0.9.7-x86_64-1
-rw-r--r--  1 root root     984 Jul  7  2017 pixman-0.34.0-x86_64-1
-rw-r--r--  1 root root    1017 Out 18  2017 pixman-compat32-0.34.0-x86_64-1compat32
-rw-r--r--  1 root root    1264 Jul  7  2017 pkg-config-0.29.2-x86_64-1_slack14.2
-rw-r--r--  1 root root    4837 Jul  7  2017 pkgtools-14.2-noarch-10
-rw-r--r--  1 root root   28954 Nov 26  2017 playonlinux-4.2.10-noarch-1_SBo
-rw-r--r--  1 root root    3526 Jul  7  2017 pm-utils-1.4.1-x86_64-5
-rw-r--r--  1 root root    1159 Jul  7  2017 pmake-1.111-x86_64-3
-rw-r--r--  1 root root    6617 Jul 23 14:47 podofo-0.9.5-x86_64-2_SBo
-rw-r--r--  1 root root    7249 Jul  7  2017 polkit-0.113-x86_64-2
-rw-r--r--  1 root root    6355 Jul  7  2017 polkit-gnome-0.105-x86_64-1
-rw-r--r--  1 root root    2652 Jul  7  2017 polkit-qt-1-0.103.0-x86_64-1
-rw-r--r--  1 root root    1092 Jul  7  2017 popa3d-1.0.3-x86_64-1
-rw-r--r--  1 root root 1036239 Jul 23 16:05 popcorntime-0.3.10-x86_64-1_SBo
-rw-r--r--  1 root root   10214 Jul  7  2017 poppler-0.45.0-x86_64-1
-rw-r--r--  1 root root   13034 Jul  7  2017 poppler-data-0.4.7-noarch-1
-rw-r--r--  1 root root    4208 Jul  7  2017 popt-1.16-x86_64-2
-rw-r--r--  1 root root    1223 Out 18  2017 popt-compat32-1.16-x86_64-2compat32
-rw-r--r--  1 root root    2271 Ago 19 20:38 portaudio-v190600_20161030-x86_64-1_SBo
-rw-r--r--  1 root root  128134 Fev 23  2018 postgresql-10.2-x86_64-1_SBo
-rw-r--r--  1 root root    2080 Jul  7  2017 powertop-2.8-x86_64-1
-rw-r--r--  1 root root    4663 Jul  7  2017 ppp-2.4.7-x86_64-1
-rw-r--r--  1 root root     883 Jul  7  2017 presentproto-1.0-x86_64-2
-rw-r--r--  1 root root     961 Jul  7  2017 printproto-1.0.5-noarch-1
-rw-r--r--  1 root root    4891 Mar  4  2019 privoxy-3.0.28-x86_64-1_SBo
-rw-r--r--  1 root root    2030 Jul  7  2017 procmail-3.22-x86_64-2
-rw-r--r--  1 root root    5952 Mai 23  2018 procps-ng-3.3.15-x86_64-1_slack14.2
-rw-r--r--  1 root root    2127 Out 17  2018 proj-5.2.0-x86_64-1_SBo
-rw-r--r--  1 root root   20631 Jul 25  2017 projectM-2.1.0-x86_64-1_SBo
-rw-r--r--  1 root root    2385 Jul  7  2017 pssh-2.3.1-x86_64-1
-rw-r--r--  1 root root    5163 Jul 20 16:55 psycopg2-2.8.3-x86_64-1_SBo
-rw-r--r--  1 root root    1388 Jul  7  2017 pth-2.0.7-x86_64-1
-rw-r--r--  1 root root    2354 Jul 30 23:00 ptyprocess-0.6.0-x86_64-1_SBo
-rw-r--r--  1 root root   15641 Jul  7  2017 pulseaudio-9.0-x86_64-1
-rw-r--r--  1 root root    6138 Out 18  2017 pulseaudio-compat32-9.0-x86_64-1compat32
-rw-r--r--  1 root root    1299 Fev 25  2018 purple-facebook-0.9.5_9ff9acf9fa14-x86_64-1_SBo
-rw-r--r--  1 root root    1337 Dez  5  2018 pv-1.6.6-x86_64-1_SBo
-rw-r--r--  1 root root    6378 Fev  9  2018 py3cairo-1.10.0-x86_64-3_SBo
-rw-r--r--  1 root root    1287 Jul  7  2017 pycairo-1.10.0-x86_64-1
-rw-r--r--  1 root root     925 Jul  7  2017 pycups-1.9.73-x86_64-1
-rw-r--r--  1 root root    3302 Jul  7  2017 pycurl-7.43.0-x86_64-1
-rw-r--r--  1 root root   10051 Jul  7  2017 pygobject-2.28.6-x86_64-2
-rw-r--r--  1 root root    5783 Jul  7  2017 pygobject3-3.18.2-x86_64-1
-rw-r--r--  1 root root    7533 Fev  9  2018 pygobject3-python3-3.18.2-x86_64-1_SBo
-rw-r--r--  1 root root   35261 Jul  7  2017 pygtk-2.24.0-x86_64-2
-rw-r--r--  1 root root    2285 Jul 11  2017 pygtksourceview-2.10.1-x86_64-1_SBo
-rw-r--r--  1 root root    1602 Fev  6  2018 pyorbit-2.24.0-x86_64-1_SBo
-rw-r--r--  1 root root    7058 Jul  7  2017 pyrex-0.9.9-x86_64-2
-rw-r--r--  1 root root  260086 Dez 25  2018 pysolfc-2.4.0-x86_64-2_SBo
-rw-r--r--  1 root root    1871 Fev  4  2018 pyspatialite-3.0.1_alpha_0-x86_64-1_SBo
-rw-r--r--  1 root root  259157 Mar  6  2019 python-2.7.16-x86_64-1_slack14.2
-rw-r--r--  1 root root    1793 Set  8 18:24 python-certifi-2019.6.16-x86_64-2_SBo
-rw-r--r--  1 root root   12610 Set  1  2017 python-chardet-3.0.4-x86_64-1_SBo
-rw-r--r--  1 root root    3821 Nov 24  2018 python-dateutil-2.7.5-x86_64-1_SBo
-rw-r--r--  1 root root    3045 Jul 30 22:59 python-distutils-extra-2.39-x86_64-1_SBo
-rw-r--r--  1 root root    4820 Set 14  2018 python-evdev-1.1.2-x86_64-1_SBo
-rw-r--r--  1 root root   12026 Jul  7  2017 python-pillow-3.0.0-x86_64-1
-rw-r--r--  1 root root    8803 Jul 20 16:57 python-requests-2.22.0-x86_64-1_SBo
-rw-r--r--  1 root root   10203 Jul  7  2017 python-setuptools-22.0.5-x86_64-1
-rw-r--r--  1 root root   17332 Jul 20 16:58 python-urllib3-1.25.2-x86_64-1_SBo
-rw-r--r--  1 root root    3195 Out 17  2018 python-webencodings-0.5.1-x86_64-2_SBo
-rw-r--r--  1 root root    1519 Jul 22 15:57 python2-sip-4.19.6-x86_64-4_SBo
-rw-r--r--  1 root root  548480 Mar  8  2019 python3-3.7.2-x86_64-1_SBo
-rw-r--r--  1 root root   53084 Jul 20 17:00 python3-Cython-0.29.6-x86_64-1_SBo
-rw-r--r--  1 root root   46528 Jul 22 20:05 python3-PyQt5-5.9.2-x86_64-1_SBo
-rw-r--r--  1 root root    3404 Jul 20 17:02 python3-PyYAML-3.13-x86_64-1_SBo
-rw-r--r--  1 root root   21735 Ago 19 20:39 python3-pyzmq-18.1.0-x86_64-1_SBo
-rw-r--r--  1 root root    1381 Jul 22 19:11 python3-sip-4.19.6-x86_64-1_SBo
-rw-r--r--  1 root root   40981 Mar 24  2018 pytz-2018.3-x86_64-1_SBo
-rw-r--r--  1 root root    8260 Set 14  2018 pyudev-0.21.0-x86_64-1_SBo
-rw-r--r--  1 root root    1450 Fev  6  2018 pywebkitgtk-1.1.8-x86_64-2_SBo
-rw-r--r--  1 root root    4009 Jul 30 23:00 pyxdg-0.26-x86_64-1_SBo
-rw-r--r--  1 root root    4004 Jan 26  2019 qbittorrent-3.3.16-x86_64-1_SBo
-rw-r--r--  1 root root    2335 Fev 20  2018 qca-2.1.1-x86_64-2
-rw-r--r--  1 root root   11271 Set  2 17:33 qemu-4.1.0-x86_64-1_SBo
-rw-r--r--  1 root root    1109 Jul  7  2017 qimageblitz-0.0.6-x86_64-1
-rw-r--r--  1 root root    1571 Jul  7  2017 qjson-0.8.1-x86_64-1
-rw-r--r--  1 root root    5628 Out 19  2018 qmmp-0.11.3-x86_64-1_SBo
-rw-r--r--  1 root root    1275 Out 19  2018 qmmp-plugin-pack-0.11.3-x86_64-1_SBo
-rw-r--r--  1 root root    2367 Jul  7  2017 qpdf-6.0.0-x86_64-1
-rw-r--r--  1 root root    1058 Out 21  2018 qrencode-4.0.2-x86_64-1_SBo
-rw-r--r--  1 root root  252611 Set  3  2017 qt-4.8.7-x86_64-4
-rw-r--r--  1 root root  240910 Out 18  2017 qt-compat32-4.8.7-x86_64-4compat32
-rw-r--r--  1 root root    6601 Jul  7  2017 qt-gstreamer-1.2.0-x86_64-1
-rw-r--r--  1 root root  540645 Jul 22 15:34 qt5-5.9.8-x86_64-2_SBo
-rw-r--r--  1 root root    7300 Out 20  2018 qt5-webkit-5.9.0-x86_64-1_SBo
-rw-r--r--  1 root root    1487 Jul  7  2017 qtscriptgenerator-0.2.0-x86_64-2
-rw-r--r--  1 root root    2425 Jul  7  2017 quota-4.03-x86_64-1
-rw-r--r--  1 root root    2980 Fev  3  2018 qwt-6.0.1-x86_64-1-sl
-rw-r--r--  1 root root   91565 Jan 20  2019 qwt-6.1.4-x86_64-1_SBo
-rw-r--r--  1 root root   21976 Out 17  2018 qwtpolar-1.1.1-x86_64-2_SBo
-rw-r--r--  1 root root     689 Jul  7  2017 radeontool-1.6.3-x86_64-1
-rw-r--r--  1 root root     880 Jul  7  2017 randrproto-1.5.0-noarch-1
-rw-r--r--  1 root root    7569 Jul  7  2017 raptor2-2.0.15-x86_64-2
-rw-r--r--  1 root root     825 Out 17  2017 rar-5.5.0-x86_64-1_SBo
-rw-r--r--  1 root root     831 Jul  8  2017 rarcrack-0.2-x86_64-1_SBo
-rw-r--r--  1 root root    3732 Jul  7  2017 rasqal-0.9.30-x86_64-1
-rw-r--r--  1 root root    1219 Jul  7  2017 rcs-5.9.4-x86_64-1
-rw-r--r--  1 root root     843 Jul  7  2017 rdist-6.1.5-x86_64-2
-rw-r--r--  1 root root    1589 Jul  7  2017 readline-6.3-x86_64-2
-rw-r--r--  1 root root    1169 Out 18  2017 readline-compat32-6.3-x86_64-2compat32
-rw-r--r--  1 root root     765 Out 17  2017 reaver-1.6.1-x86_64-1_SBo
-rw-r--r--  1 root root    1221 Jul  7  2017 recordproto-1.14.2-noarch-1
-rw-r--r--  1 root root    5546 Jul  7  2017 redland-1.0.16-x86_64-1
-rw-r--r--  1 root root    1242 Jul  7  2017 reiserfsprogs-3.6.24-x86_64-1
-rw-r--r--  1 root root   11774 Mai  4  2018 remmina-next20180405-x86_64-1_SBo
-rw-r--r--  1 root root     862 Jul  7  2017 rendercheck-1.5-x86_64-1
-rw-r--r--  1 root root     986 Jul  7  2017 renderproto-0.11.1-noarch-1
-rw-r--r--  1 root root    1056 Jul  7  2017 resourceproto-1.2.0-noarch-1
-rw-r--r--  1 root root     689 Jul  7  2017 rfkill-0.5-x86_64-1
-rw-r--r--  1 root root     781 Jul  7  2017 rgb-1.0.6-x86_64-2
-rw-r--r--  1 root root   47374 Jul 12  2017 rhythmbox-3.2.1-x86_64-1_SBo
-rw-r--r--  1 root root    6671 Jul 20 17:05 ristretto-0.8.4-x86_64-1_SBo
-rw-r--r--  1 root root    2569 Mai  4  2018 rkhunter-1.4.6-x86_64-1_SBo
-rw-r--r--  1 root root   58151 Dez  7  2018 rocksndiamonds-3.3.0.1-x86_64-1_SBo
-rw-r--r--  1 root root    1731 Jul  7  2017 rp-pppoe-3.12-x86_64-1
-rw-r--r--  1 root root    1168 Jul 19  2017 rpcbind-0.2.4-x86_64-2_slack14.2
-rw-r--r--  1 root root   13800 Jul  7  2017 rpm-4.12.0.1-x86_64-1
-rw-r--r--  1 root root     776 Jul  7  2017 rpm2tgz-1.2.2-x86_64-1
-rw-r--r--  1 root root    2078 Fev  2  2018 rsync-3.1.3-x86_64-1_slack14.2
-rw-r--r--  1 root root    1386 Jul 15  2017 rtmpdump-20151223_fa8646d-x86_64-1_SBo
-rw-r--r--  1 root root  940619 Abr  3  2018 ruby-2.2.10-x86_64-1_slack14.2
-rw-r--r--  1 root root  188102 Jul 18  2017 rubygem-sass-3.4.22-x86_64-1_SBo
-rw-r--r--  1 root root    1936 Jul  7  2017 rxvt-2.7.10-x86_64-5_slack14.2
-rw-r--r--  1 root root     624 Jul  7  2017 rzip-2.1-x86_64-1
-rw-r--r--  1 root root   53193 Dez  2  2018 samba-4.6.16-x86_64-2_slack14.2
-rw-r--r--  1 root root   27721 Out 18  2017 samba-compat32-4.4.15-x86_64-1_slack14.2compat32
-rw-r--r--  1 root root   18828 Jul  7  2017 sane-1.0.25-x86_64-2
-rw-r--r--  1 root root    7437 Out 18  2017 sane-compat32-1.0.25-x86_64-2compat32
-rw-r--r--  1 root root    1499 Jul  7  2017 sazanami-fonts-ttf-20040629-noarch-1
-rw-r--r--  1 root root    1055 Jul  7  2017 sbc-1.3-x86_64-1
-rw-r--r--  1 root root    1092 Out 18  2017 sbc-compat32-1.3-x86_64-1compat32
-rw-r--r--  1 root root    1975 Jul  8  2017 sbopkg-0.38.1-noarch-1_wsr
-rw-r--r--  1 root root    1813 Jul 20 17:06 sbotools-2.7-noarch-1_SBo
-rw-r--r--  1 root root    1890 Dez 25  2018 sboui-2.0.1-x86_64-1_SBo
-rw-r--r--  1 root root     650 Jul  7  2017 sc-7.16-x86_64-4
-rw-r--r--  1 root root    1047 Jul  8  2017 scalpel-2.0-x86_64-1_SBo
-rw-r--r--  1 root root    5606 Set  3 17:13 schroedinger-1.0.11-x86_64-1_SBo
-rw-r--r--  1 root root    9072 Jul  7  2017 scim-1.4.17-x86_64-1_slack14.2
-rw-r--r--  1 root root    2585 Jul  7  2017 scim-anthy-1.2.7-x86_64-1
-rw-r--r--  1 root root    2364 Jul  7  2017 scim-hangul-0.4.0-x86_64-1
-rw-r--r--  1 root root    2218 Jul  7  2017 scim-input-pad-0.1.3.1-x86_64-1
-rw-r--r--  1 root root    1175 Jul  7  2017 scim-m17n-0.2.3-x86_64-1
-rw-r--r--  1 root root    2433 Jul  7  2017 scim-pinyin-0.5.92-x86_64-1
-rw-r--r--  1 root root    7024 Jul  7  2017 scim-tables-0.5.14.1-x86_64-1
-rw-r--r--  1 root root   24110 Jul  7  2017 scons-2.4.1-x86_64-1
-rw-r--r--  1 root root    2014 Jul  7  2017 screen-4.4.0-x86_64-2_slack14.2
-rw-r--r--  1 root root    1177 Jan 12  2018 screenfetch-3.8.0-noarch-1_SBo
-rw-r--r--  1 root root    1247 Jul  7  2017 scrnsaverproto-1.2.2-noarch-1
-rw-r--r--  1 root root   18421 Jul  7  2017 sdl-1.2.15-x86_64-5_slack14.2
-rw-r--r--  1 root root    1777 Out 18  2017 sdl-compat32-1.2.15-x86_64-5_slack14.2compat32
-rw-r--r--  1 root root    1153 Jul  7  2017 sdparm-1.10-x86_64-1
-rw-r--r--  1 root root    4627 Jul  7  2017 sed-4.2.2-x86_64-1
-rw-r--r--  1 root root     872 Jul  7  2017 seejpeg-1.10-x86_64-1
-rw-r--r--  1 root root    2735 Jul  7  2017 sendmail-8.15.2-x86_64-2
-rw-r--r--  1 root root    9651 Jul  7  2017 sendmail-cf-8.15.2-noarch-2
-rw-r--r--  1 root root    1149 Jul  7  2017 serf-1.3.8-x86_64-1
-rw-r--r--  1 root root     802 Jul  7  2017 sessreg-1.1.0-x86_64-2
-rw-r--r--  1 root root     836 Jul  7  2017 setxkbmap-1.3.1-x86_64-1
-rw-r--r--  1 root root    1855 Jul  7  2017 seyon-2.20c-x86_64-3
-rw-r--r--  1 root root    5389 Jul  7  2017 sg3_utils-1.42-x86_64-1
-rw-r--r--  1 root root   18970 Jul  7  2017 shadow-4.2.1-x86_64-1
-rw-r--r--  1 root root    3279 Jul  7  2017 shared-desktop-ontologies-0.11.0-x86_64-1
-rw-r--r--  1 root root    9123 Jul  7  2017 shared-mime-info-1.6-x86_64-1
-rw-r--r--  1 root root    4283 Jul  7  2017 sharutils-4.15.2-x86_64-1
-rw-r--r--  1 root root   18933 Nov 26  2018 shotcut-18.11.18-x86_64-1_SBo
-rw-r--r--  1 root root     767 Jul  7  2017 showfont-1.0.5-x86_64-2
-rw-r--r--  1 root root     868 Jul  7  2017 sinhala_lklug-font-ttf-20060929-noarch-1
-rw-r--r--  1 root root    3645 Jul  7  2017 sip-4.18-x86_64-1
-rw-r--r--  1 root root    1313 Dez 25  2018 six-1.12.0-x86_64-1_SBo
-rw-r--r--  1 root root    8107 Jan 20  2019 skypeforlinux-8.34.0.78-x86_64-1_SBo
-rw-r--r--  1 root root    1483 Nov 25  2018 slackpkg+-1.7.0-noarch-9mt
-rw-r--r--  1 root root    3464 Jul  7  2017 slackpkg-2.82.1-noarch-3
-rw-r--r--  1 root root    1528 Jul  7  2017 slacktrack-2.17-x86_64-1
-rw-r--r--  1 root root    5358 Jul  7  2017 slang-2.3.0-x86_64-1
-rw-r--r--  1 root root    1280 Jul  7  2017 slang1-1.4.9-x86_64-1
-rw-r--r--  1 root root    3844 Ago  3 19:21 sleuthkit-4.6.6-x86_64-1_SBo
-rw-r--r--  1 root root    1521 Dez  3  2018 slim-1.3.6-x86_64-2_SBo
-rw-r--r--  1 root root    1162 Jul  7  2017 slocate-3.1-x86_64-4
-rw-r--r--  1 root root    3583 Jul  7  2017 slrn-1.0.2-x86_64-1
-rw-r--r--  1 root root    1842 Jul  7  2017 smartmontools-6.5-x86_64-1
-rw-r--r--  1 root root    1507 Dez  7  2018 smpeg-r389-x86_64-1_SBo
-rw-r--r--  1 root root   11067 Ago  6 03:59 smplayer-19.5.0-x86_64-1_SBo
-rw-r--r--  1 root root     729 Jul  7  2017 smproxy-1.0.6-x86_64-1
-rw-r--r--  1 root root    2994 Dez 25  2018 snes9x-1.57-x86_64-1_SBo
-rw-r--r--  1 root root   13412 Jul 24 20:20 snort-2.9.11.1-x86_64-2_SBo
-rw-r--r--  1 root root    2992 Jul  7  2017 snownews-1.5.12-x86_64-2
-rw-r--r--  1 root root     731 Jul  7  2017 soma-2.10.4-noarch-1
-rw-r--r--  1 root root    7776 Jul  7  2017 soprano-2.9.4-x86_64-1
-rw-r--r--  1 root root    2804 Jul  7  2017 sound-theme-freedesktop-0.7-noarch-1
-rw-r--r--  1 root root    1367 Jul 14  2017 soundtouch-1.9.2-x86_64-1_SBo
-rw-r--r--  1 root root    1149 Jul  7  2017 sox-14.4.2-x86_64-3
-rw-r--r--  1 root root    1499 Set  2 04:30 speedtest-cli-2.1.2-x86_64-1_SBo
-rw-r--r--  1 root root    1822 Out  4  2017 speex-1.2.0-x86_64-1_SBo
-rw-r--r--  1 root root    1076 Jul  7  2017 speexdsp-1.2rc3-x86_64-1
-rw-r--r--  1 root root     870 Out 18  2017 speexdsp-compat32-1.2rc3-x86_64-1compat32
-rw-r--r--  1 root root     938 Jul  7  2017 splitvt-1.6.5-x86_64-1
-rw-r--r--  1 root root    1227 Jul 23 16:08 sqlite-3.13.0-x86_64-1
-rw-r--r--  1 root root    1272 Out 18  2017 sqlite-compat32-3.13.0-x86_64-1compat32
-rw-r--r--  1 root root   34904 Jul 23 16:25 sqlite3-1.4.1-x86_64-1_SBo
-rw-r--r--  1 root root    1275 Jul 29  2017 squashfs-tools-4.3-x86_64-2_slack14.2
-rw-r--r--  1 root root    7387 Mai 28  2018 ssr-0.3.11-x86_64-1_SBo
-rw-r--r--  1 root root    1510 Jul  7  2017 startup-notification-0.12-x86_64-2
-rw-r--r--  1 root root    1135 Out 18  2017 startup-notification-compat32-0.12-x86_64-2compat32
-rw-r--r--  1 root root    1979 Jul 20 19:30 steam-1.0.0.61-x86_64-2_SBo
-rw-r--r--  1 root root    5349 Set 14  2018 stella-5.1.3-x86_64-1_SBo
-rw-r--r--  1 root root    1155 Jul  7  2017 strace-4.11-x86_64-1
-rw-r--r--  1 root root    5799 Jul  7  2017 strigi-0.7.8-x86_64-2
-rw-r--r--  1 root root    2173 Jul  7  2017 stunnel-5.35-x86_64-2_slack14.2
-rw-r--r--  1 root root   14368 Ago 26  2017 subversion-1.9.7-x86_64-1_slack14.2
-rw-r--r--  1 root root    5872 Jul  7  2017 sudo-1.8.20p2-x86_64-1_slack14.2
-rw-r--r--  1 root root   10861 Jul  7  2017 svgalib-1.9.25-x86_64-3
-rw-r--r--  1 root root    1175 Out 18  2017 svgalib-compat32-1.9.25-x86_64-3compat32
-rw-r--r--  1 root root    6627 Set  2  2017 swfdec-0.9.2-x86_64-1_SBo
-rw-r--r--  1 root root  307583 Jul  7  2017 swig-3.0.7-x86_64-1
-rw-r--r--  1 root root    1365 Jul  7  2017 sysfsutils-2.1.0-x86_64-1
-rw-r--r--  1 root root    1449 Jul  7  2017 sysklogd-1.5.1-x86_64-2
-rw-r--r--  1 root root    4986 Jul  7  2017 syslinux-4.07-x86_64-1
-rw-r--r--  1 root root    5336 Jul  7  2017 sysstat-11.2.1.1-x86_64-1
-rw-r--r--  1 root root   15145 Jul  7  2017 system-config-printer-1.3.13-x86_64-2
-rw-r--r--  1 root root    1530 Jul  7  2017 sysvinit-2.88dsf-x86_64-4
-rw-r--r--  1 root root    1409 Jul  7  2017 sysvinit-functions-8.53-x86_64-2
-rw-r--r--  1 root root     955 Jul  7  2017 sysvinit-scripts-2.0-noarch-33
-rw-r--r--  1 root root    2270 Jul  7  2017 t1lib-5.1.2-x86_64-3
-rw-r--r--  1 root root    4460 Jul  7  2017 taglib-1.10-x86_64-1
-rw-r--r--  1 root root    1463 Jul  7  2017 taglib-extras-1.0.1-x86_64-1
-rw-r--r--  1 root root   64985 Jul  7  2017 tango-icon-theme-0.8.90-noarch-1
-rw-r--r--  1 root root    6238 Jul  7  2017 tango-icon-theme-extras-0.1.0-noarch-1
-rw-r--r--  1 root root    4724 Jul  7  2017 tar-1.29-x86_64-1
-rw-r--r--  1 root root   18234 Jul  7  2017 tcl-8.6.5-x86_64-2
-rw-r--r--  1 root root    1666 Jul  7  2017 tclx-8.4.1-x86_64-3
-rw-r--r--  1 root root    1496 Jul  7  2017 tcp_wrappers-7.6-x86_64-1
-rw-r--r--  1 root root     988 Set 24  2017 tcpdump-4.9.2-x86_64-1_slack14.2
-rw-r--r--  1 root root    2293 Jul  7  2017 tcsh-6.19.00-x86_64-1
-rw-r--r--  1 root root    1015 Jul  7  2017 telnet-0.17-x86_64-2
-rw-r--r--  1 root root   20918 Jul  7  2017 terminus-font-4.40-noarch-1
-rw-r--r--  1 root root    1825 Jul  8  2017 testdisk-7.0-x86_64-1_SBo
-rw-r--r--  1 root root  537383 Jul  7  2017 tetex-3.0-x86_64-10
-rw-r--r--  1 root root  205841 Jul  7  2017 tetex-doc-3.0-x86_64-10
-rw-r--r--  1 root root   29813 Jul  7  2017 texinfo-6.1-x86_64-1
-rw-r--r--  1 root root    6836 Jul  8  2017 thunar-archive-plugin-0.3.1-x86_64-1_SBo
-rw-r--r--  1 root root    1076 Nov 12  2018 thunar-sendto-clamtk-0.06-noarch-1_SBo
-rw-r--r--  1 root root    6905 Jul 29  2017 thunar-volman-0.8.1-x86_64-2
-rw-r--r--  1 root root    1078 Jul  7  2017 tibmachuni-font-ttf-1.901b-noarch-1
-rw-r--r--  1 root root    4035 Dez 10  2017 tigervnc-1.6.0-x86_64-3
-rw-r--r--  1 root root     852 Jul  7  2017 time-1.7-x86_64-1
-rw-r--r--  1 root root    3543 Jul  7  2017 tin-2.2.1-x86_64-3
-rw-r--r--  1 root root   15991 Jul  7  2017 tix-8.4.3-x86_64-3
-rw-r--r--  1 root root   12072 Jul  7  2017 tk-8.6.5-x86_64-2
-rw-r--r--  1 root root    1265 Jul  7  2017 tmux-2.1-x86_64-3
-rw-r--r--  1 root root    1094 Jul  8  2017 tolua++-1.0.93-x86_64-1_SBo
-rw-r--r--  1 root root    1802 Jul 20 14:00 tor-0.4.0.5-x86_64-1_SBo
-rw-r--r--  1 root root    1258 Dez 31  2017 torsocks-2.2.0-x86_64-1_SBo
-rw-r--r--  1 root root   12845 Jul 12  2017 totem-pl-parser-3.4.5-x86_64-1_SBo
-rw-r--r--  1 root root    1488 Jul  7  2017 traceroute-2.0.21-x86_64-1
-rw-r--r--  1 root root   15812 Jul 10  2017 transcode-1.1.7-x86_64-5_SBo
-rw-r--r--  1 root root    3626 Jul  7  2017 transfig-3.2.5e-x86_64-3
-rw-r--r--  1 root root    1101 Dez  6  2018 translate-shell-0.9.6.7-x86_64-1_SBo
-rw-r--r--  1 root root     914 Jul  7  2017 transset-1.0.1-x86_64-2
-rw-r--r--  1 root root    1498 Jul  8  2017 tre-0.8.0-x86_64-2_SBo
-rw-r--r--  1 root root     922 Jul  7  2017 tree-1.7.0-x86_64-1
-rw-r--r--  1 root root    1035 Jul  7  2017 trn-3.6-x86_64-2
-rw-r--r--  1 root root    4050 Jul  7  2017 ttf-indic-fonts-0.5.14-noarch-1
-rw-r--r--  1 root root     632 Jan 25  2018 ttygif-1.4.0-x86_64-1_SBo
-rw-r--r--  1 root root     907 Jan 25  2018 ttyrec-1.0.8-x86_64-1_SBo
-rw-r--r--  1 root root    9860 Nov  4  2017 tumbler-0.1.31-x86_64-8
-rw-r--r--  1 root root     853 Jul  7  2017 twm-1.0.9-x86_64-1
-rw-r--r--  1 root root    1998 Jul 14  2017 twolame-0.3.13-x86_64-1_SBo
-rw-r--r--  1 root root    3071 Jul  7  2017 udisks-1.0.5-x86_64-3
-rw-r--r--  1 root root   14575 Jul  7  2017 udisks2-2.1.5-x86_64-2
-rw-r--r--  1 root root    3219 Jul  7  2017 ulogd-2.0.5-x86_64-1
-rw-r--r--  1 root root   13972 Jul  7  2017 umbrello-4.14.3-x86_64-2
-rw-r--r--  1 root root    1097 Jul 20 17:11 unar-1.10.6-x86_64-1_SBo
-rw-r--r--  1 root root     772 Jul  7  2017 unarj-265-x86_64-1
-rw-r--r--  1 root root    4392 Set 14  2018 unetbootin-661-x86_64-1_SBo
-rw-r--r--  1 root root    2781 Set  1  2017 unittest-cpp-2.0.0-x86_64-1_SBo
-rw-r--r--  1 root root    5280 Dez  8  2018 unixODBC-2.3.4-x86_64-1_SBo
-rw-r--r--  1 root root    1277 Jul 31 00:46 unoconv-0.8.2-x86_64-1_SBo
-rw-r--r--  1 root root    5487 Mar 24  2018 unrar-5.6.1-x86_64-1_SBo
-rw-r--r--  1 root root    3598 Jul  7  2017 upower-0.9.23-x86_64-3
-rw-r--r--  1 root root    4515 Jul  7  2017 urwid-1.0.3-x86_64-1
-rw-r--r--  1 root root   16579 Jul  7  2017 usb_modeswitch-2.2.6-x86_64-1
-rw-r--r--  1 root root     887 Jul  7  2017 usbmuxd-1.1.0-x86_64-1
-rw-r--r--  1 root root    1013 Jul  7  2017 usbutils-008-x86_64-1
-rw-r--r--  1 root root     893 Jul  7  2017 utempter-1.1.6-x86_64-2
-rw-r--r--  1 root root   13490 Jul  7  2017 util-linux-2.27.1-x86_64-1
-rw-r--r--  1 root root    2601 Out 18  2017 util-linux-compat32-2.27.1-x86_64-1compat32
-rw-r--r--  1 root root     975 Jul  7  2017 util-macros-1.19.0-noarch-1
-rw-r--r--  1 root root    1452 Jul  7  2017 uucp-1.07-x86_64-1
-rw-r--r--  1 root root    8555 Jul  7  2017 v4l-utils-1.10.0-x86_64-1
-rw-r--r--  1 root root    2152 Out 18  2017 v4l-utils-compat32-1.10.0-x86_64-1compat32
-rw-r--r--  1 root root   16274 Dez  4  2017 vala-0.34.9-x86_64-1_SBo
-rw-r--r--  1 root root    2305 Out 17  2017 vamp-plugin-sdk-2.7.1-x86_64-1_SBo
-rw-r--r--  1 root root     767 Jul  7  2017 vbetool-1.2.2-x86_64-1
-rw-r--r--  1 root root    2024 Jul 25  2017 vcdimager-0.7.24-x86_64-1_SBo
-rw-r--r--  1 root root    1134 Jul  7  2017 videoproto-2.3.3-noarch-1
-rw-r--r--  1 root root    5490 Mai 20  2018 viewnior-1.7-x86_64-1_SBo
-rw-r--r--  1 root root     918 Jul  7  2017 viewres-1.0.4-x86_64-2
-rw-r--r--  1 root root   70858 Jul  7  2017 vim-7.4.1938-x86_64-1
-rw-r--r--  1 root root    1436 Jul  7  2017 vim-gvim-7.4.1938-x86_64-1
-rw-r--r--  1 root root    1225 Jul  9  2017 vinetto-0.07-x86_64-1_SBo
-rw-r--r--  1 root root   95765 Fev 13  2018 virtualbox-5.0.40-x86_64-1_SBo
-rw-r--r--  1 root root    3055 Fev 13  2018 virtualbox-extension-pack-5.0.40-x86_64-1_SBo
-rw-r--r--  1 root root    1110 Set  3 12:32 virtualbox-kernel-5.0.40_4.4.190-x86_64-2_SBo
-rw-r--r--  1 root root    8334 Jul  7  2017 virtuoso-ose-6.1.8-x86_64-3
-rw-r--r--  1 root root     850 Jul  7  2017 vlan-1.9-x86_64-2
-rw-r--r--  1 root root   63100 Ago 26 19:52 vlc-3.0.8-x86_64-1_SBo
-rw-r--r--  1 root root    1456 Set  2 04:29 vnstat-2.4-x86_64-1_SBo
-rw-r--r--  1 root root    3115 Jul  7  2017 vorbis-tools-1.4.0-x86_64-1
-rw-r--r--  1 root root   11930 Jul  7  2017 vte-0.28.2-x86_64-4
-rw-r--r--  1 root root   11101 Dez  4  2017 vte3-0.50.2-x86_64-1_SBo
-rw-r--r--  1 root root    1077 Ago 10 21:30 wavemon-0.9.0-x86_64-1_SBo
-rw-r--r--  1 root root    1150 Jul  7  2017 wavpack-4.75.2-x86_64-1
-rw-r--r--  1 root root   18706 Jul 26 17:22 webkit2gtk-2.20.5-x86_64-1_SBo
-rw-r--r--  1 root root   36622 Fev  6  2018 webkitgtk-2.4.11-x86_64-1_SBo
-rw-r--r--  1 root root    4710 Jul 19 20:30 wget-1.20.3-x86_64-1_slack14.2
-rw-r--r--  1 root root    1144 Jul  7  2017 which-2.21-x86_64-1
-rw-r--r--  1 root root    2310 Jul  7  2017 whois-5.2.12-x86_64-1
-rw-r--r--  1 root root    2258 Fev 14  2019 wifi-radar-2.0.s10-x86_64-2_SBo
-rw-r--r--  1 root root   22718 Jul  7  2017 windowmaker-0.95.7-x86_64-2
-rw-r--r--  1 root root  111802 Set  2 15:30 wine-4.0.2-x86_64-1_SBo
-rw-r--r--  1 root root    1311 Jul 20 17:50 winetricks-20190615-noarch-1_SBo
-rw-r--r--  1 root root    3137 Fev 28  2019 winff-20170714_220b212-x86_64-1_SBo
-rw-r--r--  1 root root    1017 Jul  9  2017 wipe-2.3.1-x86_64-2_SBo
-rw-r--r--  1 root root    1833 Jul  7  2017 wireless-tools-29-x86_64-9
-rw-r--r--  1 root root   53679 Jul 20 17:49 wireshark-3.0.3-x86_64-1_SBo
-rw-r--r--  1 root root    1256 Jul  9  2017 wkhtmltopdf-0.12.3.2-x86_64-1_SBo
-rw-r--r--  1 root root    1169 Jul 26 15:03 woff2-1.0.2-x86_64-1_SBo
-rw-r--r--  1 root root     621 Jul  7  2017 workbone-2.40-x86_64-4
-rw-r--r--  1 root root    3692 Out 24  2017 wpa_supplicant-2.6-x86_64-1_slack14.2
-rw-r--r--  1 root root    1555 Jul  7  2017 wqy-zenhei-font-ttf-0.8.38_1-noarch-2
-rw-r--r--  1 root root    1168 Jul  7  2017 wvdial-1.61-x86_64-2_SBo
-rw-r--r--  1 root root    9319 Jul  7  2017 wvstreams-4.6.1-x86_64-2_SBo
-rw-r--r--  1 root root   55977 Set  3 18:10 wxGTK3-3.0.4-x86_64-2_SBo
-rw-r--r--  1 root root  162297 Jul 25  2017 wxPython-2.8.12.1-x86_64-2_SBo
-rw-r--r--  1 root root    8169 Set  8 17:04 wxsvg-1.5.12-x86_64-1_SBo
-rw-r--r--  1 root root    1103 Jul  7  2017 x11-skel-7.7-x86_64-1
-rw-r--r--  1 root root     976 Jul  7  2017 x11-ssh-askpass-1.2.4.1-x86_64-2
-rw-r--r--  1 root root    1067 Jul  7  2017 x11perf-1.6.0-x86_64-1
-rw-r--r--  1 root root    1197 Set  3 17:14 x264-20170225-x86_64-1_SBo
-rw-r--r--  1 root root     911 Ago  3 19:53 x265-3.1.2-x86_64-1_SBo
-rw-r--r--  1 root root    3145 Jul  7  2017 x3270-3.3.12ga7-x86_64-2
-rw-r--r--  1 root root   10338 Jul  7  2017 xaos-3.6-x86_64-1
-rw-r--r--  1 root root   29982 Jul  7  2017 xapian-core-1.2.22-x86_64-1
-rw-r--r--  1 root root     686 Jul  7  2017 xauth-1.0.9-x86_64-2
-rw-r--r--  1 root root    3528 Jul 20 18:34 xawtv-3.106-x86_64-1_SBo
-rw-r--r--  1 root root     842 Jul  7  2017 xbacklight-1.2.1-x86_64-2
-rw-r--r--  1 root root     732 Jul  7  2017 xbiff-1.0.3-x86_64-2
-rw-r--r--  1 root root    3134 Jul  7  2017 xbitmaps-1.1.1-x86_64-2
-rw-r--r--  1 root root     742 Jul  7  2017 xcalc-1.0.6-x86_64-2
-rw-r--r--  1 root root    2798 Jul  7  2017 xcb-proto-1.11-x86_64-2
-rw-r--r--  1 root root    1164 Jul  7  2017 xcb-util-0.4.0-x86_64-2
-rw-r--r--  1 root root    1093 Out 18  2017 xcb-util-compat32-0.4.0-x86_64-2compat32
-rw-r--r--  1 root root    1042 Jul  7  2017 xcb-util-cursor-0.1.2-x86_64-2
-rw-r--r--  1 root root    1194 Jul  7  2017 xcb-util-errors-1.0-x86_64-1
-rw-r--r--  1 root root    1059 Jul  7  2017 xcb-util-image-0.4.0-x86_64-2
-rw-r--r--  1 root root    1033 Jul  7  2017 xcb-util-keysyms-0.4.0-x86_64-2
-rw-r--r--  1 root root    1151 Jul  7  2017 xcb-util-renderutil-0.3.9-x86_64-2
-rw-r--r--  1 root root    1092 Jul  7  2017 xcb-util-wm-0.4.1-x86_64-2
-rw-r--r--  1 root root    1046 Jul  7  2017 xclipboard-1.1.3-x86_64-2
-rw-r--r--  1 root root     861 Jul  7  2017 xclock-1.0.7-x86_64-2
-rw-r--r--  1 root root     931 Jul  7  2017 xcm-0.5.2-x86_64-2
-rw-r--r--  1 root root    1175 Jul  7  2017 xcmiscproto-1.2.2-noarch-1
-rw-r--r--  1 root root     838 Jul  7  2017 xcmsdb-1.0.5-x86_64-1
-rw-r--r--  1 root root     791 Jul  7  2017 xcompmgr-1.1.7-x86_64-1
-rw-r--r--  1 root root     774 Jul  7  2017 xconsole-1.0.6-x86_64-2
-rw-r--r--  1 root root    6670 Jul  7  2017 xcursor-themes-1.0.4-noarch-1
-rw-r--r--  1 root root     913 Jul  7  2017 xcursorgen-1.0.6-x86_64-3
-rw-r--r--  1 root root     752 Jul  7  2017 xdbedizzy-1.1.0-x86_64-2
-rw-r--r--  1 root root    8908 Jul  7  2017 xdg-user-dirs-0.15-x86_64-1
-rw-r--r--  1 root root    1482 Jul  7  2017 xdg-utils-1.1.1-noarch-1
-rw-r--r--  1 root root    1053 Jul  7  2017 xditview-1.0.4-x86_64-1
-rw-r--r--  1 root root    1390 Jul  7  2017 xdm-1.1.11-x86_64-6
-rw-r--r--  1 root root    1318 Fev 22  2018 xdotool-3.20160805.1-x86_64-1_SBo
-rw-r--r--  1 root root     841 Jul  7  2017 xdpyinfo-1.3.2-x86_64-1
-rw-r--r--  1 root root     869 Jul  7  2017 xdriinfo-1.0.5-x86_64-1
-rw-r--r--  1 root root    1824 Jul  7  2017 xedit-1.2.2-x86_64-2
-rw-r--r--  1 root root     939 Jul  7  2017 xev-1.2.2-x86_64-1
-rw-r--r--  1 root root    4504 Jul  7  2017 xextproto-7.3.0-x86_64-2
-rw-r--r--  1 root root     776 Jul  7  2017 xeyes-1.1.1-x86_64-2
-rw-r--r--  1 root root    1154 Jul  7  2017 xf86-input-acecad-1.5.0-x86_64-9
-rw-r--r--  1 root root    1355 Jul  7  2017 xf86-input-evdev-2.10.3-x86_64-1
-rw-r--r--  1 root root    1325 Jul  7  2017 xf86-input-joystick-1.6.1-x86_64-9
-rw-r--r--  1 root root    1173 Jul  7  2017 xf86-input-keyboard-1.8.1-x86_64-2
-rw-r--r--  1 root root    1241 Jul  7  2017 xf86-input-mouse-1.9.1-x86_64-4
-rw-r--r--  1 root root    1196 Jul  7  2017 xf86-input-penmount-1.5.0-x86_64-9
-rw-r--r--  1 root root    1554 Jul  7  2017 xf86-input-synaptics-1.8.3-x86_64-2
-rw-r--r--  1 root root    1634 Jul  7  2017 xf86-input-vmmouse-13.1.0-x86_64-4
-rw-r--r--  1 root root    1094 Jul  7  2017 xf86-input-void-1.4.0-x86_64-9
-rw-r--r--  1 root root    1715 Jul  7  2017 xf86-input-wacom-0.33.0-x86_64-1
-rw-r--r--  1 root root    1244 Jul  7  2017 xf86-video-amdgpu-1.1.0-x86_64-1
-rw-r--r--  1 root root    1092 Jul  7  2017 xf86-video-apm-1.2.5-x86_64-8
-rw-r--r--  1 root root    1039 Jul  7  2017 xf86-video-ark-0.7.5-x86_64-8
-rw-r--r--  1 root root    1053 Jul  7  2017 xf86-video-ast-1.1.5-x86_64-2
-rw-r--r--  1 root root    1206 Jul  7  2017 xf86-video-ati-7.7.0-x86_64-1
-rw-r--r--  1 root root    1135 Jul  7  2017 xf86-video-chips-1.2.6-x86_64-2
-rw-r--r--  1 root root    1402 Jul  7  2017 xf86-video-cirrus-1.5.3-x86_64-2
-rw-r--r--  1 root root    1053 Jul  7  2017 xf86-video-dummy-0.3.7-x86_64-5
-rw-r--r--  1 root root     987 Ago  3 22:30 xf86-video-fbdev-0.4.4-x86_64-4
-rw-r--r--  1 root root    1182 Jul  7  2017 xf86-video-glint-1.2.8-x86_64-8
-rw-r--r--  1 root root    1119 Jul  7  2017 xf86-video-i128-1.3.6-x86_64-8
-rw-r--r--  1 root root    1113 Jul  7  2017 xf86-video-i740-1.3.5-x86_64-3
-rw-r--r--  1 root root    1594 Jul  7  2017 xf86-video-intel-git_20160601_b617f80-x86_64-1
-rw-r--r--  1 root root    1105 Jul  7  2017 xf86-video-mach64-6.9.5-x86_64-2
-rw-r--r--  1 root root    1129 Jul  7  2017 xf86-video-mga-1.6.4-x86_64-3
-rw-r--r--  1 root root    1242 Jul  7  2017 xf86-video-neomagic-1.2.9-x86_64-2
-rw-r--r--  1 root root    1150 Jul  7  2017 xf86-video-nouveau-1.0.12-x86_64-1
-rw-r--r--  1 root root    1114 Jul  7  2017 xf86-video-nv-2.1.20-x86_64-9
-rw-r--r--  1 root root    1386 Jul  7  2017 xf86-video-openchrome-0.4.0-x86_64-1
-rw-r--r--  1 root root    1122 Jul  7  2017 xf86-video-r128-6.10.1-x86_64-1
-rw-r--r--  1 root root    1295 Jul  7  2017 xf86-video-rendition-4.2.6-x86_64-1
-rw-r--r--  1 root root    1076 Jul  7  2017 xf86-video-s3-0.6.5-x86_64-8
-rw-r--r--  1 root root    1226 Jul  7  2017 xf86-video-s3virge-1.10.7-x86_64-2
-rw-r--r--  1 root root    1158 Jul  7  2017 xf86-video-savage-2.3.8-x86_64-2
-rw-r--r--  1 root root    1311 Jul  7  2017 xf86-video-siliconmotion-1.7.8-x86_64-2
-rw-r--r--  1 root root    1099 Jul  7  2017 xf86-video-sis-0.10.8-x86_64-2
-rw-r--r--  1 root root    1157 Jul  7  2017 xf86-video-sisusb-0.9.6-x86_64-8
-rw-r--r--  1 root root    1107 Jul  7  2017 xf86-video-tdfx-1.4.6-x86_64-3
-rw-r--r--  1 root root    1046 Jul  7  2017 xf86-video-tga-1.2.2-x86_64-8
-rw-r--r--  1 root root    1179 Jul  7  2017 xf86-video-trident-1.3.7-x86_64-3
-rw-r--r--  1 root root    1136 Jul  7  2017 xf86-video-tseng-1.2.5-x86_64-8
-rw-r--r--  1 root root    1043 Jul  7  2017 xf86-video-v4l-0.2.0-x86_64-13
-rw-r--r--  1 root root    1115 Jul  7  2017 xf86-video-vesa-2.3.4-x86_64-2
-rw-r--r--  1 root root    1126 Jul  7  2017 xf86-video-vmware-13.1.0-x86_64-7
-rw-r--r--  1 root root    1191 Jul  7  2017 xf86-video-voodoo-1.2.5-x86_64-9
-rw-r--r--  1 root root    1084 Jul  7  2017 xf86-video-xgi-1.6.1-x86_64-2
-rw-r--r--  1 root root    1123 Jul  7  2017 xf86-video-xgixp-1.8.1-x86_64-8
-rw-r--r--  1 root root    1046 Jul  7  2017 xf86bigfontproto-1.2.0-noarch-1
-rw-r--r--  1 root root     806 Jul  7  2017 xf86dga-1.0.3-x86_64-2
-rw-r--r--  1 root root    1123 Jul  7  2017 xf86dgaproto-2.1-noarch-1
-rw-r--r--  1 root root    1006 Jul  7  2017 xf86driproto-2.1.1-noarch-1
-rw-r--r--  1 root root     977 Jul  7  2017 xf86miscproto-0.9.3-noarch-1
-rw-r--r--  1 root root    1115 Jul  7  2017 xf86vidmodeproto-2.3.1-noarch-1
-rw-r--r--  1 root root   10222 Jan 25  2018 xfburn-0.5.5-x86_64-1_SBo
-rw-r--r--  1 root root    7538 Jul 29  2017 xfce4-appfinder-4.12.0-x86_64-2
-rw-r--r--  1 root root    7957 Jul 29  2017 xfce4-clipman-plugin-1.2.6-x86_64-1
-rw-r--r--  1 root root    1313 Jul 29  2017 xfce4-dev-tools-4.12.0-x86_64-2
-rw-r--r--  1 root root    6402 Jul 29  2017 xfce4-notifyd-0.2.4-x86_64-3
-rw-r--r--  1 root root   14453 Jul 29  2017 xfce4-panel-4.12.0-x86_64-3
-rw-r--r--  1 root root   16440 Jul 29  2017 xfce4-power-manager-1.4.4-x86_64-4
-rw-r--r--  1 root root    2152 Jul 29  2017 xfce4-pulseaudio-plugin-0.2.4-x86_64-3
-rw-r--r--  1 root root    7763 Jul 29  2017 xfce4-screenshooter-1.8.2-x86_64-2
-rw-r--r--  1 root root   10123 Jul 29  2017 xfce4-session-4.12.1-x86_64-2
-rw-r--r--  1 root root    7995 Jul 29  2017 xfce4-settings-4.12.0-x86_64-3
-rw-r--r--  1 root root    6559 Jul 29  2017 xfce4-systemload-plugin-1.1.2-x86_64-2
-rw-r--r--  1 root root    6878 Jul 29  2017 xfce4-taskmanager-1.1.0-x86_64-2
-rw-r--r--  1 root root    9054 Jul 29  2017 xfce4-terminal-0.6.3-x86_64-2
-rw-r--r--  1 root root   25134 Out 29  2017 xfce4-weather-plugin-0.8.10-x86_64-1_slack14.2
-rw-r--r--  1 root root    8587 Mai 16  2018 xfce4-whiskermenu-plugin-1.7.5-x86_64-1_SBo
-rw-r--r--  1 root root    7519 Jul 29  2017 xfconf-4.12.0-x86_64-2
-rw-r--r--  1 root root     672 Jul  7  2017 xfd-1.1.2-x86_64-2
-rw-r--r--  1 root root    8237 Jul 29  2017 xfdesktop-4.12.3-x86_64-2
-rw-r--r--  1 root root  192015 Jul  7  2017 xfig-3.2.5c-x86_64-3
-rw-r--r--  1 root root     901 Jul  7  2017 xfontsel-1.0.5-x86_64-2
-rw-r--r--  1 root root    7955 Jul  7  2017 xfractint-20.04p13-x86_64-1
-rw-r--r--  1 root root     764 Jul  7  2017 xfs-1.1.4-x86_64-2
-rw-r--r--  1 root root    1714 Jul  7  2017 xfsdump-3.1.6-x86_64-1
-rw-r--r--  1 root root     902 Jul  7  2017 xfsinfo-1.0.5-x86_64-2
-rw-r--r--  1 root root    2621 Jul  7  2017 xfsprogs-4.3.0-x86_64-1
-rw-r--r--  1 root root   46857 Jul 29  2017 xfwm4-4.12.3-x86_64-1
-rw-r--r--  1 root root    1489 Jul  7  2017 xgames-0.3-x86_64-4
-rw-r--r--  1 root root     720 Jul  7  2017 xgamma-1.0.6-x86_64-1
-rw-r--r--  1 root root     716 Jul  7  2017 xgc-1.0.5-x86_64-1
-rw-r--r--  1 root root     707 Jul  7  2017 xhost-1.0.7-x86_64-1
-rw-r--r--  1 root root   11797 Jul  7  2017 xine-lib-1.2.6-x86_64-8
-rw-r--r--  1 root root    8140 Jul  7  2017 xine-ui-0.99.9-x86_64-1
-rw-r--r--  1 root root     980 Jul  7  2017 xineramaproto-1.2.1-noarch-1
-rw-r--r--  1 root root     894 Jul  7  2017 xinit-1.3.4-x86_64-2
-rw-r--r--  1 root root    1022 Jul  7  2017 xinput-1.6.2-x86_64-1
-rw-r--r--  1 root root     850 Jul  7  2017 xkbcomp-1.3.0-x86_64-2
-rw-r--r--  1 root root     769 Jul  7  2017 xkbevd-1.1.4-x86_64-1
-rw-r--r--  1 root root     734 Jul  7  2017 xkbprint-1.0.4-x86_64-1
-rw-r--r--  1 root root     825 Jul  7  2017 xkbutils-1.0.4-x86_64-2
-rw-r--r--  1 root root   14183 Jul  7  2017 xkeyboard-config-2.17-noarch-1
-rw-r--r--  1 root root     763 Jul  7  2017 xkill-1.0.4-x86_64-2
-rw-r--r--  1 root root     832 Jul  7  2017 xload-1.1.2-x86_64-2
-rw-r--r--  1 root root    1491 Jul  7  2017 xlockmore-5.46-x86_64-1
-rw-r--r--  1 root root     851 Jul  7  2017 xlogo-1.0.4-x86_64-2
-rw-r--r--  1 root root     837 Jul  7  2017 xlsatoms-1.1.2-x86_64-1
-rw-r--r--  1 root root     793 Jul  7  2017 xlsclients-1.1.3-x86_64-2
-rw-r--r--  1 root root     726 Jul  7  2017 xlsfonts-1.0.5-x86_64-1
-rw-r--r--  1 root root     681 Jul  7  2017 xmag-1.0.6-x86_64-1
-rw-r--r--  1 root root     864 Jul  7  2017 xman-1.1.4-x86_64-2
-rw-r--r--  1 root root     912 Jul  7  2017 xmessage-1.0.4-x86_64-2
-rw-r--r--  1 root root     744 Jul  7  2017 xmh-1.0.3-x86_64-1
-rw-r--r--  1 root root   11351 Jul 20 18:35 xmlsec-1.2.28-x86_64-1_SBo
-rw-r--r--  1 root root    8227 Jul  7  2017 xmms-1.2.11-x86_64-5
-rw-r--r--  1 root root     921 Jul  7  2017 xmodmap-1.0.9-x86_64-1
-rw-r--r--  1 root root     835 Jul  7  2017 xmore-1.0.2-x86_64-2
-rw-r--r--  1 root root    4805 Jul  7  2017 xorg-cf-files-1.0.6-x86_64-2
-rw-r--r--  1 root root    5148 Jul  7  2017 xorg-docs-1.7.1-noarch-1
-rw-r--r--  1 root root    7706 Out 24  2017 xorg-server-1.18.3-x86_64-5_slack14.2
-rw-r--r--  1 root root     712 Out 24  2017 xorg-server-xephyr-1.18.3-x86_64-5_slack14.2
-rw-r--r--  1 root root     933 Out 24  2017 xorg-server-xnest-1.18.3-x86_64-5_slack14.2
-rw-r--r--  1 root root    1027 Out 24  2017 xorg-server-xvfb-1.18.3-x86_64-5_slack14.2
-rw-r--r--  1 root root    1557 Jul  7  2017 xorg-sgml-doctools-1.11-x86_64-2
-rw-r--r--  1 root root    3750 Jan 20  2018 xpad-4.8.0-x86_64-1_SBo
-rw-r--r--  1 root root    9866 Jul  7  2017 xpaint-2.9.10.3-x86_64-1
-rw-r--r--  1 root root     664 Jul  7  2017 xpr-1.0.4-x86_64-2
-rw-r--r--  1 root root     773 Jul  7  2017 xprop-1.2.2-x86_64-2
-rw-r--r--  1 root root    1855 Jul  7  2017 xproto-7.0.29-noarch-1
-rw-r--r--  1 root root    4370 Jul  7  2017 xpyb-1.3.1-x86_64-3
-rw-r--r--  1 root root     691 Jul  7  2017 xrandr-1.5.0-x86_64-1
-rw-r--r--  1 root root     761 Jul  7  2017 xrdb-1.1.0-x86_64-2
-rw-r--r--  1 root root    3291 Dez  4  2017 xrdp-0.9.4-x86_64-1_SBo
-rw-r--r--  1 root root     822 Jul  7  2017 xrefresh-1.0.5-x86_64-2
-rw-r--r--  1 root root   11497 Jul  7  2017 xsane-0.999-x86_64-1
-rw-r--r--  1 root root     844 Jul  7  2017 xscope-1.4.1-x86_64-2
-rw-r--r--  1 root root   28718 Jul 19 20:31 xscreensaver-5.43-x86_64-1_slack14.2
-rw-r--r--  1 root root     680 Jul  7  2017 xset-1.2.3-x86_64-2
-rw-r--r--  1 root root     831 Jul  7  2017 xsetroot-1.1.1-x86_64-2
-rw-r--r--  1 root root     795 Jul  7  2017 xsm-1.0.3-x86_64-2
-rw-r--r--  1 root root     911 Jul  7  2017 xstdcmap-1.0.3-x86_64-2
-rw-r--r--  1 root root    1927 Jul  7  2017 xterm-325-x86_64-1
-rw-r--r--  1 root root    1393 Jul  7  2017 xtrans-1.3.5-noarch-1
-rw-r--r--  1 root root  330082 Mai 21  2018 xulrunner-41.0.2-x86_64-1_SBo
-rw-r--r--  1 root root     969 Jul  7  2017 xv-3.10a-x86_64-7
-rw-r--r--  1 root root    1185 Mar 24  2018 xvidcore-1.3.5-x86_64-1_SBo
-rw-r--r--  1 root root     790 Jul  7  2017 xvidtune-1.0.3-x86_64-2
-rw-r--r--  1 root root     724 Jul  7  2017 xvinfo-1.1.3-x86_64-1
-rw-r--r--  1 root root     706 Jul  7  2017 xwd-1.0.6-x86_64-2
-rw-r--r--  1 root root     733 Jul  7  2017 xwininfo-1.1.3-x86_64-2
-rw-r--r--  1 root root     666 Jul  7  2017 xwud-1.0.4-x86_64-2
-rw-r--r--  1 root root    3136 Jul  7  2017 xz-5.2.2-x86_64-1
-rw-r--r--  1 root root    1405 Out 18  2017 xz-compat32-5.2.2-x86_64-1compat32
-rw-r--r--  1 root root    2293 Jul  7  2017 yasm-1.3.0-x86_64-1
-rw-r--r--  1 root root    1447 Mai 20  2018 yelp-tools-3.18.0-x86_64-1_SBo
-rw-r--r--  1 root root    7535 Mai 20  2018 yelp-xsl-3.20.1-x86_64-1_SBo
-rw-r--r--  1 root root  240105 Set  8 18:25 youtube-dl-2019.09.01-x86_64-1_SBo
-rw-r--r--  1 root root    4468 Ago 10 21:54 youtube-dl-gui-0.3.8-x86_64-1_SBo
-rw-r--r--  1 root root    3307 Jul  7  2017 yptools-2.14-x86_64-7
-rw-r--r--  1 root root     819 Jul  7  2017 ytalk-3.3.0-x86_64-2
-rw-r--r--  1 root root    2190 Out 21  2018 zbar-0.10-x86_64-1_SBo
-rw-r--r--  1 root root    1615 Jul  7  2017 zd1211-firmware-1.4-fw-1
-rw-r--r--  1 root root   42722 Set 14  2018 zenity-3.28.0-x86_64-1_SBo
-rw-r--r--  1 root root   12025 Ago 10 21:49 zeromq-4.3.2-x86_64-1_SBo
-rw-r--r--  1 root root     988 Set 14  2018 zlib-1.2.11-x86_64-1_slack14.2
-rw-r--r--  1 root root     922 Out 18  2017 zlib-compat32-1.2.8-x86_64-1compat32
-rw-r--r--  1 root root     971 Jul  7  2017 zoo-2.10_22-x86_64-1
-rw-r--r--  1 root root   60994 Jan 19  2019 zsh-5.6.2-x86_64-1_slack14.2
-rw-r--r--  1 root root    2114 Jul 15  2017 zvbi-0.2.35-x86_64-1_SBo




Programas instalados no sistema (Manualmente)

# ls -la /opt/ > /tmp/programas.txt



# cat /tmp/programas.txt

total 977496
drwxr-xr-x 40 root     root       4096 Set  8 17:41 .
drwxr-xr-x 22 root     root       4096 Set  9 13:47 ..
-rwxr-xr-x  1 root     root     344352 Fev 27  2019 Ammyy Admin.tar.xz
drwxr-xr-x  2 root     root       4096 Mar 24  2018 DANFE View
drwxr-xr-x  2 root     root       4096 Nov 15  2018 Funções ZZ
drwxr-sr-x 26 root     root       4096 Dez 30  2018 MPlayer-1.3.0
-rwxr-xr-x  1 root     root   13278984 Dez 30  2018 MPlayer-1.3.0.tar.xz
drwxr-xr-x  5 root     root       4096 Fev  8  2018 MPxConverterL
drwxr-xr-x  4 root     root       4096 Jul 20 12:52 ProjectLibre
drwxr-xr-x  4 root     root       4096 Jan 25  2018 SweetHome3D
-rwxr-xr-x  1 root     root   65065260 Set 15  2018 SweetHome3D-5.7-linux-x64.tgz
drwxr-xr-x  2 root     root       4096 Set  5  2017 Telegram
drwxr-xr-x  3 root     root       4096 Mar  1  2019 Visualg
drwxr-xr-x  6 root     root       4096 Ago  4 19:24 anydesk
-rwxr-xr-x  1 root     root    4504909 Ago  4 19:03 anydesk-5.1.1-amd64.tar.gz
drwxr-xr-x  3 root     root       4096 Ago  3 16:01 dropbox
drwxr-xr-x  9 root     root       4096 Set  3 15:52 firefox
-rw-r--r--  1 fernando users  66899912 Set  3 15:50 firefox-69.0.tar.bz2
drwxr-xr-x  7 root     root      12288 Jun 22  2018 foo2zjs
-rwxr-xr-x  1 root     root    1747724 Mai 19  2018 foo2zjs.tar.gz
lrwxrwxrwx  1 root     root         15 Jul 20 13:52 frostwire -> frostwire-6.7.9
drwxr-xr-x  2 root     root       4096 Abr 10 22:31 frostwire-6.7.9
drwxr-xr-x  3 root     root       4096 Out 19  2018 genymobile
drwxr-xr-x  2 root     root       4096 Out 19  2018 genymotion
drwxr-xr-x  2 root     root       4096 Mar 26  2018 goldendict
drwxr-xr-x  3 root     root       4096 Jul 12 20:16 google
-rw-r--r--  1 fernando users  14120960 Ago 13 18:28 goonies.src_1.4.1528.tgz
drwxr-xr-x 10     1000  1000      4096 Set  5 19:34 hexchat-2.14.2
-rw-r--r--  1 fernando users   1288732 Set  5 11:46 hexchat-2.14.2.tar.xz
drwxr-xr-x  6 root     root       4096 Mar  8  2019 iron-linux-64
-rwxr-xr-x  1 root     root   99752783 Mar  8  2019 iron-linux-64.tar.gz
drwxr-xr-x  6 root     root       4096 Dez 19  2017 java
drwxr-xr-x  8 root     root       4096 Set  5  2017 jdk
-rwxr-xr-x  1 root     root  189736377 Out  9  2017 jdk-8u151-linux-x64.tar.gz
-rwxr-xr-x  1 root     root   80062269 Mar  5  2018 jre-8u161-linux-x64.tar.gz
drwxr-xr-x  2 root     root       4096 Fev 13  2019 kdenlive
drwxr-xr-x  2 root     root       4096 Ago  7 15:41 leocad
drwxr-xr-x  7 root     root       4096 Jun 16  2018 libextractor-1.6
drwxr-xr-x  2 root     root       4096 Set  5 11:27 libreoffice
drwxr-xr-x  7 root     root       4096 Ago  6 22:17 libreoffice6.3
drwxr-xr-x  2 root     root       4096 Mar 24  2018 litemanager
-rwxr-xr-x  1 root     root    1542891 Set  1  2018 maldetect-current.tar.gz
drwxr-xr-x  6 root     root       4096 Jul 20 12:47 master-pdf-editor-5
drwxr-xr-x  4 root     root       4096 Jul  4  2018 net.downloadhelper.coapp-1.2.4
-rwxr-xr-x  1 root     root   33078045 Set 12  2018 net.downloadhelper.coapp-1.2.4-1_amd64.tar.gz
-rwxr-xr-x  1 root     root  223882240 Set 29  2016 netbeans-8.2-linux.sh
-rwxr-xr-x  1 root     root   18231644 Dez 12  2018 otrs-6.0.tar.xz
drwxr-xr-x 13 root     root       4096 Mai 20  2018 parlatype
drwxr-xr-x  3 root     root       4096 Fev 11  2018 portugol
-rwxr-xr-x  1 root     root    2032036 Jan 26  2019 portugol23.zip
drwxr-xr-x  3 root     root       4096 Jul 23 16:03 share
drwxrwxr-x  7 root     users      4096 Ago  4 20:32 teamviewer
-rwxr-xr-x  1 root     root   12237660 Ago  4 19:42 teamviewer_14.4.2669_amd64.tar.xz
drwxr-xr-x 10 root     root       4096 Ago 26 18:36 thunderbird
-rw-r--r--  1 fernando users  54621669 Set  8 17:38 thunderbird-68.0.tar.bz2
drwxr-xr-x 10 root     root       4096 Dez 16  2017 tibia-11.30.4876
-rwxr-xr-x  1 root     root   69382232 Jan  1  2018 tor-browser-linux64-7.0.11_pt-BR.tar.xz
drwxr-xr-x  3 root     root       4096 Fev 11  2018 tor-browser_pt-BR
-rwxr-xr-x  1 root     root   30306844 Out 14  2017 tsetup.1.1.23.tar.xz
-rwxr-xr-x  1 root     root    7700269 Ago 15  2012 ultradefrag-5.0.0AB.7.zip
drwxr-xr-x  8 root     root       4096 Jan  6  2018 xmind
drwxr-xr-x  3 root     root       4096 Jan 23  2018 zandronum
-rwxr-xr-x  1 root     root   10863020 Set  1  2017 zandronum3.0-linux-x86_64.tar.bz2




" 35 100





# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Pasta-chamada-net-no-diretorio-raiz/?pagina=1
# https://www.vivaolinux.com.br/artigo/Configuracao-do-Autofs
# https://www.dicas-l.com.br/arquivo/usando_o_autofs_e_automunt.php
# https://www.ibm.com/developerworks/community/blogs/752a690f-8e93-4948-b7a3-c060117e8665/entry/dica_rapida_automount_mais_inteligente?lang=en


;;


72) 

# Configurando o Slackware como desktop (recomendações)

clear


dialog \
--title ''  \
--msgbox "

Configurando o Slackware como desktop (recomendações)


No Slackware, instalado 'full'


Desmistificando o Slackware Linux

https://rodrigolira.eti.br/desmistificando-o-slackware-linux-parte-02/



Bem, para começar o projeto está ativo e bem vivo, recebe atualizações constantes, podemos verificar isso dando uma olhada no changelogs do projeto.

http://www.slackware.com/changelog/




A compilação dos pacotes não é complicada, nem ter que resolver dependência é ruim. 
Desde que tenha tempo, a resolução das dependências não é um grande problema. Já se 
tiver um bom pc, melhor ainda. 

O maior empecilho que tive foi o kernel, pois o hardware é meio recente. 


Se precisar de um kernel mais recente, você poderá compilá-lo ou usar o 
Slackware Current. Pode ser que o Slackware novo demore a ser lançado, 
o Slackware só fica pronto quando está pronto.


No meu caso, não vou pro current porque prefiro algo mais estável (menos atualizações). 
Compilar o kernel, também não é uma opção para mim. Confio mais no kernel entregue 
pela distro oficialmente. 



Era Minimalista:


Interface grafica (Xfce, Fluxbox ou Mate)

Obs: Não uso KDE ou Gnome ... Acho Pesados



Gerenciador de login (Slim)


Gerenciador de boot (lilo)




Teste de HW (placa wireless, placa de video, teclado, mouse, verificar falta de firmware no sistema, impressora, scanner de mesa, placa de som, placa de rede, leitores ópticos)


https://www.hardware.com.br/guias/usando-slackware/placas-wireless.html

https://www.vivaolinux.com.br/artigo/Configurando-leitores-opticos-e-HDs




Programas:

plugins, codecs, java e afins instalados e devidamente configurados;


Java: https://www.java.com/pt_BR/download/

Para assistir DVDs, você vai precisar do pacote 'libdvdcss'. 



Fontes do Windows ($HOME/.fonts  ou /usr/share/fonts/TTF/extras/ );


Outras fontes:

https://www.dafont.com/pt/

https://fonts.google.com/

https://www.1001fonts.com/

https://br.maisfontes.com/

https://www.maisfontes.com/




Está cansado da cara do visual da sua Área de Trabalho ou está pensando em mudar o papel de parede?

Papel de parede (wallpapers)


https://wall.alphacoders.com/

http://wallpaperswide.com/

https://www.injustice.com/pt-BR/media/wallpapers

https://www.iliketowastemytime.com/wallpapers

https://cyberstruggle.org/desktop-wallpapers/

https://pixabay.com/pt

https://hipwallpaper.com/de-wallpapers/

https://isha.sadhguru.org/mahashivratri/downloads/shiva-images-wallpapers/





LibreOffice: https://pt-br.libreoffice.org/baixe-ja/libreoffice-novo/



Obs: 

Tem problema de importação de conteudo dos sites na internet para o Writer no Linux. No Windows 7 e 10 não identifiquei esse problema.


  O problema só acontece quando o conteudo do site tem imagens
  O congelamente e trava no Writer com imagens de site só acontece com acesso a internet


(pagina em HTML)

Solução 1: Salvar a pagina HTML no computador, depois abrir no Firefox e copiar o conteudo para o Writer.


Exemplo: 


https://edpsblog.wordpress.com/2017/09/24/dica-ajustando-a-aparencia-de-aplicativos-qt-em-ambientes-gtk/

Pelo metodo tradicional copiar e cola travou e congelou o Libreoffice no Slackware usando o Mate. 



Não tive problema com os sites usando Mate no Slackware 14.02

https://semanickz.wordpress.com/2017/05/31/hoje-eu-vou-aprender-a-usar-o-terminal-do-linux/



Travou e congelou o libreoofice (pagina em PHP)

https://www.vivaolinux.com.br/artigos/impressora.php?codigo=17059

https://www.hardware.com.br/comunidade/criando-pacotes/78062/






Mozilla Firefox: https://www.mozilla.org/pt-BR/firefox/new/

Mozilla Thunderbird: https://www.thunderbird.net/pt-BR/


Kdenlive (Appimage): https://kdenlive.org/en/download/  ou  https://files.kde.org/kdenlive/release/


Telegram


Pidgin

Skype


Gimp

Kolourpaint



simplescreenrecorder

Obs:

Ajustando a aparência de aplicativos QT em ambientes GTK


O aplicativo qtconfig define a aparência padrão como Desktop Settings (Default), o que quer dizer que ele pressupõe que o aplicativo esteja rodando em ambiente Qt.

which qtconfig
/usr/bin/qtconfig


Mas bastará apenas que você execute o comando abaixo para resolver isto:
	
$ qtconfig

Daí, na aba Appearance, opção Select Gui Style, altere a opção Desktop Settings (Default) por GTK+:

E pronto, bastará abrir os programas baseados em Qt:


https://edpsblog.wordpress.com/2017/09/24/dica-ajustando-a-aparencia-de-aplicativos-qt-em-ambientes-gtk/





hdparm


Suporte a  impressora (cups e hplip)


Servidor de arquivo (Samba)



O Slackware trabalha com um formato próprio de pacotes, o .tgz, que é provavelmente o sistema de gerenciamento de pacotes mais simples ainda em uso. Os pacotes .tgz são simplesmente arquivos compactados, que ao serem instalados são descompactados no diretório raiz do sistema. Se o pacote contém o arquivo “usr/bin/adsl-setup”, por exemplo, ao instalá-lo será criado o arquivo “/usr/bin/adsl-setup”.

Ao contrário de outras distribuições, os pacotes do Slackware não utilizam nenhum sistema de controle de dependências. Você poderia remover alguma peça fundamental do sistema, como o libc ou o kernel e o gerenciador de pacotes não emitiria nenhum tipo de alerta (você só perceberia o erro quando o sistema parasse de funcionar).

O mesmo acontece ao instalar novos pacotes: nada impede que você instale um novo programa sem instalar junto outros pacotes com bibliotecas e componentes adicionais dos quais ele precise para funcionar, mas, por outro lado, não existe nenhuma garantia de que ele vá realmente funcionar sem eles.


Isso é ao mesmo tempo uma vantagem e uma desvantagem. Desvantagem no sentido de que é necessário muito mais conhecimento sobre as relações entre os pacotes para instalar ou remover programas sem destruir nada, e vantagem por que você tem liberdade para fazer o que quiser (inclusive destruir o sistema) sem nenhum gerenciador de pacotes chato reclamando sobre dependências não satisfeitas e pacotes quebrados. Você pode aprender na prática o que acontece ao remover o pacote X ou ao instalar o pacote Y sem instalar junto o pacote Z, e assim aprofundar seus conhecimentos sobre a estrutura do sistema.




Para gerenciar os pacotes instalados, o Slackware conta com o pkgtool, um utilitário de modo texto que permite instalar e remover pacotes, verificar o conteúdo dos pacotes instalados e ver detalhes sobre eles. Para usá-lo, basta chamá-lo em um terminal, como root:

# pkgtool




Pacotes TGZ/TXZ para o Slackware

http://slackbuilds.org/


Se você notar que não estão disponíveis pacotes para o Slackware. É possível instalar através do arquivo com os pacotes RPM, convertendo-os para o formato do Slackware usando o comando 'rpm2tgz'.


Este processo de conversão de pacotes de uma distribuição para outra é um último recurso usado em casos em que você instalar um determinado aplicativo que está disponível apenas no formato usado por outra distribuição. Na maioria dos casos, converter pacotes resulta apenas em problemas, mas em alguns casos específicos, como no caso do Libreoffice sobre o Slackware, a instalação é tranquila.




# Ativando e desativando serviços




Atualiza o sistema

# slackpkg update gpg  && slackpkg update && slackpkg upgrade-all






A maior vantagem para uma distribuição é o TEMPO que você gastará para resolver algum problema. 
Se você está gastando mais tempo para resolver algo trivial, isso não chega a ser vantagem, ao 
menos que seja com objetivo de aprendizado. A outra vantagem é a documentação. Não adianta ficar 
esperando um samaritano em fóruns ou IRC. No caso do Slackware, a documentação é descentralizada. 
Existem wikis maravilhosas, como a do Arch Linux, mas o que recomendo sempre é ir no site oficial 
de determinado projeto e aprender com a própria documentação cedida pelos desenvolvedores ou 
colaboradores.


Instale e teste o Slackware XX.XX/current, somente deste modo verá se adapta ao sistema ou não, pois existe uma curva de aprendizado.


" 35 100


;;




73) # Dica: Ajustando a aparência de aplicativos QT em ambientes GTK

clear


# Verifique se tem o qtconfig instalado no sistema. 


# which qtconfig
# /usr/bin/qtconfig



QT=`which qtconfig`

if [ -e "$QT" ]
then





dialog \
--title ''  \
--msgbox '

Dica: Ajustando a aparência de aplicativos QT em ambientes GTK


O aplicativo qtconfig define a aparência padrão como Desktop Settings (Default), o que quer dizer que ele pressupõe que o aplicativo esteja rodando em ambiente Qt

Mas bastará apenas que você execute o comando abaixo para resolver isto:

$ qtconfig

Daí, na aba Appearance, opção Select Gui Style, altere a opção Desktop Settings (Default) por GTK+:


ou


$ export QT_QPA_PLATFORMTHEME="gtk3"

https://postimg.org/gallery/2xo6jw8rq/

Aqui coloquei esse comando no ".xinitrc" , deste modo fica a variável armazenada.

$ nano ~/.xinitrc

' 35 100

clear


qtconfig




else
	zenity --error --text="Não foi possível encontrar o qtconfig no local definido.

" --width="800" --height="100"   2>/dev/null

	exit

fi


# https://edpsblog.wordpress.com/2017/09/24/dica-ajustando-a-aparencia-de-aplicativos-qt-em-ambientes-gtk/


;;




74) 

clear


which slackpkg


echo "
Informação sobre um pacote do Slackware


Informe o nome do pacote. Ex: kde-base-artwork, k3b, usbutils"
read pacote

slackpkg info $pacote



echo "Enter para volta ..."
read pausa

;;




75) 

clear

which sbopkg


echo "
Informação sobre um pacote do Sbopkg


Informe o nome do pacote. Ex: wvdial, libreoffice"
read pacote

sbopkg -s $pacote


# -g package(s)   General search for packages matching string.

# -s package(s)   Specific search by specific package and, if found,
#                 display package information.


echo "Enter para volta ..."
read pausa

;;



76)

clear

echo "Modificando o tempo de espera do LILO:
"


cat  /etc/lilo.conf | grep -i "timeout ="
# timeout = 100

sleep 10

clear


# Verificar se arquivo existe

if [ -e "/etc/lilo.conf-backup" ] ; then

clear

echo "O arquivo lilo.conf-backup existe"

sleep 1

gksu gedit /etc/lilo.conf 2> /dev/null


else


clear

echo "O arquivo lilo.conf-backup não existe"

sleep 1

cp -a /etc/lilo.conf /etc/lilo.conf-backup

gksu gedit /etc/lilo.conf 2> /dev/null


fi

# https://www.vivaolinux.com.br/topico/Shell-Script/verificar-se-arquivo-existe



# Esse é o tempo de espera do LILO em décimos de segundo, ou seja, 1200 significa um tempo de espera de 2 minutos. O 
# tempo padrão pode variar dependendo da distribuição.
#
# Altere o valor para o tempo que desejar, por exemplo, 50 para esperar 5 segundos. Salve e feche o arquivo.
#
# Não esqueça de reexecutar o LILO para que as modificações sejam efetuadas. Para fazê-lo use o seguinte comando:


clear

/sbin/lilo -v


sleep 5

# Na próxima reinicialização do computador você perceberá as modificações. 

# https://www.vivaolinux.com.br/dica/Como-modificar-o-tempo-de-espera-do-LILO


;;




77)

clear

which pdbedit

echo "
Para listar todos os usuários do servidor Samba
"

pdbedit -L

echo "
Enter para voltar ao menu principal."
read pausa

;;


78)

# Visualizando apenas usuários no passwd

clear

echo "
Para listar todos os usuários do sistema:
"

cat /etc/passwd | cut -d ":" -f1


# cat /etc/passwd | cut -d: -f1



# cat /etc/passwd | grep /bin/bash | cut -d ":" -f1
# root
# operator
# fernando
# master



# Como não utilizo serviços rpc, então bloquiei o login dele no sistema:

# passwd -l operator

# https://www.vivaolinux.com.br/topico/Slackware/Arquivo-passwd-user-operator
# https://www.vivaolinux.com.br/dica/Bloqueando-e-desabilitando-usuario-no-Linux
# 


echo "
Enter para voltar ao menu principal."
read pausa

# https://www.vivaolinux.com.br/dica/Visualizando-apenas-usuarios-no-passwd

;;



79) # Eliminando terminais virtuais inúteis.

clear

echo "
Eliminando terminais virtuais inúteis.

# These are the standard console login getties in multiuser mode:
c1:12345:respawn:/sbin/agetty --noclear 38400 tty1 linux
c2:12345:respawn:/sbin/agetty 38400 tty2 linux
# c3:12345:respawn:/sbin/agetty 38400 tty3 linux
# c4:12345:respawn:/sbin/agetty 38400 tty4 linux
# c5:12345:respawn:/sbin/agetty 38400 tty5 linux
# c6:12345:respawn:/sbin/agetty 38400 tty6 linux"

sleep 10

nano /etc/inittab


;;



80)

clear


xdg-open "https://packages.slackonly.com/"



;;



81)

clear

xdg-open "http://slackware.uk/"

;;




82)

# Tarefas agendadas do sistema

clear

# Como especificar um editor para abrir o arquivo crontab?

# $ which nano
# /usr/bin/nano

export EDITOR=nano

# Adicione isso a ~/.bash_profile ou ~/.bashrc para habilitar isso para o usuário atual.

# https://qastack.com.br/programming/5952467/how-to-specify-a-editor-to-open-crontab-file-export-editor-vi-does-not-work


# gksu gedit /etc/crontab

# gksu gedit /var/spool/cron/crontabs/root


# Edita o crontab ou cria um caso ainda não exista.

crontab -e

;;



83)

# Tarefas agendadas do usuário ('$USER')

clear


# Como especificar um editor para abrir o arquivo crontab?

# $ which nano
# /usr/bin/nano

export EDITOR=nano

# Adicione isso a ~/.bash_profile ou ~/.bashrc para habilitar isso para o usuário atual.

# https://qastack.com.br/programming/5952467/how-to-specify-a-editor-to-open-crontab-file-export-editor-vi-does-not-work


# gksu gedit /var/spool/cron/crontabs/$USER


# Edita o crontab ou cria um caso ainda não exista.

crontab -e

# https://qastack.com.br/ubuntu/577741/minimal-terminal-editor-alternative-to-vi-and-nano
# https://terminalroot.com.br/2015/10/o-editor-de-texto-nano.html
# https://www.vivaolinux.com.br/dicas/impressora.php?codigo=12031

;;



84)

# Mostra o conteúdo do crontab

clear

crontab -l

echo "
Enter para sair...
"
read pausa

# https://www.infowester.com/linuxcron.php

;;



85)

# Remove o arquivo atual do crontab para o usuário ('$USER').

clear

crontab -r

;;



86)

clear

echo "
Verificar logs de execução da crontab:
"

tail -f /var/log/cron

# https://veduardodba.wordpress.com/2012/03/29/verificar-logs-de-execucao-da-crontab-linux/

;;



87)

clear

# Obtém a lista de tarefas agendadas do cron para um usuário do sistema.

echo "Informe o nome do usuario no sistema."
read usuario


# Verificar

# cat /etc/passwd | grep -i "$usuario"

crontab -l -u "$usuario"


echo "
Enter para voltar ao menu..."
read pausa

;;




88)

clear


zenity --info --text="Redefinindo o Gerenciador de Arquivos padrão


Veremos como por a casa em ordem, isto é, quando estranhamente o ícone do Gerenciador de Arquivos nos leva a abertura de algum programa estranho a esse próposito.

Já me ocorreu muitas vezes de ao clicar no ícone do Gerenciador de Arquivos (na maioria das vezes era o Thunar) o que abria era o Audacious rsrs, então veremos aqui como resolver a bagaça:

Com o comando abaixo descubra quem está definido como padrão:

$ xdg-mime query default inode/directory

Aqui apareceu o QMPlayer2, ótimo player de audio, rádios web, vídeos, downloader de vídeos do Youtube, etc mas que não é um Gerenciador de Arquivos como o Thunar, Dolphin, Nautilus, Nemo, Caja, etc.

E com o comando abaixo redefinirei o Caja (fork do Nautilus) e o Gerenciador padrão do MATE Desktop:

$ xdg-mime default caja.desktop inode/directory application

Pra confirmar se deu certo, basta executar o primeiro comando:
	
$ xdg-mime query default inode/directory
caja.desktop

" --width="800" --height="100"   2>/dev/null


# https://edpsblog.wordpress.com/2019/08/30/dica-redefinindo-o-gerenciador-de-arquivos-padrao/
# https://edpsblog.wordpress.com/2018/12/17/cpupower-novos-shell-scripts-para-trocar-frequencia-dos-nucleos-dos-processadores/

;;


89)

clear

# Harmonizando Compton com Xfce4-screenshooter


zenity --info --text='

Publicado por Xerxes Lins em 06/11/2017


# Harmonizando Compton com Xfce4-screenshooter


Ao tirar screenshots com o xfce4-screenhooter, se estiver usando o compositor Compton, poderá obter imagens sombreadas. Um bug? Talvez. Mas há como contornar isso.

Abra o arquivo de configuração do Compton:


nano ~/.config/compton.conf


E coloque:

shadow-exclude = [ "i:e:Conky", "i:e:xfce4-screenshooter" ];


Salve e feche.

Reinicie o Compton e pronto! Aproveite. 

Fonte: https://forums.bunsenlabs.org/viewtopic.php?id=250


' --width="800" --height="100"   2>/dev/null


# https://www.vivaolinux.com.br/dica/Harmonizando-Compton-com-Xfce4-screenshooter


;;


90)

clear


# Plank

which plank

plank --preferences


;;



91)

clear

# Gerenciar Sua Impressão Via Cups
#
# Gerenciando Impressoras Via Interface Web
#
# Após confirmada ou realizada a instalação do cups, vamos acessá-lo.
#
# Para acessar a interface Web do CUPS, basta entrar com o seguinte endereço em seu navegador: 


firefox "http://localhost:631/admin"


# https://cleuber.com.br/index.php/2015/11/24/como-gerenciar-sua-impressao-via-cups

;;


92)

clear


echo "Executar update-desktop-database"

su -c "update-desktop-database"


# https://qastack.com.br/ubuntu/162612/how-can-i-add-an-application-to-the-list-of-open-with-applications


;;


93)

clear

echo "
Muda o papel de parede - Nitrogen
"

which nitrogen

nitrogen

sleep 2

;;



94)

clear

# Muda o papel de parede - Feh

which feh

sleep 1


# Selecionando um arquivo de imagem a partir de uma caixa de diálogo

arquivo=$(zenity --file-selection --title="Selecione um arquivo de imagem" --filename=$HOME/Imagens/ --file-filter='Imagens | *.jpg | *.png | *.jpeg | *.gif' 2>/dev/null)

case $? in
    0)
        echo "$arquivo selecionado."

        feh --bg-fill "$arquivo" &

        ;;
    1)
        zenity --error --title "Muda o papel de parede - Feh" --text "Nenhum arquivo selecionado." 2>/dev/null & exit ;;
    -1)
        zenity --error --title "Muda o papel de parede - Fbsetbg" --text "Ocorreu um erro desconhecido." 2>/dev/null & exit ;;
esac


# https://sobrelinux.info/questions/8354/how-do-i-prompt-users-with-a-gui-dialog-box-to-choose-file-directory-path-via-t
# https://stackoverflow.com/questions/40478661/zenity-command-for-multiple-file-filtering


;;


95)

clear


# Muda o papel de parede - Fbsetbg

which fbsetbg

sleep 1


# Selecionando um arquivo de imagem a partir de uma caixa de diálogo

arquivo=$(zenity --file-selection --title="Selecione um arquivo de imagem" --filename=$HOME/Imagens/ --file-filter='Imagens | *.jpg | *.png | *.jpeg | *.gif' 2>/dev/null)

case $? in
    0)
        echo "$arquivo selecionado."

        fbsetbg "$arquivo" &

        ;;

    1) 
        zenity --error --title "Muda o papel de parede - Fbsetbg" --text "Nenhum arquivo selecionado." 2>/dev/null & exit

        ;;

    -1)
       zenity --error --title "Muda o papel de parede - Fbsetbg" --text "Ocorreu um erro desconhecido." 2>/dev/null & exit

       ;;
esac



# https://sobrelinux.info/questions/18391/how-to-use-zenity-file-selection
# https://www.vivaolinux.com.br/topico/Zenity/Escolher-varios-arquivos

;;


96)

clear

echo "
Bloqueador e protetor de tela para X com uma coleção repleta de protetores diferentes (xscreensaver)


Música parando quando tela bloqueia/apaga

Já vi algumas pessoas aqui no VOL e em outros sites, relatando e procurando uma solução para este problema, que faz 
com que atividades de áudio sejam paradas quando a tela se apaga. O problema afeta em especial distros com Xfce. Dei 
uma vasculhada por aí e encontrei três soluções possíveis. 


"


which xscreensaver
# /usr/bin/xscreensaver


which xscreensaver-demo
# /usr/bin/xscreensaver-demo


slackpkg info xscreensaver



slackpkg search xscreensaver
#
# Looking for xscreensaver in package list. Please wait... DONE
#
# The list below shows all packages with name matching "xscreensaver".
#
# [ installed ] - xscreensaver-5.43-x86_64-1_slack14.2
#
# You can search specific files using "slackpkg file-search file".



# Esta alternativa se trata da adição de seu usuário ao grupo "audio", o que não é recomendado caso seu sistema possua mais de um 
# usuário (além do root). Mas caso seu sistema possua apenas um usuário, pode adicioná-lo sem problemas. 

cat /etc/group | grep -i audio



killall -9 xscreensaver

xscreensaver &

xscreensaver-demo

# (xscreensaver-demo:24035): libglade-WARNING **: Could not load support for `gnome': libgnome.so: cannot open shared object file: Arquivo ou diretório não encontrado


sleep 5
clear


# https://www.vivaolinux.com.br/dica/Musica-parando-quando-tela-bloqueiaapaga-RESOLVIDO/
# https://www.jwz.org/xscreensaver/man.html


# Filosofia KISS

;;


97)

clear

# Consultando qual o repositório está ativo no Slackpkg


echo "
Repositório do Brasil:
"
cat /etc/slackpkg/mirrors | grep brasil


echo "
Qual repositório que estou usado?
"

# OPA! No arquivo mirrors do slackpkg, tudo é comentado. Aí para configurá-lo você só descomenta a linha do repositório a ser usado. 
# Então, basta encontrar um comando que consiga nos mostrar qual é a linha em um arquivo que não está comentada, pois essa linha será 
# o repositório configurado no arquivo mirror. E o grep consegue fazer isso:


grep -v '#' /etc/slackpkg/mirrors


# O pulo do gato está no parâmetro "-v", que tem a função de omitir as linhas que possuam determinado padrão que no nosso caso é 
# o "#". Uma simples consulta em grande estilo. 
#
#
# https://www.vivaolinux.com.br/dica/Consultando-qual-o-repositorio-esta-ativo-no-slackpkg-usando-apenas-o-grep/


sleep 30

;;


98)

clear

echo "
Atualiza certificados...
"

update-ca-certificates -f

sleep 5

;;


99)

clear


# Problema:
#
# Ao atualizar o kernel para a versão 4.4.261 no Slackware 14.2, notei que o lilo já não reconhecia o "kernel generic". Ao carregar o sistema deu um "kernel panic" e travou.
#
# O "kernel hudge" funciona normal.


echo "
Gera kernel generico no Slackware


Toda vez que atualizar o kernel precisa fazer esses passos:

1-) Dê boot pelo kernel huge


Rodar esse script para gerar o kernel generic

2-) Gere o initrd: /usr/share/mkinitrd/mkinitrd_command_generator.sh | bash

"


# Solução do problema:


# Dica do ryuuzaki42

echo "
O Kernel Generc precisa ser gerado ...
"

# Direto

/usr/share/mkinitrd/mkinitrd_command_generator.sh -r | /bin/bash


sleep 2
clear

echo 'Depois precisa ser inserido no menu de boot do LiLo 

Exemplo:

# -----------------------------------------------------------------------------------------------------


# Slackware 14.02  64 bit


# Kernel Generico (Kernel Generc)

# Linux bootable partition config begins

        image=/boot/vmlinuz-generic
	label = "Kernel Generico"

# 
# Opção usada para adicionar um segundo HD no sistema
#
addappend = "root=PARTUUID=000e9f23-03"
#
#	root=/dev/sda3
	initrd = /boot/initrd.gz
	read-only

# Linux bootable partition config ends


# -----------------------------------------------------------------------------------------------------


# Kernel completo (Kernel Huge)

        image=/boot/vmlinuz-huge  
        label="Kernel Huge"
        root=/dev/sda3
        read-only

# -----------------------------------------------------------------------------------------------------


'

sleep 10


# O lilo, não tem suporte ao UEFI. O Elilo foi descontinuado, então, me restou usar o grub mesmo.

sudo nano /etc/lilo.conf

# https://docs.slackware.com/slackware:beginners_guide#switch_to_a_generic_kernel


sleep 2
clear

lilo -v


# Se usa grub (update grub)
#
# grub-mkconfig -o /boot/grub/grub.cfg
#
# https://www.vivaolinux.com.br/topico/Slackware/Duvida-sobre-Kernel-Generic-e-Grub



echo '
Verifica se esta funcionando o "kernel Generic" apos reinciar o sistema.

# reboot
'

sleep 6


;;


100)

clear

echo "
Emblema das pastas do Thunar não aparecem


Se os emblemas das suas pastas da home sumiram, veja nessa matéria como recuperar.


Sempre que esse problema ocorre é por erro do usuário, como os abaixo.

Alterou o nome da pasta.

Apagou configurações ocultas.

Alterou as permissões da pasta de usuário ou de alguma pasta. 

Trocou uma pasta do sistema por outra.

E por ai vai a encrenca :)


Em primeiro lugar você deve recerrecar as configurações do XDG na sua home, para isso de o comando abaixo no terminal.
"

xdg-user-dirs-update


echo '
Como podem ver as pastas problemáticas foram identificadas como "Removidas" da minha home.
Na verdade as pastas estão ai, mas com nomes alterados, um simples espaço no final do nome e a confusão está feita, veja o espaço em azul.


Antes de alterar, você deve conferir os nomes oficiais dessas pastas.


XDG_DESKTOP_DIR="$HOME/Desktop"
XDG_DOWNLOAD_DIR="$HOME/Downloads"
XDG_TEMPLATES_DIR="$HOME/Modelos"
XDG_PUBLICSHARE_DIR="$HOME/Público"
XDG_DOCUMENTS_DIR="$HOME/Documentos"
XDG_MUSIC_DIR="$HOME/Música"
XDG_PICTURES_DIR="$HOME/Ímagens"
XDG_VIDEOS_DIR="$HOME/Vídeos"


Agora você deve alterar os nomes das pastas com problema para o nome exato listado acima.


O mesmo deve ser feito no arquivo user-dirs.dirs, para isso de o comando abaixo no terminal.


    nano ~/.config/user-dirs.dirs


'

sleep 5

nano ~/.config/user-dirs.dirs





echo "
Recarregando as configurações do XDG...

Feche o thunar e abra novamente.
"
xdg-user-dirs-update


# https://linuxdicasesuporte.blogspot.com/2017/08/emblema-das-pastas-do-thunar-nao.html

;;



101)

clear

echo '
Thunar não exibe miniaturas dos arquivos


O que já tentei:

No próprio gerenciador de arquivo, habilitar "mostrar miniaturas".


OBS: Esses recursos de exibição de miniaturas consomem recursos do seu hardware, podendo causar lentidão em maquinas modestas.


'


# Thumbnail são miniaturas de imagens, vídeos, músicas, pastas, textos e outros arquivos, confira nessa matéria como 
# ter suporte aos thumbnail e visualizar informações dos arquivos.

# Miniaturas são versões reduzidas de imagens, usadas para tornar mais fácil o processo de as procurar e reconhecer. 
# Os motores de busca de imagem e programas de organização destas usam-nos muitas vezes, tal como alguns sistemas 
# operativos e ambientes de trabalho modernos, tais como o Windows XP, KDE e o GNOME.


# Se estiver com problemas para exibição de miniaturas de imagens no thunar e até consumo alto no navegador, 
# é devido a permissões alteradas da pasta ~/.thumbnails



chown -R fernando:users /home/fernando/

chmod -R 700 /home/fernando/



# Esse problema é devido a permissões alteradas da pasta ~/.thumbnails e ~/.cache/thumbnails. 

rm -Rf ~/.thumbnails
rm -Rf ~/.cache/thumbnails

chmod 755 -R ~/.thumbnails
chmod 755 -R ~/.cache/thumbnails


# Em algumas pastas as miniaturas aparece colocando permissões 775 na pasta home do usuário.

# chmod -R 775 /home/master/

# chmod -R 775 /home/fernando/
# chmod: não é possível acessar '/home/fernando/.gvfs': Permissão negada








# ffmpegthumbnailer


slackpkg file-search gst
# 
# Looking for gst in package list. Please wait... DONE
# 
# The list below shows the packages that contains "gst" file.
#
# [ installed ] - pidgin-2.12.0-x86_64-1_slack14.2
# [ installed ] - gst-plugins-base-1.6.4-x86_64-1
# [ installed ] - gst-plugins-base0-0.10.36-x86_64-2
# [ installed ] - gst-plugins-good-1.6.4-x86_64-1
# [ installed ] - gst-plugins-good0-0.10.31-x86_64-2
# [ installed ] - gstreamer-1.6.4-x86_64-1
# [ installed ] - gstreamer0-0.10.36-x86_64-1
# [ installed ] - tumbler-0.1.31-x86_64-8
#
# You can search specific packages using "slackpkg search package".


sbopkg -g gst
# Searching for gst
# Found the following matches for gst:
# libraries/gstreamer-editing-services
# libraries/gstreamermm
# multimedia/gst-libav
# multimedia/gst-plugins-bad
# multimedia/gst-plugins-ugly
# multimedia/gst0-ffmpeg
# multimedia/gst0-plugins-bad
# multimedia/gst0-plugins-ugly
# perl/perl-Test-LongString
# perl/perl-gstreamer
# python/gst-python
# python/gst-python3
# python/gst0-python


slackpkg file-search gstreamer
# 
# Looking for gstreamer in package list. Please wait... DONE
# 
# The list below shows the packages that contains "gstreamer" file.
# 
# [ installed ] - gst-plugins-base-1.6.4-x86_64-1
# [ installed ] - gst-plugins-base0-0.10.36-x86_64-2
# [ installed ] - gst-plugins-good-1.6.4-x86_64-1
# [ installed ] - gst-plugins-good0-0.10.31-x86_64-2
# [ installed ] - gstreamer-1.6.4-x86_64-1
# [ installed ] - gstreamer0-0.10.36-x86_64-1
# [ installed ] - libcanberra-0.30-x86_64-5
# [ installed ] - phonon-gstreamer-4.8.2-x86_64-1
# [ installed ] - qt-gstreamer-1.2.0-x86_64-1
# 
# You can search specific packages using "slackpkg search package".


sbopkg -g gstreamer
# Searching for gstreamer
# Found the following matches for gstreamer:
# libraries/gstreamer-editing-services
# libraries/gstreamermm
# perl/perl-gstreamer





# chown -R fernando:users /home/fernando/
#
# chmod -R 700 /home/fernando/

echo "Adicionar um usuário a um grupo"
# gpasswd -a fernando users
# Adicionando usuário fernando ao grupo users


# groups fernando
# fernando : fernando dialout audio netdev users vboxusers clamav


echo "Remover um usuário de um grupo"

# gpasswd -d fernando fernando
#
# Removendo usuário fernando do grupo fernando
# gpasswd: usuário 'fernando' não é um membro de 'fernando'


# Lista informação do usuário no linux


# Eliminar grupo no Slackware



# Alterar o grupo primário do usuário.


# id fernando
# uid=1000(fernando) gid=1000(fernando) grupos=1000(fernando),16(dialout),17(audio),86(netdev),100(users),215(vboxusers),210(clamav)

echo "
Para alterar o grupo principal de um usuário no Linux
"
# usermod -g users fernando

# id fernando
# uid=1000(fernando) gid=100(users) grupos=100(users),16(dialout),17(audio),86(netdev),215(vboxusers),210(clamav)

# https://sobrelinux.info/questions/771107/how-can-i-change-a-users-default-group-in-linux



# groupdel fernando
# groupdel: não é possível remover o grupo primário do usuário 'fernando'


# groups fernando
# fernando : users dialout audio netdev vboxusers clamav

# groupdel fernando

# groupdel fernando
# groupdel: grupo 'fernando' não existe



# http://www.bosontreinamentos.com.br/linux/certificacao-lpic-1/como-gerenciar-grupos-no-linux-com-gpasswd/
# http://www.bosontreinamentos.com.br/linux/certificacao-lpic-1/arquivo-etc-group-gerenciar-grupos-no-linux/
# https://www.vivaolinux.com.br/topico/Servidores-Linux-para-iniciantes/Tirar-usuario-de-um-grupo




# Para exibir miniaturas de vídeos precisamos instalar os pacotes abaixo

which ffmpegthumbnailer

ls -l /var/log/packages/ | grep -i gst-libav

ls -l /var/log/packages/ | grep -i tumbler



ls -l /var/log/packages/ | grep -i gvfs


ls -l /var/log/packages/ | grep -i gst-plugins-bad
ls -l /var/log/packages/ | grep -i gst-plugins-ugly
ls -l /var/log/packages/ | grep -i gst0-ffmpeg
ls -l /var/log/packages/ | grep -i gst0-plugins-bad
ls -l /var/log/packages/ | grep -i gst0-plugins-ugly




ls -l /var/log/packages/ | grep -i gst
# -rw-r--r-- 1 root root    2686 Mar 18 20:53 gst-libav-1.6.2-x86_64-1_SBo
# -rw-r--r-- 1 root root   37401 Jan 30 17:38 gst-plugins-bad-1.6.2-x86_64-2_SBo
# -rw-r--r-- 1 root root   33424 Jan 25 02:30 gst-plugins-base-1.6.4-x86_64-1
# -rw-r--r-- 1 root root   33193 Jan 25 02:30 gst-plugins-base0-0.10.36-x86_64-2
# -rw-r--r-- 1 root root   35388 Jan 25 02:30 gst-plugins-good-1.6.4-x86_64-1
# -rw-r--r-- 1 root root   11249 Jan 25 02:30 gst-plugins-good0-0.10.31-x86_64-2
# -rw-r--r-- 1 root root   10899 Mar 18 21:19 gst-plugins-ugly-1.6.2-x86_64-1_SBo
# -rw-r--r-- 1 root root    1251 Mar 19 00:43 gst0-ffmpeg-0.10.13-x86_64-1_SBo
# -rw-r--r-- 1 root root   36756 Mar 19 00:51 gst0-plugins-bad-0.10.23-x86_64-1_SBo
# -rw-r--r-- 1 root root   11461 Mar 19 00:54 gst0-plugins-ugly-0.10.19-x86_64-2_SBo
# -rw-r--r-- 1 root root   23498 Jan 25 02:30 gstreamer-1.6.4-x86_64-1
# -rw-r--r-- 1 root root   20846 Jan 25 02:30 gstreamer0-0.10.36-x86_64-1
# -rw-r--r-- 1 root root    1983 Jan 25 02:31 phonon-gstreamer-4.8.2-x86_64-1
# -rw-r--r-- 1 root root    6601 Jan 25 02:31 qt-gstreamer-1.2.0-x86_64-1


ls -l /var/log/packages/ | grep -i gstreamer
# -rw-r--r-- 1 root root   23498 Jan 25 02:30 gstreamer-1.6.4-x86_64-1
# -rw-r--r-- 1 root root   20846 Jan 25 02:30 gstreamer0-0.10.36-x86_64-1
# -rw-r--r-- 1 root root    1983 Jan 25 02:31 phonon-gstreamer-4.8.2-x86_64-1
# -rw-r--r-- 1 root root    6601 Jan 25 02:31 qt-gstreamer-1.2.0-x86_64-1



slackpkg file-search gstreamer
#
# Looking for gstreamer in package list. Please wait... DONE
#
# The list below shows the packages that contains "gstreamer" file.
#
# [ installed ] - gst-plugins-base-1.6.4-x86_64-1
# [ installed ] - gst-plugins-base0-0.10.36-x86_64-2
# [ installed ] - gst-plugins-good-1.6.4-x86_64-1
# [ installed ] - gst-plugins-good0-0.10.31-x86_64-2
# [ installed ] - gstreamer-1.6.4-x86_64-1
# [ installed ] - gstreamer0-0.10.36-x86_64-1
# [ installed ] - libcanberra-0.30-x86_64-5
# [ installed ] - phonon-gstreamer-4.8.2-x86_64-1
# [ installed ] - qt-gstreamer-1.2.0-x86_64-1
#
# You can search specific packages using "slackpkg search package".




# sbopkg -i thunar-thumbnailers



echo "
Reiniciando o seu gerenciador de arquivos...
"

thunar -q




echo "
Abrir o Thunar com Root e verificar se as miniaturas dos arquivos funciona.

Verificar com o usuário comum se o arquivo esta abrindo normalmente com o programa destinado a ele sem erro.

"
# https://linuxdicasesuporte.blogspot.com/2014/04/thunar-xfce4-nao-exibe-miniaturas-de.html
# https://linuxdicasesuporte.blogspot.com/2021/02/exibir-thumbnail-e-informacoes-no.html
# https://linuxdicasesuporte.blogspot.com/2019/10/dolphin-nao-mostra-miniaturas-ao.html
# https://linuxdicasesuporte.blogspot.com/2016/01/mostrar-imagens-em-icones-nas-pastas-do.html
# https://linuxdicasesuporte.blogspot.com/2017/11/thumbnail-de-video-kde-plasma-para.html
# https://linuxdicasesuporte.blogspot.com/2015/04/caja-mate-desktop-nao-exibe-miniaturas.html
# https://linuxdicasesuporte.blogspot.com/2014/04/thunar-xfce4-nao-exibe-miniaturas-de.html
# https://www.vivaolinux.com.br/topico/Duvidas-frequentes/LInux-Mint-nao-mostra-thumbnails-de-videos-so-de-imagens
# https://www.vivaolinux.com.br/topico/openSUSE-Linux-Brasil/como-mostrar-miniaturas-de-videos-no-opensuse-tw



sleep 2

;;



102)

clear



;;



103)

clear



;;





         0) break ;;
    esac

done

clear
# Mensagem final :)
echo 'Tchau '$USER'!'


exit 0

