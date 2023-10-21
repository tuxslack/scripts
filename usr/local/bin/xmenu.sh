#!/bin/sh
#
# xmenu: Utilitário de menu independente da área de trabalho
#
# Por: Gideon Wolfe  em 04/08/2020  https://www.github.com/GideonWolfe
#
# Atualizado por: Fernando Souza
# 
#
# Programa auxiliar que uso com o i3 gerenciador de janelas.
#
# Ele oferece um menu estilo openbox que pode ser navegado com o teclado ou com o mouse.
#
# Cada valor é separado pelo TABcaractere. À esquerda está o nome a ser exibido e, em seguida, 
# uma guia sobre o comando/script a ser executado se essa opção for selecionada.
#
# Você pode criar menus aninhados recuando outra guia e quebras de linha com linhas vazias. 
# Observe que as quebras de linha aninhadas precisam do número apropriado de tabulações no 
# início da linha, seguidas de nada.
#
# 
# https://github.com/phillbush/xmenu
# https://gideonwolfe.com/posts/workflow/xmenu/
# https://www.vivaolinux.com.br/topico/XFCE/Colocar-uma-opcao-no-service-menu-do-Thunar-para-selecionar-tudo
# https://terminalroot.com.br/2021/06/como-instalar-e-configurar-o-bspwm-com-temas-para-polybar.html
# https://wiki.gentoo.org/wiki/Recommended_applications
# https://www.vivaolinux.com.br/artigos/impressora.php?codigo=12713
#
#
#
# Com xdotool, podemos disparar ações do mouse/teclado, através de comandos via terminal.
#
# Um exemplo, para ativar o clique com o botão direito do mouse (botão número 3), via comando, digite:
#
# xdotool click 3
#
# https://www.vivaolinux.com.br/dica/Tint2-com-menu-do-Openbox
#
#
# Esse arquivo usa as fontes fontawesome-free
#
# https://fontawesome.com



# Como instalar fonts de texto no seu Linux 
#
# Com as suas fonts na pasta ~/.fonts abra o terminal e de o comando abaixo para atualizar o cache das fonts.
#
# https://www.dropbox.com/sh/5qmd43k6af1y5s6/AAA3qmqddFI5vMvYSt6Be9RQa
#
#
#
# Baixar todas as fontes do Google
#
# Você pode baixar todas as fontes do Google em um instantâneo ZIP simples (mais de 1 GB) em https://github.com/google/fonts/archive/main.zip
#
# wget -c https://github.com/google/fonts/archive/main.zip
#
#
#
# Sincronizar com o Git
#
# cd ~/.fonts/
#
# git clone https://github.com/google/fonts.git google-fonts
# 
# 
# 
# Atualizando o Google Fonts
# 
# cd ~/.fonts/google-fonts/
# 
# git pull
# 
# https://andersonbraz.com/instalando-google-fonts-no-macos
#
# 
#
# Você também pode sincronizar a coleção com o git para poder atualizar apenas buscando o que foi alterado. 
# Para aprender a usar o git, o Github oferece guias ilustrados e um canal no youtube, além de um laboratório 
# de aprendizado interativo. Aplicativos git gratuitos e de código aberto estão disponíveis para Windows e Mac OS X.
#
#
#
# fc-cache -vf
#
# https://linuxdicasesuporte.blogspot.com/2017/11/como-instalar-fonts-de-texto-no-seu_4.html



# Resetando as Configurações do .Xresources
# 
# 
# Alguns usuários costumam usar um arquivo de configuração para configurar o xterm e o rxvt, 
# o .Xdefault ou o .Xresources, um desses dois. Para aplicar as configurações imediatamente 
# para esses programas é usado esse comando no terminal ou até pode ser inserido no bashrc:
# 
# xrdb -merge ~/.Xresources
# 
# E assim as configurações são aplicadas. Mas, você pode querer modificar uma configuração para 
# esses programas e ao aplicar esse comando, você percebe que as configurações não foram alteradas. 
# Isso porque esse comando só vai aplicar os comandos adicionados e não os que já estão configurados.
# 
# Então, para resolver esse problema, você pode resetar as configurações do .Xresources com esse comando:
# 
# xrdb -remove
# 
# Com isso, ao aplicar as configurações novamente, as configurações serão aplicadas corretamente.
# 
# 
# https://pt.wikipedia.org/wiki/X_resources
# https://www.vivaolinux.com.br/dica/Resetando-as-Configuracoes-do-Xresources




