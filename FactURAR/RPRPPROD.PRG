SET BELL TO 60,1
SET ESCAPE OFF
SET EXACT ON
DEFI WIND TODO FROM 0,0 TO 24,79;
     CLOSE FLOAT GROW SHADOW COLOR B/B,GR/B,W/R,R/W NONE
DEFI WIND BLANCO FROM 0,0 TO 24,79;
     CLOSE FLOAT GROW SHADOW COLOR B/B,GR/B,W/R,R/W NONE
DEFI WIND PREPARA FROM 10,20 TO 14,60;
     CLOSE FLOAT GROW SHADOW 
DEFI WIND AYUDAS FROM 22,7 TO 24,73;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 6
     
MES=0
ANIO=0
NOMMES=SPACE(10)
MESITO=SPACE(8)
CANSTO=SPACE(10)
BASE=SPACE(3)
SIGA=0
COD=SPACE(7)

ACTI WIND PREPARA
SET COLO TO WR/B
@0,12 SAY 'MES :> ' GET MES PICT '99' ERROR 'MES NO EXISTE'
@1,12 SAY 'AฅO :> ' GET ANIO PICT '9999' WHEN MES>0
@2,3 SAY 'Seleccione el perกodo de proceso'
READ
DEAC WIND PREPARA
IF MES>0 AND MES<13 AND ANIO>=1994
   DO DARMES
  ELSE
   RETURN 
ENDIF   
ACTI WIND PREPARA
CLEA
ON KEY LABEL F10 DO MOSTRAR
@1,10 SAY 'PRODUCTO :> 'GET COD PICT '9.A9999'
READ
ON KEY LABEL F10
DEAC WIND PREPARA
DRV03=DRIVFARM+'\SALICONS.DBF'
IF COD!=SPACE(7)
   *USE H:\FARMACIA\FARMACO\SALICONS INDE H:\FARMACIA\FARMACO\SACO
   USE &DRV03
   SET ORDE TO 1
   SEEK COD
   IF FOUN()
      IF &CANSTO=0
         CLOS ALL
         RETURN
      ENDIF
     ELSE
      ACTI WIND PREPARA
      SET BELL TO 200,2
      ?CHR(7)
      SET BELL TO 90,2
      ??CHR(7)
      SET BELL TO 900,2 
      ?CHR(7)
      SET COLO TO WR/B*   
      @1,7 SAY '<< CODIGO NO ENCONTRADO >>'
      SET COLO TO WR/B
      WAIT''
      CLOS ALL
      DEAC WIND PREPARA
      RETURN
   ENDIF
  ELSE
   RETURN
ENDIF    
       

ACTI WIND PREPARA
SET COLO TO WR/B*
@1,5 SAY 'ESPERE UN MOMENTO POR FAVOR ....'

SWIMP=0
TOT1=0
TOT2=0
IF MES<10
   MESES='0'+SUBS(STR(MES,2),2,1)
  ELSE
   MESES=STR(MES,2)
