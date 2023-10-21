#!/bin/bash
#
#
# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml
#
#
#
# https://www.vivaolinux.com.br/topico/Shell-Script/Pegar-somente-o-formato-do-audio-do-video


which mediainfo || exit 1
which zenity    || exit 2

clear


echo "Codec do áudio do arquivo:

`mediainfo --Inform="Audio;%Format%" "$1"`

" | zenity --text-info --title="Media Info" --width=400 --height=250


exit 0
