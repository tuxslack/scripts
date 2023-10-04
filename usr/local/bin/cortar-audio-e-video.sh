#!/bin/bash
#
# Autor:    Fernando Souza - https://www.youtube.com/@fernandosuporte/
# Data:     27/09/2023 as 20:56
# Homepage: https://github.com/tuxslack/scripts
# Licença:  GPL
#
# cortar-audio-e-video.sh
#
# Cortar áudio e vídeo
# 
#
# YAD - Insira horários de início/parada para cortar vídeo
# 
# cortar arquivos de áudio/vídeo usando horários de início/parada.
# 
# Uso:
# 
# ./chopvideoaudio.sh [input.mp4] [startchop] [stopchop] [output.mp4]
# 
# 
# Onde [startchop] e [stopchop] são carimbos de data/hora absolutos desde o início da faixa.
# 
# Comando de exemplo para executar este script:
# 
# ./chopvideoaudio.sh entrada.mp4 00:01:20 00:01:45 saída.mp4


# https://unix.stackexchange.com/questions/183944/yad-and-zenity-input-start-stop-times-to-trim-video
# https://www.enmimaquinafunciona.com/pregunta/142301/como-aumentar-los-numeros-de-archivo-en-un-bucle-for-ffmpeg
# https://www.youtube.com/watch?v=53onxaA-Zgs
# https://www.vivaolinux.com.br/topico/Zenity/Copiar-varios-arquivos-com-o-zenity



# Eu quero um script YAD (mais uma caixa de diálogo) que abra uma (s) caixa (s) de diálogo 
# contendo um campo de entrada para inserir um tipo de arquivo personalizado (por exemplo, 
# mp3, mp4, avi). Em seguida, insira campos para os dois carimbos de data/hora, nos quais 
# posso inserir dois carimbos de data/hora personalizados. Depois de pressionar, OKo script 
# será executado e extrairá a seção entre os dois carimbos de data/hora.


# INFILE=$1
# START=$2
# STOP=$3
# OUTFILE=$4

# OFFSET=`php TimeDiff.php "$START" "$STOP"`

# echo "Disecting $INFILE starting from $START to $STOP (duration $OFFSET)"


# Arquivo de log

log="/tmp/ffmpeg.log"


# Remove o arquivo de log caso ele existe

rm -Rf "$log"


clear


# ----------------------------------------------------------------------------------------

# Caso o script não execute, talvez seja necessário instalar esses programas no sistema:


which yad       2> /dev/null || { echo "Programa Yad não esta instalado."      ; exit ; }


which ffmpeg    2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa ffmpeg não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; } 
 
which mediainfo 2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa mediainfo não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; } 

which xdg-open  2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa xdg-open não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; } 

which tee       2> /dev/null || { yad --center --image=dialog-error --timeout=10 --no-buttons --title "Aviso" --text "Programa tee não esta instalado." --width 450 --height 100 2>/dev/null   ; exit ; } 



# which zenity      || exit 


# A instalação dos programas acima deve ser executado com permissões de Root. 

# ----------------------------------------------------------------------------------------



yad \
--center \
--title="Cortar arquivos de audio e video" \
--image=dialog-information \
--text="Como cortar audio e vídeos com o ffmpeg no Linux?

Neste script, você vai cortar o arquivo usando o ffmpeg. Você definir o tempo inicial e final do corte. O 
ffmpeg é uma ferramenta poderosa e gratuita para manipular arquivos de mídia.

Espero que você goste deste script e obrigado por usar!" \
--width="900" --height="400" \
--button=OK:0 


# ----------------------------------------------------------------------------------------


# A vantagem desta caixa de diálogo é que com Zenity ou Yad, você pode pré-selecionar a 
# extensão do arquivo para entrada de dados.

# INPUT=$(zenity \
# --title "Escolha o arquivo para corta." \
# --filename=${HOME}/ \
# --file-selection \
# --file-filter='*.mp3 *.m4a *.wav *.mp4 *.avi *.mkv *.webm *.wmv *.mpeg *.MOV' \
# --width=600 \
# --height=400  \
# 2>/dev/null)