ENDIF  
DRIVVE='MED'+BASE+SUBS(STR(ANIO,4),3,2)+'.DBF'
FIC=STR(INT(RAND()*1000000),6)
NOMFIC='TMP'+SUBS(FIC,2,5)+'.TEM'
CREA TABLE (NOMFIC) (CANTIDAD N(8,2), FECHA D, FACTURA N(8), PRECIO N(12,2), TIPO C(8))
IF FILE (DRIVVE) 
   CLOS DATABASE
   SELE A
      USE (DRIVVE)
   SELE B
      USE MEDICTDO
      SET ORDE TO 1
      * INDE MDCO
   SELE C
      USE MEDICINA
      SET ORDE TO 1
      * INDE MEDI
   SELE D
      USE MEDICONV 
      SET FILTER TO MONTH(FECHA)=MES
   SELE E
      USE (NOMFIC)      
   SELE F
      USE FACTMEDI
      SET ORDE TO 2
      * INDE FECFTMED
   ACTI WIND AYUDAS
   CLEA
   @0,23 SAY 'P R O C E S A N D O'
   RELOJ1=0
   SELE C
   SEEK COD
   IF FOUND()
      NOM=NOM_COMER
      NOM1=NOM_ESPEC
      FORM=FORMA
 
      SELE A
      DO WHILE .NOT. EOF()
         IF MEDICINA1=COD
            CAN=CANTIDAD1
            FEC=FECHA
            CTA=CUENTA_C
            SOL=PREC_MED1
            SELE E
            APPE BLAN
            REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH CTA
            REPLA PRECIO WITH SOL, TIPO WITH 'CTA.CTE.' 
            SELE A
         ENDIF
         RELOJ1=RELOJ1+1
         DO CASE
            CASE RELOJ1=1
                 @0,15 SAY '|'
                 @0,49 SAY '|'
            CASE RELOJ1=2                   
                 @0,15 SAY '/'
                 @0,49 SAY '/'
            CASE RELOJ1=3                   
                 @0,15 SAY '-'
                 @0,49 SAY '-'
            CASE RELOJ1=4                   
                 @0,15 SAY '\'
                 @0,49 SAY '\'
                 RELOJ1=0
         ENDCASE
         SKIP
      ENDDO       

      SELE D
      DO WHILE .NOT. EOF()
         IF MEDICINA1=COD
            CAN=CANTIDAD1
            FEC=FECHA
            CTA=CUENTA_C
            SOL=PREC_MED1
            SELE E
            APPE BLAN
            REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH CTA
            REPLA PRECIO WITH SOL, TIPO WITH 'CONVENIO' 
            SELE D
         ENDIF
         RELOJ1=RELOJ1+1
         DO CASE
            CASE RELOJ1=1
                 @0,15 SAY '|'
                 @0,49 SAY '|'
            CASE RELOJ1=2                   
                 @0,15 SAY '/'
                 @0,49 SAY '/'
            CASE RELOJ1=3                   
                 @0,15 SAY '-'
                 @0,49 SAY '-'
            CASE RELOJ1=4                   
                 @0,15 SAY '\'
                 @0,49 SAY '\'
                 RELOJ1=0
         ENDCASE
         SKIP
      ENDDO       

      SELE F
      IF MES>9
         SEEK CTOD('01/'+STR(MES,2)+'/'+SUBS(STR(ANIO,4),3,2))
        ELSE
         SEEK CTOD('01/0'+STR(MES,1)+'/'+SUBS(STR(ANIO,4),3,2))
      ENDIF   
      DO WHILE .NOT. EOF() AND MONTH(FECHA)=MES
         IF TIPO='M'
         NUM=NUMERO
         SELE B
         SEEK NUM
         IF FOUND()
            IF MEDICINA1=COD
               CAN=CANTID1
               FEC=FECHA
               SOL=PREC_UNI1*(1-EXONERAR/100)
               SELE E
               APPE BLAN
               REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH NUM
               REPLA PRECIO WITH SOL, TIPO WITH 'CONTADO' 
               SELE B
            ENDIF
            IF MEDICINA2=COD
               CAN=CANTID2
               FEC=FECHA
               SOL=PREC_UNI2*(1-EXONERAR/100)
               SELE E
               APPE BLAN
               REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH NUM
               REPLA PRECIO WITH SOL, TIPO WITH 'CONTADO' 
               SELE B
            ENDIF
            IF MEDICINA3=COD
               CAN=CANTID3
               FEC=FECHA
               SOL=PREC_UNI3*(1-EXONERAR/100)
               SELE E
               APPE BLAN
               REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH NUM
               REPLA PRECIO WITH SOL, TIPO WITH 'CONTADO' 
               SELE B
            ENDIF
            IF MEDICINA4=COD
               CAN=CANTID4
               FEC=FECHA
               SOL=PREC_UNI4*(1-EXONERAR/100)
               SELE E
               APPE BLAN
               REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH NUM
               REPLA PRECIO WITH SOL, TIPO WITH 'CONTADO' 
               SELE B
            ENDIF
            IF MEDICINA5=COD
               CAN=CANTID5
               FEC=FECHA
               SOL=PREC_UNI5*(1-EXONERAR/100)
               SELE E
               APPE BLAN
               REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH NUM
               REPLA PRECIO WITH SOL, TIPO WITH 'CONTADO' 
               SELE B
            ENDIF
