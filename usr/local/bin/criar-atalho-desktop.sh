#!/bin/bash
#
#
########################################################################
#
# Autor:        Fernando Souza - https://www.youtube.com/@fernandosuporte
# Data:         03/10/2023 as 18:43
# Homepage:     https://github.com/tuxslack/scripts
#
# Colaboração:  Andrew - 03/12/2010 - andrew@webupd8.org
# Site:         
# LICENÇA:      GPL3 (https://www.gnu.org/licenses/gpl-3.0.html)
# REQUER:       yad
# Nome:         criar-atalho-desktop.sh
# DESCRIÇÃO:  
# VERSÃO:       1.0.0 (2023)
#
########################################################################
#
#
#
#
#
#
#
#
# http://www.webupd8.org/2010/12/yad-zenity-on-steroids-display.html
# http://www.dicas-l.com.br/arquivo/yad_yet_another_dialog.php
# https://askubuntu.com/questions/1187335/how-to-put-yad-form-fields-value-into-variable-after-submit
# https://www.vivaolinux.com.br/topico/Comandos/Mudar-variavel-global.
# https://mange.ifrn.edu.br/shell-script-wikipedia/13-else-if.html
# https://www.dicas-l.com.br/arquivo/uma_breve_apresentacao_do_yad_yet_another_dialog.php
# https://yad-guide.ingk.se/examples/examples.html
# https://www.cyberciti.biz/faq/bash-while-loop/
# https://www.thegeekdiary.com/test-command-examples-in-linux/
# https://wiki.inf.ufpr.br/maziero/doku.php?id=unix:shell_scripts
# https://www.vivaolinux.com.br/dica/Bash-Nao-use-if
# https://www.vivaolinux.com.br/topico/Shell-Script/Ordem-Crescente-e-Decrescente
# https://www.vivaolinux.com.br/topico/Shell-Script/Como-fazer-um-FOR-com-separador-em-um-Script








clear

# Defina a versão do programa
VERSAO="1.0.0"


# ----------------------------------------------------------------------------------------


# Ele verifica a variavel $LANG e se não for pt_BR vai para o proximo idioma.


if [ "$LANG" = "pt_BR.UTF-8" ]; then

echo "Carregando $LANG"


titulo="Editor de entradas de desktop"
texto="Editor de entrada de desktop simples"
botao_ajuda="Ajuda"
botao_sobre="Sobre"
botao_ok="OK"
botao_cancelar="Cancelar"


aviso="Aviso"
faltayad="O programa yad não foi localizado no sistema."
faltanotify="O programa notify-send não foi localizado no sistema."

localizar_pasta="A pasta não foi encontrada:"



# Verificar permissões de pasta

permissoes_pasta="O usuário $USER não tem acesso de gravação em "


tipo_de_categoria="Você precisa inserir uma categoria para o atalho"

caminho_atalho="Você tem que dizer onde salvar o atalho"


# Type=Application

variavel1="Tipo"
variavel1_1="Application"


# Versão - Version

variavel2="Versão"
variavel2_1="1.0"


# Nome - Name

variavel3="Nome"
variavel3_1="Nome"

# Nome genérico

variavel4="Nome genérico"
variavel4_1="Nome genérico"

# Comentário

variavel5="Comente"
variavel5_1="Este é o comentário"

# Caminho - Path

variavel6="Caminho"
variavel6_1=""

# Comando - Exec

variavel7="Comando"
variavel7_1='xdg-open ""  ou xfce4-terminal --maximize --title="" -e "su -c "" "'

# Ícone - Icon

variavel8="Ícone"
variavel8_1="/usr/share/icons/hicolor/48x48/apps/"


# Terminal

variavel9="Terminal"

# StartupNotify

variavel10="Notificação de inicialização (StartupNotify)"




# Palavras chave - Keywords

variavel12="Palavras chave - deve  ser separada por ;"

