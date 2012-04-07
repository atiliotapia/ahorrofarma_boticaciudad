*************************************
*  SE ADICIONAN LOS REPORTES DEL    *
*         SEGURO ESCOLAR            *
* A PARTIR DEL MES DE  OCTUBRE-1997 *
*************************************
*************************************
*  SE ADICIONAN LOS REPORTES DEL    *
*      SEGURO MATERNO INFANTIL      *
* A PARTIR DEL MES DE  OCTUBRE-2000 *
*************************************
SET BELL TO 60,1
SET ESCAPE OFF
SET EXACT ON
SET CENTU ON
SET STAT ON
SET TALK OFF
SET ECHO OFF
SET CONF ON
SET DATE FREN
DEFI WIND TODO FROM 0,0 TO 24,79;
     CLOSE FLOAT GROW SHADOW COLOR BG/RB NONE
DEFI WIND BLANCO FROM 0,0 TO 24,79;
     CLOSE FLOAT GROW SHADOW COLOR BG/RB NONE
DEFI WIND PREPARA FROM 10,20 TO 14,60;
     CLOSE FLOAT GROW SHADOW 
DEFI WIND AYUDAS FROM 22,7 TO 24,73;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 6
DEFI WIND PEDII FROM 7,25 TO 18,55 DOUBLE
     

STORE 0 TO MES,ANIO,SWIMP,ELIZ,ELIZ1
NOMMES=SPACE(10)
MESITO=SPACE(8)
CANSTO=' '
MONTOS=' '
BASE=SPACE(3)
SIGA=0
DEAC WIND TODO
DEAC WIND AYUDAS
DO WHILE .T.
  * ACTI WIND AYUDAS
   SET COLO TO RB/GR+ 
   CLEA
   SET COLO TO I
   @0,16 SAY 'SELECCIONE EL  PERIODO DE PROCESO'
   ACTI WIND PEDII
   SET COLO TO WR/B
   CLEA
   @0,8 SAY '<< REPORTE >>'
   @2,8 PROM ' DIARIO '
   @4,8 PROM ' MENSUAL '
   @6,8 PROM ' TRIMESTRAL '
   @8,8 PROM ' SEMESTRAL '
   MENU TO OPRE
   IF LASTKEY()=27
      DEAC WIND PEDII
      DEAC WIND AYUDAS
      EXIT
   ENDIF   
      DO CASE
         CASE OPRE=1
              DIA1=0
              DIA2=0
              FEC1=SPACE(10)
              FEC2=SPACE(10)
              ACTI WIND PREPARA
              SET COLO TO WR/B
              CLEA
              @0,5 SAY 'MES :> ' GET MES PICT '99' ERROR 'MES NO EXISTE'
              @0,18 SAY 'A¥O :> ' GET ANIO PICT '9999' WHEN MES>0 AND MES<13
              @2,5 SAY  'DESDE :' GET DIA1 PICT '99' VALID DIAS(DIA1,MES,ANIO,VARR()) ERROR 'DIA NO EXISTE' WHEN ANIO>2000
              @2,20 SAY 'HASTA :' GET DIA2 PICT '99' VALID DIAS(DIA2,MES,ANIO,VARR()) ERROR 'DIA NO EXISTE O MENOR QUE DIA1' WHEN DIA1>0
              READ
              DEAC WIND PREPARA
              IF LAST()!=27 AND MES>0 AND ANIO>0
                 DO DARMES
                 DO DIARIO
              ENDIF   
         CASE OPRE=2
              ACTI WIND PREPARA
              SET COLO TO WR/B
              @1,1 SAY 'MES :> ' GET MES PICT '99' ERROR 'MES NO EXISTE'
              @1,14 SAY 'A¥O :> ' GET ANIO PICT '9999' WHEN MES>0
              READ
              DEAC WIND PREPARA
              IF MES>0 AND MES<13 AND ANIO>=1994
                 DO DARMES
                 DO MENSUAL
              ENDIF   
      ENDCASE   
ENDDO
CLOSE ALL
DEAC WIND AYUDAS
QUIT

PROCEDURE MENSUAL
CLOS ALL
SWEX=0
DRV01=DRIVFARM+'\SALICONS.DBF'
USE &DRV01
*USE H:\FARMACIA\FARMACO\SALICONS
DO WHILE NOT EOF()
   IF &CANSTO>0
      SWEX=1
      EXIT
   ENDIF
   SKIP
ENDDO   
       

ACTI WIND PREPARA
SET COLO TO WR/B*
@1,5 SAY 'ESPERE UN MOMENTO POR FAVOR ....'
   
IF SWEX=1
   *****************************************
   ***************SI FUE GRABADO************
   *****************************************
   DELE FILE MONTMEDI.IDX
   SELE A