# Para Desligar, Reiniciar e Bloquear a Tela tenha polkit instalado para permitir 
# que usuários sem privilégios executem comandos de gerenciamento de energia (Não usar o SUDO).
#
# https://wiki.archlinux.org/title/I3_(Portugu%C3%AAs)



# Instala as Fontes Awesome sempre a ultima versão

# xbps-query -Rs  font-awesome
# [-] font-awesome-4.7.0_3   An iconic font
# [-] font-awesome5-5.15.4_2 Iconic font (version 5)
# [*] font-awesome6-6.4.0_1  Iconic SVG, font, and CSS toolkit - desktop fonts

# sudo xbps-install -Suy font-awesome6-6.4.0_1



# Reinicie o i3 com "i3-msg restart" para aplicar suas alterações.



clear

# Verificar se os programas estão instalados

which xmenu            || exit 1
which xev              || exit 2
which xdotool          || exit 3
which i3status         || exit 4
which polybar          || exit 5
which i3blocks         || exit 6
which i3lock           || exit 7
which xautolock        || exit 8
which i3-nagbar        || exit 9
which rofi             || exit 10
which xfce4-terminal   || exit 11
which gedit            || exit 12
which thunar           || exit 13
which masterpdfeditor  || exit 14
which i3-msg           || exit 15



# A parte que chama o programa não pode ter espaço e nem -
# Tem limite de letra em nome

# IMG:./../../../.icons/xmenu/web.png	Firefox		firefox

oi(){
xmenu <<EOF | sh &
Aplicação
	IMG:./.icons/xmenu/web.png Firefox firefox
	IMG:/usr/share/icons/hicolor/48x48/apps/google-chrome.png	Navegador web    /usr/bin/google-chrome-stable --password-store=basic
	IMG:./.icons/xmenu/gimp.png	Editor de imagem gimp
EOF

}


# O gksu => pkexec env DISPLAY=$DISPLAY XAUTHORITY=$XAUTHORITY "$@"




# Proteção de tela e gerenciamento de energia
#
#
# xbps-install -Suy  xautolock
#
# Com o Power management#xss-lock você pode registrar um bloqueador de tela para o 
# sua sessão do i3. A opção -time com xautolock bloqueia a tela após um determinado 
# período de tempo:
#
# xautolock -time 10 -locker "i3lock -i 'background_image.png'" &


# https://wiki.archlinux.org/title/I3_(Portugu%C3%AAs)



# urxvt | xterm
terminal="xfce4-terminal"

# nvim | nano
editor_de_texto="gedit"

# zathura
leitor_de_PDF="masterpdfeditor"


gerenciador_de_arquivo="thunar"


# https://wiki.archlinux.de/title/Urxvt



COLORSCRIPTSDIR=$HOME/Programs/color-scripts/color-scripts
CONFIGDIR=$HOME/.config



# Observe a invocação de xmenu.
#
# xmenu -i -p 0x25:1
#
#     -i diz ao xmenu para remover o espaço para ícones
#     -p diz ao xmenu para usar uma posição específica
#     0x25 as coordenadas que colocam xmenu abaixo da minha barra (25px abaixo)
#     :1 na tela um



# cat <<EOF | xmenu -i -p 0x25:1 | sh &
# cat <<EOF | xmenu -i -p 9x477:1 | sh &

cat <<EOF | xmenu -i | sh &
Executar programa...	rofi -show drun -show-icons
Executar Rofi -theme solarized...	rofi -modi run,drun -show drun -show-icons -drun-icon-theme Adwaita -scroll-method 1 -sidebar-mode -theme solarized -font "hack 10"
 Terminal	$terminal
 Gerenciador de arquivos	$gerenciador_de_arquivo ~/
Configurações
	Editar o arquivo sudoers como Root - SUDO	pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority  $editor_de_texto  /etc/sudoers
	Editar Servidor DNS	pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority  $editor_de_texto /etc/resolv.conf
	Abrir o FSTAB	pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority  $editor_de_texto /etc/fstab
	Abrir o wvdial.conf	pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority  $editor_de_texto /etc/wvdial.conf	
	Abrir a pasta skel como ROOT	pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority  $editor_de_texto  /etc/skel/
	Abrir a pasta de atalho de programa local	xdg-open ~/.local/share/applications/
	Abrir a pasta de atalho de programa global	pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority $gerenciador_de_arquivo /usr/share/applications/
	Abrir a pasta de ícones – local		xdg-open ~/.icons/
	Abrir a pasta bin como ROOT		pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority  $gerenciador_de_arquivo  /usr/local/bin/
	Abrir a pasta skel como ROOT		pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority  $gerenciador_de_arquivo  /etc/skel/
	Teclado Virtual - xvkbd			xvkbd		
