#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     20/10/2023 as 19:45
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL

log="/tmp/Pacotes_VoidLinux.txt"





# Exemplo de caso para o uso:


# Descobrir quais os programas que foram instalados na data da criação do arquivo /etc/cron.hourly/0anacron no Void Linux.


# $ cat /var/log/socklog/cron/current | egrep  -i "line |exited" 
# cat: /var/log/socklog/cron/current: Permissão negada


# Saída de erro do Cron

# cat /var/log/socklog/cron/current | egrep  -i "line |exited" 
# 2023-11-02T22:01:01.55380 cron.info: Nov  2 19:01:01 CRONIE-CROND[24771]: (root) CMDOUT (/etc/cron.hourly/0anacron: line 11: /etc/default/anacron: No such file or directory)
# 2023-11-02T22:01:01.55414 cron.info: Nov  2 19:01:01 CRONIE-CROND[24771]: (root) CMDOUT (run-parts: /etc/cron.hourly/0anacron exited with return code 1)
# 2023-11-02T23:01:01.44840 cron.info: Nov  2 20:01:01 CRONIE-CROND[2640]: (root) CMDOUT (/etc/cron.hourly/0anacron: line 11: /etc/default/anacron: No such file or directory)
# 2023-11-02T23:01:01.44857 cron.info: Nov  2 20:01:01 CRONIE-CROND[2640]: (root) CMDOUT (run-parts: /etc/cron.hourly/0anacron exited with return code 1)
# 2023-11-03T00:01:01.48550 cron.info: Nov  2 21:01:01 CRONIE-CROND[12030]: (root) CMDOUT (/etc/cron.hourly/0anacron: line 11: /etc/default/anacron: No such file or directory)
# 2023-11-03T00:01:01.48600 cron.info: Nov  2 21:01:01 CRONIE-CROND[12030]: (root) CMDOUT (run-parts: /etc/cron.hourly/0anacron exited with return code 1)
# 2023-11-03T01:01:01.78345 cron.info: Nov  2 22:01:01 CRONIE-CROND[20459]: (root) CMDOUT (/etc/cron.hourly/0anacron: line 11: /etc/default/anacron: No such file or directory)
# 2023-11-03T01:01:01.78408 cron.info: Nov  2 22:01:01 CRONIE-CROND[20459]: (root) CMDOUT (run-parts: /etc/cron.hourly/0anacron exited with return code 1)
# 2023-11-03T02:01:01.82375 cron.info: Nov  2 23:01:01 CRONIE-CROND[30004]: (root) CMDOUT (/etc/cron.hourly/0anacron: line 11: /etc/default/anacron: No such file or directory)
# 2023-11-03T02:01:01.82409 cron.info: Nov  2 23:01:01 CRONIE-CROND[30004]: (root) CMDOUT (run-parts: /etc/cron.hourly/0anacron exited with return code 1)
# 2023-11-03T03:01:01.56114 cron.info: Nov  3 00:01:01 CRONIE-CROND[7951]: (root) CMDOUT (/etc/cron.hourly/0anacron: line 11: /etc/default/anacron: No such file or directory)
# 2023-11-03T03:01:01.56187 cron.info: Nov  3 00:01:01 CRONIE-CROND[7951]: (root) CMDOUT (run-parts: /etc/cron.hourly/0anacron exited with return code 1)
# 2023-11-03T03:01:01.99271 cron.info: Nov  3 00:01:01 CRONIE-CROND[17919]: (root) CMDOUT (/etc/cron.hourly/0anacron: line 11: /etc/default/anacron: No such file or directory)
# 2023-11-03T03:01:01.99303 cron.info: Nov  3 00:01:01 CRONIE-CROND[17919]: (root) CMDOUT (run-parts: /etc/cron.hourly/0anacron exited with return code 1)
# 2023-11-03T04:01:01.07745 cron.info: Nov  3 01:01:01 CRONIE-CROND[27420]: (root) CMDOUT (/etc/cron.hourly/0anacron: line 11: /etc/default/anacron: No such file or directory)
# 2023-11-03T04:01:01.07815 cron.info: Nov  3 01:01:01 CRONIE-CROND[27420]: (root) CMDOUT (run-parts: /etc/cron.hourly/0anacron exited with return code 1)
# 2023-11-03T05:01:01.79857 cron.info: Nov  3 02:01:01 CRONIE-CROND[5541]: (root) CMDOUT (/etc/cron.hourly/0anacron: line 11: /etc/default/anacron: No such file or directory)
# 2023-11-03T05:01:01.79907 cron.info: Nov  3 02:01:01 CRONIE-CROND[5541]: (root) CMDOUT (run-parts: /etc/cron.hourly/0anacron exited with return code 1)
# 2023-11-03T06:01:01.86629 cron.info: Nov  3 03:01:01 CRONIE-CROND[17376]: (root) CMDOUT (/etc/cron.hourly/0anacron: line 11: /etc/default/anacron: No such file or directory)
# 2023-11-03T06:01:01.86659 cron.info: Nov  3 03:01:01 CRONIE-CROND[17376]: (root) CMDOUT (run-parts: /etc/cron.hourly/0anacron exited with return code 1)




