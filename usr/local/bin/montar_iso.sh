#!/bin/bash


# Usa no menu de service do Thunar.
#
# ~/.config/Thunar/uca.xml


# chmod +x /usr/local/bin/montar_iso.sh


# https://help.ubuntu.com/community/Grub2/ISOBoot
# https://unix.stackexchange.com/questions/466938/what-is-the-difference-between-mount-and-mount-o-loop
# https://askubuntu.com/questions/26722/device-type-loop-in-mount-command
# https://sobrelinux.info/questions/16853/cant-mount-iso-file-as-loop-device-error-failed-to-setup-loop-device
# https://www.vivaolinux.com.br/topico/Linux-Basico/Como-abrir-arquivo-iso
# https://sobrelinux.info/questions/48625/failed-to-setup-loop-device-while-mounting-iso-file
# https://itsfoss.com/loop-device-linux/


clear

# Sem essa opção a caixa de dialog "Zenity" e o "notify-send" não aparece para o usuário.

# export DISPLAY=:0.0



# Se você não obtiver nenhuma saída com "lsmod | grep loop" , isso significa que você precisa montar o módulo de kernel do dispositivo de loop. Então:

# modprobe loop


# Certifique-se de ter montado o módulo do kernel do dispositivo de loop:

# lsmod | grep loop


# Opcional - o arquivo ISO pode ser montado em um ponto de montagem existente, se desejado.

# mkdir -p /mnt/iso

su -c "umount /mnt/ ; mount -o loop $1 /mnt/ && thunar /mnt/  2> /dev/null && umount /mnt/"


# Ao terminar de inspecionar o conteúdo.

# umount /mnt/iso
# rm -Rf /mnt/iso

exit 0

