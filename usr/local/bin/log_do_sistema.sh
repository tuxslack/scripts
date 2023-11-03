#!/bin/bash
#
# ###################################################################################### #
#                                                                                        #                  
#                                                                                        #
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/                   #
# Data:     03/11/2023 as 01:01                                                          #
# Homepage: https://github.com/tuxslack/scripts                                          #
# Licença:  GPL                                                                          #
# Versão:   20231103                                                                     # 
# Script:   log_do_sistema.sh                                                            # 
# Objetivo:                                                                              #
#                                                                                        # 
# Shell Script com Yad - Lendo arquivo de log do sistema                                 #
#                                                                                        #
# Obs: Não esqueça que para funcionar o pacote Yad                                       #
#      tem que estar instalado no seu sistema.                                           # 
#                                                                                        # 
#                                                                                        # 
# ###################################################################################### #
#
#
#
# Faça uma verificação geral em busca de erros nos logs do sistema
#
# Verificar erros no Linux
#
#
# Quando inicio o sistema, aparece uma mensagem de erro sempre, isso desde quando 
# instalei, aí gostaria de verificar. 
#
# Um para todos não existe
# Mas existem vários comandos para cada situação específica
# E há erros causados geralmente pelo usuário desavisado que não tem jeito
#
# https://plus.diolinux.com.br/t/ha-alguma-forma-de-verificar-erros-no-ubuntu/56575
#
#
#
#
# Quando o sistema trava, congela ou da Kernel Panic. É gerado algum log com a mensagem de erro?
#
# Todos os logs gerados pelo sistema ficam em "/var/log".
#
#
# Os logs pode ficar com GB ou TB de tamanho absurdo por causa de firewall, com o gufw aberto, 
# ir em preferências e marque para ele não salvar os logs, ou deixe-o em low.
#
#
# 
# 
# Minha pasta log está ficando gigante... agora ela está com 1,6 GB... já exclui os 
# logs semana retrasada e mesmo assim ela ficou com 500 MB sem nada dentro.
# 
# Você viu o logs? deve estar acontecendo algo para gerar tantos logs assim.
# 
# du -h /var/log/* | sort -h
# 
# 
# sudo du -h /var/log/* | sort -h
# [sudo] password for juliana: 
# 4,0K	/var/log/btmp
# 4,0K	/var/log/fontconfig.log
# 8,0K	/var/log/alternatives.log
# 16K	/var/log/preload.log
# 40K	/var/log/lightdm
# 40K	/var/log/Xorg.0.log
# 40K	/var/log/Xorg.0.log.old
# 44K	/var/log/Xorg.1.log
# 96K	/var/log/daemon.log
# 124K	/var/log/apt
# 124K	/var/log/messages
# 160K	/var/log/auth.log
# 236K	/var/log/wtmp
# 240K	/var/log/vbox-install.log
# 256K	/var/log/dpkg.log
# 280K	/var/log/user.log
# 1008K	/var/log/syslog
# 6,5M	/var/log/debug
# 6,6M	/var/log/kern.log
# 
# 
#
# https://www.vivaolinux.com.br/topico/Debian/Pasta-LOG-ficando-gigante
# 
# 
# 
# https://www.vivaolinux.com.br/topico/yad/Criar-menu-com-radiolist/
# https://www.vivaolinux.com.br/topico/Linux-Basico/Log-de-erros
# https://aurelio.net/shell/dialog/
# https://www.pclinuxos.com/forum/index.php?topic=149893.0
# https://explainshell.com/explain?cmd=grep.1%20-oE%20%22ERROR%7CWARN%22%20%2Alog%2A%20%7C%20sort%20%7C%20uniq%20-c
# https://medium.com/devops-engineering-on-cloud/troubleshooting-application-issues-using-find-and-grep-in-linux-70ccc84d1bc7
# https://www.vivaolinux.com.br/dica/Analisado-logs-do-Samba
# https://www.vivaolinux.com.br/topico/Shell-Script/verificar-se-arquivo-existe
# https://www.vivaolinux.com.br/topico/Shell-Script/Verificar-se-diretorio-existe-nao-entra-no-if
# http://dclarks.blogspot.com/2012/02/limpar-os-arquivos-de-varlog.html
# https://www.vivaolinux.com.br/artigo/Sistema-de-gerenciamento-de-logs-do-Linux
# https://www.vivaolinux.com.br/dica/Relatorio-do-SARG-com-o-access.log-do-Dansguardian
# https://plus.diolinux.com.br/t/kde-demorando-para-iniciar/8736/3
# https://plus.diolinux.com.br/t/notebook-nao-liga-apos-aviso-de-falta-de-espaco/48635
# https://plus.diolinux.com.br/t/preciso-reiniciar-o-notebook-pro-sistema-funcionar-normal/4843
# https://learn.microsoft.com/pt-br/troubleshoot/azure/virtual-machines/how-to-use-perfinsights-linux
# https://pt.linux-console.net/?p=1633#gsc.tab=0
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=12713



clear


# ls -1 /var/log/socklog/

# ls -1 /var/log/



# find / -iname "*.log"  > /tmp/arquivo_de_log.txt


echo "
# Falta fazer:
 
# /var/log/lastlog
# /var/log/dist-upgrade
# /var/log/wtmp
# /var/log/private
# /var/log/gdm3 
# /var/log/speech-dispatcher
# /var/log/apt 
# /var/log/hp 
# /var/log/installer 
# /var/log/boot-repair 
# /var/log/journal 
# /var/log/unattended-upgrades
# /var/log/btmp 
# /var/log/wpslog
# /var/log/openvpn 
# /var/log/mensagens
# /var/log/sysstat ou /var/log/sa [**]
# /var/log/cloud-init.log
# /var/log/cloud-init-output.log
# /var/log/waagent.log
# /var/log/azure/[pasta de extensão]/*log*
# /var/opt/microsoft/omsconfig/omsconfig.log
# /var/opt/microsoft/omsagent/log/omsagent.log
# /etc/waagent.config

/var/log/apt
/var/log/aptitude
/var/log/btmp
/var/log/btmp.1
/var/log/ConsoleKit
/var/log/cups
/var/log/dmesg

/var/log/hp
/var/log/installer
/var/log/lastlog
/var/log/mdm
/var/log/mintsystem.log
/var/log/mintsystem.timestamps
/var/log/ntpstats
/var/log/speech-dispatcher
/var/log/unattended-upgrades
/var/log/upstart
/var/log/vbox-install.log
/var/log/wtmp
/var/log/wtmp.1


du -ha
0 ./bootstrap.log
96K ./auth.log
4,0K ./openvpn
0 ./boot.log.5
4,0K ./dist-upgrade
4,0K ./private
0 ./btmp
4,0K ./gpu-manager-switch.log
36K ./boot.log.1
8,1M ./journal/13da3002fed0469283aaa613e785092e/system@0005ab9f26fafd8d-d2ff39a8298c15ee.journal~
129M ./journal/13da3002fed0469283aaa613e785092e/system@4a801ec725a440fa957f358746bc387c-0000000000000001-0005ab9f26f8f0ac.journal
17M ./journal/13da3002fed0469283aaa613e785092e/user-1000.journal
33M ./journal/13da3002fed0469283aaa613e785092e/system.journal
49M ./journal/13da3002fed0469283aaa613e785092e/user-1000@6c399bff55184a8db619879be7747a4c-0000000000000abb-0005ab9f285ffe5b.journal
233M ./journal/13da3002fed0469283aaa613e785092e
233M ./journal
0 ./boot.log.6
24K ./boot.log.3
0 ./ubuntu-advantage.log
0 ./btmp.1
4,0K ./hp/tmp
8,0K ./hp
24K ./dpkg.log
28K ./wtmp
44K ./Xorg.1.log.old
du: não foi possível ler diretório ‘./gdm3’: Permissão negada
4,0K ./gdm3
37G ./uvcdynctrl-udev.log
4,0K ./auth.log.2.gz
4,0K ./apt/history.log
4,0K ./apt/term.log.1.gz
16K ./apt/term.log
80K ./apt/eipp.log.xz
4,0K ./apt/history.log.1.gz
0 ./apt/history.log.2.gz
0 ./apt/term.log.2.gz
112K ./apt
0 ./fontconfig.log
76K ./auth.log.1
du: não foi possível ler diretório ‘./speech-dispatcher’: Permissão negada
4,0K ./speech-dispatcher
0 ./boot.log.7
0 ./lastlog
4,0K ./boot.log.2
0 ./boot.log.4
120K ./boot.log
0 ./installer/media-info
0 ./installer/syslog
0 ./installer/version
0 ./installer/telemetry
0 ./installer/debug
0 ./installer/initial-status.gz
0 ./installer/partman
0 ./installer/casper.log
4,0K ./installer
"



