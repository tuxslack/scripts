#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     05/10/2023 as 12:04
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
#
# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml
#
#
#
# Anti-vírus online
#
# Quer verificar um arquivo antes de enviar para um amigo ou disponiobilizar na internet? Não confia só no seu anti-vírus? 
# Utilize o site Virus Total e faça uma varredura grátis usando mais de 40 ferramentas de detecção atualizadas a cada minuto. 
#
#
# Existe a ferramenta do ClamAV, uma linha de comando "sigtool" usada para adicionar novas assinaturas de malware na assinatura do mesmo?
#
#
# ferramenta **sigtool** do ClamAV. Esta ferramenta é usada principalmente para testes manuais de detecção de malware e debug. Ela pode 
# converter assinaturas de base de dados para um formato legível e vice-versa, extrair partes das assinaturas e criar arquivos CVD.
#
# Para usar a ferramenta sigtool, você precisa ter o ClamAV instalado em seu sistema.
#
#
# Depois de instalar o ClamAV, a sigtool estará disponível para uso.
#
# sigtool
#
#
#
# Crie suas próprias assinaturas
#
# Existe toda uma comunidade de pesquisadores de malware e criadores de assinaturas. Se você gostaria de aprender a criar suas próprias assinaturas , você pode!
#
#
# ClamAV e Malwarebytes, apesar de ambos serem antivírus, têm bancos de dados de vírus diferentes. Isso significa que cada um pode detectar vírus que o outro não consegue.
#
# Por último, é importante ressaltar: caso você suspeite que algum arquivo esteja infectado, mesmo após uma verificação com ClamAV, é sempre uma boa 
# prática deletar ou isolar este arquivo até que ele seja verificado de maneira mais completa.
#
# 
# Isso pode ser muito útil ao escrever uma assinatura ou tentar obter informações 
# sobre uma assinatura que pode estar causando FPs ou problemas de desempenho.
# 
# 
# Os sinalizadores sigtool a seguir podem ser especialmente úteis para a gravação de assinaturas:
# 
#      --md5 / --sha1 / --sha256: gera o hash MD5/SHA1/SHA256 e calcula o tamanho do arquivo, gerando ambos como uma assinatura .hdb/.hsb formatada corretamente
# 
#      --mdb: Gera hashes de seção do arquivo especificado. Isso é útil ao gerar assinaturas .mdb.
# 
#      --decode: Dada uma assinatura ClamAV de STDIN, mostra uma representação mais amigável dela. Um exemplo de uso desse sinalizador é cat test.ldb | sigtool --decode.
# 
#      --hex-dump: Dada uma sequência de bytes de STDIN, imprima o equivalente hexadecimal. Um exemplo de uso desse sinalizador é echo -n "Match on this" | sigtool --hex-dump.
# 
#      --html-normalise: normaliza o arquivo HTML especificado da maneira que o clamscan fará antes de procurar correspondências de regras. Gravar assinaturas 
#        desses arquivos torna mais fácil escrever regras para HTML de tipo de destino (você saberá o que esperar de espaço em branco, letras maiúsculas, etc.). 
#        Consulte a seção HTML para obter mais detalhes.
# 
#      --ascii-normalise: normaliza o arquivo de texto ASCII especificado da maneira que o clamscan fará antes de procurar correspondências de regras. Escrever 
#        assinaturas a partir desses dados de arquivo normalizados torna mais fácil escrever regras para o tipo de destino Txt (você saberá qual espaço em branco, 
#        letras maiúsculas, etc. esperar). Consulte a seção Arquivos de texto para obter mais detalhes.
# 
#      --print-certs: Imprime as assinaturas Authenticode de quaisquer arquivos PE especificados. Isso é útil ao gravar arquivos de regra .crb baseados em assinatura.
# 
#      --vba: Extrai o código de macro VBA/Word6
# 
#     --test-sigs: Dada uma assinatura e uma amostra, determina se a assinatura corresponde e, em caso afirmativo, exibe o deslocamento no arquivo onde ocorreu a 
#       correspondência. Isso pode ser útil para investigar correspondências de falsos positivos em arquivos limpos.
# 
# 
#
# FreshClam
#
# Antes de iniciar o mecanismo de verificação ClamAV (usando clamdou clamscan), você deve primeiro ter o(s) arquivo(s) de banco de dados de vírus ClamAV (.cvd) 
# instalado(s) no local apropriado em seu sistema.
#
# A ferramenta freshclamé usada para baixar e atualizar os bancos de dados oficiais de assinatura de vírus do ClamAV. Embora fácil de usar em sua configuração 
# básica, freshclamrequer um freshclam.confarquivo de configuração de trabalho para ser executado (cuja localização pode ser passada via linha de comando se o 
# local de pesquisa padrão não atender às suas necessidades).
#
# Depois de ter um arquivo de configuração válido, você pode invocar o FreshClam com o seguinte comando:
#
# freshclam
#
#
#
# 
# O MD5 é um algoritmo de hash, e qualquer pequena modificação no arquivo original resulta em uma alteração drástica no hash gerado. Isso significa 
# que, mesmo que o código original e o modificado façam exatamente a mesma coisa, se houve qualquer mudança, ainda que mínima, o hash MD5 será 
# diferente e isso fará com que o malware não seja detectado se o detector de malwares estiver baseado apenas na comparação da assinatura (hash 
# MD5, SHA256, etc.) do arquivo.
# 
# É importante ressaltar que essa é uma das limitações de se usar uma abordagem baseada em assinatura para detecção de malwares. É por isso que a 
# detecção baseada em comportamento também é frequentemente utilizada, neste caso até um if vazio ou uma alteração no parâmetro de otimização seria 
# considerado na analise, mesmo que o hash MD5 seja o mesmo. Ao apontar para fatores como ações suspeitas durante a execução, tentativas de fraude 
# ou alterações incomuns no sistema, a detecção fica mais refinada e com menor chance de permitir a passagem de ameaças.
# 
# Isso sendo dito, a segurança é um processo contínuo que sempre precisa de acompanhamento, atualização de pacotes,
# 
# 
# Além do hash, uma assinatura de malware pode conter parâmetros sobre o comportamento do malware.
# 
# Uma assinatura de malware é essencialmente um padrão que pode ser usado para detectar uma instância específica de malware. O hash é apenas uma parte 
# dessa assinatura - ele é usado para identificar unicamente um arquivo específico e é geralmente o elemento principal e mais direto de detecção. No 
# entanto, uma assinatura também pode conter informações sobre as ações que o malware realiza (por exemplo, quais arquivos cria, que processos inicia, 
# etc) e como ele se comporta (por exemplo, como se propaga, se e como evita a detecção).
# 
# Isso porque malware não é algo estático - ele pode mudar e evoluir, seja através de atualizações feitas por seu criador, ou através de mecanismos de 
# auto-modificação. Para lidar com isso, sistemas de detecção de malware precisam ser capazes de detectar não apenas um arquivo específico, mas qualquer 
# arquivo que se comporte como o malware que estão tentando detectar. Portanto, eles precisam ser capazes de analisar e entender o comportamento do arquivo, 
# não apenas o seu conteúdo. Isso é chamado de detecção por comportamento ou detecção heurística
# 
# 
# https://docs.clamav.net/manual/Usage/SignatureManagement.html
# https://docs.clamav.net/manual/Signatures.html
# https://www.vivaolinux.com.br/dica/Retornar-o-tamanho-de-arquivo-ou-diretorio-em-bytes-(KB-MB)
# https://www.vivaolinux.com.br/comunidade/yad
# https://stackoverflow.com/questions/44251787/how-to-use-yad-in-bash-scripting
# https://www.vivaolinux.com.br/topico/yad/Escolher-radiobutton-e-executar-acao/
# https://www.vivaolinux.com.br/topico/yad/Duvida-no-YAD/
# https://askubuntu.com/questions/1285252/how-to-execute-a-command-when-selecting-an-option-and-pressing-ok-button-in-ya
# https://www.datafix.com.au/BASHing/2019-11-29.html
# https://sourceforge.net/p/yad-dialog/tickets/150/
# https://pclosmag.com/html/Issues/201508/page06.html
# https://github.com/v1cont/yad/issues/107
# https://groups.google.com/g/yad-common/c/5idEkOHdVrs?pli=1
# https://acervolima.com/como-criar-um-arquivo-no-linux-usando-o-terminal/
# https://www.mankier.com/1/yad
# https://alvosec.com/create-custom-signatures-for-clamav/
# https://www.youtube.com/watch?v=T6iILXOfHo4
# https://www.youtube.com/watch?v=juxpnFdF6ZU
# https://www.baboo.com.br/windows-10/dicas-tutoriais-windows/como-remover-manualmente-um-programa/2/#split_content
# https://www.youtube.com/watch?v=cDG83v5lOyk
# https://www.youtube.com/watch?v=kvg2-HI1gew
# https://www.briancarr.org/post/clamav