variavel12_1="sistema;pacote;void;linux;xbps;update;atualizar;atualizacao;repositorio;voidlinux"


# MimeType

# application/pdf;application/rdf+xml;application/rss+xml;application/xhtml+xml;application/xhtml_xml;application/xml;image/gif;image/jpeg;image/png;image/webp;text/html;text/xml;x-scheme-handler/http;x-scheme-handler/https

variavel13="Tipo MIME - deve ser separado por ;"

variavel13_1=" "


variavel14="Onde salva o arquivo .desktop?"


# Ajuda do script

ajuda(){

echo "Ajuda do script $(basename $0)"

}







elif [ "$LANG" = "en_US.utf8"  ]; then

# elif [ "$LANG" = "$LANG"  ]; then


echo "Carregando $LANG"




# ----------------------------------------------------------------------------------------


titulo="Desktop entry editor"
texto="Simple desktop entry editor"
botao_ajuda="Help"
botao_sobre="About"
botao_ok="OK"
botao_cancelar="Cancel"


aviso="Notice"
faltayad="O programa yad não foi localizado no sistema."
faltanotify="O programa notify-send não foi localizado no sistema."

localizar_pasta="The folder was not found:"


# Verificar permissões de pasta

permissoes_pasta="The $USER user does not have write access to "


tipo_de_categoria="You need to enter a category for the shortcut"

caminho_atalho="You have to tell where to save the shortcut to"



# Type

variavel1="Type"
variavel1_1="Application"


# Versão - Version

variavel2="Version"
variavel2_1="1.0"


# Nome - Name

variavel3="Name"
variavel3_1="Name"


# Nome genérico - Generic name

variavel4="Generic name"
variavel4_1="Generic name"

# Comentário - Comment

variavel5="Comment"
variavel5_1="This is the comment"


# Caminho - Path

variavel6="Path"
variavel6_1=""

# Comando - Exec

variavel7="Command"
variavel7_1="/usr/bin/yad"

# Ícone - Icon

variavel8="Icon"
variavel8_1="/usr/share/icons/hicolor/48x48/apps/"



# Terminal

variavel9="Terminal"

# StartupNotify

variavel10="Startup notify"



# Palavras chave - Keywords

variavel12="Keywords - must be separated by ;"

variavel12_1="sistema;pacote;void;linux;xbps;update;atualizar;atualizacao;repositorio;voidlinux"



# MimeType

# application/pdf;application/rdf+xml;application/rss+xml;application/xhtml+xml;application/xhtml_xml;application/xml;image/gif;image/jpeg;image/png;image/webp;text/html;text/xml;x-scheme-handler/http;x-scheme-handler/https

variavel13="MIME type - must be separated by ;"

variavel13_1=" "



# Onde salva o arquivo .desktop

variavel14="Where do you save the .desktop file?"





# Ajuda do script

ajuda(){

echo "Script help $(basename $0)"
  
}



else
 

 
    yad \
    --center \
    --image=dialog-error \
    --timeout=10 \
    --no-buttons \
    --title "Aviso" --text "Sem suporte ao idioma: $LANG" \
    --width 400 --height 100 \
    2>/dev/null
    
    exit
    
    
fi


# ----------------------------------------------------------------------------------------

# Verificar se os programas estão instalados


which yad            2> /dev/null || { echo "$faltayad" ; exit 1; }

which notify-send    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "$aviso" --text "$faltanotify" --width 450 --height 100 2>/dev/null   ; exit 1; }


# ----------------------------------------------------------------------------------------

# Inicio do loop while

while :
do


# ----------------------------------------------------------------------------------------


# Categoria - Categories
#
#  cat /usr/share/applications/*.desktop | grep -i Categories
#
#  cat ~/.local/share/applications/*.desktop | grep -i Categories

variavel11="Categoria"

variavel11_1="Utility!Game!HardwareSettings!System!Development!Network!WebBrowser!Office!AudioVideo!Graphics!Settings"