# Comando find para buscar extensão.
#
# 
# find /var/log -iname "*.log*"
#
# /var/log/Xorg.1.log.old
# /var/log/dmesg.log
# /var/log/rkhunter.log
# /var/log/lynis.log
# /var/log/lxdm.log
# /var/log/Xorg.0.log
# /var/log/timeshift/2023-05-16_13-42-59_gui.log
# /var/log/timeshift/2023-01-28_14-10-26_gui.log
# /var/log/timeshift/2023-05-16_13-32-35_gui.log
# /var/log/lxdm.log.old
# /var/log/Xorg.0.log.old
# /var/log/rkhunter.log.old
# /var/log/chkrootkit.log
# /var/log/wicd/wicd.log.1
# /var/log/wicd/wicd.log
# /var/log/php-fpm.log
# /var/log/Xorg.1.log
# 
# 
# 
# 
# No Void Linux
# 
#
# find /var/log -iname "current" 
#
# /var/log/socklog/cron/current
# /var/log/socklog/daemon/current      
# /var/log/socklog/tty12/current       <====
# /var/log/socklog/remote-udp/current  <====
# /var/log/socklog/mail/current        <====
# /var/log/socklog/lpr/current         <====
# /var/log/socklog/debug/current
# /var/log/socklog/kernel/current
# /var/log/socklog/user/current        
# /var/log/socklog/everything/current
# /var/log/socklog/secure/current
# /var/log/socklog/errors/current
# /var/log/socklog/messages/current
# /var/log/socklog/xbps/current
# 
# 
# 
# https://www.vivaolinux.com.br/topico/Comandos/Comando-find-para-buscar-mais-de-1-extensao


clear


which yad         || exit 2
which tail        || exit 3
which pkexec      || exit 4
which grep        || exit 5
which tee         || exit 6
which notify-send || exit 7
which less        || exit
which more        || exit
which dmesg       || exit
which cut         || exit


# Usado no Void Linux

which socklog


# O "gksu" salvo na pasta /usr/local/bin/ esta assim => pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY "$@"




# Os arquivos .gz na pasta /var/log/ são arquivos antigos que foram compactados.
# 
# Ex:
# 
# dmesg.1 
# dmesg.2.gz 
# syslog.2.gz
# dmesg.3.gz
# syslog.3.gz
# dmesg.4.gz




# Para verificar:

# tamanho_da_pasta_log=`du -hs "/var/log"`

# echo "$tamanho_da_pasta_log"

# ls -hals /var/log

# Monitore o log em tempo real para ver o que está acontecendo, pode ser pelo 
# journalctl -f ou no modo antigo com tail -f arquivogigante.log


# Dê uma olhada nos Snaps antigos. O Snap age automaticamente baixando versões mais novas em 
# segundo plano quando disponível, e quando você se dá por conta a unidade tá lotada.
#
# Lista todos os snaps instalados:
# $ snap list --all


# https://plus.diolinux.com.br/t/subita-ocupacao-da-particao/21286




yad --center --title='Log do sistema' --text='\n\n

O arquivo /var/log/syslog não está disponível no VoidLinux, pois essa distribuição Linux utiliza o runit ao invés do 
systemd para gerenciar os serviços. Por causa disso, os logs são direcionados para o socklog e são gravados no /var/log/socklog.


Alguns arquivos de log são filtrados por:

"failed|error|WARNING|DENIED|Firmware|disconnected|not supported|No such file or directory|Cannot|blocks|Could not determine|Permission denied"


Algumas coisa que a analise de log pode ajuda a resolver os problemas:

Processos de telemetrias;
Sistema inchado coletando tudo;
Causando um atraso no carregamento dos sites;
updates incontroláveis;
Cheio de bloatware (programa inútil, que por uma série de razões não pode ser removido ou desativado.);
Mensagem de memória cheia;
Algumas travadas no sistema;
Otimização do sistema;
Sistema travado totalmente e teve que desligar na força;
Sistema não inicia e fica voltando ao momento de por a senha;
Desinstalar os pacotes órfãos;
Limpeza periódica;
Vulnerabilidades no sistema;
Arquivo com Malware, vírus e outros (escalação de privilégios);
Notebook não liga após aviso de falta de espaço;
O disco cheio (partição raiz), o sistema não consegue criar arquivos temporários 
para iniciar corretamente o computador deletar alguns arquivos para recuperar 
espaço livre e o sistema voltar a carregar a interface gráfica; 
Problema com atualização do sistema;
Confira o espaço alocado nas partições: df -h e veja qual partição está com uso 100%;
Problema de hardware;
Teste de Hardware;
Limpeza do sistema;
Resetar a senha do Root;
Problema de falta de firmware;

KDE demorando para iniciar (limpar o arquivo de inicialização)  => verifica com systemd-analyze blame ;

O problema não era na inicialização do sistema, mas sim do KDE Plasma;

Desativar o "Chaveiro do KDE" (kwallet) / serviços do akonadi;

Limpeza na pasta ~/.cache (~/.cache/akonadi) que tinha quase 500 MB;

Não abre /home cryptografada (montar manualmente a partição);
Demorando para dar reboot;
Suporte para migração de sistema;
Para detectar problemas e mau funcionamento do software.

'  2>/dev/null

# --timeout=10 --no-buttons




# Loop que mostra o menu principal

while : ; do



# Obs: A barra invertida quebra a linha esteticamente,
#      Porem nao ha quebra no comando. 


    # Mostra o menu na tela, com as ações disponíveis

opcao=$(yad --list --radiolist --title "Log do sistema" --center --on-top --window-icon "$ICON" --image "$IMAGE" \
--text "Escolha um log para visualizar:" \
--columns=2 \
--column "Opção" \
--column "descrição" \
--width="450" --height="1000" \
false "Procurar palavra nos logs" \
false "journalctl" \
false "debug" \
false "messages" \
false "kernel.log" \
false "errors" \
false "cron" \
false "rkhunter.log" \
false "wicd.log" \
false "lynis.log" \
false "Xorg.log" \
false "Log de acesso do servidor Apache" \
false "Log de error do servidor Apache" \
false "PHP" \
false "dmesg" \
false "dmesg --level=warn e dmesg --level=err" \
false "timeshift" \
false "Squid" \
false "Zabbix" \
false "Log de acesso" \
false "maillog" \
false "syslog" \
false "history Root" \
false "ClamAV" \
false "cups" \
false "chkrootkit.log" \
false "lxdm.log" \
false "inkscape" \
false "qBittorrent" \
false "TeamViewer" \
false "xbps" \
false "daemon" \
false "user" \
false "everything" \
false "secure" \
false "arquivos recentes" \
false "ufw" \
false "xsession-errors" \
false "Samba" \
false "dpkg" \
false "Fontconfig" \
false "Preload" \
false "LightDM" \
false "Alternatives" \
false "boot" \
false "FTP" \
false "XMind" \
false "bootstrap.log" \
false "apport.log" \
false "access.log" \
false "gpu-manager.log" \
false "danguardian" \
false "mysql" \
false "yum" \
false "faillog" \
false "NVIDIA" \
false "unattended-upgrades" \
false "virtualbox" \
false "Erros no Cron" \
false "fsck" \
true "Sair" \
--print-column=1 --print-column 2 --buttons-layout=center --button="OK":2  --button="Cancelar":1  2> /dev/null )


if [ $? = "1" ]; then clear && exit 1; fi; opcao=$(echo $opcao | cut -d '|' -f1);




# =====================================================================================================


    # Se apertar CANCELAR ou ESC, então vamos sair...
    
    [ $? -ne 0 ] && break
    
# echo "$opcao"


# De acordo com a opção escolhida, dispara programas

case "$opcao" in


# =====================================================================================================

"Procurar palavra nos logs")



# Em relação ao WPS vc tinha algo faltando na saída do comando (Erro de biblioteca):
#
# ldd `which programa_WPS`
#
# cd /var/log && grep -rli wps *
#
#
# https://youtu.be/PIXZw_iIHMo




# Verificar se diretório existe

if [ -d "/var/log/" ] ; then

clear




procurar=$( yad \
        --center \
        --entry \
        --entry-label="Encontre trechos de palavra nos arquivos de log em: /var/log/" \
        --entry-text="nscd" \
        --completion \
        --editable \
        --title="Procurar palavra nos logs" \
        --width="700" 2> /dev/null
) 




# Para verificar se a variavel é nula

if [ -z "$procurar" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar uma palavra ou trecho para realizar uma busca nos arquivos de log do sistema...\n\n' --timeout=30 --no-buttons 2>/dev/null

clear

# break

exit 8

fi




# grep - Pesquise por palavras dentro de arquivos de texto
# 
# 
# O comando "grep" é muito utilizado quando necessitamos procurar por uma determinada palavra 
# dentro de um ou mais arquivos.
# 
# A sintaxe do comando é: grep -R "palavra" *, onde R é um parâmetro que define a recursividade 
# da busca, ou seja, a busca irá partir do diretório base e seguir para seus subdiretórios também 
# e o * (asterisco) para todos os arquivos, independente do nome e extensão.
# 
# 
#
# grep -R "nscd" /var/log/


# grep CRON /var/log/syslog 



rm -Rf /tmp/busca_palavra*.txt


# Ele vai procurar o trecho em todos os arquivos e diretórios que estejam dentro de /var/log/
#
# Dependendo da quantidade de arquivos e do tamanho deles, isso pode levar alguns minutos ou 
# várias horas. Então use essa opção com cuidado. Se você quiser, pode fazer uma busca que 
# não se importe com maiúsculas ou minúsculas usando a opção -i.
#
# Aqui, o grep vai retornar qualquer resultado que bater com o trecho desejado, independente 
# se houverem maiúsculas.


# grep -Ri "$procurar" /var/log/ > /tmp/busca_palavra-$(date "+%d-%m-%Y-%H-%M").txt


grep -R "$procurar" /var/log/ > /tmp/busca_palavra-$(date "+%d-%m-%Y-%H-%M").txt 


sleep 1


cat /tmp/busca_palavra-$(date "+%d-%m-%Y-%H-%M").txt  | yad --center --title='Procurar palavra nos logs' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


chmod 777 /tmp/busca_palavra-$(date "+%d-%m-%Y-%H-%M").txt



# notify-send -i gtk-dialog-info  -t 200000 "Procurar palavra nos logs" "
# 
# Busca salva no arquivo /tmp/busca_palavra.txt
# 
# "


yad --center --title='Aviso' --text='\n\nBusca salva no arquivo /tmp/busca_palavra-'$(date "+%d-%m-%Y-%H-%M")'.txt\n' --timeout=10 --no-buttons  2>/dev/null


# 
# 
# https://www.mundoubuntu.com.br/dicas/comandos/306-grep-pesquise-por-palavras-dentro-de-arquivos-de-texto
# https://tecnoblog.net/responde/grep-tutorial-linux-codigo/
# https://www.vivaolinux.com.br/topico/Linux-Avancado/Verificando-se-o-CRON-executou



else


clear


echo "A pasta /var/log/ não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/ pasta inexistente!' --timeout=10 --no-buttons 2>/dev/null


clear


fi


;;





# =====================================================================================================


# Atualização Automática de Segurança (Debian)


"unattended-upgrades")