Acessórios
	Editores de Texto
		Gedit		gedit
		Geany		geany
		Kate		kate
		Mousepad	mousepad
		Pluma		pluma
		Xed		xed
	Gpick	gpick
	 Captura de tela
		Captura de tela - xfce4-screenshooter				xfce4-screenshooter
		Captura de tela - xfce4-screenshooter (apenas uma região)	xfce4-screenshooter -r
		Captura de tela - screenfetch					$terminal -e "screenfetch -s"
		Captura de tela - Scrot						sleep 1 && scrot -s -d 3 ~/screenshot_%d-%m-%Y-%H-%M-%S.png
		Captura de tela - Scrot 5s					scrot -cd 5 ~/scrot_screenshot_%d-%m-%Y-%H-%M-%S.png
		Captura de tela - Import					sleep 1 && import -w root ~/import_%d-%m-%Y-%H-%M-%S.png
		Captura de tela - Import (apenas uma região)			sleep 1 && data=`date +%d-%m-%Y-%H-%M-%S` && import ~/import_$data.png
		GUI	flameshot gui
		All Displays	flameshot screen -d 5000 -n 3 -p $HOME/Photos/screenshots
		Middle Display	flameshot screen -d 5000 -n 0 -p $HOME/Photos/screenshots
		Right Display	flameshot screen -d 5000 -n 1 -p $HOME/Photos/screenshots
		Left Display	flameshot screen -d 5000 -n 2 -p $HOME/Photos/screenshots
	Discos		gnome-disks
	Galculator	galculator
	Nitrogen	nitrogen
	Plank		plank
	Terminal como Root	gksu /usr/bin/xfce4-terminal  --title="Terminal como Root"
	Terminal (xterm)	xterm
	Terminal (urxvt)	urxvt
	Xfburn		xfburn
	Xpad		xpad
	Screenkey	screenkey
Ajuda
Centro de Controle	xdg-open /opt/painel/
 Desenvolvimento
	Codeblocks	codeblocks
	NetBeans	/opt/netbeans/bin/netbeans
	Meld		meld
	 IDEs
		Neovim	$terminal -e nvim
		VS Code	code
		Dr. Racket	drracket
	 Github (TUI)	$terminal -e github
		bitwise	bitwise
		Github Activity (TUI)	$terminal -e sh -c 'ghcal --no-ansi ; read'
		QDbusViewer	qdbusviewer --style gtk2
Educação
	Geogebra	geogebra
	Geogebra-Online	xdg-open "https://www.geogebra.org/classic"
Escritório
	Goldendict	goldendict
	LibreOffice
		Writer	libreoffice --writer
		Calc	libreoffice --calc
		Base	libreoffice --base
		Impress	libreoffice --impress
		Math	libreoffice --math
		Draw	libreoffice --draw		
	XMind local	cd ~/xmind/XMind_amd64/ && ./XMind
	XMind	/opt/Xmind/xmind	
	Master PDF Editor	/opt/master-pdf-editor-5/masterpdfeditor5
Forense Digital
Gráficos
	Gimp	gimp
	Inkscape	inkscape
	Kolourpaint	kolourpaint
	Krita		krita
	Synfig Studio	synfigstudio
	Xsane		xsane
	gcolor2		gcolor2
	Sweet Home 3D	/opt/SweetHome3D/SweetHome3D
Atualizações
	Sweet Home 3D		xdg-open "https://www.sweethome3d.com/pt/download.jsp"
	Master PDF Editor	xdg-open "https://code-industry.net/masterpdfeditor/"
	Java			xdg-open "https://www.java.com/en/download/"