*           IF MEDICINA6=COD
*              CAN=CANTID6 
*              FEC=FECHA
*              SOL=PREC_UNI6*(1-EXONERAR/100)
*              SELE E
*              APPE BLAN
*              REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH NUM
*              REPLA PRECIO WITH SOL, TIPO WITH 'CONTADO' 
*              SELE B
*           ENDIF
*           IF MEDICINA7=COD
*              CAN=CANTID7
*              FEC=FECHA
*              SOL=PREC_UNI7*(1-EXONERAR/100)
*              SELE E
*              APPE BLAN
*              REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH NUM
*              REPLA PRECIO WITH SOL, TIPO WITH 'CONTADO' 
*              SELE B
*           ENDIF
*           IF MEDICINA8=COD
*              CAN=CANTID8
*              FEC=FECHA
*              SOL=PREC_UNI8*(1-EXONERAR/100)
*              SELE E
*              APPE BLAN
*              REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH NUM
*              REPLA PRECIO WITH SOL, TIPO WITH 'CONTADO' 
*              SELE B
*           ENDIF
*           IF MEDICINA9=COD
*              CAN=CANTID9
*              FEC=FECHA
*              SOL=PREC_UNI9*(1-EXONERAR/100)
*              SELE E
*              APPE BLAN
*              REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH NUM
*              REPLA PRECIO WITH SOL, TIPO WITH 'CONTADO' 
*              SELE B
*           ENDIF
*           IF MEDICINA10=COD
*              CAN=CANTID10
*              FEC=FECHA
*              SOL=PREC_UNI10*(1-EXONERAR/100)
*              SELE E
*              APPE BLAN
*              REPLA CANTIDAD WITH CAN, FECHA WITH FEC, FACTURA WITH NUM
*              REPLA PRECIO WITH SOL, TIPO WITH 'CONTADO' 
*              SELE B
*           ENDIF
            RELOJ1=RELOJ1+1
            DO CASE
               CASE RELOJ1=1
                    @0,15 SAY '|'
                    @0,49 SAY '|'
               CASE RELOJ1=2                   
                    @0,15 SAY '/'
                    @0,49 SAY '/'
               CASE RELOJ1=3                   
                    @0,15 SAY '-'
                    @0,49 SAY '-'
               CASE RELOJ1=4                   
                    @0,15 SAY '\'
                    @0,49 SAY '\'
                    RELOJ1=0
            ENDCASE
         ENDIF   
         SELE F
         ENDIF
         SKIP
      ENDDO       
      
      SELE E
      ACTI WIND BLANCO
      ACTI WIND TODO
      SET COLO TO WR/B
      @0,0 SAY 'PRODUCTO > '
      SET COLO TO B/W*
      @0,11 SAY +NOM
      @1,11 SAY +FORM
      @2,52 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
      SET COLO TO R+/B
      @1,32 SAY +NOMMES+'-'+STR(ANIO,4)
      SET COLO TO WR/B
      @3,5 SAY '  FECHA     DESTINO    CANTIDAD       P-UNIT      M-PARCIAL     TIPO'
      @4,5 SAY 'þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ'
      Y=5
      TOTAL=0
      ELIZ=1
      FOR DIA=1 TO 31
          GO TOP
          DO WHILE .NOT. EOF()
             IF DAY(FECHA)=DIA
                @Y,5 SAY ''+DTOC(FECHA)+'   '+STR(FACTURA,8)+'     '+STR(CANTIDAD,7,2)+'   '+STR(PRECIO,10,2)+'   '+STR((PRECIO*CANTIDAD),12,2)+'   '+TIPO
                TOT1=TOT1+CANTIDAD
                TOT2=TOT2+PRECIO*CANTIDAD
                Y=Y+1
             ENDIF
             SKIP
             IF Y=21
                   @22,5 SAY 'Sub-Total          '+STR(TOT1,12,2)+'              '+STR(TOT2,14,2)             
                   IF ELIZ<10
                      PANTA='PNT0'+STR(ELIZ,1)
                     ELSE
                      PANTA='PNT'+STR(ELIZ,2)         
                   ENDIF
                   SAVE WIND TODO TO (PANTA)
                   ELIZ=ELIZ+1
                   @24,20 SAY 'Presione <ENTER> para continuar ....'
                   READ
                   IF LASTKEY()=27
                      EXIT
                   ENDIF   
                   Y=5
                   @5,0 CLEA 
             ENDIF   
          ENDDO   
      ENDFOR
      @22,5 SAY 'T O T A L          '+STR(TOT1,12,2)+'              '+STR(TOT2,14,2)
      IF ELIZ<10
         PANTA='PNT0'+STR(ELIZ,1)
        ELSE
         PANTA='PNT'+STR(ELIZ,2)         
      ENDIF
      SAVE WIND TODO TO (PANTA)        
      ELIZ1=ELIZ
      ELIZ=ELIZ+1
      @24,5 SAY '<PgUp> ANTERIOR'
      @24,25 SAY '<PgDn> SIGUIENTE'
      @24,46 SAY '< F8 > IMPRIME'
      @24,64 SAY '<ESC> SALIR'
      SET COLO TO WR/B
      ON KEY LABEL PGUP DO SUBE
      ON KEY LABEL PGDN DO BAJA
      ON KEY LABEL F2
      ON KEY LABEL F8 DO IMPRIMA
      SET ESCAPE ON
      STORE .F. TO mexit
      ON ESCAPE STORE .T. TO mexit
      DO WHILE NOT mexit
         IF LASTKEY()!=-1 .AND. LASTKEY()!=-4
            CLEAR TYPEAHEAD
         ENDIF   
      ENDDO
      ON KEY LABEL F8
      ON KEY LABEL F2
      ON KEY LABEL PGDN
      ON KEY LABEL PGUP                             
      FOR ELIZ=1 TO ELIZ1
          IF ELIZ<10
             PANTA='PNT0'+STR(ELIZ,1)
            ELSE
             PANTA='PNT'+STR(ELIZ,2)         
          ENDIF
          PANTA1=PANTA+'.WIN'
          IF FILE(PANTA1)
             DELE FILE (PANTA1)
          ENDIF
      ENDFOR       
      DEAC WIND PREPARA
      DEAC WIND AYUDAS
      DEAC WIND TODO
      DEAC WIND BLANCO
     ELSE
      ACTI WIND PREPARA
      SET BELL TO 300,2
      ??CHR(7)
      SET BELL TO 3000,2
      ??CHR(7)
      SET BELL TO 30,2
      ??CHR(7)
      SET BELL TO 9000,2
      ??CHR(7)
      SET COLO TO WR/B*
      @0,2 SAY 'NO SE REGISTRAN SALIDAS EN '+NOMMES
      @2,0 SAY 'Verifique salidas al Contado y Cta.Cte.'
      WAIT''
      DEAC WIND PREPARA
   ENDIF   