*      USE H:\FARMACIA\FARMACO\SALICONS INDE H:\FARMACIA\FARMACO\NOMSACO,H:\FARMACIA\FARMACO\SACO
       DRV01=DRIVFARM+'\SALICONS.DBF'
       USE &DRV01
       *USE H:\FARMACIA\FARMACO\SALICONS
   SELE C
       USE MEDICINA NOUPDATE
       SET ORDE TO 1
       * INDE MEDI
   SWIMP=1
   TOT1=0
   TOT2=0
   TOT3=0
   ACTI WIND AYUDAS
   CLEA
   SET COLO TO RG/B*
   @0,15 SAY '.....   O R D E N A N D O   .....'
   SELE A
   SUM &MONTOS TO TOT1 FOR SUBS(CODIGO,1,1)!='3' AND SUBS(CODIGO,1,1)!='8'
   SUM &MONTOS TO TOT2 FOR SUBS(CODIGO,1,1)='3'
   SUM &MONTOS TO TOT3 FOR SUBS(CODIGO,1,1)='8'
   INDE ON &MONTOS TO MONTMEDI

   GO BOTT
   ACTI WIND TODO
   SET COLO TO B/W*
   @0,27 SAY 'VENTAS DE MEDICINAS'
   SET COLO TO R+/B
   @1,25 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
   SET COLO TO WR/B
   @2,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
   @3,0 SAY 'CODIGO          N O M B R E         FORMA       CONSUMO    MONTO TOTAL  % VENTAS'
   @4,0 SAY 'þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ'
   Y=5
   DO WHILE .NOT. BOF()
      IF &CANSTO>0
         IF SUBS(CODIGO,1,1)!='3' AND SUBS(CODIGO,1,1)!='8'
            SET RELA TO A->CODIGO INTO C
            @Y,0 SAY ''+CODIGO+'  '+SUBS(NOM_COMER,1,25)+'  '+SUBS(FORMA,1,5)+'  '+STR(&CANSTO,12,2)+' '+STR(&MONTOS,14,2)+'   '+STR((&MONTOS/TOT1*100),5,2)
            Y=Y+1
         ENDIF   
      ENDIF   
      SKIP -1
      IF Y=21 .OR. BOF()
         IF BOF() 
            @22,20 SAY 'TOTAL MEDICINAS (EN NUEVOS SOLES) :> '+STR(TOT1,15,2)
            @24,20 SAY 'Presione <ENTER> para reportar Material M‚dico'
            WAIT''
            EXIT
           ELSE
            @22,20 SAY 'Presione <ENTER> para continuar ...'
            READ
            IF LASTKEY()=27
               EXIT
            ENDIF   
            Y=5
            @5,0 CLEA 
         ENDIF   
      ENDIF
   ENDDO   

   GO BOTT
   ACTI WIND TODO
   CLEA
   SET COLO TO B/W*
   @0,24 SAY 'VENTAS DE PRODUCTOS DE SALA'   
   SET COLO TO R+/B
   @1,25 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
   SET COLO TO WR/B
   @2,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
   @3,0 SAY 'CODIGO          N O M B R E         FORMA       CONSUMO    MONTO TOTAL  % VENTAS'
   @4,0 SAY 'þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ'
   Y=5
   DO WHILE .NOT. BOF()
      IF &CANSTO>0
         IF SUBS(CODIGO,1,1)='8'
            SET RELA TO A->CODIGO INTO C
            @Y,0 SAY ''+CODIGO+'  '+SUBS(NOM_COMER,1,25)+'  '+SUBS(FORMA,1,5)+'  '+STR(&CANSTO,12,2)+' '+STR(&MONTOS,14,2)+'   '+STR((&MONTOS/TOT3*100),5,2)
            Y=Y+1
         ENDIF   
      ENDIF   
      SKIP -1
      IF Y=21 .OR. BOF()
         IF BOF() 
            @22,20 SAY 'TOTAL PRODUCTOS DE SALA (EN NUEVOS SOLES) :> '+STR(TOT3,15,2)
            @24,20 SAY 'Presione <ENTER> para reportar Material M‚dico'
            WAIT''
            EXIT
           ELSE
            @22,20 SAY 'Presione <ENTER> para continuar ...'
            READ
            IF LASTKEY()=27
               EXIT
            ENDIF   
            Y=5
            @5,0 CLEA 
         ENDIF   
      ENDIF
   ENDDO   
    
   GO BOTT
   ACTI WIND TODO
   CLEA
   SET COLO TO B/W*
   @0,25 SAY 'VENTAS DE MATERIAL MEDICO'
   SET COLO TO R+/B
   @1,29 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
   SET COLO TO WR/B
   @2,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
   @3,0 SAY 'CODIGO          N O M B R E         FORMA       CONSUMO    MONTO TOTAL  % VENTAS'
   @4,0 SAY 'þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ'
   Y=5
   DO WHILE .NOT. BOF()
      IF &CANSTO>0
         IF SUBS(CODIGO,1,1)='3'
            SET RELA TO A->CODIGO INTO C
            @Y,0 SAY ''+CODIGO+'  '+SUBS(NOM_COMER,1,25)+'  '+SUBS(FORMA,1,5)+'  '+STR(&CANSTO,12,2)+' '+STR(&MONTOS,14,2)+'   '+STR((&MONTOS/TOT2*100),5,2)
            Y=Y+1
         ENDIF   
      ENDIF
      SKIP -1
      IF Y=21 .OR. BOF()
         IF BOF() 
            @22,20 SAY 'TOTAL MATERIAL MEDICO (EN NUEVOS SOLES) :> '+STR(TOT2,15,2)
            @23,20 SAY 'TOTAL   G E N E R A L (EN NUEVOS SOLES) :> '+STR((TOT1+TOT2+TOT3),15,2)
            @24,16 SAY '< F8 > IMPRIME'
            @24,54 SAY '<ESC> SALIR'
            SET COLO TO WR/B
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
            EXIT            
           ELSE
            @22,20 SAY 'Presione <ENTER> para continuar ...'
            READ
            IF LASTKEY()=27
               EXIT
            ENDIF   
            Y=5
            @5,0 CLEA 
         ENDIF   
      ENDIF   
   ENDDO   
   DEAC WIND TODO
   DEAC WIND PREPARA
   CLOS ALL
   DELE FILE MONTMEDI.IDX  
  ELSE
    
   *****************************************
   ***************NO FUE GRABADO************
   *****************************************
   SWIMP=0
   TOT1=0
   TOT2=0
   STORE 0 TO CANSAL,PRESAL
   IF MES<10
      MESES='0'+SUBS(STR(MES,2),2,1)
     ELSE
      MESES=STR(MES,2)
   ENDIF  
   DRIVVE='MED'+BASE+SUBS(STR(ANIO,4),3,2)+'.DBF'
   DRIVVE2='MDCT'+MESES+SUBS(STR(ANIO,4),3,2)+'.DBF'
   DRIVVE3='MDSS'+MESES+SUBS(STR(ANIO,4),3,2)+'.DBF'
   DRIVVE4='MDSM'+MESES+SUBS(STR(ANIO,4),3,2)+'.DBF'
   IF FILE (DRIVVE) AND FILE (DRIVVE2)
      DRIVVE1='TMPO'+MESES+SUBS(STR(ANIO,4),3,2)+'.DBF'
      CLOS DATABASE
      DELE FILE (DRIVVE1)
      DELE FILE IMHCOD.IDX
      DELE FILE IMHMON.IDX
      CREA TABLE (DRIVVE1) (CODIGO C(7), CANTIDAD N(9,2), PRECIO N(12,2))
      USE (DRIVVE1)
      INDE ON CODIGO TO IMHCOD
      SELE A
         USE (DRIVVE)
      SELE B
         USE (DRIVVE2)
      SELE C
         USE MEDICINA NOUPDATE
         SET ORDE TO 1
         * INDE MEDI
      SELE D
         USE (DRIVVE1) INDE IMHCOD
      SELE E
         USE MEDICONV 
      SELE F   
         USE (DRIVVE3)
      SELE G   
         USE (DRIVVE4)
      SELE A
      GO TOP
      ACTI WIND AYUDAS
      CLEA
      SET COLO TO I
      @0,5 SAY '......  PROCESANDO CUENTA CORRIENTE  ......'
      SET COLO TO WR/B
      DO WHILE .NOT. EOF()
         COD=MEDICINA1
         CANSAL=CANTIDAD1 
         PRESAL=PREC_MED1*CANTIDAD1
         SELE D
         SEEK COD
         IF FOUND()
            CANTI=CANTIDAD
            PRECI=PRECIO
            REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
           ELSE
            APPE BLANK
            REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
         ENDIF   
         SELE A
         SKIP
      ENDDO 
      ACTI WIND AYUDAS
      CLEA
      SET COLO TO I
      @0,5 SAY '......  PROCESANDO C O N V E N I O S  ......'
      SELE E
      GO TOP
      DO WHILE .NOT. EOF()
         IF MES=MONTH(FECHA) AND ANIO=YEAR(FECHA)
            COD=MEDICINA1
            CANSAL=CANTIDAD1 
            PRESAL=(PREC_MED1*CANTIDAD1)*(1+PORC_CONV/100)
            SELE D
            SEEK COD
            IF FOUND()
               CANTI=CANTIDAD
               PRECI=PRECIO
               REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
              ELSE
               APPE BLANK
               REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
            ENDIF   
            SELE E
         ENDIF   
         SKIP
      ENDDO 
      ACTI WIND AYUDAS
      CLEA
      @0,5 SAY '......  PROCESANDO VENTAS AL CONTADO  ......' COLO I 
      SET COLO TO WR/B
      SELE B
      GO TOP
      DO WHILE .NOT. EOF()
         COD=CODIGO
         CANSAL=CANTIDAD 
         PRESAL=PRECIO
         SELE D
         SEEK COD
         IF FOUND()
            CANTI=CANTIDAD
            PRECI=PRECIO
            REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
           ELSE
            APPE BLANK
            REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
         ENDIF   
         SELE B
         SKIP
      ENDDO
      ACTI WIND AYUDAS
      CLEA
      @0,5 SAY '....  PROCESANDO SALIDAS SEGURO ESCOLAR  ....' COLO I 
      SET COLO TO WR/B
      SELE F
      GO TOP
      DO WHILE .NOT. EOF()
         COD=CODIGO
         CANSAL=CANTIDAD 
         PRESAL=PRECIO
         SELE D
         SEEK COD
         IF FOUND()
            CANTI=CANTIDAD
            PRECI=PRECIO
            REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
           ELSE
            APPE BLANK
            REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
         ENDIF   
         SELE F
         SKIP
      ENDDO


      ACTI WIND AYUDAS
      CLEA
      @0,4 SAY '.. PROCESANDO SALIDAS SEGURO MATERNO INFANTIL ..' COLO I 
      SET COLO TO WR/B
      SELE G
      GO TOP
      DO WHILE .NOT. EOF()
         COD=CODIGO
         CANSAL=CANTIDAD 
         PRESAL=PRECIO
         SELE D
         SEEK COD
         IF FOUND()
            CANTI=CANTIDAD
            PRECI=PRECIO
            REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
           ELSE
            APPE BLANK
            REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
         ENDIF   
         SELE G
         SKIP
      ENDDO


      ACTI WIND AYUDAS
      @0,15 SAY '.....   O R D E N A N D O   .....'
      SELE D
      SEEK '       '
      DELE
      INDE ON PRECIO TO IMHMON
      GO TOP
      SUM PRECIO TO TOT1 FOR SUBS(CODIGO,1,1)!='3' AND SUBS(CODIGO,1,1)!='8'
      SUM PRECIO TO TOT2 FOR SUBS(CODIGO,1,1)='3'
      SUM PRECIO TO TOT3 FOR SUBS(CODIGO,1,1)='8'
      GO BOTT
      DEAC WIND AYUDAS
      ACTI WIND BLANCO
      ACTI WIND TODO
      SET COLO TO B/W*
      @0,27 SAY 'VENTAS DE MEDICINAS'
      SET COLO TO R+/B
      @1,25 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
      SET COLO TO WR/B
      @2,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
      @3,0 SAY 'CODIGO          N O M B R E         FORMA       CONSUMO    MONTO TOTAL  % VENTAS'
      @4,0 SAY 'þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ'
      Y=5
      TOTAL=0
      ELIZ=1
      DO WHILE .NOT. BOF()
         IF SUBS(CODIGO,1,1)!='3' AND SUBS(CODIGO,1,1)!='8'
            SET RELA TO D->CODIGO INTO C
            @Y,0 SAY ''+CODIGO+'  '+SUBS(C->NOM_COMER,1,25)+'  '+SUBS(C->FORMA,1,5)+'  '+STR(CANTIDAD,12,2)+' '+STR(PRECIO,14,2)+'   '+STR((PRECIO/TOT1*100),5,2)
            Y=Y+1
         ENDIF   
         SKIP -1
         IF Y=21 .OR. BOF()
            IF BOF()
               @22,20 SAY 'TOTAL MEDICINAS (EN NUEVOS SOLES) :> '+STR(TOT1,15,2)
               IF ELIZ<10
                  PANTA='PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='PNT'+STR(ELIZ,2)         
               ENDIF
               ELIZ1=ELIZ
               SAVE WIND TODO TO (PANTA)
               ELIZ=ELIZ+1
               @24,20 SAY 'Presione <ENTER> para reportar Productos de Sala'
               READ
               IF LASTKEY()=27
                  EXIT
               ENDIF   
              ELSE
               IF ELIZ<10
                  PANTA='PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='PNT'+STR(ELIZ,2)         
               ENDIF   
               SAVE WIND TODO TO (PANTA)
               ELIZ=ELIZ+1
               @22,20 SAY 'Presione <ENTER> para continuar ...'
               READ
               IF LASTKEY()=27
                  EXIT
               ENDIF   
               Y=5
               @5,0 CLEA 
            ENDIF   
         ENDIF   
      ENDDO   
              
      GO BOTT
      ACTI WIND BLANCO
      ACTI WIND TODO
      CLEA
      SET COLO TO B/W*
      @0,24 SAY 'VENTAS DE PRODUCTOS DE SALA'
      SET COLO TO R+/B
      @1,25 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
      SET COLO TO WR/B
      @2,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
      @3,0 SAY 'CODIGO          N O M B R E         FORMA       CONSUMO    MONTO TOTAL  % VENTAS'
      @4,0 SAY 'þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ'
      Y=5
      TOTAL=0
      ELIZ=1
      DO WHILE .NOT. BOF()
         IF SUBS(CODIGO,1,1)='8'
            SET RELA TO D->CODIGO INTO C
            @Y,0 SAY ''+CODIGO+'  '+SUBS(C->NOM_COMER,1,25)+'  '+SUBS(C->FORMA,1,5)+'  '+STR(CANTIDAD,12,2)+' '+STR(PRECIO,14,2)+'   '+STR((PRECIO/TOT3*100),5,2)
            Y=Y+1
         ENDIF   
         SKIP -1
         IF Y=21 .OR. BOF()
            IF BOF()
               @22,20 SAY 'TOTAL PRODUCTOS DE SALA (EN NUEVOS SOLES) :> '+STR(TOT3,15,2)
               IF ELIZ<10
                  PANTA='PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='PNT'+STR(ELIZ,2)         
               ENDIF
               ELIZ1=ELIZ
               SAVE WIND TODO TO (PANTA)
               ELIZ=ELIZ+1
               @24,20 SAY 'Presione <ENTER> para reportar Material M‚dico'
               READ
               IF LASTKEY()=27
                  EXIT
               ENDIF   
              ELSE
               IF ELIZ<10
                  PANTA='PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='PNT'+STR(ELIZ,2)         
               ENDIF   
               SAVE WIND TODO TO (PANTA)
               ELIZ=ELIZ+1
               @22,20 SAY 'Presione <ENTER> para continuar ...'
               READ
               IF LASTKEY()=27
                  EXIT
               ENDIF   
               Y=5
               @5,0 CLEA 
            ENDIF   
         ENDIF   
      ENDDO   
        
             
      GO BOTT
      ACTI WIND BLANCO
      ACTI WIND TODO
      CLEA
      SET COLO TO B/W*
      @0,25 SAY 'VENTAS DE MATERIAL MEDICO'
      SET COLO TO R+/B
      @1,29 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
      SET COLO TO WR/B
      @2,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
      @3,0 SAY 'CODIGO          N O M B R E         FORMA       CONSUMO    MONTO TOTAL  % VENTAS'
      @4,0 SAY 'þþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþþ'
      Y=5
      TOTAL=0
      DO WHILE .NOT. BOF()
         IF SUBS(CODIGO,1,1)='3'
            SET RELA TO D->CODIGO INTO C
            @Y,0 SAY ''+CODIGO+'  '+SUBS(C->NOM_COMER,1,25)+'  '+SUBS(C->FORMA,1,5)+'  '+STR(CANTIDAD,12,2)+' '+STR(PRECIO,14,2)+'   '+STR((PRECIO/TOT2*100),5,2)
            Y=Y+1
         ENDIF   
         SKIP -1
         IF Y=21 .OR. BOF()
            IF BOF()
               @22,20 SAY 'TOTAL MATERIAL MEDICO (EN NUEVOS SOLES) :> '+STR(TOT2,15,2)
               @23,20 SAY 'TOTAL   G E N E R A L (EN NUEVOS SOLES) :> '+STR((TOT1+TOT2+TOT3),15,2)
               IF ELIZ<10
                  PANTA='PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='PNT'+STR(ELIZ,2)         
               ENDIF
               ELIZ1=ELIZ
               SAVE WIND TODO TO (PANTA)
               @24,10 SAY '< F2 > GRABA'
               @24,36 SAY '< F8 > IMPRIME'
               @24,64 SAY '<ESC> SALIR'
               SET COLO TO WR/B
               ON KEY LABEL PGUP DO SUBE
               ON KEY LABEL PGDN DO BAJA
               ON KEY LABEL F2 DO GRABAR
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
              ELSE
               IF ELIZ<10
                  PANTA='PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='PNT'+STR(ELIZ,2)         
               ENDIF   
               SAVE WIND TODO TO (PANTA)
               ELIZ=ELIZ+1
               @22,20 SAY 'Presione <ENTER> para continuar ...'
               READ
               IF LASTKEY()=27
                  EXIT
               ENDIF   
               Y=5
               @5,0 CLEA 
            ENDIF   
         ENDIF   
      ENDDO         
      DEAC WIND BLANCO
      DEAC WIND TODO
      DEAC WIND PREPARA
      IF ELIZ1>ELIZ
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
      ENDIF
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
      CLEA
      SET COLO TO WR/B*
      @0,2 SAY 'NO SE REGISTRAN SALIDAS EN '+NOMMES
      @2,0 SAY 'Verifique salidas al Contado y Cta.Cte.'
      WAIT''
      DEAC WIND PREPARA
   ENDIF   
   CLOS ALL
   DELE FILE (DRIVVE1)   
   DELE FILE IMHCOD.IDX
   DELE FILE IMHMON.IDX
