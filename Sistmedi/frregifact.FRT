   �   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                              Courier New                    9  "  winspool  HP LaserJet 5L  LPT1:                        �HP LaserJet 5L                   � 4C� 	 �4d   X  X  A4                                                            ����                DINU"   4  �Z��                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                       �DRIVER=winspool
DEVICE=HP LaserJet 5L
OUTPUT=LPT1:
ORIENTATION=0
PAPERSIZE=9
ASCII=9
COPIES=1
DEFAULTSOURCE=15
PRINTQUALITY=600
COLOR=2
YRESOLUTION=600
TTOPTION=2
COLLATE=1
          TPTABLDO.FECHA                 tptabldo.tipcp+ tptabldo.serie                                  Draft 10cpi                     "DETALLE DE VENTAS CON FACTURAS"                                TITULO01                                                      Courier New                    TITULO02                                                      Courier New                    Courier New                    "P�g:"                         Courier New                    "Fecha:"                       Courier New                    "FRTABING.FRX"                 DATE()                                                        Courier New                    _pageno                                                       Courier New                    Times New Roman                "PERIODO :"                    FEC01                                                         Times New Roman                Arial Narrow                   "COMPROBANTE"                  "@I"                           Arial Narrow                   "FECHAEMISION"                Arial Narrow                   "R U C"                        Arial Narrow                   "RAZON SOCIAL"                 "@I"                           Arial Narrow                   "I G V"                        "@I"                           Arial Narrow                   "TOTALVENTA"                  Draft 12cpi                    "TOTAL GENERAL"                Draft 15cpi                    tptabldo.tipvt="A"                                            "A  N  U  L  A  D  O"          Courier New                    "Hora :"                       TIME()                                                        Courier New                    tptabldo.vventa                                               Draft 15cpi                    tptabldo.tipvt!="A"            ?tptabldo.tipvt+"  "+tptabldo.serie+" - "+STR(tptabldo.numero,6)                                                                 Draft 15cpi                    Draft 15cpi                    "Total"                        Courier New                    a"-----------------------------------------------------------------------------------------------"                                 tptabldo.fecha                                                Draft 15cpi                    FEC02                                                         Times New Roman                tptabldo.fecha                                                Draft 15cpi                    tptabldo.igv                                                  Draft 15cpi                    tptabldo.tipvt!="A"            tptabldo.total_fact                                           Draft 15cpi                    tptabldo.tipvt!="A"            tptabldo.ruc                                                  Draft 15cpi                    tptabldo.tipvt!="A"            clientes.razon_soci                                           Draft 15cpi                    tptabldo.tipvt!="A"            "@I"                           Arial Narrow                   "VALOR VENTA"                 tptabldo.vventa                                               Draft 15cpi                    tptabldo.tipvt!="A"            tptabldo.igv                                                  Draft 15cpi                    tptabldo.tipvt!="A"            tptabldo.total_fact                                           Draft 15cpi                    tptabldo.tipvt!="A"            tptabldo.vventa                                               Draft 15cpi                    tptabldo.tipvt!="A"            tptabldo.igv                                                  Draft 15cpi                    tptabldo.tipvt!="A"            tptabldo.total_fact                                           Draft 15cpi                    tptabldo.tipvt!="A"            NOMREP                                                        Courier New                    Times New Roman                "Al"                           Courier New                    Draft 10cpi                    Courier New                    Courier New                    Courier New                    Times New Roman                Times New Roman                Arial Narrow                   Draft 12cpi                    Draft 15cpi                    Draft 15cpi                    dataenvironment                aTop = 352
Left = 157
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                                 cursor                         Top = 20
Left = 10
Height = 90
Width = 90
Alias = "tptabldo"
CursorSource = c:\sigep\temp\tptabldo.dbf
Name = "Cursor1"
                                    cursor                         ~Top = 20
Left = 150
Height = 90
Width = 90
Alias = "clientes"
CursorSource = ..\facturar\clientes.dbf
Name = "Cursor2"
                                     relation                       sParentAlias = "tptabldo"
RelationalExpr = "ruc"
ChildAlias = "clientes"
ChildOrder = "ruc"
Name = "Relation1"
                