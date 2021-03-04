#!/bin/bash
#
#
# Este programa é um software livre; você pode redistribuí-lo e / ou modificar
# sob os termos da GNU General Public License publicada por
# a Fundação para o Software Livre; versão 2 da Licença.
#
# Este programa é distribuído na esperança de que seja útil,
# mas SEM QUALQUER GARANTIA; sem mesmo a garantia implícita de
# COMERCIABILIDADE ou ADEQUAÇÃO A UMA FINALIDADE ESPECÍFICA. Veja o
# GNU General Public License para mais detalhes.
#
#
# https://wiki.gentoo.org/wiki/D-Bus
# https://www.vivaolinux.com.br/script/i3-exit
# https://www.vivaolinux.com.br/topico/Desktops/Problema-com-desligamento-no-Ubuntu-1504
# https://edpsblog.wordpress.com/2014/07/12/utilizando-o-painel-do-xfce-no-openbox/
# https://www.vivaolinux.com.br/comunidades/imagens/anexos/desconectar.png
#
#
#
# Como adicionar o botão Desligar/Reiniciar ao LXPanel?
#
# Como adicionar o botão Desligar ao LXPanel e fazê-lo funcionar?
#
# https://www.it-swarm-pt.tech/pt/shutdown/como-adicionar-o-botao-desligar-ao-lxpanel-e-faze-lo-funcionar/961468963/
# https://sobrelinux.info/questions/35300/how-to-add-shutdown-button-to-lxpanel-and-make-it-work
#
#
#
# Script para i3, compatível com runit e systemd. Pode ser usado para sair do i3 (logout), bloquear tela, e suspender, desligar e reiniciar o sistema.
#
# Botão desligar e reiniciar para ser usado no Fluxbox.
# 
#
# Mova-o para /usr/local/bin/
#
# mv -i botao.sh /usr/local/bin/
#
#
# Torne-o executável com:
#
# chmod +x /usr/local/bin/botao.sh
#
#
# Se usa Fluxbox:
#
# gedit $HOME/.fluxbox/menu
#
#
#
# [exec]  (Hibernar)       {play ~/.fluxbox/sons/service-logout.ogg  > /dev/null 2>&1 && /usr/local/bin/botao.sh hibernar}   <~/.fluxbox/icons/Hibernate.xpm>
#
# [exec]  (Suspender)      {play ~/.fluxbox/sons/service-logout.ogg  > /dev/null 2>&1 && /usr/local/bin/botao.sh suspender}  <~/.fluxbox/icons/Suspender.xpm>
#
# [exec] (Bloquear tela - xscreensaver) {xscreensaver-command -lock} <>
#
# [exec] (Reiniciar)       {play ~/.fluxbox/sons/service-login.ogg   > /dev/null 2>&1 && /usr/local/bin/botao.sh reiniciar}  <~/.fluxbox/icons/reboot.xpm>
#
# [exec] (Desligar)        {play ~/.fluxbox/sons/service-logout.ogg  > /dev/null 2>&1 && /usr/local/bin/botao.sh desligar}   <~/.fluxbox/icons/desligar.xpm>
#
#
# ou
#
#
# [exec]   (Desligar)      {/usr/local/bin/botao.sh desligar }     <~/.fluxbox/icons/desligar.xpm>
# [exec]   (Reiniciar)     {/usr/local/bin/botao.sh reiniciar}     <~/.fluxbox/icons/reboot.xpm>
# [exec]   (suspender)     {/usr/local/bin/botao.sh suspender}     <~/.fluxbox/icons/Suspender.xpm>
# [exec]   (sair)          {/usr/local/bin/botao.sh sair}          <~/.fluxbox/icons/logoff.xpm>
# [exec]   (hibernar)      {/usr/local/bin/botao.sh hibernar}      <~/.fluxbox/icons/Hibernate.xpm>
# [exec]   (bloqueartela)  {/usr/local/bin/botao.sh bloqueartela}  <~/.fluxbox/icons/ação.xpm>
#
#
#
# ---------------------------------------------------------------------------
# 
#
# Permissões para Shutdown/Reboot/Suspend com sudo (Void linux):
# sudo visudo
# %wheel ALL=(ALL) NOPASSWD: /usr/bin/halt, /usr/bin/poweroff, /usr/bin/reboot, /usr/bin/shutdown, /usr/bin/zzz, /usr/bin/ZZZ
# 
# 
# Se tiver mais de um usuário logado, no sistema essas funções abaixos, vão requerer privilégio de root.
#
#
#
#
# Baseado no i3wm-off.sh
#
# Script  para i3 que adiciona opção para desligar, reiniciar ou sair do i3 / Script em zenity para desligar ou reiniciar o computador.
#
# autores: José Mario e Xerxes Lins
#
# versão: 1.0
#
# Data de criação: 17 ago 2014
#
# http://www.vivaolinux.com.br/~zezaocapoeira
# http://www.vivaolinux.com.br/~xerxeslins
#
#
# Como usar:
#
# Torne-o executável:
#
# $ chmod +x i3wm-off
#
# Após mover para "/usr/local/bin/ ", para usá-lo é só
# chamar ele pelo terminal:
#
# $ i3wm-off
#
# Se quiser substituir o comando se saída do i3 por ele, procure nas configurações
# do gerenciador i3 (~/.i3/config) o atalho padrão que é:
#
# "bindsym $mod+Shift+e exec "i3-nagbar -t warning -m 'You pressed the exit shortcut.
# Do you really want to exit i3? This will end your X session.' -b 'Yes, exit i3' 'i3-m$"
#
# Substitua por:
#
# bindsym $mod+Shift+e exec i3wm-off"
#
#
#
#
# shutdown script
#
#
# Como adicionar funcionalidade de desligamento / reinicialização ao gerenciador de janelas Fluxbox para X
#
# Por Leonardo Sanchez em 22 de janeiro de 2010
#
# Você modificará o arquivo sudoers para que as pessoas em um grupo administrativo possam executar o desligamento e reinicializar 
# os programas sem uma senha. A entrada no arquivo sudoers seria semelhante à seguinte.
#
# cat /etc/sudoers
#
# %staff ALL = NOPASSWD: /sbin/poweroff, /sbin/reboot, /sbin/shutdown
#
# Se alguém lesse isso, soaria como o seguinte. Todos no grupo staff (% staff) podem executar os programas /sbin/shutdown e /sbin/reboot 
# sem uma senha.
#
# Vamos editar nosso menu.
#
# [exec] (Logoff)          {/usr/local/bin/acao-fluxbox.sh} <>
#
# https://www.thegeekstuff.com/2010/01/how-to-add-shutdown-reboot-functionality-to-fluxbox-window-manager-for-x/
# https://askubuntu.com/questions/168879/shutdown-from-terminal-without-entering-password
# https://www.vivaolinux.com.br/topico/Linux-Basico/Problema-no-Sudoers
#
#
# https://www.thegeekstuff.com/2010/01/how-to-add-shutdown-reboot-functionality-to-fluxbox-window-manager-for-x/