# Identificação do tipo de ameaça

# Utilizaremos o VirusTotal na tentativa de identificação do tipo da ameaça. O VirusTotal é uma 
# ferramenta que inspeciona o arquivo submetido com múltiplos motores de análise de malware ou 
# engines de anti-vírus de diferentes fabricantes. Caso o item submetido seja uma URL ou domínio 
# de internet, a ferramenta buscará pelo item em blocklists. Cada engine analisará o artefato e, 
# caso o identifique como malicioso, indicará um rótulo para a ameaça detectada (ex:Trojan.BitCoinMiner). 
# Além dos rótulos, o VirusTotal poderá oferecer análises adicionais com base na execução do artefato 
# em sandboxes.
#
# Em ’BEHAVIOR’, teremos acesso aos resultados da execução do binário em uma ou mais sandboxes.


# O Sigtool é uma ferramenta de linha de comando que faz parte do ClamAV (um antivírus de código aberto) 
# e serve para manipular vários tipos de arquivos de assinatura de vírus.
#
# Já o www.virustotal.com é um serviço online gratuito que analisa arquivos e URLs suspeitos e facilita a 
# detecção rápida de vírus, worms, trojans e todos os tipos de malware.
#
# Para utilizar o Sigtool com o Virustotal, seguem os passos:
#
#
# Acesse o site www.virustotal.com e suba o arquivo que você deseja checar. O site vai gerar um hash para esse arquivo.
#
# Depois, com o hash em mãos, você poderá usar o Sigtool para criar uma assinatura de malware para esse arquivo, da seguinte forma:
#
# sigtool --sha256 [hash-arquivo] > [nome-arquivo.cvd]
#
# Isso gerará um arquivo de definição de vírus (.cvd), que você pode usar para verificar se outros arquivos correspondem.

