#!/bin/bash

# Util para desintalar as fontes do Windows das pastas ~/.fonts e /usr/share/fonts/TTF/


clear

titulo="Desintala as fontes do Windows da pasta"



rm -Rf /tmp/Arquivo_do_windows_nao_encontrado.log
rm -Rf /tmp/Arquivo_do_windows.log
rm -Rf /tmp/analise.log



# Para gera o arquivo /tmp/windows10.txt
#
# cd /run/media/Goku/Windows 10 Pro/Windows/Fonts
# ls -1 . > /tmp/windows10.txt


# Arquivo de fontes do Windows 10 Pro

echo "8514fix.fon
8514fixe.fon
8514fixg.fon
8514fixr.fon
8514fixt.fon
8514oem.fon
8514oeme.fon
8514oemg.fon
8514oemr.fon
8514oemt.fon
8514sys.fon
8514syse.fon
8514sysg.fon
8514sysr.fon
8514syst.fon
85775.fon
85855.fon
85f1255.fon
85f1256.fon
85f1257.fon
85f874.fon
85s1255.fon
85s1256.fon
85s1257.fon
85s874.fon
AGENCYB.TTF
AGENCYR.TTF
ALGER.TTF
ANTQUAB.TTF
ANTQUABI.TTF
ANTQUAI.TTF
ARIALN.TTF
ARIALNB.TTF
ARIALNBI.TTF
ARIALNI.TTF
ARIALUNI.TTF
ARLRDBD.TTF
Alef-Bold.ttf
Alef-Regular.ttf
Amiri-Bold.ttf
Amiri-BoldSlanted.ttf
Amiri-Regular.ttf
Amiri-Slanted.ttf
AmiriQuran.ttf
BASKVILL.TTF
BAUHS93.TTF
BELL.TTF
BELLB.TTF
BELLI.TTF
BERNHC.TTF
BKANT.TTF
BOD_B.TTF
BOD_BI.TTF
BOD_BLAI.TTF
BOD_BLAR.TTF
BOD_CB.TTF
BOD_CBI.TTF
BOD_CI.TTF
BOD_CR.TTF
BOD_I.TTF
BOD_PSTC.TTF
BOD_R.TTF
BOOKOS.TTF
BOOKOSB.TTF
BOOKOSBI.TTF
BOOKOSI.TTF
BRADHITC.TTF
BRITANIC.TTF
BRLNSB.TTF
BRLNSDB.TTF
BRLNSR.TTF
BROADW.TTF
BRUSHSCI.TTF
BSSYM7.TTF
CALIFB.TTF
CALIFI.TTF
CALIFR.TTF
CALIST.TTF
CALISTB.TTF
CALISTBI.TTF
CALISTI.TTF
CASTELAR.TTF
CENSCBK.TTF
CENTAUR.TTF
CENTURY.TTF
CHILLER.TTF
COLONNA.TTF
COOPBL.TTF
COPRGTB.TTF
COPRGTL.TTF
CURLZ___.TTF
Caladea-Bold.ttf
Caladea-BoldItalic.ttf
Caladea-Italic.ttf
Caladea-Regular.ttf
Candara.ttf
Candarab.ttf
Candarai.ttf
Candaraz.ttf
Carlito-Bold.ttf
Carlito-BoldItalic.ttf
Carlito-Italic.ttf
Carlito-Regular.ttf
DavidCLM-Bold.ttf
DavidCLM-BoldItalic.ttf
DavidCLM-Medium.ttf
DavidCLM-MediumItalic.ttf
DavidLibre-Bold.ttf
DavidLibre-Regular.ttf
DejaVuMathTeXGyre.ttf
DejaVuSans-Bold.ttf
DejaVuSans-BoldOblique.ttf
DejaVuSans-ExtraLight.ttf
DejaVuSans-Oblique.ttf
DejaVuSans.ttf
DejaVuSansCondensed-Bold.ttf
DejaVuSansCondensed-BoldOblique.ttf
DejaVuSansCondensed-Oblique.ttf
DejaVuSansCondensed.ttf
DejaVuSansMono-Bold.ttf
DejaVuSansMono-BoldOblique.ttf
DejaVuSansMono-Oblique.ttf
DejaVuSansMono.ttf
DejaVuSerif-Bold.ttf
DejaVuSerif-BoldItalic.ttf
DejaVuSerif-Italic.ttf
DejaVuSerif.ttf
DejaVuSerifCondensed-Bold.ttf
DejaVuSerifCondensed-BoldItalic.ttf
DejaVuSerifCondensed-Italic.ttf
DejaVuSerifCondensed.ttf
ELEPHNT.TTF
ELEPHNTI.TTF
ENGR.TTF
ERASBD.TTF
ERASDEMI.TTF
ERASLGHT.TTF
ERASMD.TTF
EmojiOneColor-SVGinOT.ttf
FELIXTI.TTF
FORTE.TTF
FRABK.TTF
FRABKIT.TTF
FRADM.TTF
FRADMCN.TTF
FRADMIT.TTF
FRAHV.TTF
FRAHVIT.TTF
FRAMDCN.TTF
FREESCPT.TTF
FRSCRIPT.TTF
FTLTLT.TTF
FrankRuehlCLM-Bold.ttf
FrankRuehlCLM-BoldOblique.ttf
FrankRuehlCLM-Medium.ttf
FrankRuehlCLM-MediumOblique.ttf
FrankRuhlHofshi-Bold.otf
FrankRuhlHofshi-Regular.otf
GARA.TTF
GARABD.TTF
GARAIT.TTF
GIGI.TTF
GILBI___.TTF
GILB____.TTF
GILC____.TTF
GILI____.TTF
GILLUBCD.TTF
GILSANUB.TTF
GIL_____.TTF
GLECB.TTF
GLSNECB.TTF
GOTHIC.TTF
GOTHICB.TTF
GOTHICBI.TTF
GOTHICI.TTF
GOUDOS.TTF
GOUDOSB.TTF
GOUDOSI.TTF
GOUDYSTO.TTF
Gabriola.ttf
GenBasB.ttf
GenBasBI.ttf
GenBasI.ttf
GenBasR.ttf
GenBkBasB.ttf
GenBkBasBI.ttf
GenBkBasI.ttf
GenBkBasR.ttf
HARLOWSI.TTF
HARNGTON.TTF
HATTEN.TTF
HTOWERT.TTF
HTOWERTI.TTF
IMPRISHA.TTF
INFROMAN.TTF
ITCBLKAD.TTF
ITCEDSCR.TTF
ITCKRIST.TTF
JOKERMAN.TTF
JUICE___.TTF
KUNSTLER.TTF
KacstBook.ttf
KacstOffice.ttf
LATINWD.TTF
LBRITE.TTF
LBRITED.TTF
LBRITEDI.TTF
LBRITEI.TTF
LCALLIG.TTF
LFAX.TTF
LFAXD.TTF
LFAXDI.TTF
LFAXI.TTF
LHANDW.TTF
LSANS.TTF
LSANSD.TTF
LSANSDI.TTF
LSANSI.TTF
LTYPE.TTF
LTYPEB.TTF
LTYPEBO.TTF
LTYPEO.TTF
LeelUIsl.ttf
LeelaUIb.ttf
LeelawUI.ttf
LiberationMono-Bold.ttf
LiberationMono-BoldItalic.ttf
LiberationMono-Italic.ttf
LiberationMono-Regular.ttf
LiberationSans-Bold.ttf
LiberationSans-BoldItalic.ttf
LiberationSans-Italic.ttf
LiberationSans-Regular.ttf
LiberationSansNarrow-Bold.ttf
LiberationSansNarrow-BoldItalic.ttf
LiberationSansNarrow-Italic.ttf
LiberationSansNarrow-Regular.ttf
LiberationSerif-Bold.ttf
LiberationSerif-BoldItalic.ttf
LiberationSerif-Italic.ttf
LiberationSerif-Regular.ttf
LinBiolinum_RB_G.ttf
LinBiolinum_RI_G.ttf
LinBiolinum_R_G.ttf
LinLibertine_DR_G.ttf
LinLibertine_RBI_G.ttf
LinLibertine_RB_G.ttf
LinLibertine_RI_G.ttf
LinLibertine_RZI_G.ttf
LinLibertine_RZ_G.ttf
LinLibertine_R_G.ttf
MAGNETOB.TTF
MAIAN.TTF
MATURASC.TTF
MEIRYO.TTC
MEIRYOB.TTC
MISTRAL.TTF
MOD20.TTF
MTCORSVA.TTF
MiriamCLM-Bold.ttf
MiriamCLM-Book.ttf
MiriamLibre-Bold.otf
MiriamLibre-Regular.otf
MiriamMonoCLM-Bold.ttf
MiriamMonoCLM-BoldOblique.ttf
MiriamMonoCLM-Book.ttf
MiriamMonoCLM-BookOblique.ttf
NIAGENG.TTF
NIAGSOL.TTF
NachlieliCLM-Bold.otf
NachlieliCLM-BoldOblique.otf
NachlieliCLM-Light.otf
NachlieliCLM-LightOblique.otf
Nirmala.ttf
NirmalaB.ttf
NirmalaS.ttf
NotoKufiArabic-Bold.ttf
NotoKufiArabic-Regular.ttf
NotoMono-Regular.ttf
NotoNaskhArabic-Bold.ttf
NotoNaskhArabic-Regular.ttf
NotoNaskhArabicUI-Bold.ttf
NotoNaskhArabicUI-Regular.ttf
NotoSans-Bold.ttf
NotoSans-BoldItalic.ttf
NotoSans-Condensed.ttf
NotoSans-CondensedBold.ttf
NotoSans-CondensedBoldItalic.ttf
NotoSans-CondensedItalic.ttf
NotoSans-Italic.ttf
NotoSans-Light.ttf
NotoSans-LightItalic.ttf
NotoSans-Regular.ttf
NotoSansArabic-Bold.ttf
NotoSansArabic-Regular.ttf
NotoSansArabicUI-Bold.ttf
NotoSansArabicUI-Regular.ttf
NotoSansArmenian-Bold.ttf
NotoSansArmenian-Regular.ttf
NotoSansGeorgian-Bold.ttf
NotoSansGeorgian-Regular.ttf
NotoSansHebrew-Bold.ttf
NotoSansHebrew-Regular.ttf
NotoSansLao-Bold.ttf
NotoSansLao-Regular.ttf
NotoSansLisu-Regular.ttf
NotoSerif-Bold.ttf
NotoSerif-BoldItalic.ttf
NotoSerif-Condensed.ttf
NotoSerif-CondensedBold.ttf
NotoSerif-CondensedBoldItalic.ttf
NotoSerif-CondensedItalic.ttf
NotoSerif-Italic.ttf
NotoSerif-Light.ttf
NotoSerif-LightItalic.ttf
NotoSerif-Regular.ttf
NotoSerifArmenian-Bold.ttf
NotoSerifArmenian-Regular.ttf
NotoSerifGeorgian-Bold.ttf
NotoSerifGeorgian-Regular.ttf
NotoSerifHebrew-Bold.ttf
NotoSerifHebrew-Regular.ttf
NotoSerifLao-Bold.ttf
NotoSerifLao-Regular.ttf
OCRAEXT.TTF
OLDENGL.TTF
ONYX.TTF
OUTLOOK.TTF
PALSCRI.TTF
PAPYRUS.TTF
PARCHM.TTF
PERBI___.TTF
PERB____.TTF
PERI____.TTF
PERTIBD.TTF
PERTILI.TTF
PER_____.TTF
PLAYBILL.TTF
POORICH.TTF
PRISTINA.TTF
RAGE.TTF
RAVIE.TTF
REFSAN.TTF
REFSPCL.TTF
ROCCB___.TTF
ROCC____.TTF
ROCK.TTF
ROCKB.TTF
ROCKBI.TTF
ROCKEB.TTF
ROCKI.TTF
ReemKufi-Regular.ttf
Rubik-Bold.ttf
Rubik-BoldItalic.ttf
Rubik-Italic.ttf
Rubik-Regular.ttf
SCHLBKB.TTF
SCHLBKBI.TTF
SCHLBKI.TTF
SCRIPTBL.TTF
SHOWG.TTF
SNAP____.TTF
STENCIL.TTF
Scheherazade-Bold.ttf
Scheherazade-Regular.ttf
Sitka.ttc
SitkaB.ttc
SitkaI.ttc
SitkaZ.ttc
SourceCodePro-Black.ttf
SourceCodePro-BlackIt.ttf
SourceCodePro-Bold.ttf
SourceCodePro-BoldIt.ttf
SourceCodePro-ExtraLight.ttf
SourceCodePro-ExtraLightIt.ttf
SourceCodePro-It.ttf
SourceCodePro-Light.ttf
SourceCodePro-LightIt.ttf
SourceCodePro-Medium.ttf
SourceCodePro-MediumIt.ttf
SourceCodePro-Regular.ttf
SourceCodePro-Semibold.ttf
SourceCodePro-SemiboldIt.ttf
SourceSansPro-Black.ttf
SourceSansPro-BlackIt.ttf
SourceSansPro-Bold.ttf
SourceSansPro-BoldIt.ttf
SourceSansPro-ExtraLight.ttf
SourceSansPro-ExtraLightIt.ttf
SourceSansPro-It.ttf
SourceSansPro-Light.ttf
SourceSansPro-LightIt.ttf
SourceSansPro-Regular.ttf
SourceSansPro-Semibold.ttf
SourceSansPro-SemiboldIt.ttf
SourceSerifPro-Black.ttf
SourceSerifPro-BlackIt.ttf
SourceSerifPro-Bold.ttf
SourceSerifPro-BoldIt.ttf
SourceSerifPro-ExtraLight.ttf
SourceSerifPro-ExtraLightIt.ttf
SourceSerifPro-It.ttf
SourceSerifPro-Light.ttf
SourceSerifPro-LightIt.ttf
SourceSerifPro-Regular.ttf
SourceSerifPro-Semibold.ttf
SourceSerifPro-SemiboldIt.ttf
StaticCache.dat
TCBI____.TTF
TCB_____.TTF
TCCB____.TTF
TCCEB.TTF
TCCM____.TTF
TCMI____.TTF
TCM_____.TTF
TEMPSITC.TTF
VINERITC.TTF
VIVALDII.TTF
VLADIMIR.TTF
WINGDNG2.TTF
WINGDNG3.TTF
YuGothB.ttc
YuGothL.ttc
YuGothM.ttc
YuGothR.ttc
app775.fon
app850.fon
app852.fon
app855.fon
app857.fon
app866.fon
app932.fon
app936.fon
app949.fon
app950.fon
arial.ttf
arialbd.ttf
arialbi.ttf
ariali.ttf
ariblk.ttf
c8514fix.fon
c8514oem.fon
c8514sys.fon
calibri.ttf
calibrib.ttf
calibrii.ttf
calibril.ttf
calibrili.ttf
calibriz.ttf
cambria.ttc
cambriab.ttf
cambriai.ttf
cambriaz.ttf
cga40737.fon
cga40850.fon
cga40852.fon
cga40857.fon
cga40866.fon
cga40869.fon
cga40woa.fon
cga80737.fon
cga80850.fon
cga80852.fon
cga80857.fon
cga80866.fon
cga80869.fon
cga80woa.fon
comic.ttf
comicbd.ttf
comici.ttf
comicz.ttf
consola.ttf
consolab.ttf
consolai.ttf
consolaz.ttf
constan.ttf
constanb.ttf
constani.ttf
constanz.ttf
corbel.ttf
corbelb.ttf
corbeli.ttf
corbelz.ttf
coue1255.fon
coue1256.fon
coue1257.fon
couf1255.fon
couf1256.fon
couf1257.fon
cour.ttf
courbd.ttf
courbi.ttf
coure.fon
couree.fon
coureg.fon
courer.fon
couret.fon
courf.fon
courfe.fon
courfg.fon
courfr.fon
courft.fon
couri.ttf
cvgafix.fon
cvgasys.fon
desktop.ini
dos737.fon
dos869.fon
dosapp.fon
ebrima.ttf
ebrimabd.ttf
ega40737.fon
ega40850.fon
ega40852.fon
ega40857.fon
ega40866.fon
ega40869.fon
ega40woa.fon
ega80737.fon
ega80850.fon
ega80852.fon
ega80857.fon
ega80866.fon
ega80869.fon
ega80woa.fon
fms_metadata.xml
framd.ttf
framdit.ttf
gadugi.ttf
gadugib.ttf
georgia.ttf
georgiab.ttf
georgiai.ttf
georgiaz.ttf
h8514fix.fon
h8514oem.fon
h8514sys.fon
himalaya.ttf
hvgafix.fon
hvgasys.fon
impact.ttf
j8514fix.fon
j8514oem.fon
j8514sys.fon
javatext.ttf
jsmalle.fon
jsmallf.fon
jvgafix.fon
jvgasys.fon
l_10646.ttf
lucon.ttf
malgun.ttf
malgunbd.ttf
malgunsl.ttf
marlett.ttf
micross.ttf
mingliub.ttc
mmrtext.ttf
mmrtextb.ttf
modern.fon
monbaiti.ttf
msjh.ttc
msjhbd.ttc
msjhl.ttc
msyh.ttc
msyhbd.ttc
msyhl.ttc
msyi.ttf
mvboli.ttf
ntailu.ttf
ntailub.ttf
opens___.ttf
pala.ttf
palab.ttf
palabi.ttf
palai.ttf
phagspa.ttf
phagspab.ttf
roman.fon
s8514fix.fon
s8514oem.fon
s8514sys.fon
script.fon
segmdl2.ttf
segoepr.ttf
segoeprb.ttf
segoesc.ttf
segoescb.ttf
segoeui.ttf
segoeuib.ttf
segoeuii.ttf
segoeuil.ttf
segoeuisl.ttf
segoeuiz.ttf
seguibl.ttf
seguibli.ttf
seguiemj.ttf
seguihis.ttf
seguili.ttf
seguisb.ttf
seguisbi.ttf
seguisli.ttf
seguisym.ttf
sere1255.fon
sere1256.fon
sere1257.fon
serf1255.fon
serf1256.fon
serf1257.fon
serife.fon
serifee.fon
serifeg.fon
serifer.fon
serifet.fon
seriff.fon
seriffe.fon
seriffg.fon
seriffr.fon
serifft.fon
simsun.ttc
simsunb.ttf
smae1255.fon
smae1256.fon
smae1257.fon
smaf1255.fon
smaf1256.fon
smaf1257.fon
smalle.fon
smallee.fon
smalleg.fon
smaller.fon
smallet.fon
smallf.fon
smallfe.fon
smallfg.fon
smallfr.fon
smallft.fon
ssee1255.fon
ssee1256.fon
ssee1257.fon
ssee874.fon
ssef1255.fon
ssef1256.fon
ssef1257.fon
ssef874.fon
sserife.fon
sserifee.fon
sserifeg.fon
sserifer.fon
sserifet.fon
sseriff.fon
sseriffe.fon
sseriffg.fon
sseriffr.fon
sserifft.fon
svgafix.fon
svgasys.fon
sylfaen.ttf
symbol.ttf
tahoma.ttf
tahomabd.ttf
taile.ttf
taileb.ttf
times.ttf
timesbd.ttf
timesbi.ttf
timesi.ttf
trebuc.ttf
trebucbd.ttf
trebucbi.ttf
trebucit.ttf
verdana.ttf
verdanab.ttf
verdanai.ttf
verdanaz.ttf
vga737.fon
vga775.fon
vga850.fon
vga852.fon
vga855.fon
vga857.fon
vga860.fon
vga861.fon
vga863.fon
vga865.fon
vga866.fon
vga869.fon
vga932.fon
vga936.fon
vga949.fon
vga950.fon
vgaf1255.fon
vgaf1256.fon
vgaf1257.fon
vgaf874.fon
vgafix.fon
vgafixe.fon
vgafixg.fon
vgafixr.fon
vgafixt.fon
vgaoem.fon
vgas1255.fon
vgas1256.fon
vgas1257.fon
vgas874.fon
vgasys.fon
vgasyse.fon
vgasysg.fon
vgasysr.fon
vgasyst.fon
webdings.ttf
wingding.ttf" > /tmp/windows10.txt




