   u   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        �i�\ʻ:�G��K�      Courier New������8}&�{+�      8    winspool EPSON LX-300+ LPT1:                            �EPSON LX-300+                    � @ n�  ��   x   �                                                                                @ MSUD
EPSON LX-300+                   �             d                      �DRIVER=winspool
DEVICE=EPSON LX-300+
OUTPUT=LPT1:
ORIENTATION=0
PAPERSIZE=1
DEFAULTSOURCE=267
PRINTQUALITY=120
COLOR=2
YRESOLUTION=144
TTOPTION=1
       "@I"                           Draft 12cpi                    $"REPORTE GENERAL DE STOCKS ACTUALES"                            TITULO01                                                      Draft 17cpi                    TITULO02                                                      Draft 17cpi                    Draft 17cpi                    "CODIGO"                       Draft 17cpi                    "DESCRIPCION"                  "@I"                           Draft 17cpi                                                   "TOTAL"                        Draft 17cpi                                                   	"R E A L"                      Draft 17cpi                                                   "TARAP."                       Draft 17cpi                                                   "LORETO"                       Draft 17cpi                                                   "JAUJA"                        Courier New                    ^"============================================================================================"                                    Draft 17cpi                    "UNID."                        Courier New                    ^"============================================================================================"                                    Ntmpstocks.codigo+"    "+SUBS(tmpstocks.descripcio,1,45)+"    "+tmpstocks.forma                                                  Draft 17cpi                    �STR(tmpstocks.real,6)+"  "+STR(tmpstocks.tarapaca,6)+"  "+STR(tmpstocks.loreto,6)+"  "+STR(tmpstocks.jauja,6)+"  "+STR(tmpstocks.total,6)+"  "+SUBS(tmpstocks.laborato,1,20)                                                       Draft 17cpi                    Draft 17cpi                                                   "LABORATORIO"                  _pageno                                                       Arial Narrow                   Arial Narrow                   "P�g:"                         Courier New                    "FRSALDSTKS.FRX"               DATE()                                                        Arial Narrow                   Arial Narrow                   "FECHA:"                       Courier New                    Draft 12cpi                    Draft 17cpi                    Arial Narrow                   Courier New                    dataenvironment                aTop = 256
Left = 248
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                                 cursor                         �Top = 20
Left = 10
Height = 90
Width = 90
Alias = "tmpstocks"
CursorSource = ..\..\sigep\temp\tmpstocks.dbf
Name = "Cursor1"
                         