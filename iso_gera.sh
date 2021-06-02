#!/bin/bash
#
#
# Resultado:
#
# 461752320 bytes (462 MB, 440 MiB) copied, 104,009 s, 4,4 MB/s
# 228171+0 registros de entrada
# 228171+0 registros de saída
# 467294208 bytes (467 MB, 446 MiB) copied, 104,911 s, 4,5 MB/s
#
#
# 31c16842bd8743e8d22bac911017ca60  /dev/sr0
# 31c16842bd8743e8d22bac911017ca60  /root/imagem.iso
#
#
#
# http://www.bosontreinamentos.com.br/shell-script/zenity-exibindo-caixas-de-dialogo-com-scripts-do-shell-no-linux/
# https://www.techtudo.com.br/dicas-e-tutoriais/noticia/2012/08/como-reproduzir-dvds-protegidos-no-ubuntu.html
# https://pt.wikipedia.org/wiki/DVD
# https://www.vivaolinux.com.br/topico/Multimidia/copiar-dvd-original
# https://elias.praciano.com/2016/10/configuracoes-basicas-do-xterm/
# https://elias.praciano.com/2016/10/configuracoes-avancadas-do-xterm/
# https://www.dicas-l.com.br/arquivo/tamanho_do_fonte_em_xterm__unix_.php
# https://www.techtudo.com.br/dicas-e-tutoriais/noticia/2012/02/como-usar-o-clonedvd.html
# https://www.linuxdescomplicado.com.br/2016/11/alguns-exemplos-de-que-o-comando-dd-pode-ser-considerado-umas-das-ferramentas-mais-versateis-do-linux.html
# https://help.ubuntu.com/community/HowToMD5SUM




# dd if=/dev/sr0  of=$HOME/teste.iso status=progress
# 
# dd: erro lendo '/dev/sr0': Erro de entrada/saída





log="/tmp/iso.log"

rm -Rf $log


clear


which zenity       2>> $log
which dd           2>> $log
which md5sum       2>> $log
which notify-send  2>> $log
which umount       2>> $log
which xterm        2>> $log


# Usa fonte Liberation e icone do Mint-X




# Reproduzir DVDs protegidos
#
# Muitas vezes deseja-se assistir a um DVD em sua distribuição Ubuntu e, no entanto, o disco é reconhecido 
# pelo PC mas não é reproduzido pelo seu player favorito. Nesses casos aparece a mensagem que indica que 
# ocorreu um erro e não foi possível ler o DVD.
#
#
# isso pode ter acontecido porque o DVD é criptografado e uma biblioteca de descriptografia não está instalada 
# em sua máquina. Isso ocorre pois alguns discos são protegidos contra potenciais cópias, de modo que é necessário 
# instalar a biblioteca de descriptografia para resolver o problema. 
#
#
# Instale a biblioteca de descriptografia libdvdcss2
#
#
# No Slackware
#
#
# ls -l /var/log/packages/ | grep -i libdvdread
# -rw-r--r-- 1 root root    1585 Set 12  2019 libdvdread-5.0.3-x86_64-1
#
#
# Nota: Caso o problema persista, cheque se seu drive de DVD possui restrições de reprodução relativas à área de discos.
#



# Para uso do notify-send
#
# Se quiser, ainda é possível temporizar o tempo de exibição, com a opção -t N (onde N é em milisegundos) 
#
# 60000 milissegundos. 1 min

tempo_de_exibicao="60000"



# Icone para uso do notify-send
#
#
# find /usr/share/icons -name "*iso*"
#
# find ~/.icons -name "*iso*"
#
#

# icone_iso="/usr/share/icons/Mint-X/devices/48/battery.svg"

icone_iso="~/.icons/Mint-X/actions/96/media-optical-data-new.svg"







# dvd="sr0"


# Usando uma lista com botões de rádio com o Zenity

dvd=$(zenity  --list  --text "Selecione sua unidade de CD/DVD, pode usar o comando blkid para descubrir" \
    --radiolist \
    --column "Marcar" \
    --column "Midia" \
    TRUE "sr0" FALSE "sr1" FALSE "sr2" FALSE "sr3" FALSE "cdrom" FALSE "dvd" FALSE "dvd1" 2> /dev/null);

  if [ $dvd = 1 ];
   then zenity --error --title "Gera ISO" --text "Processo cancelado" 2> /dev/null & exit 1
  fi


umount /dev/$dvd 2>> $log



notify-send \
-i "$icone_iso" \
-t "10000" \
"Verificando /dev/$dvd ..."



# cat "$log" | grep -i erro

md5sum /dev/$dvd

if [ $? = 1 ];
   then zenity \
