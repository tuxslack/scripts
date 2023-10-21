#! /bin/sh                                                      
#
#
# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml
#
#
# https://forum.archlinux-br.org/viewtopic.php?id=4303



# Increment and count the number of files passed to the script
# for later use in the progress dialog box
n=1

# Ask for the destination graphic image format to change to
# Next line is entered all on one line
EXT=`zenity --title="Converter Imagem" --entry --text="Por favor,
insira o formato da imagem para converter (ex. PNG, JPG, TIFF, etc...)"`

  if [ $? == 1 ]; then

     exit
  fi

# Make sure the file extension is in lowercase text
declare -l EXT
EXT=$EXT

# Ask for the quality level of the copied images
# Next line is entered all on one line
QUAL=`zenity --title="Por favor, insira a qualidade" --entry --text="100= Qualidade Total, 75 = 75% de Qualidade, 50 = 50% de Qualidade"`

  if [ $? == 1 ]; then

     exit
  fi

# If the destination image format is PNG, set background to none
# (transparent) and set the quality levels, which differ from JPG
if [ $EXT == "png" ];
  then
     BACKGROUND="-background none"
     QUALITY=$(($QUAL / 10))
  else
     BACKGROUND="-background white"
     QUALITY="$QUAL"
fi

# Generate the new directory name, and set it to uppercase text
NEW_DIR="./"$EXT"-"$(date +"%d%m%y-%H%M%S")
declare -u NEW_DIR
NEW_DIR=$NEW_DIR
mkdir $NEW_DIR

# Pause for one second, just to be sure that everything that
# needs to be done has been done
sleep 1

# Cycle through the selected files, performing the conversion
# one file at a time
for file in $@; do
    if [ ! -e $file ]; then
       continue
    fi

     # Get just the filename, without the original file extension
    name=$( echo $file | cut -f1 -d.)

     # Convert the file and write it out to the destination file
     # Next line is entered all on one line
    convert -quality $QUALITY $BACKGROUND $file $NEW_DIR/${name}.$EXT

     # Set up the information to display in the progress dialog box
    echo $(($n * 100 / $#))
    echo "# Processando arquivo: $file"
    let "n = n+1"

# Next line is entered all on one line
done | (zenity  --progress --title "Convertendo para "$EXT"..." --percentage=0 --auto-close --auto-kill)

exit 0

