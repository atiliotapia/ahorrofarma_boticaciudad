   e   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        %� �   '�       Courier New -� �   /      @  '  winspool Epson LQ-2070 ESC/P 2 FILE:                                                     �Epson LQ-2070 ESC/P 2            � @ f  	 � �     �   �                                                                                  @ MSUD Epson LQ-2070 ESC/P 2           �       )      d                      �DRIVER=winspool
DEVICE=Epson LQ-2070 ESC/P 2
OUTPUT=FILE:
ORIENTATION=0
PAPERSIZE=9
DEFAULTSOURCE=8
PRINTQUALITY=180
YRESOLUTION=180
TTOPTION=1
          esquemas.codigo                Courier New                    "MEDICINAS SEGUN ESQUEMAS"                                      Arial Narrow                   "CODIGO"                       Arial Narrow                   "DESCRIPCION"                  Arial Narrow                   
"CANTIDAD"                     TITULO01                                                      Courier New                    TITULO02                                                      Courier New                    Courier New                    "P�g:"                         Courier New                    "Fecha:"                       Courier New                    "FRDETAESQUE.FRX"              DATE()                                                        Courier New                    _pageno                                                       Courier New                    esquemas.descripcio            Arial Narrow                   detaesqu.cod_medic             Arial Narrow                   detaesqu.nom_medic             Arial Narrow                   detaesqu.uni_medic             Arial Narrow                   detaesqu.cantidad              Arial Narrow                   esquemas.codigo                Arial Narrow                   Courier New                    Courier New                    Arial Narrow                   Courier New                    Courier New                    Courier New                    Arial Narrow                   Arial Narrow                   dataenvironment                JLeft = 63
Top = 51
Width = 520
Height = 200
Name = "Dataenvironment"
                       cursor                         �Left = 10
Top = 20
Width = 90
Height = 90
Alias = "detaesqu"
Order = "cod_esque"
CursorSource = ..\facturar\detaesqu.dbf
Name = "Cursor1"
                 cursor                         �Left = 150
Top = 20
Width = 90
Height = 90
Alias = "esquemas"
Order = "codigo"
CursorSource = ..\facturar\esquemas.dbf
Name = "Cursor2"
                   relation                       |ParentAlias = "detaesqu"
RelationalExpr = "cod_esque"
ChildAlias = "esquemas"
ChildOrder = "codigo"
Name = "Relation1"