# Como saber se comando do script foi executado com sucesso?


ls -1t /var/log/unattended-upgrades/unattended-upgrades*.log.*  2>/dev/null

if [ $? -eq 0 ]
then

    echo -e "\nArquivos de log de 'Atualização Automática de Segurança' foram localizados em /var/log/"
    
else

   clear
   
   yad --center --title='Aviso' --text='\n\nNão tem arquivos de log de "Atualização Automática de Segurança" na pasta /var/log/ \n' --timeout=20 --no-buttons 2>/dev/null
   
   exit
   
fi





log_unattended_upgrades=$(yad --center --list --title="Log de Atualização Automática de Segurança" --column='Arquivos de log encontrados:' $(ls -1t /var/log/unattended-upgrades/unattended-upgrades*.log.*) --height=400 --width=450 2>/dev/null)

log_unattended_upgrades=$(echo "$log_unattended_upgrades" | cut -d '|' -f1)




# /var/log/unattended-upgrades/unattended-upgrades-dpkg.log
# /var/log/unattended-upgrades/unattended-upgrades-shutdown.log
# /var/log/unattended-upgrades/unattended-upgrades-shutdown.log.1.gz
# /var/log/unattended-upgrades/unattended-upgrades-shutdown.log.2.gz
# /var/log/unattended-upgrades/unattended-upgrades.log.1.gz
# /var/log/unattended-upgrades/unattended-upgrades.log.2.gz
# /var/log/unattended-upgrades/unattended-upgrades.log
# /var/log/unattended-upgrades/unattended-upgrades-dpkg.log.1.gz
# /var/log/unattended-upgrades




# Para verificar se a variavel é nula

if [ -z "$log_unattended_upgrades" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar um arquivo de log de Atualização Automática de Segurança...\n\n' --timeout=30 --no-buttons 2>/dev/null

clear

# break

exit 

fi




# Verificar se o arquivo existe

if [ -e "$log_unattended_upgrades" ] ; then

clear

echo "O arquivo $log_unattended_upgrades existe."

cat "$log_unattended_upgrades" | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log de Atualização Automática de Segurança' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo $log_unattended_upgrades não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_unattended_upgrades' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


# https://pt.linkedin.com/pulse/atualiza%C3%A7%C3%B5es-de-seguran%C3%A7a-aut%C3%B4nomas-debian-e-ubuntu-wagner


;;


# =====================================================================================================


"faillog")


which faillog || exit


yad --center --title='Log de tentativas de login mal sucedidos' --text="Logins mal sucedidos

Dica interessante quanto à administração de tentativas de login mal sucedidos no Linux. Trata-se de um recurso 
capaz de controlar e reportar ao administrador de sistema e também ao usuário a quantidade de vezes que seu 
login sofreu um acesso não autorizado.

O primeiro passo é criar um arquivo vazio no diretório /var/log chamado faillog:

# toch /var/log/faillog

Muda a permissão do arquivo, impedindo acesso por parte de qualquer usuário do sistema, a não ser o Root:

# chmod 700 /var/log/faillog

Cada vez que o usuário informar a senha incorreta, isto será anotado nesse arquivo recém criado. Caso o administrador 
deseje saber como andam as estatísticas de tentativas de login mal sucedidas, basta executar:

# faillog

Onde serão apresentados, em ordem de data, usuário e quantidade de vezes que foi realizada a tentativa de login.

Quando o usuário informa corretamente os dados para efetuar o login, o arquivo é zerado e é apresentado para ele a 
quantidade de vezes que seu login foi mal sucedido. Dessa forma, ele saberá que outros usuários estão tentando 
acessar sua conta e pode informar ao administrador sobre tal fato.
"  2>/dev/null





# Verificar se o arquivo existe

if [ -e "/var/log/faillog" ] ; then

clear

echo "O arquivo /var/log/faillog existe."

faillog | yad --center --title='Log de tentativas de login mal sucedidos' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

# faillog
#
# faillog: Cannot open /var/log/faillog: Arquivo ou diretório inexistente


echo "O arquivo /var/log/faillog não existe."


yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/faillog arquivo inexistente!


O primeiro passo é criar um arquivo vazio no diretório /var/log chamado faillog:

# toch /var/log/faillog

Muda a permissão do arquivo, impedindo acesso por parte de qualquer usuário do sistema, a não ser o Root:

# chmod 700 /var/log/faillog

' --timeout=40 --no-buttons 2>/dev/null

clear

fi

# https://www.vivaolinux.com.br/dica/Logins-mal-sucedidos

;;

# =====================================================================================================


"NVIDIA")


# Verificar se o arquivo existe

if [ -e "/var/log/nvidia-installer.log" ] ; then

clear

echo "O arquivo /var/log/nvidia-installer.log existe."

cat /var/log/nvidia-installer.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log da NVIDIA' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/nvidia-installer.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/nvidia-installer.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


# https://support.huaweicloud.com/intl/pt-br/ugobs-obs-ecs/ecs_03_0174.html

;;

# =====================================================================================================

"journalctl")

clear

# O comando journalctl, ele grava logs das coisas mais importantes que aconteceram no 
# sistema. Se tiver algum erro grave vai aparecer aí.


which journalctl  1> /dev/null 2> /dev/null

if [ $? == 0 ]; then

clear

# O comando sem parâmetros, irá mostrar todos os LOGs de todos os serviços e, na 
# primeira linha, mostrará a data de início dos LOGs:

journalctl
# -- Logs begin at Qui 2017-07-27 12:12:16 -03, end at Sex 2017-07-28 10:01:01 -03. -- 


fi


# https://www.vivaolinux.com.br/artigo/Comando-journalctl-Monitoramento-de-LOGs
# https://pt.linkedin.com/pulse/comando-journalctl-linux-silvio-junior


;;

# =====================================================================================================

"yum")


# Verificar se o arquivo existe

if [ -e "/var/log/yum.log" ] ; then

clear

echo "O arquivo /var/log/yum.log existe."

cat /var/log/yum.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do yum' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/yum.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/yum.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;

# =====================================================================================================

"mysql")


# Verificar se o arquivo existe

if [ -e "/var/log/mysql.log" ] ; then

clear

echo "O arquivo /var/log/mysql.log existe."

cat /var/log/mysql.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do mysql' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/mysql.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/mysql.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;

# =====================================================================================================

"danguardian")


# Verificar se o arquivo existe

if [ -e "/var/log/danguardian/access.log" ] ; then

clear

echo "O arquivo /var/log/danguardian/access.log existe."

cat /var/log/danguardian/access.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do danguardian' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/danguardian/access.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/danguardian/access.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;


# =====================================================================================================

"gpu-manager.log")


# Verificar se o arquivo existe

if [ -e "/var/log/gpu-manager.log" ] ; then

clear

echo "O arquivo /var/log/gpu-manager.log existe."

cat /var/log/gpu-manager.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do gpu-manager' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/gpu-manager.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/gpu-manager.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;


# =====================================================================================================

"access.log")


# Verificar se o arquivo existe

if [ -e "/var/log/access.log" ] ; then

clear

echo "O arquivo /var/log/access.log existe."

cat /var/log/access.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do access' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/access.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/access.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;


# =====================================================================================================

"apport.log")



# Como saber se comando do script foi executado com sucesso?


ls -1t /var/log/apport*.log.* 2>/dev/null

if [ $? -eq 0 ]
then

    echo -e "\nArquivos de log do apport foram localizados em /var/log/"
    
else

   clear
   
   yad --center --title='Aviso' --text='\n\nNão tem arquivos de log do apport na pasta /var/log/ \n' --timeout=20 --no-buttons 2>/dev/null
   
   exit
   
fi





log_apport=$(yad --center --list --title="Log do apport" --column='Arquivos de log encontrados:' $(ls -1t /var/log/apport*.log.*) --height=400 --width=450 2>/dev/null)

log_apport=$(echo "$log_apport" | cut -d '|' -f1)


# /var/log/apport.log
# /var/log/apport.log.1
# /var/log/apport.log.2.gz
# /var/log/apport.log.3.gz
# /var/log/apport.log.4.gz
# /var/log/apport.log.5.gz
# /var/log/apport.log.6.gz
# /var/log/apport.log.7.gz



# Para verificar se a variavel é nula

if [ -z "$log_apport" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar um arquivo de log do apport...\n\n' --timeout=30 --no-buttons 2>/dev/null

clear

# break

exit 

fi




# Verificar se o arquivo existe

if [ -e "$log_apport" ] ; then

clear

echo "O arquivo $log_apport existe."

cat "$log_apport" | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do apport' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo $log_apport não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_apport' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;


# =====================================================================================================

"bootstrap.log")