# Descobrir a data da criação do arquivo /etc/cron.hourly/0anacron  (Formatando a saída da data para o Brasil)

# $ ls -l /etc/cron.hourly/0anacron
# -rwxr-xr-x 1 root root 798 out 17 04:30 /etc/cron.hourly/0anacron


# $ ls -lct --time=creation /etc/cron.hourly/0anacron | awk '{print $7, $6, $8 " " $9}'
# 17 out 12:51 /etc/cron.hourly/0anacron


# $ ls -lhct --time-style="+%d-%m-%Y-%H-%M-%S" /etc/cron.hourly/0anacron
# -rwxr-xr-x 1 root root 798 17-10-2023-12-51-14 /etc/cron.hourly/0anacron



# https://www.vivaolinux.com.br/topico/Comandos/Saida-do-comando-ls-ou-dir
# https://www.vivaolinux.com.br/topico/Shell-Script/Listar-e-baixar-arquivos-FTP
# https://www.vivaolinux.com.br/topico/Comandos/Listar-apenas-a-data-e-tamanho-do-arquivo



# Programas instalados ou atualizados nesta data (17/10/2023)

# $ cat Pacotes_VoidLinux.txt | grep "17/10/2023"
# 17/10/2023 12:51  cronie-1.7.0_1                     <================
# 17/10/2023 12:51  libqpdf-11.6.3_1





# https://br.ccm.net/faq/2269-como-ler-um-arquivo-linha-por-linha
# https://www.edivaldobrito.com.br/usar-o-comando-dpkg-no-debian/
# https://www.vivaolinux.com.br/topico/Sed-Awk-ER-Manipulacao-de-Textos-Strings/Remover-espacos-vazios-de-um-texto.
# https://www.vivaolinux.com.br/dica/Comando-sed-para-formatar-datas
# https://blog.4linux.com.br/desvendando-o-poder-do-comando-sed/
# http://www.dicas-l.com.br/arquivo/sed_apagando_colunas.php
# http://ptcomputador.com/Sistemas/linux/204251.html
# https://www.botecodigital.dev.br/linux/removendo-linhas-duplicadas-de-arquivo-linux-com-uniq/
# http://www.bosontreinamentos.com.br/linux/certificacao-lpic-1/comando-sort-ordenando-dados-em-um-arquivo-de-texto-no-linux-lpi-1/
# https://plus.diolinux.com.br/t/comandos-basicos-para-gerenciar-pacotes-flatpak-no-linux/35809



# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados

clear

which xbps-query  2> /dev/null || { echo "Programa xbps-query não esta instalado."   ; exit ; }
which awk         2> /dev/null || { echo "Programa awk não esta instalado."   ; exit ; }
which wc          2> /dev/null || { echo "Programa wc não esta instalado."    ; exit ; }
which tee         2> /dev/null || { echo "Programa tee não esta instalado."   ; exit ; }
which grep        2> /dev/null || { echo "Programa grep não esta instalado."  ; exit ; }
which cut         2> /dev/null || { echo "Programa cut não esta instalado."   ; exit ; }
which sed         2> /dev/null || { echo "Programa sed não esta instalado."   ; exit ; }