# -----------------------------------------------------------------------------------------------------

# Local:
#
#
# $HOME/.fonts
#
# /usr/share/fonts/TTF/
#


# Diretório a ser organizado alfabeticamente:

diretorio=$(zenity \
--entry \
--title="$titulo" \
--text "Informe a pasta de destino das fontes do Windows." \
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

echo "
Local:
" > /tmp/Arquivo_do_windows_nao_encontrado.log

pwd >> /tmp/Arquivo_do_windows_nao_encontrado.log

echo "

" >> /tmp/Arquivo_do_windows_nao_encontrado.log




echo "
Local:
" > /tmp/Arquivo_do_windows.log

pwd >> /tmp/Arquivo_do_windows.log

echo "

" >> /tmp/Arquivo_do_windows.log





# Como ler um arquivo linha por linha 
#
# A solução é utilizar um loop while



# ATENÇÂO: O arquivo /tmp/windows10.txt deve esta na codificação para Linux e não para Windows.
#
# Exemplo de codificação de Windows:
#
# ls: não é possível acessar '/home/goku/.fonts/arial.ttf'$'\r': Arquivo ou diretório não encontrado


while read LINE;do

ls "$diretorio"/"$LINE" >> /tmp/Arquivo_do_windows.log;
ls "$diretorio"/"$LINE" 2>> /tmp/Arquivo_do_windows_nao_encontrado.log;

# find "$diretorio" -iname "$LINE" | tee -a /tmp/analise.log;

# find "$diretorio" -iname "$LINE" -exec rm -f {} \; | tee -a /tmp/analise.log


rm -Rf "$diretorio"/"$LINE" 2>> /tmp/analise.log


done < /tmp/windows10.txt


echo "

" >> /tmp/Arquivo_do_windows.log


echo "

" >> /tmp/Arquivo_do_windows_nao_encontrado.log



xdg-open /tmp/Arquivo_do_windows.log
xdg-open /tmp/Arquivo_do_windows_nao_encontrado.log
xdg-open /tmp/analise.log


# https://br.ccm.net/faq/2269-como-ler-um-arquivo-linha-por-linha
# https://www.delftstack.com/pt/howto/linux/how-to-read-a-file-line-by-line-using-bash/
# https://meleu.sh/percorrer-arquivo/
# https://mariano.eng.br/como-resolver-erro-no-such-file-or-directory-arquivo-diretorio-nao-encontrado/


exit 0