# O argumento --file indica que queremos exibir uma caixa de diálogo de seleção de arquivo.
#
# A opção --file-filter no yad (Yet Another Dialog) é usada para filtrar os tipos de arquivos que 
# o usuário pode selecionar em um diálogo de arquivo. 
#
# O argumento --filename=$HOME define o diretório inicial para a seleção de arquivo. $HOME é 
# uma variável de ambiente que geralmente aponta para o diretório home do usuário atual.
#
# Neste exemplo abaixo, somente os arquivos multimidia serão exibidos no diálogo de arquivo. Lembre-se 
# de que você deve usar | para separar diferentes tipos de filtros. Aqui está um exemplo que inclui 
# um filtro para os arquivos multimidia.


INPUT=$(yad \
--center \
--title="Escolha o arquivo para corta." \
--image=dialog-information \
--file \
--filename=$HOME \
--file-filter='Multimidia | *.mp3 | *.m4a | *.wav | *.mp4 | *.avi | *.mkv | *.webm | *.wmv | *.mpeg | *.MOV' \
--width=1500 \
--height=1200 \
2>/dev/null)


# ----------------------------------------------------------------------------------------


# Para verificar se a variavel é nula

if [ -z "$INPUT" ];then

yad \
--center \
--title='Aviso' \
--image=dialog-error \
--text='\n\nVocê precisa selecionar um tipo de arquivo de audio ou video...\n\n' \
--timeout=10 \
--no-buttons 2>/dev/null

clear

exit 1

fi

# ----------------------------------------------------------------------------------------

dados=$(yad \
--center \
--title "Cortador de arquivo" \
--image ~/.icons/extras/435532.jpg \
--form \
--field="Inicio do corte" \
--field="Final do corte" \
--field="Arquivo de saida":SFL \
"00:00:00.000" "00:00:00.000" "${INPUT/%.*}-out.${INPUT##*.}" \
--width=400 \
2>/dev/null)


START=$(echo "$dados" | awk -F'|' '{printf $1}')
END=$(echo "$dados" | awk -F'|' '{printf $2}' )
OUTPUT=$(echo "$dados" | awk -F'|' '{printf $3}')



echo "
$INPUT
$START 
$END 
$OUTPUT"

# ----------------------------------------------------------------------------------------

# Verifica as variaveis

[[ -z $INPUT || -z $START || -z $END || -z $OUTPUT ]] && exit 2



clear


echo "
Inicio do corte:    $START 
Final do corte:     $END
Arquivo de entrada: $INPUT 
Arquivo de saida:   $OUTPUT
"

# -ss position 
# -t  duration
# -i url (input)
 


# Com o formato 00:00:00 não funciona somente usando o formato 00:00:00.000  ou 00:00.00


# ----------------------------------------------------------------------------------------

ffmpeg -y -i "$INPUT" -ss "$START" -t "$END"  "$OUTPUT" | \
        yad \
        --center \
        --progress \
        --title "ffmpeg - Cortador de arquivo" \
        --width="900" \
        --progress-text="Cortando o arquivo $INPUT agora..." \
        --pulsate \
        --auto-close \
        --button=Fecha:1 \
        --auto-kill 2>/dev/null # mata o processo anterior caso usuario clique em cancelar


if [ "$?" = "0" ]; then

	echo -e "\nArquivo de entrada:\n\n" | tee -a "$log"
	
	mediainfo "$INPUT" | tee -a "$log"
	
	
        echo -e "\n\nArquivo de saida:\n\n" | tee -a "$log"
        
	mediainfo "$OUTPUT" | tee -a "$log"
	
	
	xdg-open "$log"
	
	
else
	echo "Problema"
	
	xdg-open "$log"
fi

# ----------------------------------------------------------------------------------------


exit 0