# sigtool -h

# Tem como converter a base de dados do Virustotal em um arquivo .cvd?


# A resposta rápida é: infelizmente, não diretamente. O formato .cvd é um tipo de arquivo de definição de vírus usado 
# pelo ClamAV e é basicamente um arquivo zip contendo diversos arquivos com diferentes formatos.

# Se você quiser usar os dados do VirusTotal em um formato .cvd, você precisaria de algum meio de converter os dados 
# para o formato que o ClamAV pode entender.

# No entanto, é importante notar que a licença do VirusTotal não permite esse tipo de uso. O uso dos dados do VirusTotal é 
# limitado à análise e investigação de ameaças cibernéticas e não deve ser usado para gerar novas assinaturas de vírus. 
# Transferrir esses dados para um arquivo .cvd funcionaria efetivamente como a criação de novas assinaturas de vírus, o 
# que é proibido pela licença.

# Por último, vale ressaltar que a eficácia deste método seria limitada, pois os dados do VirusTotal são agregados de muitos 
# fornecedores de antivírus diferentes, cada qual com seu próprio método de detecção. Além disso, muitos vírus modernos são 
# polimórficos ou metamórficos, o que significa que podem alterar sua forma para escapar da detecção, então a conversão 
# desses dados.



# https://github.com/VirusTotal
# https://sol.sbc.org.br/livros/index.php/sbc/catalog/download/107/479/752-1?inline=1
# https://www.edivaldobrito.com.br/clamav-1-1-lancado-com-varias-melhorias-e-correcoes-de-bugs/
# https://ubuntuforum-br.org/index.php?topic=118666.0
# https://6sense.com/tech/antivirus/virustotal-vs-clamav
# https://www.tecmundo.com.br/antivirus/11062-como-funciona-um-antivirus.htm
# https://www.e-trust.com.br/cyberseguranca-por-onde-comecar-2/
# https://www.youtube.com/watch?v=tBrekyob68A




