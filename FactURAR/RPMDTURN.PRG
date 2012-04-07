SET BELL TO 60,1
SET ESCAPE OFF
SET EXACT ON
SET SAFE OFF
DEFI WIND TODO FROM 0,0 TO 24,79;
     CLOSE FLOAT GROW SHADOW COLOR W/B NONE
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
FEC1=DATE()
FEC2=DATE()
HORA1=SPACE(5)
HORA2=SPACE(5)
ACTI WIND PREPARA
CLEA
@0,5 SAY "Seleccione periodo de proceso" COLO W/B
@1,0 SAY "DESDE :>" GET FEC1
@1,26 SAY "HORA :>" GET HORA1 PICT "99:99"
@2,0 SAY "DESDE :>" GET FEC2
@2,26 SAY "HORA :>" GET HORA2 PICT "99:99"
READ
DEAC WIND PREPARA
IF LAST()!=27 AND FEC2>=FEC1
   DO DIARIO
ENDIF   
CLOS ALL



PROCEDURE DIARIO
TIME01=(YEAR(FEC1)*360+(MONTH(FEC1)-1)*30+DAY(FEC1))*1440+VAL(SUBS(HORA1,1,2))*60+VAL(SUBS(HORA1,4,2))
TIME02=(YEAR(FEC2)*360+(MONTH(FEC2)-1)*30+DAY(FEC2))*1440+VAL(SUBS(HORA2,1,2))*60+VAL(SUBS(HORA2,4,2))
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
   CREA TABLE C:\SIGEP\TEMP\TMPO2002 (CODIGO C(7), NOMBRE C(50), FORMA C(10), CANTIDAD N(9,2), PRECIO N(12,2))
   USE C:\SIGEP\TEMP\TMPO2002
   INDE ON CODIGO TAG CODIGO
   INDE ON PRECIO TAG PRECIO
CLOS ALL
*   SELE A
*         USE MEDIHOSP ALIAS MEDIHOSP NOUPDATE
   SELE B
         USE MEDICTDO ALIAS MEDICTDO NOUPDATE
         SET ORDE TO FECHA
   SELE C
         USE MEDICINA ALIAS MEDICINA NOUPDATE
         SET ORDE TO CODIGO
   SELE D
         USE C:\SIGEP\TEMP\TMPO2002 ALIAS TMPO2002
         SET ORDE TO CODIGO
*   SELE E
*         USE MEDICONV ALIAS MEDICONV NOUPDATE
   SELE F
         USE FACTURA ALIAS FACTURA NOUPDATE
         SET ORDE TO FECHA
   SELE J
         USE ..\SISTMEDI\DATOS\TIPOMEDI ALIAS TIPOMEDI NOUPDATE
         SET ORDE TO CODIGO