# Use o comando sort para colocar em ordem

# Ordem decrescente => sort -nr

variavel11_1=$(echo "$variavel11_1" | tr '!' '\n' |sort )
variavel11_1=$(echo "$variavel11_1" | tr '\n' '!' |sort )


# ----------------------------------------------------------------------------------------


# Onde salva o arquivo .desktop



variavel14_1="$HOME/.local/share/applications!/usr/share/applications!$HOME/.config/autostart!/etc/xdg/autostart"


# Use o comando sort para colocar em ordem

# Ordem decrescente => sort -nr

variavel14_1=$(echo "$variavel14_1" | tr '!' '\n'  )
variavel14_1=$(echo "$variavel14_1" | tr '\n' '!' |sort -nr)


# ----------------------------------------------------------------------------------------


opcao=$(yad \
--center \
--image="/usr/share/icons/extras/atalhos1.png" \
--title="$titulo" \
--text="$texto" \
--form  \
--item-separator="!" \
--field="$variavel1:CB" \
--field="$variavel2" \
--field="$variavel3" \
--field="$variavel4" \
--field="$variavel5" \
--field="$variavel6" \
--field="$variavel7" \
--field="$variavel8:FL" \
--field "$variavel9:CHK" \
--field="$variavel10:CHK" \
--field="$variavel11:CB"  \
--field="$variavel12"  \
--field="$variavel13"  \
--field="$variavel14:CB"  \
"$variavel1_1" "$variavel2_1" "$variavel3_1" "$variavel4_1" "$variavel5_1" "$variavel6_1" "$variavel7_1" $variavel8_1 false true $variavel11_1  $variavel12_1 "$variavel13_1"  "$variavel14_1"  \
--button="$botao_ajuda:2" \
--button="$botao_sobre:3" \
--button="$botao_ok:0" \
--button="$botao_cancelar:1" \
--width 900 --height 400 \
2>/dev/null)



# | sed 's/|$//'


    


# Variaveis: "variavel7" e "variavel7_1"


# Atalho para site:

# Exec=xdg-open ""


# Atalho para programa:

# Exec=xfce4-terminal --title="Informe a senha do usuário Root abaixo..." -e 'su -c " "'





# ----------------------------------------------------------------------------------------


# echo $?




case "$?" in

    0) # Gerar arquivo .desktop


# echo "$opcao"



# Application

variavel1_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $1 }')

# Versão

variavel2_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $2 }')

# Nome

variavel3_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $3 }')

# Nome genérico

variavel4_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $4 }')

# Comente

variavel5_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $5 }')

# Caminho - Path

variavel6_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $6 }')

# Comando - Exec

variavel7_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $7 }')

# Ícone - Icon

variavel8_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $8 }')

# Terminal

variavel9_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $9 }')


variavel10_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $10 }')


# Categoria - Categories

variavel11_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $11 }')


# Palavras chave - Keywords

variavel12_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $12 }')


# MimeType

variavel13_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $13 }')


# Onde salva o arquivo .desktop

variavel14_1=$(echo "$opcao" | awk 'BEGIN {FS="|" } { print $14 }')


# ----------------------------------------------------------------------------------------


# Verificar se as variaveis são nulas


test -n "$variavel11_1" || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "$aviso" --text "$tipo_de_categoria $variavel3_1" --width 600 --height 100 2>/dev/null   ; exit ; }


test -n "$variavel14_1" || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "$aviso" --text "$caminho_atalho $variavel3_1" --width 600 --height 100 2>/dev/null   ; exit ; }
 

# ----------------------------------------------------------------------------------------  
               
# Verificar se o diretório/arquivo existe e o usuário tem acesso de gravação.


ls "$variavel14_1"  2>/dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "$aviso" --text "$localizar_pasta $variavel14_1" --width 600 --height 100 2>/dev/null   ; exit ; }



