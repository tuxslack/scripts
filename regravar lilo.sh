#!/bin/bash

clear

dialog \
--title 'Regravar o lilo apos instalação ou reinstalação do Windows no HD'  \
--msgbox '

Regravar o lilo apos instalação ou reinstalação do Windows no HD


Recuperando lilo depois de uma instalação do Windows [Dica]

Quando possuímos o Linux e instalamos o Windows, o "sistema proprietário" reescreve a MBR e deleta o lilo, impossibilitando a inicialização de outros sistemas instalados na máquina. 


https://www.vivaolinux.com.br/dica/Recuperando-lilo-depois-de-uma-instalacao-do-Windows


Logicamente você vai precisar de um DVD da distribuição, que pode ser encontrado aqui:



Usando o DVD de instalação do Slackware


    http://www.slackware.com/getslack/ 


Depois de baixar você precisará queimar um DVD com a imagem.


Vá para a BIOS e coloque seu computador para dar boot pelo CD/DVD; 

Ligue o computador pelo DVD do Slackware. 


Aparecerá uma tela pedindo algum comando. Só tecle enter e irá começar o carregamento.

Após terminar irá pedir o login, tecle enter.

Aparecerá uma janela para selecionar o tipo de teclado. Encontre o seu tipo (geralmente ABNT2), teste na janela que aparecer, se estiver tudo ok digite "1" e tecle enter.

Agora você está no prompt de comando.

Verifique onde está o seu sistema Linux instalado.



$ su
Senha : 



# fdisk -l
Disco /dev/ram0: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram1: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram2: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram3: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram4: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram5: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram6: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram7: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram8: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram9: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram10: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram11: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram12: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram13: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram14: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/ram15: 16 MiB, 16777216 bytes, 32768 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes


Disco /dev/sdb: 119,2 GiB, 128035676160 bytes, 250069680 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 512 bytes
Tamanho E/S (mínimo/ótimo): 512 bytes / 512 bytes
Tipo de rótulo do disco: gpt
Identificador do disco: CC469BDB-FEB4-4444-9365-319780B86C26

Dispositivo Início       Fim   Setores Tamanho Tipo
/dev/sdb1     2048 250068991 250066944  119,2G Microsoft dados básico


Disco /dev/sda: 465,8 GiB, 500107862016 bytes, 976773168 setores
Unidades: setor de 1 * 512 = 512 bytes
Tamanho de setor (lógico/físico): 512 bytes / 4096 bytes
Tamanho E/S (mínimo/ótimo): 4096 bytes / 4096 bytes
Tipo de rótulo do disco: dos
Identificador do disco: 0x000e9f23

Dispositivo Inicializar   Início       Fim   Setores Tamanho Id Tipo
/dev/sda1   *                2048   1026047   1024000    500M  7 HPFS/NTFS/exFAT
/dev/sda2                 1026048  99217407  98191360   46,8G  7 HPFS/NTFS/exFAT
/dev/sda3                99217408 384587775 285370368  136,1G 83 Linux
/dev/sda4               384587776 976773119 592185344  282,4G  5 Estendida
/dev/sda5               384589824 388784127   4194304      2G 82 Linux swap
/dev/sda6               388786176 976773119 587986944  280,4G 83 Linux



Meu sistema está instalado na partição /dev/sda3  (porque eu lembro que instalei ali, só verifiquei as partições como estavam). 


Agora vamos montar a partição. No meu caso: 

# mount /dev/sda3 /floppy


Verifica se o lilo possui as configurações para carregar o Windows

# chroot /floppy



# cat /etc/lilo.conf

...


# Windows 10 Pro 64 bit

# Windows bootable partition config begins
  other = /dev/sda1
  label = Windows
  table = /dev/sda
# Windows bootable partition config ends




# lilo -v
LILO version 24.2 (released 22-November-2015)
  * Copyright (C) 1992-1998 Werner Almesberger  (until v20)
  * Copyright (C) 1999-2007 John Coffman  (until v22)
  * Copyright (C) 2009-2015 Joachim Wiedorn  (since v23)
This program comes with ABSOLUTELY NO WARRANTY. This is free software 
distributed under the BSD License (3-clause). Details can be found in 
the file COPYING, which is distributed with this software.

Warning: LBA32 addressing assumed
Reading boot sector from /dev/sda
Using BITMAP secondary loader
Calling map_insert_data
Mapping bitmap file /boot/slack.bmp
Calling map_insert_file

Boot image: /boot/vmlinuz-generic -> vmlinuz-generic-4.4.261
Mapping RAM disk /boot/initrd.gz
The initial RAM disk will be loaded in the high memory above 16M.
Added Kernel_Generico  +  *

Boot image: /boot/vmlinuz-huge -> vmlinuz-huge-4.4.261
Added Kernel_Huge

Boot other: /dev/sda1, on /dev/sda, loader CHAIN
Added Windows

Boot image: /boot/memtest86+.bin -> memtest86+-5.01.bin
Added Memtest86+

Writing boot sector.
/boot/boot.0800 exists - no boot sector backup copy made.
One warning was issued.


ou


# lilo
Warning: LBA32 addressing assumed
Added Kernel_Generico  +  *
Added Kernel_Huge
Added Windows
Added Memtest86+
One warning was issued.


# exit


Pronto, agora reinicie o computador e você estará com o lilo funcionando como era antes e com o Windows adicionado.


# reboot

' 40 100


exit 0