# ----------------------------------------------------------------------------------------

# Remove os arquivos de log

rm -Rf \
"$log" \
/tmp/VoidLinux.txt

# ----------------------------------------------------------------------------------------

# Listar pacotes atualmente instalados

# Para listar ou exibir pacotes atualmente instalados no Void Linux

echo -e "\nLista dos pacotes instalados salvo em /tmp...\n"

mkdir -p /tmp/

rm -Rf "$log"

xbps-query -l | awk '{print $2}' | tee -a "$log"

# ----------------------------------------------------------------------------------------

# Ler um arquivo linha por linha


while read pacote; do

echo -e "$pacote\n";

data=$(xbps-query -S "$pacote" | grep install-date | awk '{print $2 " " $3 " " $4}')

echo "$data $pacote" >> /tmp/VoidLinux.txt

done <  "$log"


# xbps-query -S xpad | grep install-date | cut -d: -f2
# 2022-10-10 23
 
# xbps-query -S xpad | grep install-date | awk '{print $2 " " $3 " " $4}'
# 2022-10-10 23:11 -03
  
# xbps-query -S xpad | grep install-date | awk '{print $2 " " $3 " " $4}' | awk '{print $1}'
# 2022-10-10
  
  
# xbps-query -l | awk '{print $2}' | grep xpad
# xpad-5.0.0_1


 
# Exibir informações detalhadas sobre um pacote
# 
# Este comando exibe ou mostra informações detalhadas sobre um pacote.
# 
# xbps-query -S xpad
# architecture: x86_64
# filename-sha256: aa30c37dfb590f4f75033886d4d47006809f77a1e20b08539bbd222ae8fc3eab
# filename-size: 109KB
# install-date: 2022-10-10 23:11 -03
# installed_size: 309KB
# long_desc: sticky note application for X
# maintainer: Ubuntu Developers <ubuntu-devel-discuss@lists.ubuntu.com>
# metafile-sha256: aec91400470b22a758ed24bb73daa022dc2c8ddf13a0f618b5524933aa18594d
# pkgname: xpad
# pkgver: xpad-5.0.0_1
# repository: /home/fernando/dwhelper/binpkgs
# run_depends:
# 	glib>=2.74.0_1
# 	glibc>=2.32_1
# 	gtk+3>=3.0.0_1
# 	gtksourceview>=3.8.0_1
# 	libICE>=1.0.5_1
# 	libSM>=1.1.0_1
# 	pango>=1.24.0_1
# short_desc: sticky note application for X
# state: installed

# ----------------------------------------------------------------------------------------

# Remover espaços vazios no inicio de cada linha do arquivo abaixo

sed -i 's/^ //g' /tmp/VoidLinux.txt

# ----------------------------------------------------------------------------------------

# Trocar a ordem de dados em um arquivo

# echo "2022-10-10 23:11 -03" | sed -r 's|(^.{4})-(.{2})-(.{2})|\3/\2/\1|'

# sed -r 's/(install-date: )(....)-(..)-(.. )/\\2-\\3-\\4/g' arquivo.txt


# O sed é um editor de fluxo que é muito útil para transformar texto.

# Aqui está um exemplo de como você pode usar o comando sed para rearranjar a data de "install-date: 2022-10-10 23:11 -03" para "10-10-2022 23:11".


# sed -r 's/(install-date: )(....)-(..)-(.. )/\\2-\\3-\\4/g' arquivo.txt

# A expressão regular utilizada separa as partes da data em grupos e, em seguida, reorganiza esses grupos na ordem que você deseja. Isso fará a substituição na ordem necessária.



# Certifique-se de substituir "~/backup/VoidLinux.txt" pelo caminho correto até o seu arquivo.




# cat ~/backup/VoidLinux.txt | sed -r 's|(^.{4})-(.{2})-(.{2})|\3/\2/\1|' 

