#!/bin/bash

# Por LOBO julho 28, 2023

# https://linuxdicasesuporte.blogspot.com/2023/07/obtenha-informacoes-sobre-o-seu-sistema.html

which last || exit 

clear

echo "
Obtenha informações sobre o seu sistema operacional GNU/Linux
"

cat /etc/os-release


echo "
Seja conservador com o uso de kernels, deixe ele amadurecer para só depois usar.

Descubra a versão do seu.
"

uname -a 

echo "
Qual o servidor gráfico que você usa?
"

# Os mais usados são Xorg ( X11 ) e Wayland

echo "$XDG_SESSION_TYPE"


echo "
Qual o ambiente gráfico que você usa

Por meio do ambiente gráfico você se comunica de forma gráfica com o Kernel e ele com 
o seu hardware.

Os mais utilizados são:

    Cinnamon
    Gnome
    LXDE
    Mate
    KDE
    LXQt
    XFCE

Descubra o seu com o comando.

"

echo "$XDG_CURRENT_DESKTOP"


echo "
Quando você instalou a sua distribuição e ou refisefuqui ( Remasterizações de final de 
semana em fundo de quintal )
"


last -f /var/log/wtmp | grep "wtmp"




exit 0


