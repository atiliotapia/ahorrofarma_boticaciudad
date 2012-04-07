SELE A
     USE MEDICINA  ALIAS MEDICINA NOUP
     SET ORDE TO 2
     SET FILTE TO CANT_STOCK>0
SELE B
     USE GRUPTERA ALIAS GRUPTERA NOUP
     SET ORDE TO 1
     SET FILTE TO SUBS(CODIGO,3,1)!="0"

SET DEVI TO PRIN
PAG=1
SELE GRUPTERA
GO TOP
DO WHILE !EOF()
   GRPT=CODIGO
   DESC=DESCRIPCIO
   SELE MEDICINA
   LOCATE FOR GRUP_TERA=GRPT
   IF FOUN()
      @0,0 SAY CHR(15)
      @0,2 SAY '   F A R M A C I A'
      @0,120 SAY 'CONTROL AUTOMATIZADO'
      @0,0 SAY CHR(18)
      @0,0 SAY CHR(14)+'          CATALOGO DE PRODUCTOS'
      @0,0 SAY CHR(14)+'          CATALOGO DE PRODUCTOS'
      @1,34 SAY 'FECHA :> '+DTOC(DATE())
      @1,34 SAY 'FECHA :> '+DTOC(DATE())
      @1,0 SAY CHR(15)
      @1,2 SAY 'HOSPITAL  "EL CARMEN"'
      @1,120 SAY '  INGRESOS EN CAJA'
      @1,0 SAY CHR(18)
      @2,1 SAY +GRPT+" "+DESC
      @2,1 SAY +GRPT+" "+DESC   
      @2,76 SAY 'P g : '+STR(PAG,2)
      *@3,1 SAY 'þþþþþþþþþþþþþþþþþþþþþ'
      @4,1 SAY 'CODIGO            N  O  M  B  R  E        FORMA      STOCK-ACTUAL      PRECIO-VENTA'
      @5,1 SAY '-----------------------------------------------------------------------------------'
      Y=6
      GO TOP 
      DO WHILE .NOT. EOF()
         IF CANT_STOCK>0 .AND. GRUP_TERA=GRPT
            @Y,1 SAY ''+CODIGO+'  '+NOM_COMER+'  '+FORMA+'  '+STR(CANT_STOCK,9,2)+'        '+STR(PREC_VENT,9,2)
            Y=Y+1
            IF Y=62
               EJECT
               PAG=PAG+1
               @0,0 SAY CHR(15)
               @0,2 SAY '   F A R M A C I A'
               @0,120 SAY 'CONTROL AUTOMATIZADO'
               @0,0 SAY CHR(18)
               @0,0 SAY CHR(14)+'          CATALOGO DE PRODUCTOS'
               @0,0 SAY CHR(14)+'          CATALOGO DE PRODUCTOS'
               @1,34 SAY 'FECHA :> '+DTOC(DATE())
               @1,34 SAY 'FECHA :> '+DTOC(DATE())
               @1,0 SAY CHR(15)
               @1,2 SAY 'HOSPITAL  "EL CARMEN"'
               @1,120 SAY '  INGRESOS EN CAJA'
               @1,0 SAY CHR(18)         
               @2,1 SAY +GRPT+" "+DESC
               @2,1 SAY +GRPT+" "+DESC   
               @2,76 SAY 'P g : '+STR(PAG,2)
               *@3,1 SAY 'þþþþþþþþþþþþþþþþþþþþþ'
               @4,1 SAY 'CODIGO            N  O  M  B  R  E        FORMA      STOCK-ACTUAL      PRECIO-VENTA'
               @5,1 SAY '-----------------------------------------------------------------------------------'
               Y=6
            ENDIF   
         ENDIF
         SKIP
      ENDDO      
      PAG=PAG+1
      EJECT
   ENDIF
   SELE GRUPTERA
   SKIP
ENDDO
CLOS ALL
SET DEVI TO SCRE
