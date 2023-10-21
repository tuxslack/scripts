#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     04/10/2023 as 19:25
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL


# Para conectar à internet

# discador


# https://code.google.com/p/wvstreams/
# http://github.com/wlach/wvstreams
# https://www.vivaolinux.com.br/dica/Instalando-o-modem-HUAWEI-E226-USB-3G-da-Claro-no-Debian/
# https://www.vivaolinux.com.br/artigo/Passos-essenciais-para-configurar-seu-modem-3G-no-Linux/
# https://www.vivaolinux.com.br/topico/Perguntas-Frequentes/Internet-3G-2
# https://www.vivaolinux.com.br/topico/Debian/Pacotes-para-o-Debian-Squeeze
# https://www.vivaolinux.com.br/script/Claro-3g-Sony-Ericsson-md300-script-conexao-REVISAO-2
# https://www.linuxquestions.org/questions/linux-from-scratch-13/segmentation-fault-wvdial-on-lfs-4175584392/
# https://www.vivaolinux.com.br/dica/Fazendo-o-modem-3G-MD300-da-Claro-funcionar-no-Ubuntu
# https://www.draisberghof.de/usb_modeswitch/bb/viewforum.php?f=2&sid=aa501a22b0deb10e74be9cf2103cfc2d
# https://www.vivaolinux.com.br/topico/Comandos/-1-devnull-2e1-O-que-e-isso



# Sem essa opção a caixa de dialog "Zenity" e o "notify-send" não aparece para o usuário.

export DISPLAY=:0.0


clear


# Criar uma opção para conectar usando o "modo grafico" e outra oção para usar em "modo texto".


