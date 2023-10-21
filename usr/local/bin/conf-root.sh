#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     06/10/2023 as 01:57
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
# 
# https://www.dicas-l.com.br/arquivo/automatizacao_de_tarefas_com_crontab_e_cron.php
# https://pt.stackoverflow.com/questions/311679/como-comparar-o-valor-de-uma-vari%C3%A1vel-com-uma-string-no-shell-script
# https://www.techtudo.com.br/dicas-e-tutoriais/2023/01/root-no-linux-como-ativar-e-desativar-sua-conta.ghtml



clear




# Sem essa opção a caixa de dialog "Zenity" e o "notify-send" não aparece para o usuário.

export DISPLAY=:0.0




# ----------------------------------------------------------------------------------------

# Verifica se quem executa é o Root


if [ "$(id -u)" != "0" ]; then

echo -e "\nVocê deve executar este script como Root! \n"

exit 


fi


# ----------------------------------------------------------------------------------------

# Limpar

rm -Rf /root/.bashrc



# Verifica pacotes necessários:

for pkg in notify-send xfce4-notifyd-config nano freshclam
do
    if ! which $pkg &>/dev/null; then
    
        # echo "$(basename "$0"): Erro: '$pkg' não está instalado."
        
        notify-send -i gtk-dialog-info  -t 10000 "Configura Root" "$(basename "$0"): Erro: '$pkg' não está instalado."

        exit 1
    fi
    
done



ls -la /root


# ----------------------------------------------------------------------------------------

# Configura a variavel PATH para a pasta /usr/local/bin
 
# echo $PATH

# echo 'PATH="/usr/local/bin:'$PATH'"' > /root/.bashrc


echo '
# Variavel PATH

PATH="/usr/local/bin:/usr/bin:/bin:/usr/games"
' > /root/.bashrc


# ----------------------------------------------------------------------------------------



if [ "$SHELL" == "/bin/bash" ]; then
    echo "
Usuário Root já esta usando o Shell: $SHELL
    "
    
else

    echo "
Usuário Root esta usando o shell: $SHELL
    "
    
    echo "
Configura o usuário Root para usar o shell: /bin/bash...
"


fi


# ----------------------------------------------------------------------------------------
   
echo "
     # Cor vermelha estilo Kali Linux

     PS1='\[\033[1;31m\]\u@\h:\[\033[00m\]# '
     
" >> /root/.bashrc
    
# ----------------------------------------------------------------------------------------
    
# Usa o editor nano para abrir o crontab


# O arquivo crontab será aberto utilizando o editor de sua preferência. Você pode definir esta preferência através da variável de ambiente EDITOR:
#
# Se você não conhece o vi, pode usar o nano, que é um editor mais amigável.

echo "# Usa o editor nano para abrir o crontab

export EDITOR=nano

" >> /root/.bashrc

# https://www.dicas-l.com.br/arquivo/automatizacao_de_tarefas_com_crontab_e_cron.php


# ----------------------------------------------------------------------------------------


# Adiciona uma Alias para atualizar o sistema

echo '# Para atualizar o sistema

alias atualizar="/usr/local/bin/atualiza.sh"


# Para desconectar da internet

alias desconectar="clear && pkill wvdial ; pkill ppp ; pon -a"


# Para conectar da internet

alias conectar="clear && pon E220"


# Montar partição hibernada do Windows no Linux

alias montarwindowshibernado="clear && umount /mnt/ ; umount /dev/sda2 ;  mount -t ntfs-3g -o remove_hiberfile /dev/sda2  /mnt/ && ls -a /mnt/"


# Tirar print da tela em modo texto

alias foto="fbgrab /tmp/tty-$(date +%d-%m-%Y-%H-%M).png && chown -R fernando:fernando /tmp/tty-$(date +%d-%m-%Y-%H-%M).png"


# Removendo links simbólicos quebrados em /var/service/ no VoidLinux

alias linksquebradosservicevoid="clear && find "/var/service/" -xtype l  && find "/var/service/" -xtype l -exec rm {} \;"

# https://pt.linux-console.net/?p=8329



# Como alterar as permissões de um arquivo usando o comando CHOWN?
#
# O comando chown é usado para alterar o dono ou grupo de um determinado arquivo.
#
# Este comando é reservado apenas para o Root.
#
# Se for informado um login:grupo ou login.grupo, tanto a propriedade do dono do arquivo quanto o grupo são alterados. 

alias corrigirdono="clear && chown -R fernando:fernando /home/fernando/"


# https://pt.wikipedia.org/wiki/Chown




' >> /root/.bashrc



# ----------------------------------------------------------------------------------------

# Remova a senha de root com o comando "passwd –lock root" e tecle enter. Isso desativará 
# completamente o login root. Ou seja, a partir desse ponto, nenhum usuário terá mais acesso.
#
#
# O comando acima bloqueia a senha do root. Como alternativa, é possível desativar a senha 
# atual para que nenhum usuário saiba qual é, tornando mais completa a desativação do root. 
# Para isso, use o comando “passwd -d root” e tecle enter.
#
# Quando for necessário, você pode reativar a senha. Basta usar o comando "sudo passwd root"
# e teclar enter. O sistema pede uma nova senha e a conta root será reabilitada no sistema.


# ----------------------------------------------------------------------------------------

echo "
# ----------------------------------------------------------------------------------------

Conteúdo do arquivo: $HOME/.bashrc

"

cat /root/.bashrc

echo "
# ----------------------------------------------------------------------------------------

"



source /root/.bashrc




           notify-send -i gtk-dialog-info  -t 100000 "Usuário Root" "
           
Usuário Root configurado:

* Configura a variavel PATH para a pasta /usr/local/bin
* Usa o editor nano para abrir o crontab 
* Adicionado uma Alias para atualizar o sistema

"






exit 0