Internet
	Navegador da Web
		 Firefox	firefox
		Google Chrome	/usr/bin/google-chrome-stable --password-store=basic
		Chromium	
		Navegador Tor	
		Brave		
		Vivaldi		
	Cliente de e-mail			
		Thunderbird	thunderbird
		Evolution	evolution
		KMail		kmail
		Sylpheed	sylpheed
		Claws Mail	
		Geary		
	Qbittorrent	qbittorrent
	Acesso Remoto
		AnyDesk		anydesk
		TeamViewer	/opt/teamviewer/tv_bin/script/teamviewer
	Jamendo (Músicas)	xdg-open "https://www.jamendo.com/"
	Discador ppp		xfce4-terminal --title='Discador ppp'  -e "su -c 'killall  -9 pppd ; killall  -9 wvdial ; poff -a ; pon E220 && sleep 30 && ping -c 5 www.google.com.br ; sleep 30'"
	Discador Wvdial		xfce4-terminal --title='Discador Wvdial'  -e "su -c 'killall -9 pppd ; killall -9 wvdial ; poff -a ; wvdial && sleep 30 && ping -c 5 www.google.com.br ; sleep 30'"
	Desconectar da internet		$terminal -e "su -c 'killall -9 wvdial ; killall -9 pppd ; sleep 20'"
	Testar Internet	/usr/local/bin/testarinternet.sh
	Testar a velocidade da sua internet - speedtest-cli	xfce4-terminal --maximize --title='Testando a velocidade da sua internet via speedtest-cli...'  -e "/usr/local/bin/Testar_a_velocidade_da_sua_internet-speedtest-cli.sh"
	Testar seu firewall online	xdg-open "https://www.grc.com/x/ne.dll?bh0bkyd2"
	Dropbox		dropbox start -i &
	iCloud		xdg-open "https://www.icloud.com/"
	Google Drive	xdg-open "https://drive.google.com"
	Google Maps	xdg-open "https://www.google.com.br/maps"
	Google Tradutor	xdg-open "https://translate.google.com/"
	cups		xdg-open "http://localhost:631/"
	HexChat		hexchat --existing
	Microsoft Office - Online	xdg-open "https://www.office.com/"
	OcoMon		xdg-open "http://localhost/ocomon/login.php"
	phpMyAdmin	xdg-open "http://localhost/phpmyadmin"
	Planilhas Google	xdg-open "https://docs.google.com/spreadsheets/"
	WhatsApp Web	xdg-open "https://web.whatsapp.com/"
	Zoom		/usr/bin/zoom
	Clima Tempo - RJ	xdg-open "https://www.climatempo.com.br/previsao-do-tempo/agora/cidade/321/riodejaneiro-rj"
	Netflix			xdg-open "https://www.netflix.com/br/"
	Baixar vídeos do Facebook	xdg-open "https://pocbi.com/facebook/"
	Baixar vídeo do Instagram	xdg-open "https://pocbi.com/"	
 Jogos
	lbreakout2	lbreakout2
	Mame	mame
	Stella	stella
	 Steam	steam
	Itch	itch
	Lutris	lutris
	Tetris	tetris
	Solitaire	ttysolitaire
	Battleship	bs
	Minecraft	minecraft-launcher
	Dopewars	dopewars
Miltimídia
	Audacity	audacity
	DeVeDe		/usr/bin/devede_ng.py
	Clipgrab	clipgrab
	Gravador de CD e DVD
		k3b		k3b
		xfburn		xfburn
	SimpleScreenRecorder	simplescreenrecorder --logfile
	Guvcview	guvcview
	kdenlive	kdenlive
	Qmmp		qmmp-1
	Shotcut		/opt/shotcut/shotcut-linux-x86_64-221221.AppImage
	 Controle de volume do PulseAudio (Pavucontrol)		pavucontrol