ENDIF 
CLOS ALL  
RETURN



PROCEDURE DIARIO
*CLOSE ALL
*WAIT WIND 'REPORTE NO DISPONIBLE' NOWA
*RETURN
*******************************************************
*SE CONSIDERA SEGURO ESCOLAR Y SEGURO MATERNO INFANTIL*
*******************************************************
IF FILE('CANDIA.IDX')
   DELE FILE CANDIA.IDX
ENDIF   
SWIMP=0
STORE 0 TO CANSAL,PRESAL
IF MES<10
   MESES='0'+SUBS(STR(MES,2),2,1)
  ELSE
   MESES=STR(MES,2)
ENDIF  

DRIVVE='MED'+BASE+SUBS(STR(ANIO,4),3,2)+'.DBF'
IF FILE (DRIVVE)
   OPREP=' '
   ACTI WIND PREPARA
   @0,8 SAY 'O R D E N A D O   P O R'
   @1,2 SAY '<1> CODIGO'
   @1,27 SAY '<2> MONTOS'
   @2,15 SAY 'OPCION' GET OPREP PICT '9' VALID OPREP $'12' ERROR 'CARACTER EQUIVOCADO'
   READ 
   DEAC WIND PREPARA
   DRIVVE1='TMPO'+MESES+SUBS(STR(ANIO,4),3,2)+'.TEM'
   CLOS DATABASE
   DELE FILE (DRIVVE1)
   DELE FILE DIACOD.IDX
   DELE FILE DIAMON.IDX
   CREA TABLE (DRIVVE1) (CODIGO C(7), CANTIDAD N(9,2), PRECIO N(12,2))
   USE (DRIVVE1)
   INDE ON CODIGO TO DIACOD
   SELE A
         USE (DRIVVE)
   SELE B
         USE MEDICTDO NOUPDATE
         SET ORDE TO 1
   SELE C
         USE MEDICINA NOUPDATE
         SET ORDE TO 1
   SELE D
         USE (DRIVVE1) INDE DIACOD
   SELE E
         USE MEDICONV 
   SELE F
         USE FACTMEDI NOUPDATE
         SET ORDE TO 2
   SELE H
         USE MEDISESS NOUPDATE
   SELE I
         USE MEDISSMI NOUPDATE

   SELE A
   RELOJ1=1
   GO TOP
   ACTI WIND PREPARA
   SET COLO TO WR/B*
   @1,5 SAY 'ESPERE UN MOMENTO POR FAVOR ....'
   ACTI WIND AYUDAS
   CLEA
   SET COLO TO I
   @0,16 SAY '...PROCESANDO CUENTA CORRIENTE...'
   SET COLO TO WR/B
   GO TOP
   DO WHILE .NOT. EOF()
      IF DAY(FECHA)>=DIA1 AND DAY(FECHA)<=DIA2
         COD=MEDICINA1
         CANSAL=CANTIDAD1 
         PRESAL=PREC_MED1*CANTIDAD1
         SELE D
         SEEK COD
         IF FOUND()
            CANTI=CANTIDAD
            PRECI=PRECIO
            REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
           ELSE
            APPE BLANK
            REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
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
         SELE A
      ENDIF   
      SKIP
   ENDDO 
   CLEA
   SET COLO TO I
   @0,16 SAY '..PROCESANDO  C O N V E N I O S..'
   SET COLO TO WR/B
   SELE E
   GO TOP
   DO WHILE .NOT. EOF()
      IF FECHA>=FEC1 AND FECHA<=FEC2
         COD=MEDICINA1
         CANSAL=CANTIDAD1 
         PRESAL=(PREC_MED1*CANTIDAD1)*(1+PORC_CONV/100)
         SELE D
         SEEK COD
         IF FOUND()
            CANTI=CANTIDAD
            PRECI=PRECIO
            REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
           ELSE
            APPE BLANK
            REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
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
         SELE E
      ENDIF   
      SKIP
   ENDDO 
   

   CLEA
   SET COLO TO I
   @0,16 SAY '... PROCESANDO SEGURO ESCOLAR ...'
   SET COLO TO WR/B
   SELE H
   GO TOP
   DO WHILE .NOT. EOF()
      IF FECHA>=FEC1 AND FECHA<=FEC2
         COD=MEDICINA1
         CANSAL=CANTIDAD1 
         PRESAL=(PREC_MED1*CANTIDAD1)
         SELE D
         SEEK COD
         IF FOUND()
            CANTI=CANTIDAD
            PRECI=PRECIO
            REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
           ELSE
            APPE BLANK
            REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
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
         SELE H
      ENDIF   
      SKIP
   ENDDO 


   CLEA
   SET COLO TO I
   @0,11 SAY '... PROCESANDO SEGURO MATERNO INFANTIL ...'
   SET COLO TO WR/B
   SELE I
   GO TOP
   DO WHILE .NOT. EOF()
      IF FECHA>=FEC1 AND FECHA<=FEC2
         COD=MEDICINA1
         CANSAL=CANTIDAD1 
         PRESAL=(PREC_MED1*CANTIDAD1)
         SELE D
         SEEK COD
         IF FOUND()
            CANTI=CANTIDAD
            PRECI=PRECIO
            REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
           ELSE
            APPE BLANK
            REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
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
         SELE I
      ENDIF   
      SKIP
   ENDDO 



   CLEA
   SET COLO TO I
   @0,16 SAY '...PROCESANDO VENTA AL CONTADO...'
   SET COLO TO WR/B
   SELE F
   SEEK FEC1
   DO WHILE NOT EOF()
      IF FECHA<=FEC2 AND TIPO='M'
         NUM=NUMERO
         SELE B
         SEEK NUM
         IF FOUND()
            IF CANTID1>0
               COD=MEDICINA1
               CANSAL=CANTID1 
               PRESAL=PREC_UNI1*CANTID1
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID2>0
               COD=MEDICINA2
               CANSAL=CANTID2 
               PRESAL=PREC_UNI2*CANTID2
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID3>0
               COD=MEDICINA3 
               CANSAL=CANTID3 
               PRESAL=PREC_UNI3*CANTID3
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID4>0
               COD=MEDICINA4
               CANSAL=CANTID4 
               PRESAL=PREC_UNI4*CANTID4
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID5>0
               COD=MEDICINA5
               CANSAL=CANTID5 
               PRESAL=PREC_UNI5*CANTID5
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
               ENDIF   
            ENDIF  
