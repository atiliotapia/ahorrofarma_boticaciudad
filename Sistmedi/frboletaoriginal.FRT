   �   !                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                                        jS��B �B�`�      Courier New�� !���A�a�!      D  $  winspool HP LaserJet 5L PCL LPT1:                                                        �HP LaserJet 5L PCL               � @ g   ��    ,  ,                                                                 	              @ MSUD7HP LaserJet 5L PCL              �      %     d 
                                                     �DRIVER=winspool
DEVICE=HP LaserJet 5L PCL
OUTPUT=LPT1:
ORIENTATION=0
PAPERSIZE=1
COPIES=1
DEFAULTSOURCE=1
PRINTQUALITY=300
YRESOLUTION=300
TTOPTION=1
                                    SUBS(tmpfactu.medicina1,1,1)                                                                   Draft 17cpi                    tmpfactu.nom_comer             Draft 17cpi                    tmpfactu.forma                 Draft 17cpi                    tmpfactu.prec_uni1                                            Draft 17cpi                    "999.99"                       tmpfactu.cantid1               Draft 17cpi                    tmpfactu.total1                                               Draft 17cpi                    
"99999.99"                     SUBS(tmpfactu.medicina1,3,5)                                                                   Draft 17cpi                    SUBS(tmpfactu.medicina1,1,1)                                                                   Draft 17cpi                    tmpfactu.nom_comer             Draft 17cpi                    tmpfactu.forma                 Draft 17cpi                    tmpfactu.prec_uni1                                            Draft 17cpi                    "999.99"                       tmpfactu.cantid1               Draft 17cpi                    tmpfactu.total1                                               Draft 17cpi                    
"99999.99"                     SUBS(tmpfactu.medicina1,3,5)                                                                   Draft 17cpi                    mensajes.mensaje01             Draft 17cpi                    mensajes.mensaje02             Draft 17cpi                    mensajes.mensaje01             Draft 17cpi                    mensajes.mensaje02             Draft 17cpi                    total                                                         Draft 17cpi                    
"99999.99"                     total                                                         Draft 17cpi                    
"99999.99"                     DATE()                                                        Draft 17cpi                    TIME()                                                        Draft 17cpi                    Draft 17cpi                    "VEND:"                        Draft 17cpi                    	"CAJERO:"                      NOMPAC                                                        Draft 17cpi                    TIPVTA                                                        Draft 17cpi                    SERFAC                                                        Draft 17cpi                    INICVEND                                                      Draft 17cpi                    INICNOMB                                                      Draft 17cpi                    REGRO                                                         Draft 17cpi                    "999999"                       NUMFAC                                                        Draft 17cpi                    
"99999999"                     DATE()                                                        Draft 17cpi                    TIME()                                                        Draft 17cpi                    NOMPAC                                                        Draft 17cpi                    TIPVTA                                                        Draft 17cpi                    SERFAC                                                        Draft 17cpi                    REGRO                                                         Draft 17cpi                    "999999"                       NUMFAC                                                        Draft 17cpi                    
"99999999"                     Draft 17cpi                    "(DESCUENTO)"                  Draft 17cpi                    
"Redondeo"                     totde                                                         Draft 17cpi                    
"99999.99"                     preespec                                                      Draft 17cpi                    
"99999.99"                     Draft 17cpi                    "(DESCUENTO)"                  Draft 17cpi                    
"Redondeo"                     totde                                                         Draft 17cpi                    
"99999.99"                     preespec                                                      Draft 17cpi                    
"99999.99"                     Draft 17cpi                    "VEND:"                        Draft 17cpi                    	"CAJERO:"                      INICVEND                                                      Draft 17cpi                    INICNOMB                                                      Draft 17cpi                    Courier New                    Draft 17cpi                    dataenvironment                _Top = 220
Left = 1
Width = 520
Height = 200
DataSource = .NULL.
Name = "Dataenvironment"
                                   cursor                         �Top = 20
Left = 10
Height = 90
Width = 90
Alias = "tmpfactu"
CursorSource = ..\..\sigep\temp\tmpfactu.dbf
Name = "Cursor1"
                                 cursor                         ~Top = 20
Left = 150
Height = 90
Width = 90
Alias = "mensajes"
CursorSource = ..\facturar\mensajes.dbf
Name = "Cursor2"
                               