# Verificar se o arquivo existe

if [ -e "/var/log/bootstrap.log" ] ; then

clear

echo "O arquivo /var/log/bootstrap.log existe."

cat /var/log/bootstrap.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do bootstrap' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/bootstrap.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/bootstrap.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;


# =====================================================================================================

"debug")


# Verificar se o arquivo existe

if [ -e "/var/log/socklog/debug/current" ] ; then

clear

echo "O arquivo /var/log/socklog/debug/current existe."

cat /var/log/socklog/debug/current | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do debug' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/socklog/debug/current não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/socklog/debug/current arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;

# =====================================================================================================

# Messages


"messages")


# /var/log/messages => principal log do sistema, com mensagens do kernel/sistema e mensagens de programas que utilizam o syslog.



# Verificar se o arquivo existe

if [ -e "/var/log/socklog/messages/current" ] ; then

clear

echo "O arquivo /var/log/socklog/messages/current existe."

cat /var/log/socklog/messages/current | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do messages' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1200 2>/dev/null


echo "
Monitorando...
"

tail -n 40 -f /var/log/socklog/messages/current | yad --center --title='Monitorando o log do messages' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1200 2>/dev/null



else


clear

echo "O arquivo /var/log/socklog/messages/current não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/socklog/messages/current arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear






log_messages=$(yad --center --list --title="Log do messages" --column='Arquivos de log encontrados:' $(ls -1t /var/log/messages*.log*) --height=400 --width=450 2>/dev/null)

log_messages=$(echo "$log_messages" | cut -d '|' -f1)


# /var/log/messages
# /var/log/messages.1



# Para verificar se a variavel é nula

if [ -z "$log_messages" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar um arquivo de log do messages...\n\n' --timeout=30 --no-buttons 2>/dev/null

clear

# break

exit 11

fi



# Verificar se o arquivo existe

if [ -e "$log_messages" ] ; then

clear

echo "O arquivo $log_messages  existe."


# Muitas vezes quando estamos configurando serviços no servidor e ocorrem algumas falhas para iniciar o serviço, 
# é necessário olhar o arquivo de log para saber quais os erros que podem ter ocorrido. Com tanta movimentação de 
# dados neste arquivo, às vezes ficamos confusos e perdidos no meio de tantas linhas. 


cat "$log_messages" | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do messages' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1200 2>/dev/null


# tail -f /var/log/messages | yad --center --title='Log do messages' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1200 2>/dev/null


else

clear

echo "O arquivo $log_messages não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_messages' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi




fi


# https://www.vivaolinux.com.br/dica/Melhorando-a-visualizacao-dos-arquivos-de-log


;;

# =====================================================================================================


"kernel.log")


# Tem os log que registram todos os eventos do kernel e também alguns outros que registram outros eventos.


# Verificar se o arquivo existe

if [ -e "/var/log/socklog/kernel/current" ] ; then

clear

echo "O arquivo /var/log/socklog/kernel/current existe."

cat /var/log/socklog/kernel/current | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do kernel' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null



# Logs de "Kernel Panic" também são salvos?

# Quando o sistema trava, congela ou da Kernel Panic. É gerado algum log com a mensagem de erro?

# grep -R "Kernel Panic" /var/log/



else

clear

echo "O arquivo /var/log/socklog/kernel/current não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/socklog/kernel/current arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear




# Log do kernel

# /var/log/kern.log
# /var/log/kern.log.1


log_kernel=$(yad --center --list --title="Log do kernel" --column='Arquivos de log encontrados:' $(ls -1t /var/log/kern*.log*) --height=400 --width=450 2>/dev/null)

log_kernel=$(echo "$log_kernel" | cut -d '|' -f1)



# Para verificar se a variavel é nula

if [ -z "$log_kernel" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar um arquivo de log do kernel...\n\n' --timeout=30 --no-buttons 2>/dev/null

clear

# break

exit 12

fi



# Verificar se o arquivo existe

if [ -e "$log_kernel" ] ; then

clear

echo "O arquivo $log_kernel existe."

cat "$log_kernel" | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do kernel' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo $log_kernel não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_kernel' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi




fi



# https://www.vivaolinux.com.br/topico/Linux-Basico/Log-de-erros


;;

# =====================================================================================================


"ufw")


# /var/log/ufw.log
# /var/log/ufw.log.1


log_ufw=$(yad --center --list --title="Log do ufw" --column='Arquivos de log encontrados:' $(ls -1t /var/log/ufw*.log*) --height=400 --width=450 2>/dev/null)

log_ufw=$(echo "$log_ufw" | cut -d '|' -f1)



# Para verificar se a variavel é nula

if [ -z "$log_ufw" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar um arquivo de log do ufw...\n\n' --timeout=30 --no-buttons 2>/dev/null

clear

# break

exit 13

fi



# Verificar se o arquivo existe

if [ -e "$log_ufw" ] ; then

clear

echo "O arquivo $log_ufw existe."

cat "$log_ufw" | yad --center --title='Log do ufw' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo $log_ufw não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_ufw' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi



;;

# =====================================================================================================


"Samba")


# $ grep "log file =" /etc/samba/smb.conf | cut -d= -f2
#
# /var/log/samba/%m.log



# Verificar se diretório existe

if [ -d "/var/log/samba/" ] ; then

clear