*           SELE B
*           IF CANTID6>0
*              COD=MEDICINA6
*              CANSAL=CANTID6 
*              PRESAL=PREC_UNI6*CANTID6
*              SELE D
*              SEEK COD
*              IF FOUND()
*                 CANTI=CANTIDAD
*                 PRECI=PRECIO
*                 REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
*                ELSE
*                 APPE BLANK
*                 REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
*              ENDIF   
*           ENDIF  
*           SELE B
*           IF CANTID7>0
*              COD=MEDICINA7
*              CANSAL=CANTID7 
*              PRESAL=PREC_UNI7*CANTID7
*              SELE D
*              SEEK COD
*              IF FOUND()
*                 CANTI=CANTIDAD
*                 PRECI=PRECIO
*                 REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
*                ELSE
*                 APPE BLANK
*                 REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
*              ENDIF   
*           ENDIF  
*           SELE B
*           IF CANTID8>0
*              COD=MEDICINA8
*              CANSAL=CANTID8 
*              PRESAL=PREC_UNI8*CANTID8
*              SELE D
*              SEEK COD
*              IF FOUND()
*                 CANTI=CANTIDAD
*                 PRECI=PRECIO
*                 REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
*                ELSE
*                 APPE BLANK
*                 REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
*              ENDIF   
*           ENDIF  
*           SELE B
*           IF CANTID9>0
*              COD=MEDICINA9
*              CANSAL=CANTID9 
*              PRESAL=PREC_UNI9*CANTID9
*              SELE D
*              SEEK COD
*              IF FOUND()
*                 CANTI=CANTIDAD
*                 PRECI=PRECIO
*                 REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
*                ELSE
*                 APPE BLANK
*                 REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
*              ENDIF   
*           ENDIF  
*           SELE B
*           IF CANTID10>0
*              COD=MEDICINA10
*              CANSAL=CANTID10 
*              PRESAL=PREC_UNI10*CANTID10
*              SELE D
*              SEEK COD
*              IF FOUND()
*                 CANTI=CANTIDAD
*                 PRECI=PRECIO
*                 REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
*                ELSE
*                 APPE BLANK
*                 REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
*              ENDIF   
*           ENDIF
            SELE B            
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
         SELE F
      ENDIF   
      SKIP
      IF FECHA>FEC2
         EXIT
      ENDIF   
   ENDDO

   IF OPREP='2' 
      SELE D
      USE (DRIVVE1) 
      INDE ON PRECIO TO DIAMON
     ELSE
      SELE D 
   ENDIF
   DEAC WIND AYUDAS
   ACTI WIND BLANCO
   ACTI WIND TODO
   SET COLO TO B/W*
   @0,21 SAY 'REPORTES DE MEDICAMENTOS'
   SET COLO TO R+/B
   @1,25 SAY 'HOY :> '+DTOC(DATE())
   SET COLO TO WR/B
   @2,5 SAY 'DEL :> '+DTOC(FEC1)+'    AL :> '+DTOC(FEC2)
   Y=4
   TOTAL=0
   ELIZ=1
   IF OPREP='2'
      GO BOTT
      DO WHILE .NOT. BOF()
         SET RELA TO D->CODIGO INTO C
         @Y,0 SAY ''+CODIGO+'  '+SUBS(C->NOM_COMER,1,25)+'  '+SUBS(C->FORMA,1,5)+'  '+STR(CANTIDAD,12,2)+'  '+STR(PRECIO,14,2)
         TOTAL=TOTAL+PRECIO
         Y=Y+1
         SKIP -1
         IF Y=21 .OR. BOF()
            IF BOF()
               @22,20 SAY 'MONTO TOTAL (EN NUEVOS SOLES) :> '+STR(TOTAL,15,2)
               IF ELIZ<10
                  PANTA='PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='PNT'+STR(ELIZ,2)         
               ENDIF
               ELIZ1=ELIZ
               SAVE WIND TODO TO (PANTA)
               @24,10 SAY '< F2 > GRABA'
               @24,36 SAY '< F8 > IMPRIME'
               @24,64 SAY '<ESC> SALIR'
               SET COLO TO WR/B
               ON KEY LABEL PGUP DO SUBE
               ON KEY LABEL PGDN DO BAJA
               ON KEY LABEL F8 DO IMPRIDIA WITH OPREP
               ON KEY LABEL F2 DO GRABDIA
               SET ESCAPE ON
               STORE .F. TO mexit
               ON ESCAPE STORE .T. TO mexit
               DO WHILE NOT mexit
                  IF LASTKEY()!=-1 .AND. LASTKEY()!=-4
                     CLEAR TYPEAHEAD
                  ENDIF   
               ENDDO
               ON KEY LABEL F2
               ON KEY LABEL F8
               ON KEY LABEL PGDN
               ON KEY LABEL PGUP                             
              ELSE
               IF ELIZ<10
                  PANTA='PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='PNT'+STR(ELIZ,2)         
               ENDIF   
               SAVE WIND TODO TO (PANTA)
               @22,20 SAY 'Presione <ENTER> para continuar ...'
               WAIT''
               ELIZ=ELIZ+1
               Y=4
               @4,0 CLEA 
            ENDIF   
         ENDIF   
      ENDDO   
     ELSE
      GO TOP
      DO WHILE .NOT. EOF()
         SET RELA TO D->CODIGO INTO C
         @Y,0 SAY ''+CODIGO+'  '+SUBS(C->NOM_COMER,1,25)+'  '+SUBS(C->FORMA,1,5)+'  '+STR(CANTIDAD,12,2)+'  '+STR(PRECIO,14,2)
         TOTAL=TOTAL+PRECIO
         Y=Y+1
         SKIP 1
         IF Y=21 .OR. EOF()
            IF EOF()
               @22,20 SAY 'MONTO TOTAL (EN NUEVOS SOLES) :> '+STR(TOTAL,15,2)
               IF ELIZ<10
                  PANTA='PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='PNT'+STR(ELIZ,2)         
               ENDIF
               ELIZ1=ELIZ
               SAVE WIND TODO TO (PANTA)
               @24,10 SAY '< F2 > GRABA'
               @24,36 SAY '< F8 > IMPRIME'
               @24,64 SAY '<ESC> SALIR'
               SET COLO TO WR/B
               ON KEY LABEL PGUP DO SUBE
               ON KEY LABEL PGDN DO BAJA
               ON KEY LABEL F8 DO IMPRIDIA WITH OPREP
               ON KEY LABEL F2 DO GRABDIA
               SET ESCAPE ON
               STORE .F. TO mexit
               ON ESCAPE STORE .T. TO mexit
               DO WHILE NOT mexit
                  IF LASTKEY()!=-1 .AND. LASTKEY()!=-4
                     CLEAR TYPEAHEAD
                  ENDIF   
               ENDDO
               ON KEY LABEL F2
               ON KEY LABEL F8
               ON KEY LABEL PGDN
               ON KEY LABEL PGUP                             
              ELSE
               IF ELIZ<10
                  PANTA='PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='PNT'+STR(ELIZ,2)         
               ENDIF   
               SAVE WIND TODO TO (PANTA)
               @22,20 SAY 'Presione <ENTER> para continuar ...'
               WAIT''
               ELIZ=ELIZ+1
               Y=4
               @4,0 CLEA 
            ENDIF   
         ENDIF   
      ENDDO   
   ENDIF    
   CLOS ALL
   DELE FILE DRIVVE1
   DELE FILE DIACOD.IDX
   DELE FILE DIACAN.IDX
   DEAC WIND BLANCO
   DEAC WIND TODO
   DEAC WIND PREPARA
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
   @1,2 SAY 'NO SE REGISTRAN SALIDAS EN '+NOMMES
   WAIT''
   DEAC WIND PREPARA
