
Folder: OCR-EN-BnF
-------------
Content: newspapers
Producer: Europeana Newspapers project
Manifest format: METS (UIBK)
OCR FORMAT: ALTO v2.0
Sample: BnF, L'Humanité, 1904-04-18
Notes :
- $typeDoc parameter must be set to "P"
- to compute BNF Ark IDs at document level, newspaper title parameter must be set
on the command line and the title's record ID must be known in %hashNotices

# with Ark IDs:
>perl extractMD.pl -LI ocren Humanite OCR-EN-BnF OUT-OCR-EN-BnF xml
# without Ark IDs:
>perl extractMD.pl -L ocren generic OCR-EN-BnF OUT-OCR-EN-BnF xml


Folder: OCR-EN-SBB
-------------
Content: newspapers
Producer: Europeana Newspapers project
Manifest format: METS (UIBK)
OCR FORMAT: ALTO v2.0
Sample: SB Berlin, Volkszeitung (1890-1904)/Berliner Volkszeitung (1904-1930), 1930-01-01
Notes :
- $typeDoc parameter must be set to "P"
- ALTO files names must be parametrized for SBB OCR in the Perl script:
$numFicALTOdebut = -6 # default: -8
$numFicALTOlong = 3; # default: 4

>perl extractMD.pl -L ocren generic OCR-EN-SBB OUT-OCR-EN-SBB xml


Folder: OLR-EN
-------------
Content: newspapers
Producer: Europeana Newspapers project
Manifest format: METS (CCS profile) with logical structure
OCR FORMAT: ALTO v2.0
Sample: BnF, Le Petit Journal illustré Supplément du dimanche, 10.10.1891
Note :
- $typeDoc parameter must be set to "P"

>perl extractMD.pl -LI olren PJI OLR-EN OUT-OLR-EN xml



Folder: OLR-BnF
-------------
Content: newspapers
Producer: BnF
Manifest format: METS (BnF) with logical structure
OCR FORMAT: ALTO BnF v2.0
Sample: Excelsior, 1910
Note :
- $typeDoc parameter must be set to "P"
- newspaper title parameter must be set with the command line

>perl extractMD.pl -LI olrbnf Excelsior OLR-BnF OUT-OLR-BnF xml


Folder: OCR-BnF-magazines
-----------------
Content: magazines
Producer: BnF
Manifest format: refNum (BnF, http://bibnum.bnf.fr/ns/refNum)
OCR FORMAT: ALTO BnF (http://bibnum.bnf.fr/ns/alto_prod)
Sample: La Restauration maxillo-faciale, 1919
Note :
- $typeDoc parameter must be set to "R"

>perl extractMD.pl -LI ocrbnf generic OCR-BnF-magazines OUT-OCR-BnF-magazines xml


Folder: OCR-BnF-mono
--------------------
Content: monographs
Producer: BnF
Manifest format: refNum (BnF, http://bibnum.bnf.fr/ns/refNum)
OCR FORMAT: ALTO BnF (http://bibnum.bnf.fr/ns/alto_prod)
Sample: Historique du 13e régiment d'artillerie coloniale pendant la guerre 1914-1918
Note:
- the ark IDs must be defined in arks-mono.pl file
- $typeDoc parameter must be set to "M"

>perl extractMD.pl -LI ocrbnf generic OCR-BnF-mono OUT-OCR-BnF-mono xml
