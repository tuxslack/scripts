#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     05/10/2023 as 03:57
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
#
# Metodo gambiarra
#
# Quando a gente conecta o Linux em rede, o arquivo /etc/resolv.conf é automaticamente alterado com as configurações 
# do servidor. Muitas vezes com servidor DNS lento ao extremo. Um recurso meia boca é tornar o arquivo inalterável 
# com o comando "chattr". Mas convenhamos: é um recurso pouco elegante. 
#
# Bloquear a alteração do DNS no Linux
#
#
# Arquivo de configuração de DNS em /etc/resolv.conf
#
# DNS primário
# nameserver 
#
# DNS secundário 
# nameserver 
#
#
# Para saber os atributos de um arquivo/diretório, você pode usar o seguinte comando:
# 
# lsattr
# 
# 
# Antes de aprender a correr, é preciso aprender a andar...
#
#
# https://ubuntuforum-br.org/index.php?topic=106484.0
# https://www.vivaolinux.com.br/dica/Travandobloqueando-arquivos-e-diretorios-no-GNULinux


clear

# Verificar se os programas estão instalados

which chattr      || exit 1
which xdg-open    || exit 2
which zenity      || exit 3
which notify-send || exit 4
which sudo        || exit 5



# Inicio do loop

      while true; do
        choice3="$(zenity --title="Bloquear e desbloquear a alteração do DNS"  --list --column "Opções"  --column="Descrição" --width=700 --height=200  \
        "Bloquear arquivo" "Seus dados não poderão ser alterados, até que o atributo seja desabilitado." \
        "Desbloquear arquivo"  "Tornar o arquivo mutável ​​novamente." \
        "Sair" "" 2>/dev/null)"

        case "${choice3}" in
        
# =======================================================================
        
          "Bloquear arquivo" )
          
          
          # rm -Rf "$arquivo"

          # touch  "$arquivo"
          
          
          # Para bloquear
          
          
          # Edite o arquivo /etc/resolv.conf, deixe-o da forma que prefere.

          sudo xdg-open /etc/resolv.conf

          sudo chattr +i "/etc/resolv.conf"
          
          
            notify-send -i gtk-dialog-info -t 100000 "Arquivo /etc/resolv.conf" "
            
Arquivo /etc/resolv.conf bloqueado
            
Quando bloqueia um arquivo, você não conseguirá fazer 
mais alteração nenhuma, nem mesmo se estiver logado 
como Root. Uma vez bloqueado, você só conseguirá 
alterar o arquivo/diretório desbloqueando o arquivo."
            
          ;;
          
# =======================================================================
          
          "Desbloquear arquivo" )

          # Para liberar
          
          # Se precisar mudar novamente o arquivo, use o comando abaixo antes.

          sudo chatter -i "/etc/resolv.conf"

          sudo xdg-open /etc/resolv.conf


           notify-send -i gtk-dialog-info  -t 100000 "Arquivo /etc/resolv.conf" "
           
Arquivo /etc/resolv.conf desbloqueado"
                        
          ;;
          
# =======================================================================
          
          *)
            break
                        
          ;;
          
        esac
      done
      
# Fim do loop
    
clear

exit 0