ENDIF   
CLOS ALL
IF ELIZ1>0
FOR ELIZ=1 TO ELIZ1
   IF ELIZ<10
      PANTA='PNT0'+STR(ELIZ,1)+'.WIN'
     ELSE
      PANTA='PNT'+STR(ELIZ,2)+'.WIN'
   ENDIF   
   DELE FILE (PANTA) 
ENDFOR   
ENDIF
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



PROCEDURE IMPRIMA
PARAMETER A
IF SWIMP=1

   *****************************************
   ***************SI FUE GRABADO************
   *****************************************
   *****MEDICINAS*****
   SELE A
   GO BOTT
   ACTI WIND PREPARA
   SET COLO TO WR/B*
   CLEA
   @1,9 SAY 'VERIFIQUE IMPRESORA'
   WAIT''
   CLEA
   TOTAL=0
   PAG=1
   IF PRINTSTATUS()
      @0,9 SAY 'I M P R I M I E N D O'
      @2,8 SAY '<< M E D I C I N A S >>'
      SET DEVI TO PRINT
      @2,0 SAY CHR(18)      
      @2,0 SAY CHR(14)+'           VENTAS DE MEDICINAS'
      @2,0 SAY CHR(14)+'           VENTAS DE MEDICINAS'
      @3,0 SAY CHR(15)      
      @3,55 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
      @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
      @4,129 SAY 'P g :'+STR(PAG,4)
      @5,4 SAY REPLI('ð',134)
      @6,4 SAY 'ORDEN CODIGO               N O M B R E          FORMA     UNID FISICAS        MONTO TOTAL     % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
      @7,4 SAY REPLI('ð',134)
      Y=8
      X=1
      DO WHILE .NOT. BOF()
         IF SUBS(CODIGO,1,1)!='3' AND SUBS(CODIGO,1,1)!='8' AND &CANSTO>0
            TOTAL=TOTAL+&MONTOS
            SET RELA TO A->CODIGO INTO C
            @Y,4 SAY+STR(X,4)+'  '+CODIGO+'  '+SUBS(C->NOM_COMER,1,30)+'  '+SUBS(C->FORMA,1,6)+'     '+STR(&CANSTO,12,2)+'    '+STR(&MONTOS,14,2)+'       '+STR((&MONTOS/TOT1*100),5,2)+'  '+STR(TOTAL,14,2)+'          '+STR((TOTAL/TOT1*100),5,2)
            X=X+1
            Y=Y+1
         ENDIF   
         IF Y=61 OR BOF() OR &CANSTO=0
            IF BOF() OR &CANSTO=0
               @55,20 SAY 'TOTAL MEDICINAS (EN NUEVOS SOLES) :> '+STR(TOT1,15,2)
               EJECT
               EXIT
              ELSE 
               EJECT
               PAG=PAG+1
               @2,0 SAY CHR(18)      
               @2,0 SAY CHR(14)+'           VENTAS DE MEDICINAS'
               @2,0 SAY CHR(14)+'           VENTAS DE MEDICINAS'
               @3,0 SAY CHR(15)      
               @3,55 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
               @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
               @4,129 SAY 'P g :'+STR(PAG,4)
               @5,4 SAY REPLI('ð',134)
               @6,4 SAY 'ORDEN CODIGO               N O M B R E          FORMA     UNID FISICAS        MONTO TOTAL     % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
               @7,4 SAY REPLI('ð',134)
               Y=8
            ENDIF   
         ENDIF   
         SKIP -1
      ENDDO   
      SET DEVI TO SCREE
      DEAC WIND PREPARA
   ENDIF  
   
   ********PRODUCTOS DE SALA******
   SELE A
   GO BOTT
   ACTI WIND PREPARA
   SET COLO TO WR/B*
   CLEA
   @1,9 SAY 'VERIFIQUE IMPRESORA'
   WAIT''
   CLEA
   TOTAL=0
   PAG=1
   IF PRINTSTATUS()
      @0,9 SAY 'I M P R I M I E N D O'
      @2,8 SAY '<< PRODUCTOS DE SALA >>'
      SET DEVI TO PRINT
      @2,0 SAY CHR(18)      
      @2,0 SAY CHR(14)+'        VENTAS PRODUCTOS D E SALA'      
      @2,0 SAY CHR(14)+'        VENTAS PRODUCTOS D E SALA'      
      @3,0 SAY CHR(15)      
      @3,55 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
      @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
      @4,129 SAY 'P g :'+STR(PAG,4)
      @5,4 SAY REPLI('ð',134)
      @6,4 SAY 'ORDEN CODIGO               N O M B R E          FORMA     UNID FISICAS        MONTO TOTAL     % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
      @7,4 SAY REPLI('ð',134)
      Y=8
      X=1
      DO WHILE .NOT. BOF()
         IF SUBS(CODIGO,1,1)='8' AND &CANSTO>0
            TOTAL=TOTAL+&MONTOS
            SET RELA TO A->CODIGO INTO C
            @Y,4 SAY+STR(X,4)+'  '+CODIGO+'  '+SUBS(C->NOM_COMER,1,30)+'  '+SUBS(C->FORMA,1,6)+'     '+STR(&CANSTO,12,2)+'    '+STR(&MONTOS,14,2)+'       '+STR((&MONTOS/TOT3*100),5,2)+'  '+STR(TOTAL,14,2)+'          '+STR((TOTAL/TOT3*100),5,2)
            X=X+1
            Y=Y+1
         ENDIF   
         IF Y=61 OR BOF() OR &CANSTO=0
            IF BOF() OR &CANSTO=0
               @55,20 SAY 'TOTAL PRODUCTOS DE SALA (EN NUEVOS SOLES) :> '+STR(TOT3,15,2)            
               EJECT
               EXIT
              ELSE 
               EJECT
               PAG=PAG+1
               @2,0 SAY CHR(18)      
               @2,0 SAY CHR(14)+'        VENTAS PRODUCTOS D E SALA'      
               @2,0 SAY CHR(14)+'        VENTAS PRODUCTOS D E SALA'      
               @3,0 SAY CHR(15)      
               @3,55 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
               @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
               @4,129 SAY 'P g :'+STR(PAG,4)
               @5,4 SAY REPLI('ð',134)
               @6,4 SAY 'ORDEN CODIGO               N O M B R E          FORMA     UNID FISICAS        MONTO TOTAL     % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
               @7,4 SAY REPLI('ð',134)
               Y=8
            ENDIF   
         ENDIF   
         SKIP -1
      ENDDO   
      SET DEVI TO SCREE
      DEAC WIND PREPARA
   ENDIF  


   *****MATERIAL MEDICO*****
   SELE A
   GO BOTT
   ACTI WIND PREPARA
   SET COLO TO WR/B*
   CLEA  
   @1,9 SAY 'VERIFIQUE IMPRESORA'
   WAIT''
   TOTAL=0
   PAG=1
   IF PRINTSTATUS()
      @0,9 SAY 'I M P R I M I E N D O'
      @2,8 SAY '<< MATERIAL   MEDICO >>'
      SET DEVI TO PRINT
      @2,0 SAY CHR(18)      
      @2,0 SAY CHR(14)+'        VENTAS DE MATERIAL MEDICO'
      @2,0 SAY CHR(14)+'        VENTAS DE MATERIAL MEDICO'
      @2,0 SAY CHR(15)      
      @3,45 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
      @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
      @4,129 SAY 'P g :'+STR(PAG,4)
      @5,4 SAY REPLI('ð',134)
      @6,4 SAY 'ORDEN CODIGO               N O M B R E          FORMA     UNID FISICAS       MONTO TOTAL      % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
      @7,4 SAY REPLI('ð',134)
      Y=8 
      X=1
      DO WHILE .NOT. BOF()
         IF SUBS(CODIGO,1,1)='3' AND &CANSTO>0
               TOTAL=TOTAL+&MONTOS
               SET RELA TO A->CODIGO INTO C
               @Y,4 SAY+STR(X,4)+'  '+CODIGO+'  '+SUBS(C->NOM_COMER,1,30)+'  '+SUBS(C->FORMA,1,6)+'     '+STR(&CANSTO,12,2)+'    '+STR(&MONTOS,14,2)+'       '+STR((&MONTOS/TOT2*100),5,2)+'  '+STR(TOTAL,14,2)+'          '+STR((TOTAL/TOT2*100),5,2)
               Y=Y+1
               X=X+1
         ENDIF   
         IF Y=61 OR BOF() OR &CANSTO=0
            IF BOF() OR &CANSTO=0
               @55,20 SAY 'TOTAL MATERIAL MEDICO (EN NUEVOS SOLES) :> '+STR(TOT2,15,2)
               EJECT
               EXIT
              ELSE
               EJECT
               PAG=PAG+1
               @2,0 SAY CHR(18)      
               @2,0 SAY CHR(14)+'        VENTAS DE MATERIAL MEDICO'
               @2,0 SAY CHR(14)+'        VENTAS DE MATERIAL MEDICO'
               @2,0 SAY CHR(15)      
               @3,45 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
               @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
               @4,129 SAY 'P g :'+STR(PAG,4)
               @5,4 SAY REPLI('ð',134)
               @6,4 SAY 'ORDEN CODIGO               N O M B R E          FORMA     UNID FISICAS       MONTO TOTAL      % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
               @7,4 SAY REPLI('ð',134)
               Y=8
            ENDIF   
         ENDIF
         SKIP -1
      ENDDO   
      SET DEVI TO SCREE
      DEAC WIND PREPARA
   ENDIF

  ELSE 
   
   *****************************************
   ***************NO FUE GRABADO************
   *****************************************
   ****MEDICINAS****
   SELE D
   GO BOTT
   ACTI WIND PREPARA
   SET COLO TO WR/B*
   CLEA
   @1,9 SAY 'VERIFIQUE IMPRESORA'
   WAIT''
   TOTAL=0
   PAG=1
   IF PRINTSTATUS()
      @0,9 SAY 'I M P R I M I E N D O'
      @2,8 SAY '<< M E D I C I N A S >>'   
      SET DEVI TO PRINT
      @2,0 SAY CHR(18)      
      @2,0 SAY CHR(14)+'           VENTAS DE MEDICINAS'
      @2,0 SAY CHR(14)+'           VENTAS DE MEDICINAS'
      @3,0 SAY CHR(15)      
      @3,50 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
      @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
      @4,129 SAY 'P g :'+STR(PAG,4)
      @5,4 SAY REPLI('ð',134)
      @6,4 SAY 'ORDEN CODIGO              N O M B R E           FORMA     C O N S U M O      CONS VALORADO    % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
      @7,4 SAY REPLI('ð',134)
      Y=8
      X=1
      DO WHILE .NOT. BOF()
         IF SUBS(CODIGO,1,1)!='3' AND SUBS(CODIGO,1,1)!='8'
            TOTAL=TOTAL+PRECIO
            SET RELA TO D->CODIGO INTO C
            @Y,4 SAY+STR(X,4)+'  '+CODIGO+'  '+SUBS(C->NOM_COMER,1,30)+'  '+SUBS(C->FORMA,1,6)+'     '+STR(CANTIDAD,12,2)+'    '+STR(PRECIO,14,2)+'       '+STR((PRECIO/TOT1*100),5,2)+'  '+STR(TOTAL,14,2)+'          '+STR((TOTAL/TOT1*100),5,2)
            Y=Y+1
            X=X+1
         ENDIF
         SKIP -1
         IF Y=61 OR BOF()
            IF BOF()
               @55,20 SAY 'TOTAL MEDICINAS (EN NUEVOS SOLES) :> '+STR(TOT1,15,2)            
               EJECT
              ELSE
               EJECT
               PAG=PAG+1
               @2,0 SAY CHR(18)      
               @2,0 SAY CHR(14)+'           VENTAS DE MEDICINAS'
               @2,0 SAY CHR(14)+'           VENTAS DE MEDICINAS'
               @3,0 SAY CHR(15)      
               @3,50 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
               @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
               @4,129 SAY 'P g :'+STR(PAG,4)
               @5,4 SAY REPLI('ð',134)
               @6,4 SAY 'ORDEN CODIGO              N O M B R E           FORMA     C O N S U M O      CONS VALORADO    % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
               @7,4 SAY REPLI('ð',134)
               Y=8
            ENDIF   
         ENDIF   
      ENDDO   
      SET DEVI TO SCREE
      DEAC WIND PREPARA
   ENDIF

   *****PRODUCTOS DE SALA*****
   SELE D
   GO BOTT
   ACTI WIND PREPARA
   SET COLO TO WR/B*
   CLEA
   @1,9 SAY 'VERIFIQUE IMPRESORA'
   WAIT''
   TOTAL=0
   PAG=1
   IF PRINTSTATUS()
      @0,9 SAY 'I M P R I M I E N D O'
      @2,8 SAY '<< PRODUCTOS DE SALA >>'
      SET DEVI TO PRINT
      @2,0 SAY CHR(18)      
      @2,0 SAY CHR(14)+'        VENTAS PRODUCTOS D E SALA'      
      @2,0 SAY CHR(14)+'        VENTAS PRODUCTOS D E SALA'      
      @3,0 SAY CHR(15)      
      @3,50 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
      @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
      @4,129 SAY 'P g :'+STR(PAG,4)
      @5,4 SAY REPLI('ð',134)
      @6,4 SAY 'ORDEN CODIGO              N O M B R E           FORMA     C O N S U M O      CONS VALORADO    % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
      @7,4 SAY REPLI('ð',134)
      Y=8
      X=1
      DO WHILE .NOT. BOF()
         IF SUBS(CODIGO,1,1)='8'
            TOTAL=TOTAL+PRECIO
            SET RELA TO D->CODIGO INTO C
            @Y,4 SAY+STR(X,4)+'  '+CODIGO+'  '+SUBS(C->NOM_COMER,1,30)+'  '+SUBS(C->FORMA,1,6)+'     '+STR(CANTIDAD,12,2)+'    '+STR(PRECIO,14,2)+'       '+STR((PRECIO/TOT3*100),5,2)+'  '+STR(TOTAL,14,2)+'          '+STR((TOTAL/TOT3*100),5,2)
            Y=Y+1
            X=X+1
         ENDIF
         SKIP -1
         IF Y=61 OR BOF()
            IF BOF()
               @55,20 SAY 'TOTAL PRODUCTOS DE SALA (EN NUEVOS SOLES) :> '+STR(TOT3,15,2)            
               EJECT
              ELSE
               EJECT
               PAG=PAG+1
               @2,0 SAY CHR(18)      
               @2,0 SAY CHR(14)+'        VENTAS PRODUCTOS D E SALA'      
               @2,0 SAY CHR(14)+'        VENTAS PRODUCTOS D E SALA'      
               @3,0 SAY CHR(15)      
               @3,50 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
               @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
               @4,129 SAY 'P g :'+STR(PAG,4)
               @5,4 SAY REPLI('ð',134)
               @6,4 SAY 'ORDEN CODIGO              N O M B R E           FORMA     C O N S U M O      CONS VALORADO    % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
               @7,4 SAY REPLI('ð',134)
               Y=8
            ENDIF   
         ENDIF   
      ENDDO   
      SET DEVI TO SCREE
      DEAC WIND PREPARA
   ENDIF


   ****MATERIAL MEDICO*****
   SELE D
   GO BOTT
   ACTI WIND PREPARA
   SET COLO TO WR/B*
   CLEA
   @1,9 SAY 'VERIFIQUE IMPRESORA'
   WAIT''
   PAG=1
   TOTAL=0
   IF PRINTSTATUS()
      @0,9 SAY 'I M P R I M I E N D O'
      @2,8 SAY '<< MATERIAL   MEDICO >>'
      SET DEVI TO PRINT
      @2,0 SAY CHR(18)      
      @2,0 SAY CHR(14)+'        VENTAS DE MATERIAL MEDICO'
      @2,0 SAY CHR(14)+'        VENTAS DE MATERIAL MEDICO'
      @2,0 SAY CHR(15)      
      @3,50 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
      @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
      @4,129 SAY 'P g :'+STR(PAG,4)
      @5,4 SAY REPLI('ð',134)
      @6,4 SAY 'ORDEN CODIGO              N O M B R E           FORMA     C O N S U M O      CONS VALORADO    % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
      @7,4 SAY REPLI('ð',134)
      Y=8
      X=1
      DO WHILE .NOT. BOF()
         IF SUBS(CODIGO,1,1)='3'
            TOTAL=TOTAL+PRECIO
            SET RELA TO D->CODIGO INTO C
            @Y,4 SAY+STR(X,4)+'  '+CODIGO+'  '+SUBS(C->NOM_COMER,1,30)+'  '+SUBS(C->FORMA,1,6)+'     '+STR(CANTIDAD,12,2)+'    '+STR(PRECIO,14,2)+'       '+STR((PRECIO/TOT1*100),5,2)+'  '+STR(TOTAL,14,2)+'          '+STR((TOTAL/TOT2*100),5,2)
            Y=Y+1
            X=X+1
         ENDIF   
         SKIP -1
         IF Y=61 OR BOF()
            IF BOF()
               @55,20 SAY 'TOTAL MATERIAL MEDICO (EN NUEVOS SOLES) :> '+STR(TOTAL,15,2)            
              ELSE 
               EJECT
               PAG=PAG+1
               @2,0 SAY CHR(18)      
               @2,0 SAY CHR(14)+'        VENTAS DE MATERIAL MEDICO'
               @2,0 SAY CHR(14)+'        VENTAS DE MATERIAL MEDICO'
               @2,0 SAY CHR(15)      
               @3,50 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
               @4,5 SAY 'CORRESPONDIENTE A :> '+NOMMES+'-'+STR(ANIO,4)
               @4,129 SAY 'P g :'+STR(PAG,4)
               @5,4 SAY REPLI('ð',134)
               @6,4 SAY 'ORDEN CODIGO              N O M B R E           FORMA     C O N S U M O      CONS VALORADO    % VENTAS   TOTAL ACUMULADO   % ACUMULADO'
               @7,4 SAY REPLI('ð',134)
               Y=8
            ENDIF   
         ENDIF   
      ENDDO   
      SET DEVI TO SCREE
      DEAC WIND PREPARA
   ENDIF