test -w "$variavel14_1" || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "$aviso" --text "$permissoes_pasta $variavel14_1" --width 600 --height 100 2>/dev/null   ; exit ; }



# ----------------------------------------------------------------------------------------

rm -Rf /tmp/atalho.log


# Verificar se na pasta $variavel14_1 já tem arquivo .desktop com esse comando $variavel7_1

grep -R "$variavel7_1" "$variavel14_1"  > /tmp/atalho.log



grep -R "$variavel7_1" "$variavel14_1"


if [ $? = 0 ]; then

yad --center \
--image=dialog-error \
--timeout=30 \
--no-buttons \
--title "Aviso" \
--text "
Na pasta $variavel14_1 já existe um atalho com esse comando:

$variavel7_1

Arquivos:

$(cat /tmp/atalho.log)

" --width 1300 --height 400 2>/dev/null   ; exit ;

	
fi

rm -Rf /tmp/atalho.log

# ----------------------------------------------------------------------------------------



if [ "$LANG" = "pt_BR.UTF-8" ]; then

comentario_pt_BR="$variavel5_1"
name_pt_BR="$variavel3_1"

fi


if [ "$LANG" = "en_US.utf8" ]; then

comentario_en_US="$variavel5_1"
name_en_GB="$variavel3_1"

fi


# ----------------------------------------------------------------------------------------

rm -Rf "$variavel14_1"/"$variavel3_1".desktop


# ----------------------------------------------------------------------------------------

echo '[Desktop Entry]
# 
# 
# Entrada de aplicativos
# 
# As entradas de desktop para aplicativos, ou arquivos .desktop, geralmente são uma combinação de 
# recursos de meta informações e um atalho de um aplicativo. Esses arquivos geralmente residem em 
# /usr/share/applications/ ou /usr/local/share/applications/ para aplicativos instalados em todo 
# o sistema ou ~/.local/share/applications/ para aplicativos específicos do usuário. As entradas 
# do usuário têm precedência sobre as entradas do sistema.
# 
# 
# Exemplo de arquivo
# 
# A seguir, é apresentado um exemplo de sua estrutura com comentários adicionais. O exemplo serve 
# apenas para dar uma impressão rápida e não mostra como utilizar todas as chaves de entrada 
# possíveis. A lista completa de chaves pode ser encontrada na especificação da freedesktop. 
# 
# 
#
#
# Localização padrão dos diretórios:
#
# Diretório de aplicativos padrão para os aplicativos do sistema:
#
#  /usr/share/applications
#
# Diretório dos aplicativos do usuário:
#
# $HOME/.local/share/applications
#
#
# 
# 
# Atualizar banco de dados de entradas desktop
# 
# Para que as entradas da área de trabalho definidas em ~/.local/share/applications funcionem, execute o seguinte comando:
# 
# $ update-desktop-database ~/.local/share/applications
# 
# 
# https://wiki.archlinux.org/title/Desktop_entries_(Portugu%C3%AAs)
# https://diolinux.com.br/tecnologia/como-editar-o-menu-da-sua-distro.html
#


# Confira algumas das opções e uma breve explicação sobre os parâmetros do arquivo .desktop:


# O tipo como listado acima
Type='$variavel1_1'

# A versão da especificação de entrada de desktop com a qual este arquivo está em conformidade
Version='$variavel2_1'

# Nome da aplicação.
Name='$variavel3_1'
Name[am]=
Name[ar]=
Name[bg]=
Name[bn]=
Name[ca]=
Name[cs]=
Name[da]=
Name[de]=
Name[el]=
Name[en_GB]='$name_en_GB'
Name[es]=
Name[et]=
Name[fa]=
Name[fi]=
Name[fil]=
Name[fr]=
Name[gu]=
Name[hi]=
Name[hr]=
Name[hu]=
Name[id]=
Name[it]=
Name[iw]=
Name[ja]=
Name[kn]=
Name[ko]=
Name[lt]=
Name[lv]=
Name[ml]=
Name[mr]=
Name[nl]=
Name[no]=
Name[pl]=
Name[pt]=
Name[pt_BR]='$name_pt_BR'
Name[ro]=
Name[ru]=
Name[sk]=
Name[sl]=
Name[sr]=
Name[sv]=
Name[sw]=
Name[ta]=
Name[te]=
Name[th]=
Name[tr]=
Name[uk]=
Name[vi]=
Name[zh_CN]=
Name[zh_TW]=