log_samba=$(yad --center --list --title="Log do Samba" --column='Arquivos de log encontrados:' $(ls -1t /var/log/samba/*.log*) --height=400 --width=450 2>/dev/null)

log_samba=$(echo "$log_samba" | cut -d '|' -f1)




# Para verificar se a variavel é nula

if [ -z "$log_samba" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar um arquivo de log do Samba...\n\n' --timeout=30 --no-buttons 2>/dev/null

clear

# break

exit 14

fi



# Verificar se o arquivo existe

if [ -e "$log_samba" ] ; then

clear


echo "O arquivo $log_samba existe."


cat "$log_samba" | yad --center --title='Log do Samba' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


# less "$log_samba" | yad --center --title='Log do Samba' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null



# Nome do arquivo a ser analisado

# tail -f "$log_samba" | yad --center --title='Log do Samba' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null



 
else

clear

echo "O arquivo $log_samba não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_samba' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi




else


clear


echo "A pasta /var/log/samba/ não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/samba/ pasta inexistente!' --timeout=10 --no-buttons 2>/dev/null


clear


fi



# https://www.vivaolinux.com.br/dica/Analisado-logs-do-Samba
# https://www.vivaolinux.com.br/dica/Samba-com-log-de-acesso-e-lixeira-Instalacao-e-configuracao-no-Debian-67-e-Ubuntu
# https://www.vivaolinux.com.br/artigo/Ativar-Log-de-Acessos-do-Samba-no-OpenMediaVault


;;

# =====================================================================================================


# ~/.xsession-errors

"xsession-errors")


# Verificar se o arquivo existe

if [ -e "$HOME/.xsession-errors" ] ; then

clear

echo "O arquivo $HOME/.xsession-errors existe."

cat $HOME/.xsession-errors | yad --center --title='Log do xsession-errors' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo $HOME/.xsession-errors não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$HOME'/.xsession-errors arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================


"errors")


# Verificar se o arquivo existe

if [ -e "/var/log/socklog/errors/current" ] ; then

clear

echo "O arquivo /var/log/socklog/errors/current existe."

cat /var/log/socklog/errors/current | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log de errors' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


else

clear

echo "O arquivo /var/log/socklog/errors/current não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/socklog/errors/current arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================


"cron")



# cat: /var/log/socklog/cron/current: Permissão negada


# Verifica se quem executa é Root.

if [ "$(id -u)" != "0" ]; then

clear

yad --center --title='Aviso' --text='\n\nVocê deve visualizar o log do cron como Root...' --timeout=10 --no-buttons 2>/dev/null

else

clear

echo "Você é Root!"



# Verificar se o arquivo existe

if [ -e "/var/log/socklog/cron/current" ] ; then

clear

echo "O arquivo /var/log/socklog/cron/current existe."


# O "wrap" Habilita a quebra de texto, quando o conteúdo ultrapassa o tamanho do Dialog (tira a barra de rolagem horizontal da caixa do Yad).

cat /var/log/socklog/cron/current | yad --center --title='Log do cron' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

# | grep -i "can't"



else

clear

echo "O arquivo /var/log/socklog/cron/current não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/socklog/cron/current arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear





log_cron=$(yad --center --list --title="Log do cron" --column='Arquivos de log encontrados:' $(ls -1t /var/log/cron*.log*) --height=400 --width=450 2>/dev/null)

log_cron=$(echo "$log_cron" | cut -d '|' -f1)



# ls -1t /var/log/cron*.log*
# /var/log/cron.log




# Para verificar se a variavel é nula

if [ -z "$log_cron" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do cron...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit 

fi



# Verificar se o arquivo existe

if [ -e "$log_cron" ] ; then

clear

echo "O arquivo $log_cron existe."

cat "$log_cron" | yad --center --title='Log do cron' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=900 2>/dev/null


clear


else

clear

echo "O arquivo $log_cron não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_cron' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi





fi



fi



;;

# =====================================================================================================


"rkhunter.log")


log_rkhunter=$(yad --center --list --title="rkhunter.log" --column='Arquivos de log encontrados:' $(ls -1t /var/log/rkhunter.log*) --height=400 --width=450 2>/dev/null)

log_rkhunter=$(echo "$log_rkhunter" | cut -d '|' -f1)



# ls -1t /var/log/rkhunter.log*
# /var/log/rkhunter.log
# /var/log/rkhunter.log.old



# Para verificar se a variavel é nula

if [ -z "$log_rkhunter" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do rkhunter...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit 15

fi



# Verificar se o arquivo existe

if [ -e "$log_rkhunter" ] ; then

clear

echo "O arquivo $log_rkhunter existe."

cat "$log_rkhunter" | yad --center --title='Log do rkhunter' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=900 2>/dev/null


clear


else

clear

echo "O arquivo $log_rkhunter não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_rkhunter' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================


"wicd.log")


log_wicd=$(yad --center --list --title="wicd.log" --column='Arquivos de log encontrados:' $(ls -1t /var/log/wicd/wicd.log*) --height=400 --width=450 2>/dev/null)

log_wicd=$(echo "$log_wicd" | cut -d '|' -f1)



# ls -1t /var/log/wicd/wicd.log*
# /var/log/wicd/wicd.log
# /var/log/wicd/wicd.log.1



# Para verificar se a variavel é nula

if [ -z "$log_wicd" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do wicd...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit 16

fi






# Verificar se o arquivo existe

if [ -e "$log_wicd" ] ; then

clear

echo "O arquivo $log_wicd existe."


# $ cat /var/log/wicd/wicd.log
# cat: /var/log/wicd/wicd.log: Permissão negada

cat "$log_wicd" | yad --center --title='Log do wicd' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


else

clear

echo "O arquivo $log_wicd não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_wicd' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;

# =====================================================================================================


"lynis.log")


# ls -1t /var/log/lynis*
# /var/log/lynis.log
# /var/log/lynis-report.dat



# Verificar se o arquivo existe

if [ -e "/var/log/lynis.log" ] ; then

clear

echo "O arquivo /var/log/lynis.log existe."


cat /var/log/lynis.log | yad --center --title='Log do Lynis' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null
# cat /var/log/lynis-report.dat | yad --center --title='Log do ' --fontname "Sans regular 9" --text-info --tail --height=1000 --width=1500 2>/dev/null


else

clear

echo "O arquivo /var/log/lynis.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/lynis.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================


"lxdm.log")


log_lxdm=$(yad --center --list --title="lxdm.log" --column='Arquivos de log encontrados:' $(ls -1t /var/log/lxdm.log*) --height=400 --width=450 2>/dev/null)

log_lxdm=$(echo "$log_lxdm" | cut -d '|' -f1)


# ls -1t /var/log/lxdm.log*
# /var/log/lxdm.log
# /var/log/lxdm.log.old


# Para verificar se a variavel é nula

if [ -z "$log_lxdm" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do lxdm...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit 17

fi




# Verificar se o arquivo existe

if [ -e "$log_lxdm" ] ; then

clear

echo "O arquivo $log_lxdm existe."

cat "$log_lxdm" | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do lxdm' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


else

clear

echo "O arquivo $log_lxdm não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_lxdm' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi
 
;;

# =====================================================================================================

# Xorg.log

"Xorg.log")

log_xorg=$(yad --center --list --title="Xorg.log" --column='Arquivos de log encontrados:' $(ls -1t /var/log/Xorg*.log*) --height=400 --width=450 2>/dev/null)

log_xorg=$(echo "$log_xorg" | cut -d '|' -f1)


# ls -1 /var/log/Xorg*.log*
# /var/log/Xorg.0.log
# /var/log/Xorg.0.log.old
# /var/log/Xorg.1.log
# /var/log/Xorg.1.log.old



# Para verificar se a variavel é nula

if [ -z "$log_xorg" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do Xorg...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit 18

fi



# Verificar se o arquivo existe

if [ -e "$log_xorg" ] ; then

clear

echo "O arquivo $log_xorg existe."


cat $log_xorg | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do Xorg' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


else

clear

echo "O arquivo $log_xorg não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_xorg' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;

# =====================================================================================================

# Log de acesso do servidor Apache

"Log de acesso do servidor Apache")


# Verificar se o arquivo existe

if [ -e "/var/log/httpd/access_log" ] ; then

clear

echo "O arquivo /var/log/httpd/access_log existe."

cat /var/log/httpd/access_log | head -n 40 | yad --center --title='Log do Apache - acesso' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


else

clear

echo "O arquivo /var/log/httpd/access_log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/httpd/access_log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================

# Log de error do servidor Apache / log do PHP


"Log de error do servidor Apache")



# Verificar se o arquivo existe

if [ -e "/var/log/httpd/error_log" ] ; then

clear

echo "O arquivo /var/log/httpd/error_log existe."

cat /var/log/httpd/error_log | head -n 40 | yad --center --title='Log do Apache - error' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo /var/log/httpd/error_log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/httpd/error_log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear



# Verificar se o arquivo existe

if [ -e "/var/log/apache2/error.log" ] ; then

clear

echo "O arquivo /var/log/apache2/error.log existe."

tail -f /var/log/apache2/error.log | head -n 40 | yad --center --title='Log do Apache - error' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo /var/log/apache2/error.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/apache2/error.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi



fi



# https://www.vivaolinux.com.br/topico/PHP/log-do-PHP-no-Ubuntu
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=13213
# https://www.vivaolinux.com.br/topico/PHP/log-do-PHP-no-Ubuntu


;;

# =====================================================================================================


"PHP")


# Verificar se o arquivo existe

if [ -e "/var/log/php-fpm.log" ] ; then

clear

echo "O arquivo /var/log/php-fpm.log existe."

cat /var/log/php-fpm.log  | head -n 40 | yad --center --title='Log do PHP' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


else

clear

echo "O arquivo /var/log/php-fpm.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/php-fpm.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================

"dmesg --level=warn e dmesg --level=err")


dmesg --level=warn > /tmp/dmesg.log
dmesg --level=err >> /tmp/dmesg.log 

cat /tmp/dmesg.log | yad --center --title='Log do dmesg somente warn e err' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

rm -Rf /tmp/dmesg.log 


# https://itsfoss.community/t/modem-manager-gui-won-t-start-any-more/3416/6

;;

# =====================================================================================================

"dmesg")



# Para erros de inicialização
#
# Mas recomendo executa-lo assim que o sistema iniciar, facilitará a localização.


# erros de ACPI quando ligo meu notebook e eu os ignoro, pois nesse caso uma das seguintes hipóteses é muito provável:
#
#    O desenvolvedor da BIOS não implementou toda a especificação do ACPI dentro da BIOS;
#    O desenvolvedor da BIOS implementou a especificação do ACPI de maneira errada.
#
# Em um desses dois cenários, a fabricante do computador teria de liberar uma atualização de BIOS corrigindo os erros.

# Você pode passar um parâmetro para o Grub iniciar o Linux com ele tratando da ACPI.







# /var/log/dmesg => Mostra o log do ultimo boot.
#
# As mensagens apresentadas pelo comando dmesg são armazenadas em /var/log/dmesg.



# Verifica se quem executa é Root.

if [ "$(id -u)" != "0" ]; then

clear

yad --center --title='Aviso' --text='\n\nVocê deve executar o dmesg como Root...' --timeout=10 --no-buttons 2>/dev/null

else

clear

echo "Você é Root!"


# /var/log/dmesg.log
# /var/log/dmesg.0
# /var/log/dmesg.3.gz
# /var/log/dmesg.1.gz
# /var/log/dmesg.4.gz


log_dmesg=$(yad --center --list --title="Log do dmesg" --column='Arquivos de log encontrados:' $(ls -1t /var/log/dmesg.*) --height=400 --width=450 2>/dev/null)

log_dmesg=$(echo "$log_dmesg" | cut -d '|' -f1)




# Para verificar se a variavel é nula

if [ -z "$log_dmesg" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do dmesg...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit

fi




# Verificar se o arquivo existe

if [ -e "$log_dmesg" ] ; then

clear

echo "O arquivo $log_dmesg existe."

cat "$log_dmesg" | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do dmesg' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

clear


else

clear

echo "O arquivo $log_dmesg não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_dmesg' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi



# Usar o dmesg para ver problemas de hardware e kernel.

# dmesg | grep -iE "failed|error|WARNING|kernel|DENIED|Firmware" | yad --center --title='Log do dmesg' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


# https://www.vivaolinux.com.br/topico/Perguntas-Frequentes/qual-a-diferenca-entre-dmesg-var-log-dmesg-e-var-log-messages




# Multiplas pesquisas usando grep

# -l

dmesg -T  | egrep "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do dmesg' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


# https://www.vivaolinux.com.br/topico/Comandos/E-possivel-multiplas-pesquisas-usando-grep




fi

# https://www.vivaolinux.com.br/script/Verifica-se-quem-executa-e-root/


;;

# =====================================================================================================

# Timeshift

"timeshift")


log_timeshift=$(yad --center --list --title="Log do Timeshift" --column='Arquivos de log encontrados:' $(ls -1t /var/log/timeshift/*.log) --height=400 --width=450 2>/dev/null)

log_timeshift=$(echo "$log_timeshift" | cut -d '|' -f1)


# Listagem de arquivos pela data de modificação
#
# A opção -t do comando ls ordena os arquivos pela data de modificação, colocando os arquivos modificados mais recentemente no começo da listagem. 
#
# ls -1t /var/log/timeshift/*.log
# /var/log/timeshift/2023-05-16_13-42-59_gui.log
# /var/log/timeshift/2023-05-16_13-32-35_gui.log
# /var/log/timeshift/2023-01-28_14-10-26_gui.log

# https://www.dicas-l.com.br/arquivo/listagem_de_arquivos_pela_data_de_modificacao.php




# Para verificar se a variavel é nula

if [ -z "$log_timeshift" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do Timeshift...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit 19

fi




# Verificar se o arquivo existe

if [ -e "$log_timeshift" ] ; then

clear

echo "O arquivo $log_timeshift existe."

cat $log_timeshift | yad --center --title='Log do Timeshift' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=800 2>/dev/null


else

clear

echo "O arquivo $log_timeshift não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_timeshift' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================

# logs do Squid

"Squid")


# /var/log/squid/cache.log
# /var/log/squid/access.log
# /var/log/squid3/access.log



log_squid=$(yad --center --list --title="Log do Squid" --column='Arquivos de log encontrados:' $(ls -1t /var/log/squid*/*.log*) --height=400 --width=450 2>/dev/null)