ENDIF
RETURN



PROCEDURE GRABAR
IF MES<10
   MESES='0'+SUBS(STR(MES,2),2,1)
  ELSE
   MESES=STR(MES,2)
ENDIF  
CLOS ALL
SELE D
   USE (DRIVVE1) INDE IMHCOD,IMHMON
SELE B
   DRV01=DRIVFARM+'\SALICONS.DBF'
   USE &DRV01
   SET ORDE TO 1
   *USE H:\FARMACIA\FARMACO\SALICONS
SELE C
   USE MEDICINA
   SET ORDE TO 1
   * INDE MEDI   
NOM=SPACE(20)
SELE D
SET ORDE TO 2
GO BOTT
ACTI WIND PREPARA
SET COLO TO WR/B*
CLEA
@1,6 SAY 'G  R  A  B  A  N  D  O...'
DO WHILE .NOT. BOF()
   CODI=CODIGO
   CANT=CANTIDAD
   PREC=PRECIO
   SELE B
   SEEK CODI
   IF FOUND()
      REPLA (CANSTO) WITH CANT,(MONTOS) WITH PREC
     ELSE
      APPE BLANK
      REPLA CODIGO WITH CODI,(CANSTO) WITH CANT,(MONTOS) WITH PREC
      SELE C
      SEEK CODI
      IF FOUND()
         NOM=NOM_COMER
         FRM=FORMA
      ENDIF   
      SELE B
      REPLA NOM_COMER WITH NOM, FORMA WITH FRM
   ENDIF   
   SELE D
   SKIP -1      