sed -ri 's|(^.{4})-(.{2})-(.{2})|\3/\2/\1|g' /tmp/VoidLinux.txt

 
 
# xbps-query -S linux6.4-6.4.16_1 | grep install-date
# install-date: 2023-09-13 16:52 -03

# ----------------------------------------------------------------------------------------
 
# Remove a coluna com "-03" do arquivo ~/backup/VoidLinux.txt
# 
# 03/10/2023 18:10 -03 linux-headers-6.5_1
# 13/09/2023 16:52 -03 linux6.4-6.4.16_1
# 13/09/2023 16:52 -03 linux6.4-headers-6.4.16_1
# 06/10/2023 16:01 -03 linux6.5-headers-6.5.6_1
# 30/08/2023 14:39 -03 live555-2020.08.11_3

cat /tmp/VoidLinux.txt | awk '{$3=""; print}' > /tmp/Void.txt

mv /tmp/Void.txt  /tmp/VoidLinux.txt



# 03/10/2023 18:10  linux-headers-6.5_1
# 13/09/2023 16:52  linux6.4-6.4.16_1
# 13/09/2023 16:52  linux6.4-headers-6.4.16_1
# 06/10/2023 16:01  linux6.5-headers-6.5.6_1


# https://www.vivaolinux.com.br/topico/Iniciantes-no-Linux/comando-para-deletar-coluna-especifica-de-um-arquivo

# ----------------------------------------------------------------------------------------

sleep 2

clear


echo "

Quantidade de pacotes instalados (xbps-query -l):
" | tee -a /tmp/VoidLinux.txt

xbps-query -l  | wc -l | tee -a /tmp/VoidLinux.txt

# ----------------------------------------------------------------------------------------

echo "

Conteudo da pasta /opt:

  " | tee -a /tmp/VoidLinux.txt
  
ls -lh /opt/ | tee -a /tmp/VoidLinux.txt

# ----------------------------------------------------------------------------------------

which flatpak 1> /dev/null 2> /dev/null

if [ $? == 0 ]; then


echo "
Pacotes instalados via flatpak:

  " | tee -a /tmp/VoidLinux.txt
  
  
flatpak list   | tee -a /tmp/VoidLinux.txt


fi


# ----------------------------------------------------------------------------------------


echo "
Buscando arquivos AppImage...
" | tee -a /tmp/VoidLinux.txt


# .appimage ou .AppImage


find / -iname "*.appimage" -exec ls -lh {} \;  | tee -a /tmp/VoidLinux.txt


# https://askubuntu.com/questions/1438242/finding-a-program-running-as-appimage



# https://diolinux.com.br/tecnologia/alanpope-unsnap-abandonar-snaps.html

# ----------------------------------------------------------------------------------------

# Não ficou 100% essa parte abaixo:
#
# Ordenar o arquivo /tmp/VoidLinux.txt por data (coluna 1 do arquivo) em ordem reversa
# e salvar o resultado no arquivo de nome /tmp/Void.txt:

# cat /tmp/VoidLinux.txt | sort -nr -t"/" -k1 > /tmp/Void.txt

# mv /tmp/Void.txt /tmp/VoidLinux.txt

# ----------------------------------------------------------------------------------------
 


echo "

" >> /tmp/VoidLinux.txt


sleep 2


mv /tmp/VoidLinux.txt "$log"


# ----------------------------------------------------------------------------------------

# Como inserir linha no início do arquivo "$log" no Linux

# Podemos usar p comando sed para anexar uma linha "Esta é minha primeira linha" ao início do arquivo "$log":

sed -i '1 s/^/\nProgramas instalados no Void Linux (xbps-install):\n\n/' "$log"


# https://pt.linux-console.net/?p=12008
# https://giovannireisnunes.wordpress.com/2018/03/02/insercao-no-inicio-do-arquivo-com-sed/

# ----------------------------------------------------------------------------------------


echo "

Arquivo salvo em $log

"

# ----------------------------------------------------------------------------------------


exit 0