log_squid=$(echo "$log_squid" | cut -d '|' -f1)



# Para verificar se a variavel é nula

if [ -z "$log_squid" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do Squid...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit 

fi




# Verificar se o arquivo existe

if [ -e "$log_squid" ] ; then

clear

echo "O arquivo $log_squid existe."

cat "$log_squid"  | head -n 40 | yad --center --title='Log do Squid' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


# As ultimas 100 linhas:
#
# tail -100 "$log_squid" | grep -i "DENIED"
#
# Fazer uma filtragem você executa com "| grep palavrachave"
#
# Caso queira deixar rodando, você executa com "-f" o tail.



# tail -f "$log_squid" | grep vivaolinux

# tail -f "$log_squid" |grep playboy >$HOME/Documentos/logs/log_playboy.txt

# tail -f "$log_squid" | awk '{print$3 " " $8 " " $7}'


else

clear

echo "O arquivo $log_squid não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_squid' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi



# https://www.vivaolinux.com.br/topico/Squid-Iptables/nao-consigo-criar-os-log-do-squid-da-erro
# https://www.vivaolinux.com.br/dica/Verificando-logs-do-Squid-em-tempo-real
# https://www.vivaolinux.com.br/topico/Squid-Iptables/Limpando-access.log
# https://www.vivaolinux.com.br/topico/vivaolinux/Visualizar-LOGs


;;

# =====================================================================================================

"Zabbix")


# grep "LogFile=/var" /etc/zabbix/zabbix_agentd.conf
# LogFile=/var/log/zabbix/zabbix_agentd.log 




# Verificar se o arquivo existe

if [ -e "/var/log/zabbix/zabbix_agentd.log" ] ; then

clear

echo "O arquivo /var/log/zabbix/zabbix_agentd.log existe."

cat /var/log/zabbix/zabbix_agentd.log | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do Zabbix' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null



# Encontrando a origem do problema no log do Zimbra (para obter a visualização do Log em "tempo real")

# tail -f /var/log/zimbra.log


# filtra uma palavra no arquivo de log

# grep "palavra" /var/log/zimbra.log | less



else

clear

echo "O arquivo /var/log/zabbix/zabbix_agentd.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/zabbix/zabbix_agentd.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


# https://www.vivaolinux.com.br/topico/Zabbix/Diretorio-em-varlogszabbix-nao-encontrado
# https://www.vivaolinux.com.br/artigo/Zimbra-Como-rastrear-um-e-mail-dentro-do-log

;;

# =====================================================================================================

"Log de acesso")


# Verificar se o arquivo existe

if [ -e "/var/log/auth.log" ] ; then

clear

echo "O arquivo /var/log/auth.log existe."


cat /var/log/auth.log | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log de acesso' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null



# Criar um arquivo de log com o nome Acesso.log que contenha em modo texto (tem que ser texto mesmo); data e hora, usuário que tentou logar e que mostre o status (negado).
#
# Filtra somente as linhas que contem Acesso negado
#
# cat /var/log/auth.log |grep DENIED
#
# https://www.vivaolinux.com.br/topico/Shell-Script/Log-de-acesso



else

clear

echo "O arquivo /var/log/auth.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/auth.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

# https://www.vivaolinux.com.br/topico/Shell-Script/Log-de-acesso

;;

# =====================================================================================================

# Acompanhando o log do servidor de e-mail

"maillog")


# Verificar se o arquivo existe

if [ -e "/var/log/maillog" ] ; then

clear

echo "O arquivo /var/log/maillog existe."

cat /var/log/maillog | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log de do servidor de e-mail' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


# Para você visualizar em tempo real os logs do seu servidor de e-mail e saber quem está enviando e recebendo e-mail, dentro do terminal entre com o comando:

# tail -f /var/log/maillog


else


clear

echo "O arquivo /var/log/maillog não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/maillog arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

# https://www.vivaolinux.com.br/dica/Acompanhando-o-log-do-servidor-de-email

;;

# =====================================================================================================

"syslog")


# The main system log, which logs everything except auth-related messages.
# The primary log; grep this file to see what problem occurred.


log_syslog=$(yad --center --list --title="Log do syslog" --column='Arquivos de log encontrados:' $(ls -1t /var/log/syslog*.log*) --height=400 --width=450 2>/dev/null)

log_syslog=$(echo "$log_syslog" | cut -d '|' -f1)


# Log do sistema

# /var/log/syslog
# /var/log/syslog.1



# Para verificar se a variavel é nula

if [ -z "$log_syslog" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar um arquivo de log do syslog...\n\n' --timeout=30 --no-buttons 2>/dev/null

clear

# break

exit 20

fi



# Verificar se o arquivo existe

if [ -e "$log_syslog" ] ; then

clear

echo "O arquivo "$log_syslog" existe."

cat "$log_syslog" | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log de syslog' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo "$log_syslog" não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_syslog' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


# https://www.vivaolinux.com.br/topico/Shell-Script/Log-de-acesso
# https://www.vivaolinux.com.br/topico/Shell-Script/Log-de-boot

;;

# =====================================================================================================

# Log das ações do usuário Root


# Para quem não sabe o ~/.bash_history grava todos os comandos digitados.



"history Root")


# Verificar se o arquivo existe

if [ -e "$HOME/.bash_history" ] ; then

clear

echo "O arquivo $HOME/.bash_history existe."

cat $HOME/.bash_history | yad --center --title='Ações do usuário' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo $HOME/.bash_history não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$HOME'/.bash_history arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


# Com o comando history, você pode ver os ultimos 500 comandos usados.

# history | yad --center --title='Ações do usuário' --fontname "Sans regular 9" --text-info --tail --height=1000 --width=1500 2>/dev/null


# Ele mostrará os comandos do usuário que você esta logado no terminal.
# 
# 
# para ver os comandos de root é em /root/.bash_history como falei antes.
# Dos outros usuários o arquivo fica em /home/USUARIO/.bash_history
# Para todos os usuarios fica no home, apenas o root que fica em /root.


# https://www.vivaolinux.com.br/topico/Seguranca-Linux/Log-das-acoes-do-usuario-root
# https://www.vivaolinux.com.br/dica/Conhecendo-mais-sobre-LOGs/


;;

# =====================================================================================================

"ClamAV")


clear

# cat /etc/freshclam.conf | grep -i "UpdateLogFile.*/var" | cut -d" " -f2
#
# /var/log/freshclam.log
#
# ou
#
# /var/log/clamav/freshclam.log




# Pega a localização do arquivo de log do ClamAV no arquivo de configuração /etc/freshclam.conf

log_clamav=$(yad --center --list --title="Log do ClamAV" --column='Arquivos de log encontrados:' $(cat /etc/freshclam.conf | grep -i "UpdateLogFile.*/var" | cut -d" " -f2) --height=400 --width=450 2>/dev/null)

log_clamav=$(echo "$log_clamav" | cut -d '|' -f1)






# Verificar se diretório existe

if [ -d "/var/log/clamav/" ] ; then

clear



# Verificar se o arquivo existe

if [ -e "/var/log/clamav/freshclam.log" ] ; then

clear

echo "O arquivo /var/log/clamav/freshclam.log existe."

cat /var/log/clamav/freshclam.log | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do ClamAV' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


else

clear

echo "O arquivo /var/log/clamav/freshclam.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/clamav/freshclam.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi




else


clear


echo "A pasta /var/log/clamav/ não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/clamav/ pasta inexistente!' --timeout=10 --no-buttons 2>/dev/null


clear


fi




# Verificar se o arquivo existe

if [ -e "$log_clamav" ] ; then

clear

echo "O arquivo "$log_clamav" existe."



cat "$log_clamav" | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do ClamAV' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null



else

clear

echo "O arquivo $log_clamav não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_clamav' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi



# https://plus.diolinux.com.br/t/probrema-com-antivirus-clamav/12351/8


;;

# =====================================================================================================

"cups")



# $ ls -1t /var/log/cups/*log.*
# ls: não foi possível acessar '/var/log/cups/*log.*': Permissão negada


# grep: (entrada padrão): arquivo binário coincide com o padrão


# Verifica se quem executa é Root.

if [ "$(id -u)" != "0" ]; then

clear

yad --center --title='Aviso' --text='\n\nVocê deve visualizar o log do cups como Root...' --timeout=10 --no-buttons 2>/dev/null

else

clear

echo "
Você é Root!
"



# Como saber se comando do script foi executado com sucesso?