ENDDO
DEAC WIND PREPARA
ON KEY LABEL F2
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
    @24,10 SAY '< F2 > GRABA'
    @24,36 SAY '< F8 > IMPRIME'
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
    @24,10 SAY '< F2 > GRABA'
    @24,36 SAY '< F8 > IMPRIME'
    @24,64 SAY '<ESC> SALIR'
ENDIF    
RETURN



FUNCTION DIAS
PARAMETER A,B,C,D
IF A>9
   F1=STR(A,2)
  ELSE
   F1='0'+SUBS(STR(A,2),2,1)
ENDIF
IF B>9      
   F2=STR(B,2)
  ELSE 
   F2='0'+SUBS(STR(B,2),2,1)
ENDIF   
IF D='DIA1'
   FEC1=CTOD(F1+'/'+F2+'/'+STR(C,4))
   IF DTOC(FEC1)!='  /  /    '
      RETURN .T.
     ELSE
      RETURN .F.
   ENDIF    
  ELSE
   FEC2=CTOD(F1+'/'+F2+'/'+STR(C,4))
   IF DTOC(FEC2)!='  /  /    '
      IF FEC2>=FEC1
         RETURN .T.
        ELSE
         RETURN .F.
      ENDIF    
     ELSE
      RETURN .F.
   ENDIF    