# HouseCall - Varredura de vírus online gratuita - Trend Micro
#
# https://www.trendmicro.com/pt_br/forHome/products/housecall.html


# Vírus que se aloja no navegador.
# Ransomware
# Spyware
# Keylogger
# TROJANS
# Malwares
# Backdoor
# Adwares
# PUP
# Bloatware




# Situações:
#
# Arquivo host do Windows alterado
#
# Alterações no arquivo host do Windows, para bloquear alguns sites. Após eu fazer isso, o Kaspersky detectou como um Trojan! 
# Será que é um falso positivo? Ele restaurou tudo para o padrão, aparentemente no arquivo está OK porque só consta os 
# links bloqueados ali - e nada de estranho.
#
# Sim, isso é possível pois alguns malwares alteram o hosts para evitar que o PC acesse sites de antivírus.. 
#
#
# Eu tive que baixar alguns drivers de sites que não são da fabricante porque simplesmente não tinha nos sites oficiais. São 
# drivers para um netbook de 2013, talvez esse seja o motivo pelo qual eu não encontrei no site da fabricante. Fiquei com 
# um pouco de receio de fazer isso.
#
#
# Consigo remover vírus de ativadores do Windows e restabelecer os arquivos originais?
#
# Não
#
#
# Vou formatar o pc, mas vou fazer um backup para um hd externo há como os virus passarem de volta depois que formatar novamente?
#
#
# Essas varreduras devem ser feitas INDEPENDENTEMENTE do antivírus que vc utiliza..
#
# Formatei meu notebook depois de uma infecção que não consegui limpar. Formatei do zero.
#
# Utilize a Limpeza de Disco para remover a pasta Windows.old.
#
# Windows em Modo de Segurança não carrega diversos drivers e processos, e isso pode facilitar a remoção de malwares se esses arquivos 
# estiverem infectados. Sobre o uso da conta de usuário comum, isso é importante.
#
#
# Avast deixa o Windows lento.


# TELA PRETA DA MORTE DO WINDOWS 11 COM VÍRUS MONOXIDE64.exe - RATÃO VIRAL

# https://www.youtube.com/watch?v=zNJA81aj7VY


# O Sigtool pode gera uma assinatura somente a gente fornecendo o sha256 do arquivo ou é necessário ter o arquivo para ele gera?
#
#
# O sigtool é uma ferramenta que faz parte do pacote do ClamAV, que é um scanner de código aberto, versátil e poderoso para Linux.
#
# Para criar uma assinatura, você precisa ter o arquivo malicioso em mãos. Infelizmente, apenas fornecer o hash sha256 não é suficiente. 
# A assinatura é criada a partir do conteúdo real do arquivo, não apenas do seu hash.
#
# Então, você precisará do arquivo completo para criar a assinatura usando o sigtool. Aqui está um exemplo de como usar o sigtool:
#
# sigtool --sha256 /path/do/arquivo


#  trojan-leaks
#
# https://github.com/pankoza2-pl/trojan-leaks


# https://github.com/topics/malware


# sigtool em si não suporta análise heurística. Isso é algo implementado no nível do motor de scanner do ClamAV, e não na ferramenta de criação de assinatura. 



# Fangfrisch
#
# Parece que o projeto "clamav-unofficial-sigs" não é mais mantido.
#
# https://github.com/extremeshok/clamav-unofficial-sigs/tree/master/config/os
#
#
# Sugiro usa o Fangfrisch
#
# https://github.com/rseichter/fangfrisch


# Sites de repositorio de virus:

# https://www.baixaki.com.br/


# ========================================================================================


# Diretório de banco de dados do Clamav

banco_de_dados_clamav=$(cat /etc/freshclam.conf | grep "DatabaseDirectory" | cut -d" " -f2)


# Meu diretório de banco de dados do Clamav

banco_de_dados_de_terceiro="$HOME/clamav_DB"


# ========================================================================================



# Verificar se os programas estão instalados

clear



which yad                     2> /dev/null || { echo "Programa Yad não esta instalado."      ; exit ; }


