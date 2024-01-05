#!/bin/bash
#
# Autor:           Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:            05/01/2024 as 02:27
# Atualização em:  https://github.com/tuxslack/scripts   | https://notabug.org/
#
# Colaboração: Bruno Morato <brunobarberis@outlook.com> -  13/01/2022
#
# Script:          definir-a4-no-libreoffice.sh
# Versão:          0.1
# Defini padrão de folha para A4 no LibreOffice.
#
# Data da atualização:  
#
# Licença:  GPL - https://www.gnu.org/
# 
#
# Requer: paperconf e LibreOffice



# https://www.vivaolinux.com.br/dicas/impressora.php?codigo=25134



# Definindo padrão de folha para A4 no Void Linux - LibreOffice
#
# O padrão carta (letter) é mais usado nos EUA/Canadá do que no resto do mundo e no 
# Void Linux ele vem configurado para usar o padrão carta (letter), logo pode ser uma 
# baita dor de cabeça ter que ficar mudando isso toda vez dentro do LibreOffice.



# Cores para formatação da saída dos comandos

RED='\e[1;31m'
GREEN='\e[1;32m'
YELLOW='\e[1;33m'
NC='\e[0m' # sem cor


OK="Padrão de folha A4 já Definido."

acao="Definindo padrão de folha para A4 no Void Linux para o LibreOffice."


clear



# ----------------------------------------------------------------------------------------

# Verificar Root


if [ "$(id -u)" != "0" ]; then

        echo -e "${RED}\nVocê deve executar este script como Root! \n ${NC}"
        
exit 1 

else

        echo -e "\n${GREEN}Verificação de Root [OK] ${NC}\n"

fi

# ----------------------------------------------------------------------------------------




which paperconf 1> /dev/null 2> /dev/null || { echo "Programa paperconf não esta instalado."      ; exit 2 ; }


# Edite o arquivo: /etc/papersize

# Coloque: a4




# Verificar se o arquivo existe

if [ -e "/etc/papersize" ] ; then


      echo "O arquivo /etc/papersize existe."
  
else

      echo "O arquivo /etc/papersize não existe."
      
      exit 3

fi




    

cat /etc/papersize | grep a4 1> /dev/null

if [ "$?" -eq "0" ];
then 

      echo -e "\n${GREEN}${OK} ${NC}\n"

      exit 4


else 

      echo -e "\n${RED}${acao} ${NC}\n"


echo "
Antes:
"
cat /etc/papersize

echo "
# Defini o padrão de folha para A4 no Void Linux para o LibreOffice

a4
" >> /etc/papersize


echo "
Depois:
"
cat /etc/papersize


echo "

==========================================================================================

"

# Pronto! Rode o comando:

paperconf

# E ele vai retornar que agora se encontra definido como "a4". 

fi


exit 0