--error \
--title "Gera ISO" \
--text 'Existe erro de leitura na midia


* Teste com uma unidade de DVD portátil


Exemplo:


# lsusb

Bus 008 Device 009: ID 0e8d:1806 MediaTek Inc. Samsung SE-208 Slim Portable DVD Write


# blkid

/dev/sr2: LABEL="BASICINSTINCT_NTSC" UUID="305b84e7" TYPE="udf"


* Lavar a midia em água corrente
* Lavar a midia com pasta de dente (oral B) em água corrente

* Unidade de CD/DVD ruim
* Cabo sata com problema
* Fonte de alimentação ruim (generica) de 200 a 500 Watts
* midia ruim


* Não usar cabo adaptador de energia Ide para Sata


# tail -f /var/log/messages


' --width="800" height="100" 2> /dev/null & exit 2

fi

#
# dd: erro lendo '/dev/sr0': Erro de entrada/saída





nome=$(zenity --title="Nome para sua imagem iso" --text "Qual o nome da iso?" --entry  --width="500" height="100" 2> /dev/null)


# Para verificar se a variavel $nome esta vazia

if [ -z $nome ];then

zenity --warning --text "Não pode ter valor nulo."  2>/dev/null

exit 1

fi




clear


notify-send \
-i "$icone_iso" \
-t "$tempo_de_exibicao" \
"Vai querer um cafézinho também?"



xterm \
-geometry 100x20 \
-bg lightyellow \
-fg darkblue  \
-fn 7x13 \
-fa "Liberation Mono:size=9:antialias=false" \
-T "Gerando iso do /dev/$dvd" \
-e dd if=/dev/$dvd  of=$HOME/"$nome".iso status=progress 2>> $log



# -e dd if=/dev/$dvd  of=$HOME/"$nome".iso bs=2048 status=progress 2>> $log



# dd if=/dev/sr0  of=$HOME/"Os Cavaleiros do Zodíaco - Volume 4 - Fase Santuário".iso bs=2048 status=progress

# dd if=/dev/sr0  of=$HOME/"Os Cavaleiros do Zodíaco - Volume 4 - Fase Santuário".iso bs=2048 status=progress 2>> erro.log


# dd if=/dev/sr2  of=$HOME/"Os Cavaleiros do Zodíaco - Volume 4 - Fase Santuário".iso bs=2048 status=progress




# Onde:
#
# -T => janela com o título,  para usar títulos com espaços use aspas: "nova janela";
#
# -fg cor1 => uma nova janela onde fg (foreground) é a cor do texto;
# -bg cor2 =>  (background) é a cor de fundo;
#
# -geometry => Tamanho da janela do xterm
#
# -e => 
#
# -fn => nome da fonte. Para ver a lista completa utilize o comando xlsfonts. 
#
# -fa =>
#
# 
# Para aumentar o tamanho do fonte, posicionar o mouse sobre a janela do xterm e pressionar 
# o botão direito do mouse juntamente com a tecla [CTRL]. Aparecerá então um menu onde serão 
# apresentadas diversas opções para redimensionamento do tamanho da fonte utilizada. Eu prefiro 
# o maior valor, "HUGE" ou "Large". 



# Verifique a integridade do CD/DVD
#
# Ao inicializar a partir do CD no Ubuntu, você terá a opção de testar sua integridade. Ótimo, mas se o CD 
# estiver corrompido, você já perdeu tempo reinicializando. Você pode verificar a integridade do 
# CD sem reiniciar, da seguinte maneira.
#
# Verificando o CD diretamente
#
# Você pensaria que poderia simplesmente usar um comando como este para obter o hash MD5 de uma 
# imagem gravada:
#
# md5sum /dev/cdrom
#
# No entanto, isso quase nunca será o mesmo hash da imagem ISO gravada no disco, porque esse 
# comando inclui o espaço vazio no final do disco, que altera o hash. Portanto, você deve 
# verificar apenas a parte do disco que estava no iso.



md5sum /dev/$dvd >> $log


# Verificando a integridade da imagem iso

md5sum $HOME/"$nome".iso >> $log


# Resultado do arquivo $log:
#
# 31c16842bd8743e8d22bac911017ca60  /dev/sr0
# 31c16842bd8743e8d22bac911017ca60  /home/master/Sysrcd-4.6.0.iso





notify-send \
-i "$icone_iso" \
-t "$tempo_de_exibicao" \
"Imagem ISO gerada em $HOME/  com nome de $nome.iso


Ser for copia de cd de distro linux verificar o funcionamento dela no virtualbox.

Verifique o arquivo $log para mais informações."



exit 0

