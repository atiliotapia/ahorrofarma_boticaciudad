SELE A
USE MEDICINA
SELE B
USE C:\SIGEF\SISTMEDI\DATOS\MAESMEDI
SET ORDE TO CODIGO
X=0
SELE A
GO TOP
DO WHILE !EOF()
   COD=CODIGO
   SELE B
   SEEK COD
   IF FOUN()
      REPLA MARCA WITH "*"
   ENDIF
   SELE A
   SKIP
ENDDO