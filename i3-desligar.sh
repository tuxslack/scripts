#!/bin/bash
#
# Por Fernando Souza
#
#
# Como Criar um Sistema de Desligamento para o i3 com Shell Script
#
# Configura o sudo para usar os comandos de desligar e reiniciar o sistema com seu usuário comum.
#
#
# Instalação:
#
# mv -i ~/Downloads/i3-desligar.sh /usr/local/bin/
#
# chmod +x /usr/local/bin/i3-desligar.sh
#
#
# Opcional para o Xfce, KDE:
#
# mkdir -p ~/.local/share/applications/i3
#
# mv -i ~/Downloads/i3-desligar.desktop ~/.local/share/applications/i3
#
#
#
# Configurar a opção de "desligar" e "reiniciar" no menu do Fluxbox
#
# nano ~/.fluxbox/menu
#
#  [exec]   (Encerrar Sessão)      {/usr/local/bin/i3-desligar.sh}                <~/.fluxbox/icons/desligar.xpm>
#
#
#
#
# Backup:
#
# cd ~/ && tar -czf ~/backup-i3-desligar.tar.gz  .local/share/applications/i3/i3-desligar.desktop  /usr/local/bin/i3-desligar.sh
#
#
#
# Permissão para usuários normais executar o comando "shutdown now"
#
# O sudo pode gerar uma vulnerabilidade no seu sistema.
#
#
# ------------------------------------------------------------------------------------------------------
#
# su -c 'nano /etc/sudoers'
#
# Adiciona o usuário ao sudo:
#
# nome_do_usuario ALL=(ALL:ALL) ALL
#
#
# Faz com que o usuário não precisa colocar senha quando usar esses comandos:
#
# nome_do_usuario ALL=NOPASSWD:/usr/bin/poweroff,/usr/bin/shutdown,/usr/bin/reboot,/usr/bin/halt
#
# ------------------------------------------------------------------------------------------------------
#
#
# Not enough permissions to execute usr/bin/shutdown
#
# ./i3-desligar.sh: linha 49: i3-msg: comando não encontrado
#
#
# https://www.youtube.com/watch?v=Szoid9aH9Tw
# https://www.vivaolinux.com.br/topico/vivaolinux/Usuario-usar-comando-shutdown-r-now
# https://www.hostinger.com.br/tutoriais/comando-shutdown-linux
# https://blogs.czapski.id.au/2017/04/gtkdialog-for-rapid-prototyping-of-linux-applications-install-gtkialog-and-yad
# https://www.edivaldobrito.com.br/como-fazer-para-agendar-um-desligamento-no-linux/
#
#
# Não usar esse metodo para shutdown:
#
# https://www.vivaolinux.com.br/dica/Executar-shutdown-com-usuario-comum-em-5-etapas
# https://www.vivaolinux.com.br/perguntas/verPergunta.php?codigo=39868
#
#
# Você precisará reiniciar seu sistema e clicar na pequena roda dentada na janela de login e selecionar a opção "i3"
#
# Uma vez logado, você será solicitado a gerar o arquivo de configuração que será salvo em seu 
# diretório home ~/.config/i3/config, ou usar os padrões que irão salvar o arquivo no diretório/etc/i3.
#
# Neste guia, iremos com a primeira opção, então vamos pressionar ENTER para colocar o arquivo de configuração 
# em nosso diretório inicial.
#
# Em seguida, você deverá definir a tecla modificadora i3 wm, também conhecida como tecla , que pode ser a tecla 
# do logotipo do Windows ou a tecla Alt. Use as teclas de seta para cima ou para baixo para selecionar sua tecla 
# modificadora preferida.
#
#
# Mod1 equivale à tecla modificadora Alt ou Win — depende da configuração do seu sistema.
#
#
#
# i3
#
#
# Combinação de teclas   Efeito
# 
# Mod1 + Enter 	Abre uma nova janela com um terminal dentro
# 
# Mod1 + A 	Focaliza a janela pai
# 
# Mod1 + S 	Muda o layout pro modo Stacked
#               Neste modo, apenas a janela com foco é exibida.
#               A barra superior exibe uma lista das janelas (com os nomes dos respectivos aplicativos)
# 
# Mod1 + W 	Muda o layout pro modo Tabbed
#               Este layout usa o mesmo princípio do Stacked.
#               A lista de janelas, no topo, contudo, consiste em apenas uma linha
# 
# Mod1 + E 	Muda o layout pro modo padrão Standard — cada nova janela ganha um novo espaço, igual ao das outras — a tela 
#               é dividida igualmente para todas as janelas.
#               A cada vez que você pressiona, o i3 alterna o layout para organizar as janelas horizontalmente/verticalmente
# 
# Mod1 + barra de espaço 	Foca o ladrilhamento/flutuação (tiling/floating)
# 
# Mod1 + D 	  dmenu (no topo)
# 
# Mod1 + → ↓ ↑ ←  Move o foco para próxima janela, de acordo com a direção da seta pressionada.
#                 Se não for possível usar as setas, use as teclas l (para cima), k (para baixo), j (para esquerda) e ; (para direita)
# 
# Mod1 + shift + Q 	                 Fecha a janela atual
# 
# Mod1 + Shift + E 	                 Fecha o i3
# 
# Mod1 + Shift + C 	                 Recarrega o arquivo de configurações sem reiniciar
# 
# Mod1 + Shift + R 	                 Recarrega o i3 com as alterações que você fez no arquivo de configurações
# 
# Mod1 + Shift + → ↓ ↑ ←                 Movimenta a janela atual (a quem detém o foco) na direção da seta
# 
# Mod1 + Shift + Barra de espaçamento    Alterna entre ladrilhamento/flutuação de janela
#
#
#
# https://pt.linux-console.net/?p=120#gsc.tab=0
# https://elias.praciano.com/2014/08/teclas-de-atalho-do-i3/
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=14847
#
#
# No modo texto, você pode configurar as teclas CTRL+ALT+DEL para desligar o sistema. 