which sigtool                 2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa sigtool não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which clamscan                2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa clamscan não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which notify-send             2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa notify-send não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which xfce4-terminal          2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa xfce4-terminal não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which tee                     2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa tee não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which touch                   2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa touch não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }

which grep                    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa grep não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; }


# ========================================================================================



yad \
--center \
--title="Clamav" \
--width=800 --height=600 \
--text='Escanear vírus conhecidos

A base gerada aqui é para vírus conhecidos com base em seu hash

* Comportamento dos arquivos

O processo chamado de análise heurística monitora constantemente as atividades do computador e entra em ação
quando algum programa tenta modificar configurações do sistema ou arquivos importantes.

Pelo fato de vírus inéditos surgirem todos os dias, a biblioteca pode deixar alguma ameaça passar batida pela
segurança inicial. Com a análise heurística, esse invasor pode ser descoberto enquanto age silenciosamente.

Os chamados "falsos positivos" ocorrem quando o código de um arquivo não comprometedor 
é identificado, erroneamente, com a mesma sequência de um vírus.

Antes mesmo de escolher um antivírus, avalie seus hábitos de navegação e uso do 
micro. Arquivos de suma importância devem ser sempre copiados em backups, enquanto 
ações duvidosas devem ser evitadas (como abrir emails de desconhecidos ou clicar 
em banners que prometem absurdos).

Mantenha sempre um antivírus atualizado.
' \
--on-top \
--image=gtk-dialog-question \
--window-icon=$ICON \
2> /dev/null




# Verificar se o diretório "$banco_de_dados_de_terceiro" realmente existe.

if [ ! -d "$banco_de_dados_de_terceiro" ]; then

echo "
Criando a pasta $banco_de_dados_de_terceiro
"

mkdir -p $banco_de_dados_de_terceiro


fi



yad \
--center \
--title="Clamav" \
--width=800 \
--text="
Na proxima tela seleciona uma base de dado para o Clamav que sera util para criar uma assinatura ou \n
posteriomente realizar uma varredura no HD por virus." \
--on-top \
--image=gtk-dialog-question \
--window-icon=$ICON \
--timeout=50 \
--no-buttons 2> /dev/null



# base_de_dados=$(yad \
# --width 100 --height 100 \
# --title "Clamav" \
# --text "" \
# --button="Malwarebytes:2" \
# --button="Panda-Security:3" \
# --button=":4" \
# --button=":5" \
# --button=":6" \
# --button=":7" \
# --button=":8" \
# --button=":9" \
# --button="Cancelar:1" \
# --on-top \
# --center \
# 2> /dev/null
# )


# base_de_dados=$(yad \
# --button='Sair!application-exit:1' \
# --button='Usar essa base de dados!system-run:0' \
# --button='Abrir!system-run:/bin/sh -c \"xdg-open %2 " ' \
# --list \
# --dclick-action="/bin/sh -c \"printf \%\s'\n' %s >&2\"" \
# --select-action="/bin/sh -c \"printf \%\s'\n' %s >&2\"" \
# --separator='|' \
# --center --width=800 --height=600 \
# --title "Clamav" \
# --column "Antivírus" --column "Descrição" \
# Malwarebytes   "$banco_de_dados_de_terceiro/malwarebytes.hdb" \
# Panda-Security "$banco_de_dados_de_terceiro/PandaSecurity.hdb"
# 2> /dev/null
# )