ENDIF   
RETURN



PROCEDURE IMPRIDIA
PARAMETER A
SELE D
ACTI WIND PREPARA
SET COLO TO WR/B*
CLEA
@1,9 SAY 'VERIFIQUE IMPRESORA'
WAIT''
TOTAL=0
IF PRINTSTATUS()
      PAG=1
      @1,6 SAY 'I M P R I M I E N D O...'
      SET DEVI TO PRINT
      @2,0 SAY CHR(18)      
      @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
      @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
*      @3,0 SAY CHR(15)      
      @3,29 SAY 'EMISION :> '+DTOC(DATE())
      @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)
      @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)
      @4,72 SAY 'P g. :'+STR(PAG,2)
      @6,4 SAY 'CODIGO               N O M B R E         FORMA      CANTIDAD           MONTO'
      @7,4 SAY REPLI('ð',76)
      Y=8
      IF A='2'
         GO BOTT
         DO WHILE .NOT. BOF()
            SET RELA TO D->CODIGO INTO C
            @Y,4 SAY ''+CODIGO+'  '+SUBS(C->NOM_COMER,1,30)+'  '+SUBS(C->FORMA,1,5)+'  '+STR(CANTIDAD,12,2)+'  '+STR(PRECIO,14,2)
            TOTAL=TOTAL+PRECIO
            Y=Y+1
            IF Y=57 OR BOF()
               EJECT
               PAG=PAG+1
               @2,0 SAY CHR(18)      
               @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
               @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
*               @3,0 SAY CHR(15)      
               @3,29 SAY 'EMISION :> '+DTOC(DATE())
               @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)
               @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)               
               @4,72 SAY 'P g. :'+STR(PAG,2)
               @6,4 SAY 'CODIGO               N O M B R E         FORMA      CANTIDAD           MONTO'
               @7,4 SAY REPLI('ð',76)
               Y=8
            ENDIF   
            SKIP -1
            IF BOF()
               @55,20 SAY 'MONTO TOTAL (EN NUEVOS SOLES) :> '+STR(TOTAL,15,2)            
               EJECT
            ENDIF   
         ENDDO   
        ELSE
         GO TOP
         DO WHILE .NOT. EOF()
            SET RELA TO D->CODIGO INTO C
            @Y,4 SAY ''+CODIGO+'  '+SUBS(C->NOM_COMER,1,30)+'  '+SUBS(C->FORMA,1,5)+'  '+STR(CANTIDAD,12,2)+'  '+STR(PRECIO,14,2)
            TOTAL=TOTAL+PRECIO
            Y=Y+1
            IF Y=57 OR EOF()
               EJECT
               PAG=PAG+1
               @2,0 SAY CHR(18)      
               @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
               @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
 *              @3,0 SAY CHR(15)      
               @3,29 SAY 'EMISION :> '+DTOC(DATE())
               @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)
               @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)
               @4,72 SAY 'P g. :'+STR(PAG,2)
               @6,4 SAY 'CODIGO               N O M B R E         FORMA      CANTIDAD           MONTO'
               @7,4 SAY REPLI('ð',76)
               Y=8
            ENDIF   
            SKIP 
            IF EOF()
               @55,20 SAY 'MONTO TOTAL (EN NUEVOS SOLES) :> '+STR(TOTAL,15,2)            
               EJECT
            ENDIF   
         ENDDO   
     ENDIF    
     SET DEVI TO SCREE
     DEAC WIND PREPARA
ENDIF
RETURN


PROCEDURE GRABDIA
NOMDIA=SPACE(8)
ACTI WIND PREPARA
SET COLO TO WR/B
CLEA
@1,4 SAY 'NOMBRE DE FICHERO :> ' GET NOMDIA
READ
IF LAST()=27
   DEAC WIND PREPARA
   RETURN
ENDIF   
SET COLO TO WR/B*
CLEA
@1,6 SAY 'G  R  A  B  A  N  D  O...'
NOMDIA=ALLT(NOMDIA)+'.DBF'
DELE FILE &NOMDIA
SELE D
COPY STRU TO &NOMDIA
SELE G
USE &NOMDIA
SELE D
GO TOP
DO WHILE NOT EOF()
   COD=CODIGO
   CAN=CANTIDAD
   PRE=PRECIO
   SELE G
   APPE BLAN
   REPLA CODIGO WITH COD, CANTIDAD WITH CAN, PRECIO WITH PRE
   SELE D
   SKIP
ENDDO 
DEAC WIND PREPARA
RETURN
QUIT