GenericName='$variavel4_1'
GenericName[ar]=
GenericName[bg]=
GenericName[ca]=
GenericName[cs]=
GenericName[da]=
GenericName[de]=
GenericName[el]=
GenericName[en_GB]=
GenericName[es]=
GenericName[et]=
GenericName[fi]=
GenericName[fr]=
GenericName[gu]=
GenericName[he]=
GenericName[hi]=
GenericName[hu]=
GenericName[it]=
GenericName[ja]=
GenericName[kn]=
GenericName[ko]=
GenericName[lt]=
GenericName[lv]=
GenericName[ml]=
GenericName[mr]=
GenericName[nb]=
GenericName[nl]=
GenericName[pl]=
GenericName[pt]=
GenericName[pt_BR]=
GenericName[ro]=
GenericName[ru]=
GenericName[sl]=
GenericName[sv]=
GenericName[ta]=
GenericName[th]=
GenericName[tr]=
GenericName[uk]=
GenericName[zh_CN]=
GenericName[zh_HK]=
GenericName[zh_TW]=
GenericName[bn]=
GenericName[fil]=
GenericName[hr]=
GenericName[id]=
GenericName[or]=
GenericName[sk]=
GenericName[sr]=
GenericName[te]=
GenericName[vi]=


# Um comentário que pode/será usado como uma dica da ferramenta / Descrição da aplicação.
Comment='$variavel5_1'
Comment[ar]=
Comment[bg]=
Comment[bn]=
Comment[ca]=
Comment[cs]=
Comment[da]=
Comment[de]=
Comment[el]=
Comment[en_GB]='$comentario_en_US'
Comment[es]=
Comment[et]=
Comment[fi]=
Comment[fil]=
Comment[fr]=
Comment[gu]=
Comment[he]=
Comment[hi]=
Comment[hr]=
Comment[hu]=
Comment[id]=
Comment[it]=
Comment[ja]=
Comment[kn]=
Comment[ko]=
Comment[lt]=
Comment[lv]=
Comment[ml]=
Comment[mr]=
Comment[nb]=
Comment[nl]=
Comment[or]=
Comment[pl]=
Comment[pt]=
Comment[pt_BR]='$comentario_pt_BR'
Comment[ro]=
Comment[ru]=
Comment[sk]=
Comment[sl]=
Comment[sr]=
Comment[sv]=
Comment[ta]=
Comment[te]=
Comment[th]=
Comment[tr]=
Comment[uk]=
Comment[vi]=
Comment[zh_CN]=
Comment[zh_HK]=
Comment[zh_TW]=


# O caminho para a pasta na qual o executável é executado
Path='$variavel6_1' 

# O executável do aplicativo, possivelmente com argumentos / Diretório do arquivo executável. / link do site
Exec='$variavel7_1'

# O nome do ícone que será usado para exibir esta entrada
Icon='$variavel8_1'


# Descreve se este aplicativo precisa ser executado em um terminal ou não
Terminal='$variavel9_1'

# Notificação de inicialização
StartupNotify='$variavel10_1'


# Descreve as categorias nas quais esta entrada deve ser mostrada
Categories='$variavel11_1';


# Palavras-chave para encontrar a aplicação. Deve  ser separada por ;

Keywords='$variavel12_1';
# Keywords[pt]=;
# Keywords[pt_BR]=;

# Funcionou no  menu do xfce4-popup-whiskermenu do XFCE