dial(){


clear


# -------------------------------------------------------------------------------------------------

# Verificar se os programas estão instalados

which wvdial 1> /dev/null || exit 1
which ip     1> /dev/null || exit 2


# ldd `which wvdial`


#  dmesg | grep wvdial
#
#

# -------------------------------------------------------------------------------------------------

# Verificar se o dispositivo foi reconhecido pelo sistema.

ls -l /dev/ttyUSB* 1> /dev/null

if [ "$?" = "0" ] ;
then

# clear

echo -e "\nModem USB reconhecido pelo sistema.\n"


else

clear

echo "Modem USB não foi reconhecido pelo sistema." && exit

# notify-send -i /usr/share/icons/hicolor/scalable/apps/nm-no-connection.svg  -t 200000 "Conectando a internet..." "Modem USB não foi reconhecido pelo sistema." && exit

fi



# -------------------------------------------------------------------------------------------------


# Verificar se a interface de rede ppp foi criada pelo sistema.

# O sed remove espaços vazios da saída final. Ex: ppp0


ip a | grep ppp* | cut -d: -f2 | head -n1 | sed 's/ //g'

if [ "$?" = "0" ] ;
then

# clear

echo -e "A interface de rede ppp foi criada pelo sistema.\n"

# notify-send -i  /usr/share/icons/gnome/48x48/devices/gnome-modem.png -t 200000 "Conectando a internet..." "A interface de rede ppp foi criada pelo sistema."

# /usr/share/icons/hicolor/scalable/apps/nm-device-wired.svg


else

clear

echo "A interface de rede ppp não foi criada pelo sistema." && exit

# notify-send -i /usr/share/icons/hicolor/scalable/apps/nm-no-connection.svg  -t 200000 "Sem acesso à internet..." "A interface de rede ppp não foi criada pelo sistema." && exit

# /usr/share/icons/gnome/48x48/status/stock_dialog-warning.png 

fi



# -----------------------------------------------------------------------------------------------------
#
# Error com "usuário comum" com o usuário Root funciona:
#
# --> Cannot open /dev/ttyUSB0: Device or resource busy
#
#
# Esse erro "Cannot open /dev/ttyUSB0: Device or resource busy" indica que o dispositivo ttyUSB0 está sendo usado por outro processo ou não está disponível no momento.
#
# Em muitos casos, a causa mais comum para esta mensagem é que algum processo em segundo plano está utilizando o dispositivo no momento em que tentamos 
# acessá-lo. Um dos objetos desses processos podem ser programas como o Modem Manager.
#
# Desligar o Modem Manager temporariamente pode resolver o problema. 
#
# Se isso resolver o seu problema, pode ser útil desativar permanentemente o Modem Manager para evitar que esse erro ocorra no futuro. 
#
#
# Se você não quiser ou não puder desligar o Modem Manager, outra solução seria verificar se não há outros processos que poderiam estar utilizando 
# o dispositivo ttyUSB0. Para isso, execute o seguinte comando:
#
# lsof /dev/ttyUSB0
#
# Isso vai listar quais processos estão usando o dispositivo ttyUSB0. Você pode matar o processo

# -----------------------------------------------------------------------------------------------------

# Erro relacionado à detecção do dispositivo USB
#
# dmesg
#
# ...
#
# [  212.130445] usb 2-3: device descriptor read/64, error -71
#
#
# Este é um erro que ocorre quando o sistema não consegue se comunicar corretamente com o dispositivo USB. O erro -71 significa 
# que ocorreu um protocolo de erro durante a transferência de dados.
#
# Além disso, a mensagem exibida, "usb 2-3: device descriptor read/64, error -71", indica que o erro ocorreu no dispositivo USB 
# conectado à porta 2-3 do computador.
#
# Este erro pode ser causado por várias razões, como um dispositivo USB defeituoso, um cabo USB danificado, uma porta USB danificada 
# ou arquivos de sistema corrompidos.
#
#
# Tente os seguintes procedimentos para solucionar o problema:
#
# Desconecte e reconecte o dispositivo USB.
#
# Verifique se a porta USB está funcionando corretamente. Tente usar um dispositivo USB diferente ou tente conectar o dispositivo a uma porta USB diferente.
#
# Verifique se o dispositivo e o cabo USB estão funcionando corretamente, conectando-os a outro computador.
#
#
# Verificar se o sistema operacional está reconhecendo o seu dispositivo. Para isso, em seu terminal, execute o comando lsusb
#
# lsusb
#
# Verifique se o seu dispositivo está listado. Se não, tente reconectá-lo e veja se muda de alguma forma.

# dmesg -C
#
# lsusb -t
#
# Esses comandos irão limpar o buffer do dmesg e listar as conexões USB ativas, respectivamente. Depois, reconecte o dispositivo e use o seguinte comando para ver os logs do kernel:
#
# dmesg
#
# Se o problema persistir, você pode tentar desativar o USB 3.0 no BIOS ou UEFI, ou atualizar o sistema operacional.

# Em seguida, podemos usar o dmesg para procurar quaisquer mensagens de erro relacionadas à tentativa de conexão do dispositivo:

# dmesg | tail

# Isso listará as últimas mensagens do sistema.

# -----------------------------------------------------------------------------------------------------



# lsof /dev/ttyUSB0
# lsof: WARNING: can't stat() fuse.gvfsd-fuse file system /run/user/1000/gvfs
#       Output information may be incomplete.
# lsof: WARNING: can't stat() fuse.portal file system /run/user/1000/doc
#       Output information may be incomplete.
# COMMAND   PID USER   FD   TYPE DEVICE SIZE/OFF NODE NAME
# pppd    30610 root    0u   CHR  188,0      0t0 1196 /dev/ttyUSB0
# pppd    30610 root    1u   CHR  188,0      0t0 1196 /dev/ttyUSB0
# pppd    30610 root    2u   CHR  188,0      0t0 1196 /dev/ttyUSB0
# pppd    30610 root   14u   CHR  188,0      0t0 1196 /dev/ttyUSB0


# ls -l /usr/bin/pppd
# -rwxr-xr-x 1 root root 407912 mar 21  2021 /usr/bin/pppd



# fuser -av /dev/ttyUSB*
#                     USUÁRIO     PID ACESSO COMANDO
# /dev/ttyUSB0:        root      30610 F.... pppd
# /dev/ttyUSB1:        root       1039 F.... ModemManager


# Isso pode ser um problema de permissões. Tente executar:

# sudo chmod a+rw /dev/ttyUSB0

# Em seguida, conecte-se novamente.


# https://superuser.com/questions/1455327/trying-to-read-a-serial-port-device-or-resource-busy
# https://askubuntu.com/questions/1202818/minicom-cannot-open-dev-ttyusb3-device-or-resource-busy
# https://www.linux.org.ru/forum/general/12476551
# https://www.vivaolinux.com.br/topico/Sed-Awk-ER-Manipulacao-de-Textos-Strings/Remover-espacos-vazios-de-um-texto.


# --------------------------------------------------------------------------------------

# Verificando se o usuário esta no grupo dialout


# ls -l /dev/ttyUSB0
# crw-rw---- 1 root dialout 188, 0 ago 21 12:29 /dev/ttyUSB0


cat /etc/group | grep $USER | grep dialout 1> /dev/null

if [ "$?" = "0" ] ;
then

# clear

echo "Usuário $USER está no grupo dialout."



else

# clear

echo '

Usuário "'$USER'" não está no grupo dialout.

Adiciona o usuário "'$USER'" no grupo dialout e reinicia o sistema:

# sudo usermod -aG dialout '$USER'

# reboot
'

exit


fi

# --------------------------------------------------------------------------------------





# Verificar se o arquivo /etc/wvdial.conf  existe

# Comentei a linha abaixo no wvdial.conf
# Init2 = ATQ0 V1 E1 S0=0 &C1 &D2 +FCLASS=0

if [ -e "/etc/wvdial.conf" ] ; then

# clear

echo "
O arquivo /etc/wvdial.conf existe.
"

sleep 2

echo "
Matando os processos do wvdial e do ppp caso eles existem...
"
pkill wvdial

pkill ppp


killall -9 wvdial

killall -9 pppd


poff -a






echo "
Discando...
"

# A chamada do comando wvdial aqui esta conforme a configuração do arquivo /etc/wvdial.conf
#
# Exemplo:
#
# cat  /etc/wvdial.conf | grep -i dialer
#
# [Dialer Defaults]  => wvdial     (/dev/ttyUSB0)
# [Dialer 3g]        => wvdial 3g  (/dev/ttyUSB1)
# [Dialer 1]         => wvdial 1   (/dev/ttyUSB0)
# [Dialer 2]         => wvdial 2


# Funcionando mesmo com o aviso de "Falha de segmentação" no Wvdial (/dev/ttyUSB0).
#
wvdial 1 &


# A linha 36 é o começo desta função.

# /usr/local/bin/conectar.sh, linha 36: 13510 Falha de segmentação  wvdial 1



# Não funcionou (/dev/ttyUSB1)
#
# wvdial 3g &



# Não funcionou (/dev/ttyUSB0)
#
# wvdial &


# wvdial 2 &


# Recebo uma mensagem de erro "Falha de segmentação"

# https://github.com/NixOS/nixpkgs/issues/20344


sleep 30


echo "
Verificando o acesso à internet..."


ping -c 10 www.google.com.br  1> /dev/null 2> /dev/null


if [ "$?" -eq "0" ];
then 

      echo -e "\e[1;32m\n[VERIFICADO] - Conexão com à internet funcionando normalmente.\n\e[0m"

      sleep 30
else 

     echo -e "\e[1;31m\n[ERRO] - Seu sistema não tem conexão com à internet. Verifique os cabos e o modem.\n\e[0m"

     exit

fi



else

clear

echo "O arquivo /etc/wvdial.conf não existe..."

sleep 3

clear

exit 2

fi



}





