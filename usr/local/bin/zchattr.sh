#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     05/10/2023 as 03:57
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
#
#
# Como bloquear um arquivo/diretório para que ninguém (nem mesmo o root) possa altera-lo.
#
#
# Desativar os documentos recentes
# =====================
#
#
# $ rm -Rf ~/.local/share/recently-used.xbel
#
# $ touch  ~/.local/share/recently-used.xbel
#
#
# sudo chattr +i /home/crearj/.local/share/recently-used.xbel
#
#
#
# Resultado:
#
# rm: não foi possível remover '/home/crearj/.local/share/recently-used.xbel': Operação não permitida
#
#
# Pronto, pode usar o que quiser que não aparecerá mais em documentos recentes.
#
#
# Para reativá-lo: sudo chattr -i /home/crearj/.local/share/recently-used.xbel
#
#
#
# Obs: Altera o usuário crearj para o seu usuário no sistema.
#
#
# https://help.gnome.org/users/zenity/stable/index.html.pt_BR
# https://www.vivaolinux.com.br/dica/Travandobloqueando-arquivos-e-diretorios-no-GNULinux
# https://www.unix.com/shell-programming-and-scripting/268703-bash-zenity-loop-raspbian.html
# https://www.linuxforce.com.br/comandos-linux/comandos-linux-comando-chattr/



clear

# Verificar se os programas estão instalados

which zenity          || exit 1
which notify-send     || exit 2
which chattr          || exit 3




# Pode ser usado nos arquivos:


# Documentos recentes
#
arquivo="$HOME/.local/share/recently-used.xbel"


# Para não precisar reconfigurar os servidores DNS todas as vezes que mexer nas configurações de rede.
#
# arquivo="/etc/resolv.conf"


# Wvdial
#
# arquivo="/etc/wvdial.conf"





# Inicio do loop

      while true; do
        choice3="$(zenity --title="Arquivo recently-used.xbel"  --list --column "Opções"  --column="Descrição" --width=700 --height=200  \
        "Bloquear arquivo" "Seus dados não poderão ser alterados, até que o atributo seja desabilitado." \
        "Desbloquear arquivo"  "Tornar o arquivo mutável ​​novamente." \
        "Sair" "" 2>/dev/null)"

        case "${choice3}" in
        
          "Bloquear arquivo" )
          
          
          # rm -Rf "$arquivo"

          # touch  "$arquivo"
          
          
          # Para bloquear
          
          sudo chattr +i "$arquivo"
          
          
            notify-send -i gtk-dialog-info -t 100000 "Arquivo recently-used.xbel" "
            
Arquivo $arquivo bloqueado
            
Quando bloqueia um arquivo, você não conseguirá fazer 
mais alteração nenhuma, nem mesmo se estiver logado 
como Root. Uma vez bloqueado, você só conseguirá 
alterar o arquivo/diretório desbloqueando o arquivo."
            
          ;;
          
          "Desbloquear arquivo" )

          # Para liberar
          
          sudo chattr -i "$arquivo"


           notify-send -i gtk-dialog-info  -t 100000 "Arquivo recently-used.xbel" "
           
Arquivo $arquivo desbloqueado"
                        
          ;;
          
          *)
            break
            
          ;;
          
        esac
      done
      
# Fim do loop

clear    

exit 0

