#!/bin/bash
#
# Nome: backupdeDriversWindows.sh
#
#
# Backup de Drivers
#
# Como Fazer Backup de Drivers no Prompt de Comando
#
# Recorrer ao software de backup de driver do Windows é realmente capaz de simplificar e acelerar 
# a tarefa de backup. Mas caso você não queira baixar, instalar e iniciar uma ferramenta de backup 
# de terceiros, nós também lhe forneceremos duas maneiras simples com o utilitário embutido do Windows.
#
#
# Solução de Backup do Driver 1: Copie a subpasta FileRepository
#
# Se você limpar o Windows, é necessário fazer um backup de todos os drivers no Windows. Por 
# meio do File Explorer, é possível fazer o backup dos drivers em etapas simples.
#
#    Vá para o File Explorer > "C:\Windows\System32\DriverStore".
#    Ou digite "C:\Windows\System32\DriverStore" na caixa de pesquisa e pressione Enter
#    Por fim, clique em FileRepository e copie-o para um disco rígido de backup com espaço de 
# armazenamento suficiente.
#
#
#
#
#
# Solução de Backup de Driver 2: Drivers de Backup no Prompt de Comando
# 
#    Localize a pasta do driver de backup ou crie uma nova para armazenar os drivers de backup, 
# como C:\drivers-backup.
#    Digite cmd na caixa de pesquisa ao lado do menu Iniciar e você verá o Prompt de Comando.
#    Botão direito do mouse e clique em "Executar como administrador" e, em seguida, uma 
# janela aparece.
#    Digite "dism / online / driver de exportação / destino: C: \ drivers-backup" e pressione Enter.
#    Em seguida, o comando de backup do driver será executado imediatamente.
# 
# Backup Drivers with CMDDrivers de Backup com CMD
# 
# Após a instalação limpa, você pode reinstalar os drivers de backup em nenhum momento.
# 
# 
#
#
#
# Restaurar drivers.
#
#    Para restaurar os drivers, clique com o botão direito do mouse no logotipo do Wins e 
# selecione Gerenciador de dispositivos para executar.
#    Clique com o botão direito do mouse no dispositivo que você deseja atualizar seu driver e 
# clique em  "Atualizar Driver".
#    Localize o software do driver clicando em "Procure no meu computador pelo software de driver."
#    Finalmente, escolha um local para fazer o backup dos drivers e clique em "Avançar".
# 
# 
# 
# https://recoverit.wondershare.com.br/computer-backup/top-5-windows-driver-backup-software.html
# https://sobrelinux.info/questions/205/unable-to-mount-windows-ntfs-filesystem-due-to-hibernation
# https://askubuntu.com/questions/384429/cannot-remove-hiberfile-on-ntfs-partition
# https://aoredordoburacotudoebeira.wordpress.com/tag/ntfs-3g-o-remove_hiberfile/




log="/tmp/Drivers_Windows.log"

rm -Rf "$log"

titulo="Realiza backups dos Drivers do Windows"

clear


which tar              2> "$log"
which xz               2>> "$log"
which notify-send      2>> "$log"


#
# -----------------------------------------------------------------------------------------------------
#


# fdisk -l | grep -i ntfs
# /dev/sda1   *                2048   1026047   1024000    500M  7 HPFS/NTFS/exFAT
# /dev/sda2                 1026048  99217407  98191360   46,8G  7 HPFS/NTFS/exFAT


# umount/dev/sda2


# mount /dev/sda2 /mnt/tmp/
#
# Mount is denied because the NTFS volume is already exclusively opened.
# The volume may be already mounted, or another software may use it which
# could be identified for example by the help of the 'fuser' command.


# ntfsfix /dev/sda2
#
# mount -o remove_hiberfile  /dev/sda2 /mnt/tmp/



#
#
# DESATIVAR HIBERNAÇÃO NO WINDOWS
#
#
# Como tornar a hibernação indisponível
#
#    Pressione o botão Windows tecla no teclado para abrir o menu Iniciar ou Tela Inicial.
#    Pesquise cmd. Na lista de resultados da pesquisa, clique com o botão direito do mouse em Prompt de Comando e selecione Executar como Administrador.
#    Quando você for solicitado pelo Controle de Conta de Usuário, selecione Continuar.
#    No prompt de comando, digite powercfg.exe /hibernate off e pressione Enter.
#    Digite exit e pressione Enter para fechar a janela prompt de comando.
#
#
#
#
# Como disponibilizar a hibernação
#
#    Pressione o botão Windows tecla no teclado para abrir o menu Iniciar ou Tela Inicial.
#    Pesquise cmd. Na lista de resultados da pesquisa, clique com o botão direito do mouse em Prompt de Comando e selecione Executar como Administrador.
#    Quando você for solicitado pelo Controle de Conta de Usuário, selecione Continuar.
#    No prompt de comando, digite powercfg.exe /hibernate on e pressione Enter.
#    Digite exit e pressione Enter para fechar a janela prompt de comando.
#
#
# https://docs.microsoft.com/pt-br/troubleshoot/windows-client/deployment/disable-and-re-enable-hibernation
#
#
# -----------------------------------------------------------------------------------------------------
#


# Diretório dos Drivers do Windows:

diretorio=$(zenity \
--entry \
--title="$titulo" \
--text "Informe a pasta onde esta instalado o Windows." \
--entry-text "/run/media/Goku/Windows 10 Pro/" 2> /dev/null)


# -----------------------------------------------------------------------------------------------------


clear

# Verificar se diretorio existe

if [ ! -d "$diretorio" ]; then

echo "
Pasta $diretorio não localizada.
"

    exit 1
fi

# -----------------------------------------------------------------------------------------------------


# Verificar se diretorio existe

if [ ! -d "$diretorio/Windows/System32/DriverStore/FileRepository/" ]; then

echo "
Pasta $diretorio/Windows/System32/DriverStore/FileRepository/ não localizada.
"

    exit 2
fi


DATAINICIO=`date +%d/%m/%Y-%H:%M:%S`


echo "
Inicio: $DATAINICIO
" >> "$log"


cd "$diretorio" 2>> "$log"

tar -cJvf $HOME/Backup_de_Drivers-Windows.tar.xz Windows/System32/DriverStore/FileRepository/  2>> "$log"


DATA=`date +%d/%m/%Y-%H:%M:%S`


echo "
Termino: $DATA
" >> "$log"



notify-send \
-i "/usr/share/icons/hicolor/256x256/apps/gcr-gnupg.png"  \
-t "10000" \
"Backup dos Drivers do Windows" \
"Backup realizado em $DATA salvo na pasta $HOME com o nome de Backup_de_Drivers-Windows.tar.xz ...


Tempo:

Inicio: $DATAINICIO

Termino: $DATA

"


exit 0