ppp(){


clear


# Verificar se os programas estão instalados

# which xfce4-terminal || exit 3
which notify-send    || exit 4



# Verificar se o dispositivo foi reconhecido pelo sistema.

ls -l /dev/ttyUSB* 1> /dev/null

if [ "$?" = "0" ] ;
then

clear

# echo "Modem USB reconhecido pelo sistema."

notify-send -i  /usr/share/icons/gnome/48x48/devices/gnome-modem.png -t 200000 "Conectando a internet..." "Modem USB reconhecido pelo sistema."

# /usr/share/icons/hicolor/scalable/apps/nm-device-wired.svg


else

clear

# echo "Modem USB não foi reconhecido pelo sistema." && exit

notify-send -i  /usr/share/icons/hicolor/scalable/apps/nm-no-connection.svg  -t 200000 "Sem acesso à internet..." "Modem USB não foi reconhecido pelo sistema." && exit

# /usr/share/icons/gnome/48x48/status/stock_dialog-warning.png

fi


# -------------------------------------------------------------------------------------------------


# Verificar se a interface de rede ppp foi criada pelo sistema.

# O sed remove espaços vazios da saída final. Ex: ppp0


ip a | grep ppp* | cut -d: -f2 | head -n1 | sed 's/ //g'

if [ "$?" = "0" ] ;
then

clear

# echo "A interface de rede ppp foi criada pelo sistema."

notify-send -i  /usr/share/icons/gnome/48x48/devices/gnome-modem.png -t 200000 "Conectando a internet..." "A interface de rede ppp foi criada pelo sistema."

# /usr/share/icons/hicolor/scalable/apps/nm-device-wired.svg


else

clear

# echo "A interface de rede ppp não foi criada pelo sistema." && exit

notify-send -i /usr/share/icons/hicolor/scalable/apps/nm-no-connection.svg  -t 200000 "Sem acesso à internet..." "A interface de rede ppp não foi criada pelo sistema." && exit

# /usr/share/icons/gnome/48x48/status/stock_dialog-warning.png 

fi


# -------------------------------------------------------------------------------------------------


# Modo grafico



clear

echo "
Matando os processos do wvdial e do ppp caso eles existem...
"

pkill ppp

pkill wvdial

killall -9 pppd

killall -9 wvdial


/usr/bin/poff -a





echo "
Discando...
"

# A chamada do comando pon aqui esta conforme as configurações dos arquivos na pasta /etc/ppp/
#
# Exemplo:
#
# ls /etc/ppp/ | grep -i E220
# chat-E220-nopin
# chat-E220-pin


/usr/bin/pon E220





echo -e "\n\nVerificando o acesso a internet...\n"

sleep 30

ping -c 10 www.google.com.br 

if [ "$?" = "0" ] ;
then

clear

notify-send -t 100000 -i /usr/share/icons/hicolor/scalable/apps/nm-device-wired.svg  'Atenção!' "Você esta com acesso a internet..."


else

clear

notify-send --urgency=critical -t 100000 -i /usr/share/icons/hicolor/scalable/apps/nm-no-connection.svg 'Atenção!'  "Ocorreu um problema de rede, você está \nsem acesso a internet..." && exit


fi



# /usr/sbin/pppd: In file /etc/ppp/peers/E220: unrecognized option '/dev/ttyUSB0'


# https://embarcados.com.br/modem-gsm-3g-4g-no-linux-embarcado/

# -------------------------------------------------------------------------------------------------


# Modo texto


# cat ~/.bashrc | grep conectar
#
# alias conectar='/usr/local/bin/conectar.sh ppp'



# -------------------------------------------------------------------------------------------------

}