ls -1 /var/log/cups/*_log* 2>/dev/null

if [ $? -eq 0 ]
then

    echo -e "\nArquivos de log do cups foram localizados em /var/log/"
    
else

   clear
   
   yad --center --title='Aviso' --text='\n\nNão tem arquivos de log do cups na pasta /var/log/ \n' --timeout=20 --no-buttons 2>/dev/null
   
   exit
   
fi




log_cups=$(yad --center --list --title="Log do cups" --column='Arquivos de log encontrados:' $(ls -1t /var/log/cups/*_log*) --height=400 --width=450 2>/dev/null)

log_cups=$(echo "$log_cups" | cut -d '|' -f1)


# /var/log/cups/access_log.2.gz
# /var/log/cups/access_log.6.gz
# /var/log/cups/error_log.6.gz
# /var/log/cups/error_log
# /var/log/cups/access_log
# /var/log/cups/access_log.5.gz
# /var/log/cups/error_log.3.gz
# /var/log/cups/access_log.1
# /var/log/cups/error_log.7.gz
# /var/log/cups/access_log.7.gz
# /var/log/cups/error_log.1
# /var/log/cups/error_log.5.gz
# /var/log/cups/error_log.4.gz
# /var/log/cups/access_log.3.gz
# /var/log/cups/error_log.2.gz
# /var/log/cups/access_log.4.gz
# /var/log/cups



# Para verificar se a variavel é nula

if [ -z "$log_cups" ];then

yad --center --title='Aviso' --text='\n\nVocê precisa informar um arquivo de log do cups...\n\n' --timeout=30 --no-buttons 2>/dev/null

clear

# break

exit 

fi





# Verificar se o arquivo existe

if [ -e "$log_cups" ] ; then

clear

echo "O arquivo $log_cups existe."

cat "$log_cups" | grep -iE "failed|error|WARNING|DENIED|Firmware" | yad --center --title='Log do cups' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo $log_cups não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_cups' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi




fi


# https://www.vivaolinux.com.br/topico/CUPS/Pasta-varlogcups

;;

# =====================================================================================================

"chkrootkit.log")


# Verificar se o arquivo existe

if [ -e "/var/log/chkrootkit.log" ] ; then

clear

echo "O arquivo /var/log/chkrootkit.log existe."


# O "wrap" Habilita a quebra de texto, quando o conteúdo ultrapassa o tamanho do Dialog (tira a barra de rolagem horizontal da caixa do Yad).

cat /var/log/chkrootkit.log | yad --center --title='Log do chkrootkit' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo /var/log/chkrootkit.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/chkrootkit.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;

# =====================================================================================================

"inkscape")


# Verificar se o arquivo existe

if [ -e "$HOME/.config/inkscape/extension-errors.log" ] ; then

clear

echo "O arquivo $HOME/.config/inkscape/extension-errors.log existe."


# O "wrap" Habilita a quebra de texto, quando o conteúdo ultrapassa o tamanho do Dialog (tira a barra de rolagem horizontal da caixa do Yad).

cat "$HOME/.config/inkscape/extension-errors.log" | yad --center --title='Log do inkscape' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo $HOME/.config/inkscape/extension-errors.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$HOME'/.config/inkscape/extension-errors.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;

# =====================================================================================================

"qBittorrent")


# Verificar se o arquivo existe

if [ -e "$HOME/.local/share/qBittorrent/logs/qbittorrent.log" ] ; then

clear

echo "O arquivo $HOME/.local/share/qBittorrent/logs/qbittorrent.log existe."


# O "wrap" Habilita a quebra de texto, quando o conteúdo ultrapassa o tamanho do Dialog (tira a barra de rolagem horizontal da caixa do Yad).

cat "$HOME/.local/share/qBittorrent/logs/qbittorrent.log" | yad --center --title='Log do qBittorrent' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo $HOME/.local/share/qBittorrent/logs/qbittorrent.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$HOME'/.local/share/qBittorrent/logs/qbittorrent.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;


# =====================================================================================================

"TeamViewer")

clear


# /var/log/teamviewer11


log_TeamViewer=$(yad --center --list --title="Log do TeamViewer" --column='Arquivos de log encontrados:' $(ls -1 /opt/teamviewer/logfiles/*.log /var/log/teamviewer*) --height=400 --width=450 2>/dev/null)

log_TeamViewer=$(echo "$log_TeamViewer" | cut -d '|' -f1)


# $ ls -1 /opt/teamviewer/logfiles/*.log
# /opt/teamviewer/logfiles/DependencyCheck.log
# /opt/teamviewer/logfiles/TVNetwork.log
# /opt/teamviewer/logfiles/TeamViewer15_Logfile.log
# /opt/teamviewer/logfiles/gui.log
# /opt/teamviewer/logfiles/startup.log





# Para verificar se a variavel é nula

if [ -z "$log_TeamViewer" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do TeamViewer...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit 21

fi




# Verificar se o arquivo existe

if [ -e "$log_TeamViewer" ] ; then

clear

echo "O arquivo $log_TeamViewer existe"

cat "$log_TeamViewer" | yad --center --title='Log do TeamViewer' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=800 2>/dev/null


else

clear

echo "O arquivo $log_TeamViewer não existe"

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_TeamViewer' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================

"XMind")

# $ find ~/xmind/ -iname "*.log*"
# /home/Goku/xmind/configuration/1542328571363.log
# /home/Goku/xmind/workspace/.metadata/.log


log_XMind=$(yad --center --list --title="Log do XMind" --column='Arquivos de log encontrados:' $(ls -1 $HOME/xmind/configuration/*.log) --height=400 --width=450 2>/dev/null)

log_XMind=$(echo "$log_XMind" | cut -d '|' -f1)




# Para verificar se a variavel é nula

if [ -z "$log_XMind" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do XMind...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit 21

fi




# Verificar se o arquivo existe

if [ -e "$log_XMind" ] ; then

clear

echo "O arquivo $log_XMind existe."

cat "$log_XMind" | yad --center --title='Log do XMind' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=800 2>/dev/null


else


clear

echo "O arquivo $log_XMind não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_XMind' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

# https://plus.diolinux.com.br/t/erro-arquivo-log-para-instalar-xmind-7-5-no-mint-19-1/951

;;

# =====================================================================================================


"xbps")


# Verificar se o arquivo existe

if [ -e "/var/log/socklog/xbps/current" ] ; then

clear

echo "O arquivo /var/log/socklog/xbps/current existe."

cat /var/log/socklog/xbps/current | yad --center --title='Log do xbps' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo /var/log/socklog/xbps/current não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/socklog/xbps/current arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================

"daemon")


# Verificar se o arquivo existe

if [ -e "/var/log/socklog/daemon/current" ] ; then

clear

echo "O arquivo /var/log/socklog/daemon/current existe."

cat /var/log/socklog/daemon/current | grep -iE "failed|error|WARNING|DENIED|Firmware|disconnected|not supported|No such file or directory|Cannot|blocks|Could not determine|Permission denied" | yad --center --title='Log do daemon' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null




else

clear

echo "O arquivo /var/log/socklog/daemon/current não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/socklog/daemon/current arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear





# Verificar se o arquivo existe

if [ -e "/var/log/daemon.log" ] ; then

clear

echo "O arquivo /var/log/daemon.log existe."

cat /var/log/daemon.log | grep -iE "failed|error|WARNING|DENIED|Firmware|disconnected|not supported|No such file or directory|Cannot|blocks|Could not determine|Permission denied" | yad --center --title='Log do daemon' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo /var/log/daemon.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/daemon.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi





fi



;;

# =====================================================================================================

"user")


# Verificar se o arquivo existe

if [ -e "/var/log/socklog/user/current" ] ; then

clear

echo "O arquivo /var/log/socklog/user/current  existe."

cat /var/log/socklog/user/current  | yad --center --title='Log do user' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo /var/log/socklog/user/current não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/socklog/user/current arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================

"everything")


# Verificar se o arquivo existe

if [ -e "/var/log/socklog/everything/current" ] ; then

clear

echo "O arquivo /var/log/socklog/everything/current existe."

cat /var/log/socklog/everything/current | yad --center --title='Log do everything' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo /var/log/socklog/everything/current não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/socklog/everything/current arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================

"secure")

# Existem algumas mensagens de erro relacionadas ao secure boot.


# Verificar se o arquivo existe

if [ -e "/var/log/socklog/secure/current" ] ; then

clear

echo "O arquivo /var/log/socklog/secure/current existe."

cat /var/log/socklog/secure/current | yad --center --title='Log do secure' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

else

clear

echo "O arquivo /var/log/socklog/secure/current não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/socklog/secure/current arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================


"arquivos recentes")


# Histórico de arquivos recentes



# Verificar se o arquivo existe

if [ -e "$HOME/.local/share/recently-used.xbel" ] ; then

clear


echo "O arquivo $HOME/.local/share/recently-used.xbel existe."

cat $HOME/.local/share/recently-used.xbel | yad --center --title='Histórico de arquivos recentes' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


else


clear

echo "O arquivo $HOME/.local/share/recently-used.xbel não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$HOME'/.local/share/recently-used.xbel arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

;;

# =====================================================================================================

"LightDM")


# Verificar se o arquivo existe

if [ -e "/var/log/lightdm/lightdm.log" ] ; then

clear

echo "O arquivo /var/log/lightdm/lightdm.log existe."

cat /var/log/lightdm/lightdm.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do LightDM' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/lightdm/lightdm.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/lightdm/lightdm.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

# https://askubuntu.com/questions/396957/meaning-of-files-in-var-log-lightdm-and-how-to-properly-read-lightdm-log-file
# https://plus.diolinux.com.br/t/como-reinstalar-lightdm-no-fedora-xfce-problemas-auto-login/19040
# https://wiki.ubuntu.com/LightDM


;;

# =====================================================================================================

"Preload")


# O pré-carregamento é a ação de colocar e manter os arquivos de destino na RAM. O benefício é que 
# os aplicativos pré-carregados iniciam mais rapidamente porque a leitura na RAM é sempre mais rápida 
# que no disco rígido. No entanto, parte da sua RAM será dedicada a essa tarefa, mas não mais do que 
# se você mantivesse o aplicativo aberto. Portanto, o pré-carregamento é melhor usado com aplicativos 
# grandes e usados com frequência, como Firefox e LibreOffice. 



# Verificar se o arquivo existe

if [ -e "/var/log/preload.log" ] ; then

clear

echo "O arquivo /var/log/preload.log existe."

cat /var/log/preload.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do Preload' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/preload.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/preload.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


# https://wiki.archlinux.org/title/Preload_(Portugu%C3%AAs)

;;

# =====================================================================================================

"dpkg")


# /var/log/dpkg.log => Information logged when a package is installed or removed using the dpkg command.


# Verificar se o arquivo existe

if [ -e "/var/log/dpkg.log" ] ; then

clear

echo "O arquivo /var/log/dpkg.log existe."

cat /var/log/dpkg.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do dpkg' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/dpkg.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/dpkg.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;

# =====================================================================================================

"boot")


# /var/log/boot.log => Information that is logged when the system boots.



# Verificar se o arquivo existe

if [ -e "/var/log/boot.log" ] ; then

clear

echo "O arquivo /var/log/boot.log existe."

cat /var/log/boot.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do boot' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/boot.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/boot.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


;;

# =====================================================================================================


"FTP")


# Vendo quem está logado no servidor de FTP



# Verificar se o arquivo existe

if [ -e "/var/log/proftpd/proftpd.log" ] ; then

clear

echo "O arquivo /var/log/proftpd/proftpd.log existe."


cat /var/log/proftpd/proftpd.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do FTP' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

# tail -f /var/log/proftpd/proftpd.log | yad --center --title='Log do boot' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null


else


clear

echo "O arquivo /var/log/proftpd/proftpd.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/proftpd/proftpd.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

# https://www.vivaolinux.com.br/dica/Vendo-quem-esta-logado-no-servidor-de-FTP

;;

# =====================================================================================================


"Fontconfig")


# Fontconfig é uma biblioteca de programas livre projetada para fornecer configuração, enumeração e 
# substituição de fontes para outros programas. O Fontconfig foi originalmente escrito e mantido por Keith Packard.
# 
# Página oficial: https://fontconfig.org/


# Verificar se o arquivo existe

if [ -e "/var/log/fontconfig.log" ] ; then

clear

echo "O arquivo /var/log/fontconfig.log existe."

cat /var/log/fontconfig.log | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do Fontconfig' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo /var/log/fontconfig.log não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar /var/log/fontconfig.log arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


# https://pt.wikipedia.org/wiki/Fontconfig

;;

# =====================================================================================================


"Alternatives")


# /var/log/alternatives.log => Information from update-alternatives.



# Como saber se comando do script foi executado com sucesso?


ls -1 /var/log/alternatives*.log* 2>/dev/null

if [ $? -eq 0 ]
then

    echo "Arquivos alternatives*.log* localizados em /var/log/"
    
else

   clear
   
   yad --center --title='Aviso' --text='\n\nNão tem arquivos alternatives*.log* na pasta /var/log/ \n' --timeout=20 --no-buttons 2>/dev/null
   
   exit
   
fi


# https://pt.stackoverflow.com/questions/143454/como-saber-se-comando-do-script-foi-executado-com-sucesso



# alternatives.log.2.gz
# alternatives.log.1


log_alternatives=$(yad --center --list --title="Log do Alternatives" --column='Arquivos de log encontrados:' $(ls -1 /var/log/alternatives*.log*) --height=400 --width=450 2>/dev/null)

log_alternatives=$(echo "$log_alternatives" | cut -d '|' -f1)




# Para verificar se a variavel é nula

if [ -z "$log_alternatives" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do Alternatives...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit 

fi




# Verificar se o arquivo existe

if [ -e "$log_alternatives" ] ; then

clear

echo "O arquivo $log_alternatives existe."

cat "$log_alternatives" | grep -iE "failed|error|WARNING|DENIED" | yad --center --title='Log do Alternative' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=500 2>/dev/null

else

clear

echo "O arquivo $log_alternatives não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_alternatives' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi


# https://docs.nvidia.com/networking-ethernet-software/cumulus-linux-43/Monitoring-and-Troubleshooting/Understanding-the-cl-support-Output-File/Troubleshooting-Log-Files/


;;

# =====================================================================================================


"virtualbox")

    clear
    

# xbps-query -Rs virtualbox
# [*] virtualbox-ose-7.0.10_1            General-purpose full virtualizer for x86 hardware
# [*] virtualbox-ose-dkms-7.0.10_1       General-purpose full virtualizer for x86 hardware - kernel module sources for dkms
# [-] virtualbox-ose-guest-7.0.10_1      General-purpose full virtualizer for x86 hardware - guest utilities
# [-] virtualbox-ose-guest-dkms-7.0.10_1 General-purpose full virtualizer for x86 hardware - guest addition module source for dkms



# ls -1  /var/lib/dkms/virtualbox-ose/*/*/*/log/make.log  /var/lib/dkms/virtualbox-ose/*/*/make.log