Outros
 Aplicação
	 Escola
		 canvas-tui 		$terminal -e canvas-tui
		 Zotero 		zotero
		 CS
			145
				Notes		$terminal -e $editor_de_texto $HOME/School/CS/145/notes.java
			241
				Notes		$terminal -e $editor_de_texto $HOME/School/CS/241/notes
			247
				Notes		$terminal -e $editor_de_texto $HOME/School/CS/247/notes
				Books
					Susheel's notes		$leitor_de_PDF $HOME/School/CS/247/CSCI247_CourseNotes.pdf
					Intel manual		$leitor_de_PDF $HOME/School/CS/247/intel.pdf
					C Programming Language	$leitor_de_PDF $HOME/School/CS/247/the_c_programming_language_2.pdf
			301
				Notes		$terminal -e $editor_de_texto $HOME/School/CS/301/notes
				Books
					Theory of Computation		$leitor_de_PDF $HOME/School/CS/301/TheoryOfComputation.pdf
					Book of Proof			$leitor_de_PDF $HOME/School/CS/301/Main.pdf
			305
				Notes			$terminal -e $editor_de_texto $HOME/School/CS/305/notes.md
				Textbook		$leitor_de_PDF $HOME/School/CS/305/textbook.pdf
			330
				Notes		$terminal -e $editor_de_texto $HOME/School/CS/330/notes.md
			347
				Notes		$terminal -e $editor_de_texto $HOME/School/CS/347/notes.md
				Textbook		$leitor_de_PDF $HOME/School/CS/347/textbook.pdf
			367
				Notes		$terminal -e $editor_de_texto $HOME/School/CS/367/notes.md
				Textbook		$leitor_de_PDF $HOME/School/CS/367/textbook.pdf
			461
				Notes		$terminal -e $editor_de_texto $HOME/School/CS/461/notes.md
				Textbook		$leitor_de_PDF $HOME/School/CS/461/textbook.pdf
			474
				Notes		$terminal -e $editor_de_texto $HOME/School/CS/474/notes.md
	 Comunicações
		Discord (GUI)		discord
		Discord (cordless)		$terminal -e cordless
		 Email (Neomutt)		$terminal -e neomutt
		 IRC (weechat)		$terminal -e weechat
		 SMS (kde-connect)		kdeconnect-sms --style gtk2
		 Slack 	slack
		 Signal (GUI)			signal-desktop
		 Telegram (GUI)		telegram-desktop
		 Telegram (nctelegram)	nctelegram
	 Finança
		 Crypto (TUI)		$terminal -e cointop
		 Stocks (TUI)		$terminal -e mop
		 Stonks (CLI)		$terminal -e mop
	 Utilities
		 Calculator (TUI)		$terminal -e qalq
		 Calculator (GUI)		qalculate-gtk
		 Calendar (khal)		$terminal -e khal interactive
		 Color Picker		gpick
		 Map (TUI)			$terminal -e mapscii
		
		 Pessoal
			 Nextcloud			nextcloud --style gtk2
			 Passwords (keepassxc)	keepassxc --style gtk2
			 Keys (Seahorse)		seahorse
		 Media
			 EasyTag		easytag
	 Entretenimento
		 Media
			 Podcasts (castero)	castero
			 RSS (newsboat)	newsboat
			 Reddit (tuir)	tuir
			 Music (cmus)	cmus
			 Spotify (GUI)	spotify
			 Spotify (spotifytui)	spt
			Soulseek (Nicotine+)	nicotine
		 Misc
			Color Scripts
				alpha	$terminal -e sh -c '$COLORSCRIPTSDIR/alpha; read'
				arch	$terminal -e sh -c '$COLORSCRIPTSDIR/arch; read'
				bars	$terminal -e sh -c '$COLORSCRIPTSDIR/bars; read'
				blocks2	$terminal -e sh -c '$COLORSCRIPTSDIR/blocks2; read'
				bloks	$terminal -e sh -c '$COLORSCRIPTSDIR/bloks; read'
				colorbars	$terminal -e sh -c '$COLORSCRIPTSDIR/colorbars; read'
				colortest	$terminal -e sh -c '$COLORSCRIPTSDIR/colortest; read'
				colortest-slim	$terminal -e sh -c '$COLORSCRIPTSDIR/colortest-slim; colortest'
				colorview	$terminal -e sh -c '$COLORSCRIPTSDIR/colorview; read'
				crunch	$terminal -e sh -c '$COLORSCRIPTSDIR/crunch; read'
				crunchbang	$terminal -e sh -c '$COLORSCRIPTSDIR/crunchbang; read'
				crunchbang-mini	$terminal -e sh -c '$COLORSCRIPTSDIR/crunchbang-mini; read'
				darthvader	$terminal -e sh -c '$COLORSCRIPTSDIR/darthvader; read'
				dna	$terminal -e sh -c '$COLORSCRIPTSDIR/dna; read'
				dotx	$terminal -e sh -c '$COLORSCRIPTSDIR/dna; read'
				elfman	$terminal -e sh -c '$COLORSCRIPTSDIR/elfman; read'
				faces	$terminal -e sh -c '$COLORSCRIPTSDIR/faces; read'
				fade	$terminal -e sh -c '$COLORSCRIPTSDIR/fade; read'
				ghosts	$terminal -e sh -c '$COLORSCRIPTSDIR/ghosts; read'
				guns	$terminal -e sh -c '$COLORSCRIPTSDIR/guns; read'
				hex	$terminal -e sh -c '$COLORSCRIPTSDIR/hex; read'
				hex-block	$terminal -e sh -c '$COLORSCRIPTSDIR/hex-block; read'
				illumina	$terminal -e sh -c '$COLORSCRIPTSDIR/illumina; read'
				jangofett	$terminal -e sh -c '$COLORSCRIPTSDIR/jangofett; read'
				monster	$terminal -e sh -c '$COLORSCRIPTSDIR/monster; read'
				mouseface	$terminal -e sh -c '$COLORSCRIPTSDIR/mouseface; read'
				pacman	$terminal -e sh -c '$COLORSCRIPTSDIR/pacman; read'
				panes	$terminal -e sh -c '$COLORSCRIPTSDIR/panes; read'
				pinguco	$terminal -e sh -c '$COLORSCRIPTSDIR/pinguco; read'
				pipes1	$terminal -e sh -c '$COLORSCRIPTSDIR/pipes1; read'
				pipes2	$terminal -e sh -c '$COLORSCRIPTSDIR/pipes2; read'
				pipes2-slim	$terminal -e sh -c '$COLORSCRIPTSDIR/pipes2-slim; read'
				pukeskull	$terminal -e sh -c '$COLORSCRIPTSDIR/pukeskull; read'
				rails	$terminal -e sh -c '$COLORSCRIPTSDIR/rails; read'
				rally-x	$terminal -e sh -c '$COLORSCRIPTSDIR/rally-x; read'
				rupees	$terminal -e sh -c '$COLORSCRIPTSDIR/rupees; read'
				space-invaders	$terminal -e sh -c '$COLORSCRIPTSDIR/space-invaders; read'
				spectrum	$terminal -e sh -c '$COLORSCRIPTSDIR/spectrum; read'
				square	$terminal -e sh -c '$COLORSCRIPTSDIR/square; read'
				tanks	$terminal -e sh -c '$COLORSCRIPTSDIR/tanks; read'
				thebat	$terminal -e sh -c '$COLORSCRIPTSDIR/thebat; read'
				thebat2	$terminal -e sh -c '$COLORSCRIPTSDIR/thebat2; read'
				tiefighter1-no-invo	$terminal -e sh -c '$COLORSCRIPTSDIR/tiefighter1-no-invo; read'
				tiefighter2	$terminal -e sh -c '$COLORSCRIPTSDIR/tiefighter2; read'
				zwaves	$terminal -e sh -c '$COLORSCRIPTSDIR/zwaves; read'
			cava		$terminal -e cava
			pipes.sh	$terminal -e pipes.sh
			rain.sh		$terminal -e rain.sh
			unimatrix	$terminal -e unimatrix -l Gg
			asciiquarium	$terminal -e asciiquarium
			bonsai.sh	$terminal -e bonsai -l -i -T
			eDEX-UI		sh -c (cd $HOME/Programs/edex-ui/ ; npm start)
	 Ciência
		 Astronomia
			Celestia	celestia
		 Biologia
			Pymol		pymol
		 Química
			ptable		$terminal -e ptable
			chemtool	chemtool
		 Matemática
			Desmos	        desmos
		Anki		anki		
 Configurações
	 User
		ranger			$editor_de_texto $CONFIGDIR/ranger/rc.conf
		newsboat		$editor_de_texto $CONFIGDIR/newsboat/config
		neomutt
			neomuttrc	$terminal -e $editor_de_texto $CONFIGDIR/neomutt/neomuttrc
			colors		$terminal -e $editor_de_texto $CONFIGDIR/neomutt/colors
			settings	$terminal -e $editor_de_texto $CONFIGDIR/neomutt/settings
			mappings	$terminal -e $editor_de_texto $CONFIGDIR/neomutt/mappings
			mailcap		$terminal -e $editor_de_texto $CONFIGDIR/neomutt/mailcap
		neovim
			coc-settings	$terminal -e $editor_de_texto $HOME/.config/nvim/coc-settings.json
			functions	$terminal -e $editor_de_texto $HOME/.config/nvim/configs/functions.vim
			main		$terminal -e $editor_de_texto $HOME/.config/nvim/configs/main.vim
			mappings	$terminal -e $editor_de_texto $HOME/.config/nvim/configs/mappings.vim
			plugin-settings	$terminal -e $editor_de_texto $HOME/.config/nvim/configs/plugin-settings.vim
			plugins		$terminal -e $editor_de_texto $HOME/.config/nvim/configs/plugin.vim
		neofetch		$terminal -e $editor_de_texto $CONFIGDIR/neofetch/config.conf
		htop			$terminal -e $editor_de_texto $CONFIGDIR/htop/htoprc
		s-tui			$terminal -e $editor_de_texto $CONFIGDIR/s-tui/s-tui.conf
		spicetify		$terminal -e $editor_de_texto $CONFIGDIR/spicetify/config.ini
		stonks			$terminal -e $editor_de_texto $CONFIGDIR/stonks.yml
	OpenBox
		Editor de configuração para Openbox (ObConf)	obconf 2> /dev/null
		Iniciar programas junto ao Openbox - Autostart	gedit ~/.config/openbox/autostart
		Editar o menu do Openbox - menu.xml		gedit ~/.config/openbox/menu.xml
		Teclas de atalho - rc.xml			gedit ~/.config/openbox/rc.xml
		Environment					gedit ~/.config/openbox/environment
		Leia-me.txt					gedit ~/.config/openbox/leia-me.txt
		Editar o painel Tint2				gedit ~/.config/tint2/tint2rc
		Recarregar Tint2				killall -9 tint2 ; tint2 &
		Recarregar Tint2				pkill tint2 ; tint2 &
		Reconfigure Openbox				openbox --reconfigure	