base_de_dados=$(yad \
--center \
--title "Selecione um tipo de banco de dados para ser usado pelo Clamav" \
--list \
--column='Antivírus' \
--column='Descrição' \
--hide-column=2 \
--hide-column=3 \
'Malwarebytes - O Bope dos Antivírus'          "$banco_de_dados_de_terceiro/malwarebytes.hdb"  \
'Panda Security'                               "$banco_de_dados_de_terceiro/PandaSecurity.hdb" \
'Windows Defender'                             "$banco_de_dados_de_terceiro/WindowsDefender.hdb" \
'Virus Total'                                  "$banco_de_dados_de_terceiro/VirusTotal.hdb" \
'Microsoft Security Essentials'                "$banco_de_dados_de_terceiro/MicrosoftSecurityEssentials.hdb" \
'EICAR - The Anti-Virus test file'             "$banco_de_dados_de_terceiro/EICAR.hdb" \
'Kaspersky/Kaspersky rescue disk'              "$banco_de_dados_de_terceiro/Kaspersky.hdb" \
'AVG'                                          "$banco_de_dados_de_terceiro/AVG.hdb" \
'Avira'                                        "$banco_de_dados_de_terceiro/Avira.hdb" \
'Avast'                                        "$banco_de_dados_de_terceiro/Avast.hdb" \
'McAfee'                                       "$banco_de_dados_de_terceiro/McAfee.hdb" \
'AdwCleaner'                                   "$banco_de_dados_de_terceiro/AdwCleaner.hdb" \
'Spybot-Search e Destroy'                      "$banco_de_dados_de_terceiro/SpybotSearchDestroy.hdb" \
'SUPERAntiSpyware'                             "$banco_de_dados_de_terceiro/SUPERAntiSpyware.hdb" \
'Norton'                                       "$banco_de_dados_de_terceiro/Norton.hdb" \
'BitDefender'                                  "$banco_de_dados_de_terceiro/BitDefender.hdb" \
'ESET NOD32 / Eset Online'                     "$banco_de_dados_de_terceiro/ESETNOD32.hdb" \
'Comodo'                                       "$banco_de_dados_de_terceiro/Comodo.hdb" \
'Dr.Web Anti-virus'                            "$banco_de_dados_de_terceiro/DrWeb.hdb" \
'F-Secure Anti-Virus'                          "$banco_de_dados_de_terceiro/FSecure.hdb" \
'Sophos'                                       "$banco_de_dados_de_terceiro/Sophos.hdb" \
'ZoneAlarm Firewall'                           "$banco_de_dados_de_terceiro/ZoneAlarm.hdb" \
'RootKit Hunter'                               "$banco_de_dados_de_terceiro/RootKitHunter.hdb" \
'TrendMicro HouseCall - pode  demora +12hs'    "$banco_de_dados_de_terceiro/TrendMicroHouseCall.hdb" \
'Zemana AntiMalware'                           "$banco_de_dados_de_terceiro/ZemanaAntiMalware.hdb" \
'Fortinet'                                     "$banco_de_dados_de_terceiro/fortinet.hdb" \
'Google'                                       "$banco_de_dados_de_terceiro/Google.hdb" \
'Lavasoft (Ad-Aware)'                          "$banco_de_dados_de_terceiro/lavasoft.hdb" \
'Snort'                                        "$banco_de_dados_de_terceiro/Snort.cvd" \
'eTrust Antivirus'                             "$banco_de_dados_de_terceiro/eTrust.hdb" \
'SpyHunter'                                    "$banco_de_dados_de_terceiro/SpyHunter.hdb" \
''                                             "" \
''                                             "" \
''                                             "" \
''                                             "" \
''                                             "" \
''                                             "" \
--separator='|' \
--width=800 --height=800  \
2> /dev/null)



if [ "$?" = "0" ] ;
then

clear

echo "Continuar..."


else

clear

echo "Sair..." && exit


fi



base_de_dados=$(echo "$base_de_dados" | cut -d '|' -f2)

clear



# Verificar se o arquivo existe

if [ -e "$base_de_dados" ] ; then

clear

echo "O arquivo $base_de_dados existe."

sleep 2


else

clear

echo "O arquivo $base_de_dados não existe... 

Vou criar agora o arquivo"


sleep 3
clear

touch $base_de_dados


fi



arquivo_suspeito="$1"

log="/tmp/clamav.log"



opcao=$(yad \
--center \
--width=300 --height=100 \
--title "Clamav" \
--image "dialog-question" \
--buttons-layout=center \
--text "O que gostaria de fazer com o Clamav?" \
--button="Gera assinatura para o Clamav":0 \
--button="Verificar por virus":1 \
2> /dev/null)

opcao=$?

if [[ $opcao == 0 ]]; then


# -------------------------------------------------------------------------

echo "
Ver se o arquivo suspeito $arquivo_suspeito já esta na base de dados $base_de_dados
"

assinatura=$(sigtool --sha256 "$arquivo_suspeito")


# Comando grep para filtra dados
#
# Encontre uma Palavra Ignorando Letras Maiúsculas ou Minúsculas
#
# Para isso é necessário adicionar a opção -i.


# O valor não pode ser verdadeiro aqui