# NoDisplay: Não exibe a aplicação.


# Nos casos dos parâmetros Terminal e NoDisplay, podem ser usados dois valores, true para ativar o recurso e false para desativar o recurso.


# MimeType='$variavel13_1';



' > "$variavel14_1"/"$variavel3_1".desktop



# ----------------------------------------------------------------------------------------

# Onde salva o arquivo .desktop?

# Opção usada se o usuário escolhe as pastas: $HOME/.config/autostart ou /etc/xdg/autostart


# Lembrando que os colchetes '[[' e ']]' testam strings.


if [[ "$variavel14_1" == "$HOME/.config/autostart" ]]; then

echo "
# Inicialização do programa na pasta $HOME/.config/autostart

X-GNOME-Autostart-enabled=true

" >> "$variavel14_1"/"$variavel3_1".desktop


fi



if [[ "$variavel14_1" == "/etc/xdg/autostart" ]]; then

echo "
# Inicialização do programa na pasta /etc/xdg/autostart/

X-GNOME-Autostart-enabled=true

"  >> "$variavel14_1"/"$variavel3_1".desktop


fi

# ----------------------------------------------------------------------------------------


# Não tem necessidade de usar
#
# chmod  +x "$variavel14_1"/"$variavel3_1".desktop


# Antes
#
# ls -l  Nome.desktop 
# -rw-r--r-- 1 fernando fernando 5023 out  3 17:06 Nome.desktop


# ....


# Depois
#
# ls -l  Nome.desktop 
# -rwxr-xr-x 1 fernando fernando 5023 out  3 17:07 Nome.desktop



# Permitir que este arquivo seja executado como um arquivo .desktop

chmod 755  "$variavel14_1"/"$variavel3_1".desktop

# -rwxr-xr-x


# Definir este arquivo como confiável




# if [ -x /usr/bin/update-desktop-database ]; then
#  /usr/bin/update-desktop-database -q usr/share/applications
# fi


# if [ -x /usr/bin/update-mime-database ]; then
#  /usr/bin/update-mime-database usr/share/mime >/dev/null 2>&1
# fi


# ----------------------------------------------------------------------------------------

notify-send \
-i gtk-dialog-info  \
-t 200000 "$titulo..." "

Arquivo criado em:

"$variavel14_1"/"$variavel3_1".desktop

"

# ----------------------------------------------------------------------------------------

        ;;
 
 
     1) 
        # Sair
     
        # exit
        
        
        # Abandone o loop while.
        
        break
        
        ;;
 
 
     2) # Ajuda
     
        yad \
        --center \
        --image=dialog-information \
        --title "$titulo" \
        --text "$(ajuda)"  \
        --width 600 --height 300 \
        2>/dev/null
        
         
       if [ $? -eq 1 ]; then
  

           # Abandone o loop while.
        
           break

       fi
    
        
        ;;
        
        
                
     3) # Sobre  
         
    yad \
    --center \
    --about \
    --window-icon=gtk-about \
    --image=gtk-preferences \
    --authors="
    Fernando Souza
    Andrew" \
    --license="GPL3" \
    --comments="Criador simples de ícones da área de trabalho." \
    --copyright="
    Copyright (c) 
    01/10/2023 Fernando Souza 
    03/12/2010 Andrew - andrew@webupd8.org" \
    --pversion="$VERSAO" \
    --pname="atalho para Desktop" \
    --button="Fecha!gtk-close":252  \
    2>/dev/null
 
 
    if [ $? -eq 252 ]; then
  

        # Abandone o loop while.
        
        break

    fi
    
    
            
        ;;
         
    * )
        echo "Opção inválida, use $(basename $0)"
       
        # Abandone o loop while.
        
        break
        
         
        ;;
esac


# Zera as variaveis:

variavel3_1=" " 
variavel4_1=" " 
variavel5_1=" " 
variavel6_1=" " 



# Fim do loop while

done




exit 0

