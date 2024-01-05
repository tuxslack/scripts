#!/bin/bash

clear

which notify-send   2> /dev/null || { echo "Programa notify-send não esta instalado."   ; exit ; }


rm -Rf ~/.cache/mozilla



ls -lh ~/.cache/mozilla 2>/dev/null

if [ $? == 2 ]; then

notify-send -t 100000 -i /usr/share/icons/hicolor/48x48/apps/firefox.png  'Firefox' "Cache zerado..."

# else

# notify-send -t 100000 -i /usr/share/icons/hicolor/48x48/apps/firefox.png  'Firefox' "Pasta $HOME/.cache/mozilla não localizada..."

fi

exit 0