grep -i "$assinatura" "$base_de_dados"


# Como saber se o comando anterior foi executado com sucesso?
#
# use a váriável $? ela retorna "0" se o ultimo comando foi executado com sucesso, 
# e retorna "1" se houve erro neste comando.

if [ $? -eq 0 ]
then

    yad \
    --center \
    --title='Aviso' \
    --text="\n\O arquivo suspeito $arquivo_suspeito já esta na base de dados $base_de_dados  \n\nSaindo em 50s...\n\n" \
    --timeout=50 \
    --no-buttons  \
    --height=80 --width=700 \
    2>/dev/null
    
    exit
    
fi



# https://sarata.com/manpages/sigtool.1.html
# https://rberaldo.com.br/grep-como-buscar-em-arquivos-linux/
# https://www.hostinger.com.br/tutoriais/comando-grep-linux
# https://www.certificacaolinux.com.br/comando-linux-grep/
# https://pt.stackoverflow.com/questions/143454/como-saber-se-comando-do-script-foi-executado-com-sucesso

# -------------------------------------------------------------------------


echo "
Gerando assinatura para o Clamav...
"


sigtool --sha256 "$arquivo_suspeito" >> "$base_de_dados"




# Retorna o tamanho sempre em MB - du -hsm (nome do arquivo)

tamanho=$(du -hs "$base_de_dados" | awk '{ print $1 }')


virus_conhecidos=$(cat "$base_de_dados" | wc -l)

# cat malwarebytes.hdb    | wc -l
# cat WindowsDefender.hdb | wc -l


notify-send -i gtk-dialog-info  -t 200000 "Clamav - Assinatura atualizada..." "

O banco de dados de vírus foi atualizado.

Base de dados: $base_de_dados
Tamanho: $tamanho

Vírus conhecidos: $virus_conhecidos


Depois que o arquivo de assinatura $base_de_dados foi criado, ele precisava ser movido para o diretório que o ClamAV utiliza. O 
comando para mover o $base_de_dados será:

sudo mv -i $base_de_dados `cat /etc/freshclam.conf | grep -i DatabaseDirectory | cut -d" " -f2`/ 


Uso sem move o $base_de_dados:

# clamscan --database="$base_de_dados" -r --bell -i   pasta_a_ser_examinada

# ou

# clamscan -d "$base_de_dados" -r --bell -i pasta_a_ser_examinada

"




else

echo "Verificar virus"


# pasta_a_ser_examinada=$( yad \
#            --center \
#            --file \
#            --directory \
#            --title="Selecione o diretório que deseja verifica os arquivos em busca de virus Ex: $HOME/clamav doc/virus identifica pelo malwarebytes/" \
#            --width="500" \
#            --height="300" 2> /dev/null
# )



pasta_a_ser_examinada="$1"


# Para verificar se a variavel é nula

if [ -z "$pasta_a_ser_examinada" ];then

yad \
--center \
--title='Aviso' \
--text='\n\nVocê precisa informar uma pasta para realizar a verificação por virus...\n\n' \
--timeout=10 \
--no-buttons \
2>/dev/null


clear

# break

exit 10

fi





yad \
--center \
--title='Aviso' \
--text="
# Remove os arquivos infectados
#
# Removendo vírus em partições do Windows
#
# Não sera usado o diretório de banco de dados padrão do clamav: $banco_de_dados_clamav
#
#
# clamscan --database=$base_de_dados  -r --bell -i --remove .
#
#
# https://www.hardware.com.br/dicas/removendo-virus-particoes-windows.html
# https://www.vivaolinux.com.br/topico/ClamAV/nao-remove-arquivos-infectados

" \
--timeout=30 \
--no-buttons 2>/dev/null



clamscan \
--database="$base_de_dados" \
-r --bell -i   "$pasta_a_ser_examinada" | tee -a "$log" | yad \
--center \
--title='Clamav' \
--fontname "Sans regular 9" \
--text-info --tail --wrap \
--height=1000 --width=1500 \
2>/dev/null





notify-send -i gtk-dialog-info  -t 200000 "Clamav - Verificação finalizada..." "

Pasta verificada: $pasta_a_ser_examinada
Arquivo de log: $log

"


fi



exit 0

