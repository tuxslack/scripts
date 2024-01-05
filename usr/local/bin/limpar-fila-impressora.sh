#!/bin/bash
#
# Autor:           Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:            30/12/2023
# Atualização em:  https://github.com/tuxslack/scripts   | https://notabug.org/
# Script:          limpar-fila-impressora.sh
# Versão:          0.1
# Limpar a fila de impressão.
#
# Data da atualização: 
#
# Licença:  GPL - https://www.gnu.org/



# Ociosa - "Não foi possível cancelar trabalho de impressão."



# https://h30487.www3.hp.com/t5/Dicas-dos-Experts-para-Impressoras/Como-limpar-fila-de-impress%C3%A3o-no-Linux-Qualquer-impressora-e/td-p/632706
# https://dfmgoes.wordpress.com/2011/03/07/cups-gerenciamento-de-filas-de-impressao/
# https://tecnoblog.net/responde/como-acessar-limpar-e-excluir-documentos-da-fila-de-impressao/
# https://andrerscnix.wordpress.com/2015/02/19/administrar-fila-de-impressao-no-cups/
# https://www.vivaolinux.com.br/topico/vivaolinux/Cancelar-impressao



clear


# Verificar root


# ----------------------------------------------------------------------------------------


if [ "$(id -u)" != "0" ]; then

        echo -e "${RED}\nVocê deve executar este script como Root! \n ${NC}"
 
sleep 10
       
exit 

else

        echo -e "\n${GREEN}Verificação de Root [OK] ${NC}\n"

fi



# ----------------------------------------------------------------------------------------






echo "
Serve para mostrar os trabalhos em todas as filas de impressão do sistema.
"

# Mostra os trabalhos em todas as filas do sistema

lpq -a


echo "
Limpando a fila de impressão do CUPS
"

# Cancelar todos os trabalhos

lprm -

# cancel




# Impressoras instaladas

lprm -P Epson_L3250_Wifi -

lprm -P Epson_L3250_Series -

lprm -P Canon-iP1800-series -


# lprm -P Epson_L3250_Series
# lprm: Nenhum trabalho ativo em Epson_L3250_Series

# lprm -P Epson_L3250_Wifi
# lprm: Nenhum trabalho ativo em EPSON_L3250_Wifi




# Mostra os trabalhos em todas as filas do sistema

lpq -a


# lpq -a
# Ordem   Dono    Trab    Arquivo(s)                      Tamanho total
# 1st     root    162     Test Page                       1024 bytes
# 2nd     root    163     Test Page                       1024 bytes
# 3rd     root    165     Test Page                       1024 bytes


# lpq -a
# nenhum registro


sleep 10

exit 0