ENDIF 
CLOS ALL  
DELE FILE (NOMFIC)
RETURN



PROCEDURE DARMES
DO CASE
   CASE MES=1
        CANSTO='CANT_ENERO'
        MONTOS='MONT_ENERO'
        NOMMES='ENERO'
        BASE='JAN'
   CASE MES=2
        CANSTO='CANT_FEBRE'
        MONTOS='MONT_FEBRE'
        NOMMES='FEBRERO'
        BASE='FEB'
   CASE MES=3
        CANSTO='CANT_MARZO'
        MONTOS='MONT_MARZO'
        NOMMES='MARZO'
        BASE='MAR'
   CASE MES=4
        CANSTO='CANT_ABRIL'
        MONTOS='MONT_ABRIL'
        NOMMES='ABRIL'
        BASE='APR'
   CASE MES=5
        CANSTO='CANT_MAYO'
        MONTOS='MONT_MAYO'
        NOMMES='MAYO'
        BASE='MAY'
   CASE MES=6      
        CANSTO='CANT_JUNIO'
        MONTOS='MONT_JUNIO'
        NOMMES='JUNIO'
        BASE='JUN'
   CASE MES=7
        CANSTO='CANT_JULIO'
        MONTOS='MONT_JULIO'
        NOMMES='JULIO'
        BASE='JUL'
   CASE MES=8
        CANSTO='CANT_AGOST'
        MONTOS='MONT_AGOST'
        NOMMES='AGOSTO'
        BASE='AUG'
   CASE MES=9
        CANSTO='CANT_SETIE'
        MONTOS='MONT_SETIE'
        NOMMES='SETIEMBRE'
        BASE='SEP'
   CASE MES=10
        CANSTO='CANT_OCTUB'
        MONTOS='MONT_OCTUB'
        NOMMES='OCTUBRE'
        BASE='OCT'
   CASE MES=11   
        CANSTO='CANT_NOVIE'
        MONTOS='MONT_NOVIE'
        NOMMES='NOVIEMBRE'
        BASE='NOV'
   CASE MES=12
        CANSTO='CANT_DICIE'
        MONTOS='MONT_DICIE'
        NOMMES='DICIEMBRE'
        BASE='DEC'
ENDCASE
RETURN



PROCEDURE SUBE
ELIZ=ELIZ-1
IF ELIZ=0
   ACTI WIND PREPARA
   @1,5 SAY 'ESTA EN LA PRIMERA PAGINA'
   WAIT '' TIME 0.2
   DEAC WIND PREPARA
   ELIZ=ELIZ+1
  ELSE 
   IF ELIZ<10
      PANTA='PNT0'+STR(ELIZ,1)
     ELSE
      PANTA='PNT'+STR(ELIZ,2)         
   ENDIF   
   REST WIND TODO FROM (PANTA)
   @24,5 SAY '<PgUp> ANTERIOR'
   @24,25 SAY '<PgDn> SIGUIENTE'
   @24,46 SAY '< F8 > IMPRIME'
   @24,64 SAY '<ESC> SALIR'