networkmanager(){

clear

# Verificar se os programas estão instalados

which nmcli                1> /dev/null || exit
which nm-connection-editor 1> /dev/null || exit



nmcli con show

# NAME                     UUID                                  TYPE      DEVICE  
# Claro 3G                 c2c475b4-a6d0-4bed-9f3c-5ce9bb412827  gsm       ttyUSB1 



# GSM: 850 MHz, 900 MHz, 1800 MHz e 1900 MHz. Cada operadora de telefonia brasileira trabalha em frequências diferentes.

# UMTS
# HSPA (HSDPA e HSUPA)

# https://www.tudocelular.com/tech/noticias/n125228/tudocelular-explica-redes-moveis-gsm-3g-4g-lte.html


ip a


echo "
Desconectando da internet...
"

nmcli con down "Claro 3G"


echo "
Discando...
"

# A chamada do comando nmcli abaixo esta conforme as configurações dos arquivos na pasta /etc/NetworkManager/system-connections/
#
# Exemplo:
#
# ls -l /etc/NetworkManager/system-connections/
# total 12
# -rw------- 1 root root 301 ago 21 16:36 'Claro 3G.nmconnection'



# Para conectar à internet

nmcli con up "Claro 3G"
# Conexão ativada com sucesso (caminho D-Bus ativo: /org/freedesktop/NetworkManager/ActiveConnection/4)


# Para desconectar da internet

# nmcli con down "Claro 3G"
# Conexão “Claro 3G” desativada com sucesso (caminho D-Bus ativo: /org/freedesktop/NetworkManager/ActiveConnection/10)


# Para reconectar a internet
#
# nmcli con down "Claro 3G" ; nmcli con up "Claro 3G"



# Listar as redes Wi-Fi disponíveis usando o NetworkManager

# nmcli dev wifi list



# Você pode conectar a uma rede Wi-Fi usando:
#
# nmcli dev wifi connect "nome_do_hotspot" password "sua_senha"
#
# Substitua "nome_do_hotspot" e "sua_senha" pelo nome e a senha do hotspot Wi-Fi ao qual você quer se conectar.


# -------------------------------------------------------------------------------------------------




# Em quem arquivo o nm-connection-editor salva a opção de "Conectar automaticamente com prioridade"?
#
#
# A opção de "Conectar automaticamente com prioridade" configurada no nm-connection-editor (Network Manager Connection Editor) 
# são salvas no arquivo correspondente à configuração da conexão ethernet no diretório /etc/NetworkManager/system-connections/.
#
# Assim, as configurações de uma conexão específica são salvas em um arquivo com o nome da própria conexão. Por exemplo, se sua 
# conexão se chama "eth0", as configurações serão salvas no arquivo "eth0".
#
# Você pode visualizar as configurações da sua conexão com o comando:
#
# cat /etc/NetworkManager/system-connections/[nome_da_sua_conexão]
#
# Não se esqueça de executar esse comando como root (#), já que os arquivos de configuração do NetworkManager estão protegidos.
#
# Lembre-se de substituir o termo [nome_da_sua_conexão] pelo nome da conexão que deseja verificar.
#
# Para editar manualmente caso necessário, você pode usar o nano (ou seu editor de texto preferido), com o comando:
#
# nano /etc/NetworkManager/system-connections/[nome_da_sua_conexão]
#
# Mas lembre-se, faça com cautela para evitar problemas na sua conexão de rede.
#


# Qual variável nos arquivos em /etc/NetworkManager/system-connections/ ativa a opção de "Conectar automaticamente com prioridade"?
#
#
# A variável responsável por ativar a "Conectar automaticamente com prioridade" nos arquivos dentro de /etc/NetworkManager/system-connections/ 
# é a variável autoconnect-priority.
#
# Você pode encontrar esta opção na seção de [connection] do arquivo de configuração da sua conexão. O valor dessa variável deve ser um número 
# inteiro. Conexões com um número mais alto têm prioridade sobre conexões com um número mais baixo. A conexão automática é desativada se o 
# valor for definido como -1.


# cat  /etc/NetworkManager/system-connections/* | grep autoconnect-priority
# autoconnect-priority=1



# O nm-connection-editor pode ser usado com o usuário comum ou somente como Root?
#
# Como o usuário comum altera as opções no nm-connection-editor se não tem pode de root e nem de sudo?
#
#
# O nm-connection-editor é uma ferramenta que permite que os usuários criem, editem e excluam conexões de rede. Ele pode ser iniciado tanto 
# pelo usuário comum quanto pelo usuário root, mas só o usuário root pode realmente aplicar as alterações.
#
# Se você estiver em uma sessão de usuário comum e tentar editar uma conexão de rede, o nm-connection-editor solicitará automaticamente as 
# credenciais do superusuário. Caso você não tenha essas credenciais, não poderá realizar alterações nas configurações das conexões de rede.
#
# Para iniciar o nm-connection-editor use o seguinte comando:
#
# nm-connection-editor
#
# Se um usuário comum precisa fazer alterações regulares nas conexões de rede e não tem poderes de superusuário, recomendo discutir essa necessidade 
# com o administrador do sistema. Dependendo do contexto, o administrador pode escolher dar a esse usuário privilégios específicos ou uma solução alternativa.


# Qual grupo no sistema que altera as configurações no nm-connection-editor?

# Para alterar as configurações no nm-connection-editor, você precisa ter privilégios de administrador (root) e ser membro do grupo 'sudo' 
# ou 'netdev', dependendo da distribuição Linux que você está utilizando.


# Verificar /etc/NetworkManager/NetworkManager.conf


# Qual grupo equivale ao netdev no Void Linux?

# cat /etc/group | grep netdev

# O grupo equivalente ao netdev, utilizado em outras distribuições para designar usuários que podem gerenciar redes, é o grupo network.

# cat /etc/group | grep network
# network:x:21:


# Para adicionar um usuário a esse grupo, você deve usar o seguinte comando no terminal:

# usermod -a -G network nome_do_usuário



# nmcli -f autoconnect-priority,name c
# AUTOCONNECT-PRIORITY  NAME                    
# 0                     lo                      
# 0                     Claro 3G                
# 0                     DIRECT-9E-EPSON-4AFFBF  
# 0                     DIRECT-epson-026d-0-001 
# -999                  Wired connection 1      


# nmcli c 
# NAME                     UUID                                  TYPE      DEVICE 
# lo                       57edc426-9ead-4e99-b5df-c51501cebad7  loopback  lo     
# Claro 3G                 c2c475b4-a6d0-4bed-9f3c-5ce9bb412827  gsm       --     
# DIRECT-9E-EPSON-4AFFBF   b754c7c5-113c-4ded-9b1d-1a0a7ff3efc2  wifi      --     
# DIRECT-epson-026d-0-001  3bffc2e3-db3d-4c04-8cb5-53f568e12320  wifi      --     
# Wired connection 1       152f695c-f5e7-33fe-b1fc-f5261bcc3c3e  ethernet  --    


# nmcli dev status
# DEVICE   TYPE      STATE                   CONNECTION 
# ttyUSB1  gsm       conectado               Claro 3G   
# lo       loopback  connected (externally)  lo         
# ppp0     ppp       desconectado            --         
# enp5s0   ethernet  não disponível          --    


# nmcli con show "Claro 3G"
# connection.id:                          Claro 3G
# connection.uuid:                        c2c475b4-a6d0-4bed-9f3c-5ce9bb412827
# connection.stable-id:                   --
# connection.type:                        gsm
# connection.interface-name:              --
# connection.autoconnect:                 sim
# connection.autoconnect-priority:        0
# connection.autoconnect-retries:         -1 (default)



# nmcli con show

# ip a


# Para conectar a internet

# nmcli con up "Claro 3G"
# Conexão ativada com sucesso (caminho D-Bus ativo: /org/freedesktop/NetworkManager/ActiveConnection/4)


# Para desconectar da internet

# nmcli con down "Claro 3G"
# Conexão “Claro 3G” desativada com sucesso (caminho D-Bus ativo: /org/freedesktop/NetworkManager/ActiveConnection/10)


# Para reconectar a internet
#
# nmcli con down "Claro 3G" ; nmcli con up "Claro 3G"



# nmcli connection show
# NAME                     UUID                                  TYPE      DEVICE  
# Claro 3G                 c2c475b4-a6d0-4bed-9f3c-5ce9bb412827  gsm       ttyUSB1 
# lo                       57edc426-9ead-4e99-b5df-c51501cebad7  loopback  lo      
# DIRECT-9E-EPSON-4AFFBF   b754c7c5-113c-4ded-9b1d-1a0a7ff3efc2  wifi      --      
# DIRECT-epson-026d-0-001  3bffc2e3-db3d-4c04-8cb5-53f568e12320  wifi      --      
# Wired connection 1       152f695c-f5e7-33fe-b1fc-f5261bcc3c3e  ethernet  --      



# nmcli device
# DEVICE   TYPE      STATE                   CONNECTION 
# ttyUSB1  gsm       conectado               Claro 3G   
# lo       loopback  connected (externally)  lo         
# ppp0     ppp       desconectado            --         
# enp5s0   ethernet  não disponível          --         



# https://askubuntu.com/questions/165679/how-to-manage-available-wireless-network-priority
# https://tecnoblog.net/responde/grep-tutorial-linux-codigo/
# https://askubuntu.com/questions/165679/how-to-manage-available-wireless-network-priority
# https://pt.linux-console.net/?p=1404#gsc.tab=0
# https://wiki.archlinux.org/title/NetworkManager_(Portugu%C3%AAs)




}






