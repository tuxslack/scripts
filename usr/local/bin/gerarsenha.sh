#!/bin/bash
#
# ----------------------------------------------------------------------------
#
# Autor:       Marcos Oliveira, http://terminalroot.com.br
# Data:        16/02/2013 as 23:05:55 
# Colaboração: Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Homepage:    https://github.com/tuxslack/scripts
# Nome:        gerarsenha.sh
# Função:      Gera senhas alfanuméricas com Shell Scripiting
# Versão:      1.1
# Licença:     GPL
#
# https://terminalroot.com.br/2013/02/funcao-para-gerar-senhas-alfanumericas.html
#
# ----------------------------------------------------------------------------
#
# 17/02/2013 
#
# Função para gerar senhas alfanuméricas com Shell Script
#
# Tentei escrever o código da forma mais simples, eficaz e econômica para fazer esse script, 
# para entender cada linha/comando é só ler os próprios comentários do código.
#
# ----------------------------------------------------------------------------


# 06/10/2023 as 02:23 - Fernando Souza - Adicionado caracteres especias na senha atraves 
#                       da variavel $caracteres_especias.


# ----------------------------------------------------------------------------



gerarsenha(){

cd ~/

 # Definimos as variaveis que gerarão a senha
 
 letras='abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ' # Todas as letras minúsculas e Maiúsculas
 
 
 numeros='0123456789' # Todos os números
 
 caracteres_especias='!@#.?'
 
 
 lista="$letras$numeros$caracteres_especias" # Juntamos todas as letras mM e todos os números
 
 
 # Numero de caracteres da senha
 
 max=10
 
 
 # Conta o número de caracteres da string lista
 
 tamanho=${#lista}
 
 
echo "
Sua senha de $max caracteres é:
"
 
 # Criamos um loop do zero ao max
 
 for ((i = 0; i < $max; i++ ))
  do
  
   # Colocamos o +1 para ser diferente de zero, para usar cut tem de ser no mínimo 1
   
   ordem=$((RANDOM % $tamanho + 1))
   
   
   # Acumulamos o caracter randomico escolhido pelo cut na variável senha
   
   senha=$(echo $lista | cut -c "$ordem")
   
   
   # Imprimimos a variavel senha 10 vezes(max) na mesma linha -n
   
   echo -n $senha
   
  done
  
  
 # Pulamos uma linha final
 
 echo


 
}



clear


# Chamamos a função

gerarsenha



echo "


Enter para sair...
"
read pausa

clear


exit 0