Shell Script
	zchattr			/usr/local/bin/zchattr.sh
	Gerador de senhas	xfce4-terminal --maximize --title="Gerador de senhas..." -e '/usr/local/bin/gerarsenha.sh'
	Aplicações instaladas	yad --icons --read-dir="/usr/share/applications" --width="600" --height="500"
	Visualizar Fontes	yad --font --fontname="Ubuntu",14 --preview="Texto para exemplo do uso de fonte yad é 10 :-) " --title="Selecione uma fonte"
	Atualizar sistema	xfce4-terminal --maximize --title="Informe a senha do usuário Root abaixo..." -e 'su -c "/usr/local/bin/atualiza.sh"'
	Paleta de cores		yad --color --init-color="" --palette
	Seu IP			xfce4-terminal --maximize --title="Obter seu IP via Terminal..." -e '/usr/local/bin/seu_IP.sh'
 Sistema
	Neofetch					$terminal -e 'neofetch ; sleep 20'
	Mata conky	pkill conky
	Abrir a pasta de atalho de programa local	xdg-open ~/.local/share/applications/
	Abrir CRON do Root	pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority  xdg-open /var/spool/cron/root
	Abrir o FSTAB		pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority  xdg-open /etc/fstab
	Abrir o arquivo wvdial.conf	pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority  xdg-open  /etc/wvdial.conf
	Carregar variáveis de ambiente em .bashrc	source ~/.bashrc
	Carregar variáveis de ambiente em .zshrc	source ~/.zshrc
	Obter informações
		CPU-X	cpu-x
	 Monitoramento
		Gerenciador de tarefas	xfce4-taskmanager
		Top		$terminal -e top
		Htop		$terminal -e htop
		Tcpdump (ppp0)	$terminal -e "su -c 'tcpdump -i ppp0'"
		Tcpdump (eth0)	$terminal -e "su -c 'tcpdump -i eth0'"
		Tcpdump (eth1)	$terminal -e "su -c 'tcpdump -i eth1'"
		Netstat		$terminal -e "su -c 'netstat -a | less'"
		IPTraf		$terminal -e "su -c 'iptraf-ng'"
		Processos	$terminal -e 'ps -aux | less'
		System (ytop)	$terminal -e ytop
		System (bashtop)	$terminal -e bashtop
		System (glances)	$terminal -e glances
		Disk Usage - baobab (GUI)	baobab
		Disk Usage - ncdu (TUI)		$terminal -e ncdu
		IO (iotop)	$terminal -e iotop
		Kernel (kmon)	$terminal -e kmon
		Nvidia GPU (nvtop)	$terminal -e nvtop
		Power (powertop)	$terminal -e powertop
		DNS (dnstop)	$terminal -e powertop
		Network Usage (jnettop)	$terminal -e jnettop
		Network Load (nload)	$terminal -e nload
		Bandwidth (bmon)	$terminal -e bmon
		Media Server	$terminal -e jellyfinips.sh
		Servidor Apache (ping)	xfce4-terminal --maximize --title="Servidor Apache..." -e 'ping 192.168.0.154'
		Servidor Samba  (ping)	xfce4-terminal --maximize --title="Servidor Samba..."  -e 'ping 192.168.0.131'
	 Tematização
		lxappearance 	lxappearance 2> /dev/null
		Google Fonts	xdg-open "https://fonts.google.com/"
		Google Fonts no GitHub	xdg-open "https://github.com/google/fonts"
		Abrir a pasta fonts local		xdg-open ~/.fonts/
		Abrir a pasta fonts Global		pkexec env DISPLAY=:0 XAUTHORITY=/root/.Xauthority  $gerenciador_de_arquivo /usr/share/fonts/
		Instale fonts local	cd $CONFIGDIR/polybar/scripts/  && $terminal -e ./fontes.sh
		 Fontes 	gucharmap
		 .Xresources (Tema do mouse)		$editor_de_texto $HOME/.Xresources && xrdb ${HOME}/.Xresources
		GTK (oomox) 	oomox-gui
		Qt (qt5ct) 	qt5ct --style gtk2
		WPGTK 	wpg
	BleachBit	bleachbit
	Informações e Testes do Sistema	hardinfo
	GSmartControl	/usr/bin/gsmartcontrol-root
	Configurações da Impressora	system-config-printer
	GParted		/usr/bin/gparted-pkexec
	Timeshift	timeshift-launcher
	Ventoy		/opt/ventoy/VentoyGUI.x86_64
	VirtualBox	VirtualBox
	 Notifications	$editor_de_texto $CONFIGDIR/wal/templates/dunstrc
			 Smartphone	kdeconnect-settings --style gtk2
			Configuração avançada de rede	nm-connection-editor
		 Shell
			fish
				config.fish	$editor_de_texto $CONFIGDIR/fish/config.fish
				Web Config	fish -c fish_config
			bash			$editor_de_texto $HOME/.bashrc && source ~/.bashrc
		i3
			 i3 config		$editor_de_texto $CONFIGDIR/i3/config
			Editar i3blocks (barra para i3)	$editor_de_texto ~/.config/i3/i3blocks.conf
			Editar i3status (barra padrão do i3)	$editor_de_texto $CONFIGDIR/i3status/.i3status.conf
			 Atualizar i3		i3-msg restart
			 Editar Menu Iniciar (xmenu.sh)	gksu $editor_de_texto /usr/local/bin/xmenu.sh
		 Compositor
			Picom config		$editor_de_texto $CONFIGDIR/picom/picom.conf
		 Polybar
			Abrir pasta local	xdg-open ~/.config/polybar/
			Editar Polybar (barra para i3)	$editor_de_texto $CONFIGDIR/polybar/config
			launch.sh		$editor_de_texto $CONFIGDIR/polybar/scripts/launch.sh
			 Atualizar polybar	pkill -9 polybar ; cd $CONFIGDIR/polybar/scripts/  && ./launch.sh
			Matar polybar		pkill -9 polybar
		 Rofi
			Abrir pasta local	mkdir -p ~/.config/rofi && xdg-open ~/.config/rofi/
			config		rofi -dump-config > ~/.config/rofi/config.rasi && $editor_de_texto $CONFIGDIR/rofi/config
			template	$editor_de_texto $CONFIGDIR/wal/templates/custom-rofi.rasi
			Alterar o tema do Rofi	rofi-theme-selector
		 Utilities
			 khard		$editor_de_texto $CONFIGDIR/khard/khard.conf
			 khal		$editor_de_texto $CONFIGDIR/khal/config
			 vdirsyncer	$editor_de_texto $CONFIGDIR/vdirsyncer/config
	 Keyboard (Corsair)		ckb-next
	 Smartphone (kdeconnect)		kdeconnect-app --style gtk2
	 Docker (lazydocker)		$terminal -e lazydocker
	 Kill Window	xkill
	 Screen Recording (OBS)		obs
Opções
	 Sair		i3-nagbar -t warning -m 'Você realmente deseja sair do i3? Isso encerrará sua sessão X.' -b 'Sim, saia do i3' 'i3-msg exit'
	 Desligar		sudo poweroff
	 Reiniciar		sudo reboot
	Suspender		
	Hibernar		
	Bloquear tela		i3lock -i ~/.config/i3/i3lock.png &
	Desligar		/usr/local/bin/i3-desligar.sh
	Desligar via polybar	cd ~/.config/polybar/scripts/polybar-scripts/polybar-scripts/popup-powermenu/ && ./popup-powermenu.sh --popup

EOF