*  SELE A
*  RELOJ1=1
*  GO TOP
*  ACTI WIND PREPARA
*  @1,5 SAY 'ESPERE UN MOMENTO POR FAVOR ....' COLO WR/B*
*  ACTI WIND AYUDAS
*  CLEA
*  @0,16 SAY '...PROCESANDO CUENTA CORRIENTE...' COLO I
*  GO TOP
*  DO WHILE .NOT. EOF()
*     TIMESS=(YEAR(FECHA)*360+(MONTH(FECHA)-1)*30+DAY(FECHA))*1440+VAL(SUBS(HORA,1,2))*60+VAL(SUBS(HORA,4,2))
*     IF TIMESS>=TIME01 AND TIMESS<=TIME02
*        COD=MEDICINA1
*        CANSAL=CANTIDAD1 
*        PRESAL=PREC_MED1*CANTIDAD1
*        SELE D
*        SEEK COD
*        IF FOUND()
*           CANTI=CANTIDAD
*           PRECI=PRECIO
*           REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
*          ELSE
*           APPE BLANK
*           REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
*        ENDIF   
*        SELE A
*     ENDIF   
*     SKIP
*  ENDDO 
*  CLEA
*  @0,16 SAY '..PROCESANDO  C O N V E N I O S..' COLO I
*  SELE E
*  GO TOP
*  DO WHILE .NOT. EOF()
*     TIMESS=(YEAR(FECHA)*360+(MONTH(FECHA)-1)*30+DAY(FECHA))*1440+VAL(SUBS(HORA,1,2))*60+VAL(SUBS(HORA,4,2))
*     IF TIMESS>=TIME01 AND TIMESS<=TIME02
*        COD=MEDICINA1
*        CANSAL=CANTIDAD1 
*        PRESAL=(PREC_MED1*CANTIDAD1)*(1+PORC_CONV/100)
*        SELE D
*        SEEK COD
*        IF FOUND()
*           CANTI=CANTIDAD
*           PRECI=PRECIO
*           REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL)
*          ELSE
*           APPE BLANK
*           REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL
*        ENDIF   
*        SELE E
*     ENDIF   
*     SKIP
*  ENDDO 
*  
   ACTI WIND AYUDAS
   CLEA
   @0,16 SAY '...PROCESANDO VENTAS AL CONTADO...' COLO I
   SELE MEDICTDO
   SET ORDE TO FECHA
   SEEK FEC1
   DO WHILE NOT EOF()
      TIMESS=(YEAR(FECHA)*360+(MONTH(FECHA)-1)*30+DAY(FECHA))*1440+VAL(SUBS(HORA,1,2))*60+VAL(SUBS(HORA,4,2))
      IF TIMESS>=TIME01 AND TIMESS<=TIME02
         IF ESTADO!="A"
            IF CANTID1>0
               COD=MEDICINA1
               CANSAL=CANTID1 
               PRESAL=PREC_UNI1*CANTID1*(1-EXONERAR/100)
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
               PRESAL=PREC_UNI2*CANTID2*(1-EXONERAR/100)
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
               PRESAL=PREC_UNI3*CANTID3*(1-EXONERAR/100)
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
               PRESAL=PREC_UNI4*CANTID4*(1-EXONERAR/100)
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
               PRESAL=PREC_UNI5*CANTID5*(1-EXONERAR/100)
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
            IF CANTID6>0
               COD=MEDICINA6
               CANSAL=CANTID6 
               PRESAL=PREC_UNI6*CANTID6*(1-EXONERAR/100)
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
            IF CANTID7>0
               COD=MEDICINA7
               CANSAL=CANTID7 
               PRESAL=PREC_UNI7*CANTID7*(1-EXONERAR/100)
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
            IF CANTID8>0
               COD=MEDICINA8
               CANSAL=CANTID8 
               PRESAL=PREC_UNI8*CANTID8*(1-EXONERAR/100)
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
            IF CANTID9>0
               COD=MEDICINA9
               CANSAL=CANTID9 
               PRESAL=PREC_UNI9*CANTID9*(1-EXONERAR/100)
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
            IF CANTID10>0
               COD=MEDICINA10
               CANSAL=CANTID10 
               PRESAL=PREC_UNI10*CANTID10*(1-EXONERAR/100)
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
         ENDIF   
         SELE MEDICTDO
      ENDIF   
      SKIP
      IF FECHA>FEC2
         EXIT
      ENDIF   
   ENDDO
   SELE TMPO2002
   IF OPREP='2' 
      SET ORDE TO PRECIO
     ELSE
      SET ORDE TO CODIGO
   ENDIF
   DEAC WIND AYUDAS
   ACTI WIND BLANCO
   ACTI WIND TODO
   CLEA
   @0,19 SAY 'S A L I D A S  D E  M E D I C A M E N T O S' COLO B/W*
   @1,31 SAY 'HOY :> '+DTOC(DATE())
   @2,0 SAY 'DEL :> '+DTOC(FEC1)+'    AL :> '+DTOC(FEC2)
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
                  PANTA='C:\SIGEP\TEMP\PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='C:\SIGEP\TEMP\PNT'+STR(ELIZ,2)
               ENDIF
               ELIZ1=ELIZ
               SAVE WIND TODO TO (PANTA)
               @24,10 SAY '< F2 > GRABA'
               @24,36 SAY '< F8 > IMPRIME'
               @24,64 SAY '<ESC> SALIR'
               *SET COLO TO WR/B
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
                  PANTA='C:\SIGEP\TEMP\PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='C:\SIGEP\TEMP\PNT'+STR(ELIZ,2)
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
                  PANTA='C:\SIGEP\TEMP\PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='C:\SIGEP\TEMP\PNT'+STR(ELIZ,2)
               ENDIF
               ELIZ1=ELIZ
               SAVE WIND TODO TO (PANTA)
               @24,10 SAY '< F2 > GRABA'
               @24,36 SAY '< F8 > IMPRIME'
               @24,64 SAY '<ESC> SALIR'
               *SET COLO TO WR/B
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
                  PANTA='C:\SIGEP\TEMP\PNT0'+STR(ELIZ,1)
                 ELSE
                  PANTA='C:\SIGEP\TEMP\PNT'+STR(ELIZ,2)
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
IF ELIZ1>0
     FOR ELIZ=1 TO ELIZ1
         IF ELIZ<10
            PANTA='C:\SIGEP\TEMP\PNT0'+STR(ELIZ,1)+'.WIN'
           ELSE
            PANTA='C:\SIGEP\TEMP\PNT'+STR(ELIZ,2)+'.WIN'
         ENDIF   
         DELE FILE (PANTA) 
      ENDFOR   