clear

which yad         >/dev/null || exit 1
which sudo        >/dev/null || exit 2
which shutdown    >/dev/null || exit 3
# which i3-msg      >/dev/null || exit 4
which fluxbox     >/dev/null || exit 5
which tar         >/dev/null || exit 6



# Mostra um aviso de como configurar o SUDO para o usuário atual.

ajuda(){

yad --title="Desligar" --text="\n\n
# ------------------------------------------------------------------------------------------------------

# su -c 'nano /etc/sudoers'

 Adiciona o usuário `whoami` ao sudo:

 `whoami` ALL=(ALL:ALL) ALL


 Faz com que o usuário `whoami` não precisa colocar senha quando usar esses comandos:

 `whoami` ALL=NOPASSWD:/usr/bin/poweroff,/usr/bin/shutdown,/usr/bin/reboot,/usr/bin/halt

# ------------------------------------------------------------------------------------------------------
\n\n" --width 650 --height 100  2> /dev/null

}






acao=$(yad \
--title "Sistema de Desligamento" \
--width 500 --height 100 \
--entry --image=icon.png \
--button="OK:0" \
--button="Fechar:1" \
--text "Escolha uma opção:" \
--entry-text \
"Desligar" "Reiniciar" "Encerrar Sessão" \
2> /dev/null)


case "$acao" in

# No modo texto, note que os comandos de desligamento (halt, shutdown, poweroff, ...) e reiniciar (reboot) servem apenas para o usuário Root.

# Caixa em yad para saida de erro do comando shutdown


"Desligar")        echo -e "\nDesligar\n"  && sudo shutdown -h now 2> /tmp/desligar.log || yad --title="Desligar" --text="\n\nOcorreu um problema ao usar o comando shutdown:\n\n$(cat /tmp/desligar.log)" \
--center --image="gtk-dialog-error" --window-icon="gtk-dialog-error" --width=500 --height=100 --button="OK:0" 2> /dev/null && rm -Rf /tmp/desligar.log && ajuda ;;
    
"Reiniciar")       echo -e "\nReiniciar\n" && sudo shutdown -r now 2> /tmp/reiniciar.log || yad --title="Reiniciar" --text="\n\nOcorreu um problema ao usar o comando shutdown:\n\n$(cat /tmp/reiniciar.log)" \
--center --image="gtk-dialog-error" --window-icon="gtk-dialog-error" --width=500 --height=100 --button="OK:0" 2> /dev/null && rm -Rf /tmp/reiniciar.log && ajuda ;;
    
"Encerrar Sessão") echo -e "\nLogout\n"   && i3-msg exit 2> /tmp/logout.log || yad --title="Logout" --text="\n\nOcorreu um problema ao usar o comando 'i3-msg exit':\n\n$(cat /tmp/logout.log)" \
--center --image="gtk-dialog-error" --window-icon="gtk-dialog-error" --width=500 --height=100 --button="OK:0" 2> /dev/null && rm -Rf /tmp/logout.log && ajuda ;;
*) : ;;

esac


exit 0