ENDIF    
RETURN

PROCEDURE BAJA
ELIZ=ELIZ+1
IF ELIZ>ELIZ1
   ACTI WIND PREPARA
   @1,5 SAY 'ESTA EN LA ULTIMA PAGINA'
   WAIT '' TIME 0.2
   DEAC WIND PREPARA
   ELIZ=ELIZ-1
  ELSE 
   IF ELIZ<10
      PANTA='PNT0'+STR(ELIZ,1)
     ELSE
      PANTA='PNT'+STR(ELIZ,2)         
   ENDIF   
   REST WIND TODO FROM (PANTA)
   @24,5 SAY '<PgUp> ANTERIOR'
   @24,25 SAY '<PgDn> SIGUIENTE'
   @24,46 SAY '< F8 > IMPRIME'
   @24,64 SAY '<ESC> SALIR'
ENDIF    
RETURN


PROCEDURE IMPRIMA
ON KEY LABEL PGDN
ON KEY LABEL PGUP                             
TOT1=0
TOT2=0
   IF PRIN()
      PAGINA=1
      SELE E
      SET DEVI TO PRIN
      @0,0 SAY CHR(15)
      @0,5 SAY ''+TITULO01
      @1,5 SAY '      HUANCAYO'
      @2,70 SAY ' HORA :> '+TIME()
      @3,35 SAY 'VENTAS POR PRODUCTO'
      @3,70 SAY 'FECHA :> '+DTOC(DATE())
      @4,38 SAY +NOMMES+'-'+STR(ANIO,4)
      @4,38 SAY +NOMMES+'-'+STR(ANIO,4)      
      @6,5 SAY 'PRODUCTO : '
      @6,16 SAY +NOM
      @6,16 SAY +NOM
      @7,16 SAY +FORM
      @7,16 SAY +FORM      
      @7,70 SAY 'P g : '+STR(PAGINA,4)
      @8,5  SAY 'ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ'
      @9,5  SAY '     F E C H A    DESTINO    CANTIDAD       P-UNIT      M-PARCIAL     TIPO'
      @10,5 SAY 'ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ'
      Y=11
      FOR DIA=1 TO 31
          GO TOP
          DO WHILE .NOT. EOF()
             IF DAY(FECHA)=DIA
                @Y,11 SAY ''+DTOC(FECHA)+'   '+STR(FACTURA,8)+'     '+STR(CANTIDAD,7,2)+'   '+STR(PRECIO,10,2)+'   '+STR((PRECIO*CANTIDAD),12,2)+'   '+TIPO
                TOT1=TOT1+CANTIDAD
                TOT2=TOT2+PRECIO*CANTIDAD
                Y=Y+1
             ENDIF
             SKIP
             IF Y=56
                @56,5 SAY '----------------------------------------------------------------------------------'             
                @57,9 SAY '*Sub-Total*          '+STR(TOT1,12,2)+'              '+STR(TOT2,14,2)             
                EJECT
                PAGINA=PAGINA+1
                @0,5 SAY ''+TITULO01
                @1,5 SAY '      HUANCAYO'
                @2,70 SAY ' HORA :> '+TIME()   
                @3,35 SAY 'VENTAS POR PRODUCTO'
                @3,70 SAY 'FECHA :> '+DTOC(DATE())
                @4,38 SAY +NOMMES+'-'+STR(ANIO,4)
                @4,38 SAY +NOMMES+'-'+STR(ANIO,4)      
                @6,5 SAY 'PRODUCTO : '
                @6,16 SAY +NOM
                @6,16 SAY +NOM
                @7,16 SAY +FORM
                @7,16 SAY +FORM      
                @7,70 SAY 'P g : '+STR(PAGINA,4)
                @8,5  SAY 'ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ'
                @9,5  SAY '     F E C H A    DESTINO    CANTIDAD       P-UNIT      M-PARCIAL     TIPO'
                @10,5 SAY 'ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ'
                Y=11
             ENDIF   
          ENDDO   
      ENDFOR
      @Y,5 SAY 'ออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ'             
      @Y+1,7 SAY '** T O T A L **        '+STR(TOT1,12,2)+'              '+STR(TOT2,14,2)
      DEAC WIND AYUDAS
      EJECT
      SET DEVI TO SCREE
   ENDIF   
ON KEY LABEL PGUP DO SUBE
ON KEY LABEL PGDN DO BAJA
RETURN   
