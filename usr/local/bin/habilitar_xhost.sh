#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     04/10/2023 as 04:46
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#

# Atenção: Este comando concede a qualquer usuário local acesso à sua tela X. Isso pode ser bom 
# para uma máquina de usuário único, mas geralmente não para um sistema multiusuário. Se você 
# deseja conceder acesso root à sua tela X, é preferível definir a variável de ambiente $XAUTHORITY. 
# Esta variável é mantida por sudo por padrão e também por su simples (isto é, não su -).
#
# Para fornecer acesso a um aplicativo executado como sudo ou su para o servidor gráfico (também conhecido 
# como sua sessão X e como a tela do seu computador), abra um terminal e digite como seu usuário normal 
# (não use su -).
#
# Para voltar as coisas para o normal, com acesso controlado à tela X:
#
# $ xhost -
#
#
#
# https://wiki.archlinux.org/title/Xhost_(Portugu%C3%AAs)
# http://www.geocities.ws/cesarakg/seguranca-x-window-2.html


which xhost     ||   exit 1

/usr/bin/xhost +