ENDIF
SELE TMPO2002
SET FILTE TO 
GO TOP
DO WHILE !EOF()
   SET RELA TO CODIGO INTO C
   REPLA NOMBRE WITH C->NOM_COMER,FORMA WITH C->FORMA
   SKIP
ENDDO
COPY TO C:\SIGEP\REPOXLS\RPMDTURN TYPE XLS
SET SAFE ON
DEAC WIND BLANCO
DEAC WIND TODO
DEAC WIND PREPARA
CLOS ALL
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
      PANTA='C:\SIGEP\TEMP\PNT0'+STR(ELIZ,1)
     ELSE
      PANTA='C:\SIGEP\TEMP\PNT'+STR(ELIZ,2)
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
      PANTA='C:\SIGEP\TEMP\PNT0'+STR(ELIZ,1)
     ELSE
      PANTA='C:\SIGEP\TEMP\PNT'+STR(ELIZ,2)
    ENDIF   
    REST WIND TODO FROM (PANTA)
    @24,10 SAY '< F2 > GRABA'
    @24,36 SAY '< F8 > IMPRIME'
    @24,64 SAY '<ESC> SALIR'
ENDIF    
RETURN




PROCEDURE IMPRIDIA
PARAMETER A
SELE D
ACTI WIND PREPARA
CLEA
@1,9 SAY 'VERIFIQUE IMPRESORA' COLO WR/B*
WAIT''
TOTAL=0
IF PRINTSTATUS()
      PAG=1
      @1,6 SAY 'I M P R I M I E N D O...'
      SET DEVI TO PRINT
      @2,0 SAY CHR(18)      
      @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
      @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
      @3,60 SAY 'EMISION :> '+DTOC(DATE())
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
               @3,60 SAY 'EMISION :> '+DTOC(DATE())
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
               @3,60 SAY 'EMISION :> '+DTOC(DATE())
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
CLEA
@1,4 SAY 'NOMBRE DE FICHERO :> ' GET NOMDIA 
READ
IF LAST()=27
   DEAC WIND PREPARA
   RETURN
ENDIF   
CLEA
@1,6 SAY 'G  R  A  B  A  N  D  O...' COLO WR/B*
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


