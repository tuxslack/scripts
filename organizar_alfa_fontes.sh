#!/bin/bash
# 
# Organizar arquivos por nome
# 
# Organizar alfabeticamente
# 
# Organizar alfabeticamente (a b c d e f g h i j k l m n o p q r s t u v w x y z) os seus arquivos de fontes .{ttf,TTF,otf,OTF,woff,woff2,eot,pfm,pfb,ttc,TTC,afm,fon,FON} 
#
#
#
# 
# 
# FON é um arquivo de biblioteca de fontes do Windows 3.x que contém um formato de fonte mais 
# antiga que não pode ser redimensionada para qualquer tamanho, como uma fonte TrueType.
# 
# https://www.openthefile.net/pt/extension/fon
# 
# 
# TTF é um formato de arquivo de fonte criado pela Apple, usado em ambas as plataformas Mac 
# e Windows. Ele pode ser redimensionado sem perda de qualidade, e parece o mesmo quando 
# impressos como ele faz na tela. TTF é o formato de fonte mais comum. 
# 
# https://www.openthefile.net/pt/extension/ttf
# 
# 
# A extensão do arquivo .otf é usado como um arquivo de fonte OpenType em que este tipo de 
# fonte foi desenvolvido pela Adobe e Microsoft. É uma combinação de formatos de fonte, tais 
# como TrueType e Postscripts. Além de ser um arquivo tipo de fonte, a extensão do arquivo .otf 
# também é usado como um arquivo de modelo que? S usado por planilhas do OpenOffice para a 
# criação de fórmulas. Esses arquivos de modelo .otf são úteis porque eles automaticamente 
# preencher planilhas com o uso de fórmulas. Essa extensão de arquivo também é usado como um 
# arquivo de OpenTuft Tufting projeto e se refere a formatos utilizados para criar desenhos 
# de tufos. Estes ficheiros .otf torná-lo possível tecer desenhos em uma variedade de produtos 
# têxteis. Esses arquivos também contêm fios colocação, linha ups e informações de comprimento 
# tufo. Este formato .otf foi usado por NedGraphics por seus desenhos de tufos mas foi mudado 
# porque havia conflito com extensão de arquivo .otf sendo usados ​​como fontes OpenType. Outras 
# aplicações associadas com a extensão de arquivo .otf são Blu-ray e onkos. 
# 
# https://www.openthefile.net/pt/extension/otf
# 
# 
# arquivos EOT segurar fonte OpenType incorporado em um documento como uma página da web ou 
# apresentação PowerPoint. Eles são muitas vezes incorporado com Microsoft Web Embedding 
# ferramenta fontes e guardados juntamente com o documento associado. arquivos EOT não se 
# destinam a ser abertas manualmente. 
# 
# https://www.openthefile.net/pt/extension/eot
# 
# 
# TTC é um arquivo que contém uma coleção de fontes salvos no formato TrueType. Ele é 
# usado para entregar várias fontes em um único arquivo; útil para combinar fontes que 
# compartilham muitos glifos em comum. 
# 
# https://www.openthefile.net/pt/extension/ttc




# Para listar em ordem alfabética

# Por padrão, o ls -l ou ls -1 lista em ordem alfabética.
# Mas, como será listado o conteúdo de dois diretórios, posteriormente, terá que usar o sort...


# ls | sort

# https://www.vivaolinux.com.br/topico/Shell-Script/Programa-Shell-para-listar-em-ordem-alfabetica
# https://stackoverflow.com/questions/17575840/better-way-to-generate-array-of-all-letters-in-the-alphabet
# https://www.vivaolinux.com.br/topico/Shell-Script/Laco-para-percorrer-arquivos-de-diretorio
# https://www.vivaolinux.com.br/topico/Shell-Script/Script-para-organizacao-de-arquivos-1



#for i in `ls *.ttf *.TTF *.otf *.woff *.woff2 | sort`;
#do

# find . -print0 -iname "*doc" -o -iname "*xls" | xargs -0 mv {} "$i"

#done
 
# for i in $(find "$diretorio" -type f -iname *.ttf -or -iname *.otf)


# -----------------------------------------------------------------------------------------------------


# -----------------------------------------------------------------------------------------------------