log_virtualbox=$(yad --center --list --title="Log do virtualbox" --column='Arquivos de log encontrados:' $(find /var/lib/dkms/ -iname *.log) --height=1030 --width=600 2>/dev/null)


log_virtualbox=$(echo "$log_virtualbox" | cut -d '|' -f1)




# Para verificar se a variavel é nula

if [ -z "$log_virtualbox" ];then

clear

yad --center --title='Aviso' --text='\n\nVocê precisa selecionar um arquivo de log do virtualbox...\n' --timeout=10 --no-buttons 2>/dev/null

clear

# break

exit 

fi


    
# Verificar se o arquivo existe

if [ -e "$log_virtualbox" ] ; then

clear

echo "O arquivo $log_virtualbox existe."

cat "$log_virtualbox" | yad --center --title='Log do virtualbox' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null


# | grep -iE "failed|error|WARNING|DENIED"


else

clear

echo "O arquivo $log_virtualbox não existe."

yad --center --title='Aviso' --text='\n\nNão foi possível acessar '$log_virtualbox' arquivo inexistente!' --timeout=10 --no-buttons 2>/dev/null

clear

fi

    
#  break

;;

# =====================================================================================================

"Erros no Cron")

clear


# Erros no Cron
#
#
#
# 2023-11-02T07:01:01.55683 cron.info: Nov  2 04:01:01 CRONIE-CROND[19582]: (root) CMD (run-parts /etc/cron.hourly)
# 2023-11-02T07:01:01.57208 cron.info: Nov  2 04:01:01 CRONIE-CROND[19581]: (root) CMDOUT (/etc/cron.hourly/0anacron: line 11: /etc/default/anacron: No such file or directory)
# 2023-11-02T07:01:01.57268 cron.info: Nov  2 04:01:01 CRONIE-CROND[19581]: (root) CMDOUT (run-parts: /etc/cron.hourly/0anacron exited with return code 1)
# 2023-11-02T07:44:51.29342 cron.info: Nov  2 04:44:51 cronie-crond[954]: (CRON) INFO (Shutting down)
# 2023-11-02T15:20:59.47613 cron.info: Nov  2 12:20:54 cronie-crond[960]: (CRON) STARTUP (1.7.0)
# 2023-11-02T15:20:59.86896 cron.info: Nov  2 12:20:58 cronie-crond[960]: (CRON) INFO (Syslog will be used instead of sendmail.)
# 2023-11-02T15:20:59.86926 cron.info: Nov  2 12:20:58 cronie-crond[960]: (CRON) INFO (RANDOM_DELAY will be scaled with factor 5% if used.)
# 2023-11-02T15:20:59.86969 cron.info: Nov  2 12:20:58 cronie-crond[960]: (CRON) INFO (running with inotify support)
# 2023-11-02T15:21:00.04434 cron.info: Nov  2 12:20:59 cronie-crond[960]: (root.new-4.5_34) ORPHAN (no passwd entry)


# Verificar se o arquivo existe

if [ -e "/var/log/socklog/cron/current" ] ; then

# pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority xfce4-terminal --maximize --title='Monitor cron'  -e 'tail -f -n 30 /var/log/socklog/cron/current'

cat /var/log/socklog/cron/current | grep  -i "line " | yad --center --title='Log Erros no Cron' --fontname "Sans regular 9" --text-info --tail --wrap --height=1000 --width=1500 2>/dev/null

fi




;;

# =====================================================================================================


"fsck")

    clear

# /var/log/fsck


# fsck corrige erros no sistema de arquivos, se os houver.


# O jeito mais seguro é aplicar o "fsck" a partir de um Live CD e não do linux instalado

# Mas só precisa disso, quando der problema... que é evidenciado pq seu linux não abre....

# fsck de rotina, muitas distros já fazem ao ligar, quando tem o serviço do fsck ativado.


# https://www.vivaolinux.com.br/topico/Linux-Basico/Log-de-erros

# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/Existe-um-comando-para-corrigir-todos-os-erros-ou-mal-funcionamento-do-sistema


;;

# =====================================================================================================


"Sair")

    clear
    
    exit 22
    
#  break

;;

# =====================================================================================================

*)

    clear
    
#    echo "Opção inválida!"

    break        

      
# =====================================================================================================
        
esac

done



exit 0