clear


which zenity                || dialog --msgbox         "Não foi localizado zenity."                        10 60      2> /dev/null    ||  exit 3
which dbus-send             || zenity --warning --text="Não foi localizado dbus-send."                   --width=300  2> /dev/null    ||  exit 4
which xscreensaver-command  || zenity --warning --text="Não foi localizado xscreensaver-command."        --width=300  2> /dev/null    ||  exit 5
which play                  || zenity --warning --text="Não foi localizado play."                        --width=300  2> /dev/null    ||  exit 6






fluxbox(){

clear

# Loop que mostra o menu principal
# while : ; do

xmessage "Tem certeza de que deseja desligar o computador?" -center -title "Aviso" -default "Cancelar" -buttons "Desligar":0,"Reiniciar":2,"Suspender":3,"Hibernar":4,"Trocar de usuario":5,"Bloquear tela":6,"Encerrar sessao":7,"Cancelar":8

    # Ela apertou CANCELAR ou ESC, então vamos sair...
    # [ $? -ne 0 ] && break

# echo "$?"

case "$?" in

    0)
        botao.sh desligar ;;

    1) 
        exit ;;

    2)
        botao.sh reiniciar ;;
    3)
        botao.sh suspender ;;
    4)
        botao.sh hibernar ;;
    5)
        "/usr/local/bin/Troca de usuario no Slackware.sh" ;;
    6)
        botao.sh bloqueartela ;;
    7)
        botao.sh sair ;;
    8)
        clear && echo "Cancelar" && exit ;;