ajuda(){

clear


echo "
Dica:

Conecte o modem USB

Adicione seu usuário aos grupos dialout e dip

cat /etc/group | grep $USER

`cat /etc/group | grep $USER | cut -d: -f1`


--------

dialout
dip
plugdev
netdev


Achar a configuração do usb-modeswitch para esse modem

Certifique-se de que está no modo correto com usb_modeswitch

Edite o arquivo de configuração do usb_modeswitch:

sudo xdg-open /etc/usb_modeswitch.conf


Instale os pacotes abaixo:

network-manager network-manager-gnome modemmanager usb-modeswitch mobile-broadband-provider-info pppconfig wvdial usb-modeswitch usb-modeswitch-data 

De todos, o mais importante é o modemmanager, carregando o módulo necessário à ativação do modem pelo polivalente usb-modeswitch. 

Após conectado o modem, aguarde alguns segundos (30s), até que o Linux reconheça o modem.


Se usar modem 3G configura o arquivo /etc/wvdial.conf , NetworkManager (nm-connection-editor) ou ppp.

"

}




# Três forma de conectar à internet:
# 
# /usr/local/bin/conectar.sh dial
# /usr/local/bin/conectar.sh ppp
# /usr/local/bin/conectar.sh networkmanager




case $1 in

   dial)
      dial;
   ;;
   
   ppp)
      ppp;
   ;;
   
   networkmanager)
      networkmanager;
   ;;
   
   ajuda)
      ajuda;
   ;;
      
   *)
      echo "Use $0 (dial|ppp|networkmanager|ajuda)"
      
      exit 
   ;;
   
esac


exit 0