clear


# Arquivo de log

log="/tmp/fonts.txt"

titulo="Organizar alfabeticamente as fontes"


rm -Rf "$log"

rm -Rf /tmp/"lista completa.txt"

# -----------------------------------------------------------------------------------------------------

# Diretório a ser organizado alfabeticamente:

diretorio=$(zenity \
--entry \
--title="$titulo" \
--text "Informe a pasta de destino das fontes." \
--entry-text "$HOME/.fonts" 2> /dev/null)


# -----------------------------------------------------------------------------------------------------

clear

# Verificar se diretorio existe

if [ ! -d "$diretorio" ]; then

echo "
Pasta $diretorio não localizada.
"

    exit 1
fi

# -----------------------------------------------------------------------------------------------------

clear


cd "$diretorio"


# Cria os subdiretórios de a..z:

echo "
Criando as pastas...
"

# echo "
# Listando em ordem alfabética os arquivos de fontes:
# "

# for i in a b c d e f g h i j k l m n o p q r s t u v w x y z ;



                 for i in {a..z}; 

                 do

                     mkdir -p "$i"

                     echo "$i"

                     mv -i "$i"*.{ttf,TTF,otf,OTF,woff,woff2,eot,pfm,pfb,ttc,TTC,afm,fon,FON} ${i}/ 2>> "$log"


                done
 


echo "

" >> "$log"



                 for y in {A..Z}; 

                 do

                     mkdir -p "$y"

                     echo "$y"

                     mv -i "$y"*.{ttf,TTF,otf,OTF,woff,woff2,eot,pfm,pfb,ttc,TTC,afm,fon,FON} ${y}/ 2>> "$log"


                done
 


sleep 2

clear

echo "
Movendo os arquivos de fontes...
"

mv -i	A/*	a/
mv -i	B/*	b/
mv -i	C/*	c/
mv -i	D/*	d/
mv -i	E/*	e/
mv -i	F/*	f/
mv -i	G/*	g/
mv -i	H/*	h/
mv -i	I/*	i/
mv -i	J/*	j/
mv -i	K/*	k/
mv -i	L/*	l/
mv -i	M/*	m/
mv -i	N/*	n/
mv -i	O/*	o/
mv -i	P/*	p/
mv -i	Q/*	q/
mv -i	R/*	r/
mv -i	S/*	s/
mv -i	T/*	t/
mv -i	U/*	u/
mv -i	V/*	v/
mv -i	W/*	w/
mv -i	X/*	x/
mv -i	Y/*	y/
mv -i	Z/*	z/


sleep 3
clear

echo "
Verificar pastas vazias, exclui-las do diretorio $diretorio
"
find "$diretorio" -empty -type d -exec rmdir {} \; 2> /dev/null

# https://www.vivaolinux.com.br/topico/Shell-Script/Verificar-pastas-vazias-excluilas.




# -----------------------------------------------------------------------------------------------------

sleep 2
clear


echo "
Local: $diretorio
" >> /tmp/"lista completa.txt"


                 for i in {a..z}; 

                 do



if [ -e "$i" ]
then

echo "O diretorio $i existe"





echo "


=================================================================================
                                 Letra $i:
=================================================================================


" >> /tmp/"lista completa.txt"

                     ls -1 ${i}/ >> /tmp/"lista completa.txt" 2>> "$log"






else

echo "O diretorio $i não existe" | tee "$log"

fi


                done





echo "


=================================================================================


Tamanho dos arquivos: `du -sh "$diretorio" | cut -d"/" -f1`

" >> /tmp/"lista completa.txt"



echo "
Tamanho da pasta: "

du -sh "$diretorio" | cut -d"/" -f1 | tee "$log"



mv  /tmp/"lista completa.txt" "$diretorio"/


# -----------------------------------------------------------------------------------------------------






sleep 2
clear


echo "
As fontes que ficou na pasta $diretorio
" >> "$log"


ls -1 *.{ttf,TTF,otf,OTF,woff,woff2,eot,pfm,pfb,ttc,TTC,afm,fon,FON} | tee "$log"


# -----------------------------------------------------------------------------------------------------

xdg-open "$diretorio"/"lista completa.txt"

xdg-open "$log"


exit 0