esac

# done


}







desligar() {

clear

    zenity --question --text "Você deseja desligar o computador?"  --width="200" --height="100"  2>/dev/null

    # echo "$?"

    case "$?" in

        # 0) systemctl poweroff ;;

        # 0) sudo /sbin/shutdown -h now ;;

        # 0) /usr/local/bin/shutdown -h now ;;

        0) echo "Desligando (shutdown) ..."

        play ~/.fluxbox/sons/service-logout.ogg > /dev/null 2>&1

        # Para desligar como um usuário normal ao usar o consolekit:

        dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Stop ;;

        1) exit ;;

    esac


}



reiniciar() {

clear

    zenity --question --text "Você deseja reiniciar o computador?" --width="200" --height="100"  2>/dev/null

    # echo $?

    case "$?" in

        # 0) systemctl reboot ;;

        # 0) sudo /sbin/shutdown -r now ;;

        # 0) /usr/local/bin/shutdown -r now ;;

        0) echo "Reiniciando (reboot) ..."

        play ~/.fluxbox/sons/service-login.ogg  > /dev/null 2>&1

        # Para reiniciar como um usuário normal ao usar o consolekit:

        dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Restart ;;

        1) exit ;;
    esac


}


suspender() {

clear

play ~/.fluxbox/sons/service-logout.ogg > /dev/null 2>&1

dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Suspend boolean:true

}

hibernar(){

clear

play ~/.fluxbox/sons/service-logout.ogg  > /dev/null 2>&1

dbus-send --system --print-reply --dest="org.freedesktop.ConsoleKit" /org/freedesktop/ConsoleKit/Manager org.freedesktop.ConsoleKit.Manager.Hibernate boolean:true

}



bloqueartela(){

clear


echo "Bloquear tela - xscreensaver"

xscreensaver-command -lock


# xlock


}



sair(){

# Fazer Logoff

clear

    zenity --question --text "Você deseja sair do sistema?" --width="200" --height="100"  2>/dev/null

    # echo "$?"

    case "$?" in

        # 0) i3-msg exit ;;

        0) play ~/.fluxbox/sons/desktop-logout.ogg > /dev/null 2>&1 && fluxbox-remote exit ;;

        1) exit ;;

    esac


}






case "$1" in


'desligar')
  desligar
  ;;


'reiniciar')
  reiniciar
  ;;


# '')
#  
# Para desligar como um usuário normal ao usar elogind:
#
# dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager.PowerOff boolean:false
#
#  ;;


# '')
#
# Para reiniciar como um usuário normal ao usar elogind:
#
# dbus-send --system --print-reply --dest=org.freedesktop.login1 /org/freedesktop/login1 org.freedesktop.login1.Manager.Reboot boolean:false
#  
#  ;;



'suspender')
  suspender
  ;;



'sair')
 sair
 ;;


'hibernar')
hibernar
;;



'bloqueartela')
bloqueartela
;;



'fluxbox-acoes')

# Chama a função fluxbox

fluxbox

;;


*)

  clear

  zenity --warning --text="Uso $0 {desligar|reiniciar|suspender|sair|hibernar|bloqueartela|fluxbox-acoes}"       --width=680  2> /dev/null

  exit 2


esac


exit 0

