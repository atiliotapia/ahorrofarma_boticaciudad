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
CODVEND=SPACE(6)
NOMVEND=SPACE(20)
CANSTO=' '
MONTOS=' '
FEC1=DATE()
FEC2=DATE()
ACTI WIND PREPARA
SET COLO TO WR/B
CLEA
@0,8 SAY "DESDE :> " GET FEC1
@1,8 SAY "HASTA :> " GET FEC2
@2,8 SAY "Vendedor :> " GET CODVEND PICT "999999" VALID VENDEDOR(CODVEND) ERROR "VENDEDOR NO REGISTRADO"
READ
DEAC WIND PREPARA
IF LAST()!=27 AND FEC2>=FEC1
   DO DIARIO
ENDIF   
CLOS ALL



PROCEDURE DIARIO
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
   CREA TABLE C:\SIGEP\TEMP\TMPO2002 (CODIGO C(7), NOMBRE C(50), FORMA C(10), CANTIDAD N(9,2), PRECIO N(12,2), COSTO N(12,2))
   USE C:\SIGEP\TEMP\TMPO2002
   INDE ON CODIGO TAG CODIGO
   INDE ON PRECIO TAG PRECIO
CLOS ALL
*   SELE A
*         USE MEDIHOSP NOUPDATE
   SELE B
         USE MEDICTDO ALIAS MEDICTDO NOUPDATE
         SET ORDE TO 
   SELE C
         USE MEDICINA NOUPDATE
         SET ORDE TO 1
   SELE D
         USE C:\SIGEP\TEMP\TMPO2002 ALIAS TMPO2002
         SET ORDE TO CODIGO
*  SELE E
*        USE MEDICONV 
   SELE F
         USE FACTURA NOUPDATE
         SET ORDE TO 2
   SELE J
         USE ..\SISTMEDI\DATOS\TIPOMEDI ALIAS TIPOMEDI NOUPDATE
         SET ORDE TO CODIGO
   
   ACTI WIND AYUDAS
   CLEA
   SET COLO TO I
   @0,16 SAY '...PROCESANDO VENTAS AL CONTADO...'
   SET COLO TO WR/B
   SELE MEDICTDO
   SET ORDE TO FECHA
   SEEK FEC1
   DO WHILE NOT EOF()
      IF FECHA<=FEC2 AND ESTADO!='A'
         IF DIGITADOR=CODVEND
            IF CANTID1>0
               COD=MEDICINA1
               CANSAL=CANTID1 
               PRESAL=PREC_UNI1*CANTID1*(1-EXONERAR/100)
               PRECOST=T_COSTO1
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL),COSTO WITH COSTO+PRECOST
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL,COSTO WITH PRECOST
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID2>0
               COD=MEDICINA2
               CANSAL=CANTID2 
               PRESAL=PREC_UNI2*CANTID2*(1-EXONERAR/100)
               PRECOST=T_COSTO2
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL),COSTO WITH COSTO+PRECOST
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL,COSTO WITH PRECOST
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID3>0
               COD=MEDICINA3 
               CANSAL=CANTID3 
               PRESAL=PREC_UNI3*CANTID3*(1-EXONERAR/100)
               PRECOST=T_COSTO3
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL),COSTO WITH COSTO+PRECOST
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL,COSTO WITH PRECOST
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID4>0
               COD=MEDICINA4
               CANSAL=CANTID4 
               PRESAL=PREC_UNI4*CANTID4*(1-EXONERAR/100)
               PRECOST=T_COSTO4
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL),COSTO WITH COSTO+PRECOST
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL,COSTO WITH PRECOST
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID5>0
               COD=MEDICINA5
               CANSAL=CANTID5 
               PRESAL=PREC_UNI5*CANTID5*(1-EXONERAR/100)
               PRECOST=T_COSTO5
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL),COSTO WITH COSTO+PRECOST
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL,COSTO WITH PRECOST
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID6>0
               COD=MEDICINA6
               CANSAL=CANTID6 
               PRESAL=PREC_UNI6*CANTID6*(1-EXONERAR/100)
               PRECOST=T_COSTO6
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL),COSTO WITH COSTO+PRECOST
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL,COSTO WITH PRECOST
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID7>0
               COD=MEDICINA7
               CANSAL=CANTID7 
               PRESAL=PREC_UNI7*CANTID7*(1-EXONERAR/100)
               PRECOST=T_COSTO7
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL),COSTO WITH COSTO+PRECOST
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL,COSTO WITH PRECOST
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID8>0
               COD=MEDICINA8
               CANSAL=CANTID8 
               PRESAL=PREC_UNI8*CANTID8*(1-EXONERAR/100)
               PRECOST=T_COSTO8
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL),COSTO WITH COSTO+PRECOST
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL,COSTO WITH PRECOST
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID9>0
               COD=MEDICINA9
               CANSAL=CANTID9 
               PRESAL=PREC_UNI9*CANTID9*(1-EXONERAR/100)
               PRECOST=T_COSTO9
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL),COSTO WITH COSTO+PRECOST
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL,COSTO WITH PRECOST
               ENDIF   
            ENDIF  
            SELE B
            IF CANTID10>0
               COD=MEDICINA10
               CANSAL=CANTID10 
               PRESAL=PREC_UNI10*CANTID10*(1-EXONERAR/100)
               PRECOST=T_COSTO10
               SELE D
               SEEK COD
               IF FOUND()
                  CANTI=CANTIDAD
                  PRECI=PRECIO
                  REPLA CANTIDAD WITH(CANTI+CANSAL),PRECIO WITH (PRECI+PRESAL),COSTO WITH COSTO+PRECOST
                 ELSE
                  APPE BLANK
                  REPLA CODIGO WITH COD, CANTIDAD WITH CANSAL, PRECIO WITH PRESAL,COSTO WITH PRECOST
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
   SET COLO TO B/W*
   @0,19 SAY 'S A L I D A S  D E  M E D I C A M E N T O S'
   SET COLO TO R+/B
   @1,31 SAY 'HOY :> '+DTOC(DATE())
   SET COLO TO WR/B
   @2,0 SAY 'DEL :> '+DTOC(FEC1)+'    AL :> '+DTOC(FEC2)
   @2,49 SAY "VENDEDOR: "+SUBS(NOMVEND,1,20) COLO G+/B
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
COPY TO C:\SIGEP\REPOXLS\RPMDVEND TYPE XLS
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
SET COLO TO WR/B*
CLEA
@1,9 SAY 'VERIFIQUE IMPRESORA'
WAIT''
TOTAL=0
TOTUT=0
IF PRINTSTATUS()
      PAG=1
      @1,6 SAY 'I M P R I M I E N D O...'
      SET DEVI TO PRINT
      @2,0 SAY CHR(18)      
      @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
      @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
      @3,0 SAY "VENDEDOR: "+NOMVEND
      @3,0 SAY CHR(15)
      @3,90 SAY 'EMISION :> '+DTOC(DATE())
      @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)
      @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)
      @4,102 SAY 'P g. :'+STR(PAG,2)
      @6,4 SAY 'CODIGO               N O M B R E         FORMA      CANTIDAD           MONTO     COSTO VENTAS      UTILIDAD'
      @7,4 SAY REPLI('ð',107)
      Y=8
      IF A='2'
         GO BOTT
         DO WHILE .NOT. BOF()
            SET RELA TO D->CODIGO INTO C
            @Y,4 SAY ''+CODIGO+'  '+SUBS(C->NOM_COMER,1,30)+'  '+SUBS(C->FORMA,1,5)+'  '+STR(CANTIDAD,12,2)+'  '+STR(PRECIO,14,2)+'   '+STR(COSTO,14,2)+'  '+STR((PRECIO-COSTO),12,2)
            TOTAL=TOTAL+PRECIO
            TOTUT=TOTUT+(PRECIO-COSTO)
            Y=Y+1
            IF Y=57 OR BOF()
               EJECT
               PAG=PAG+1
               @2,0 SAY CHR(18)      
               @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
               @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
               @3,0 SAY "VENDEDOR: "+NOMVEND
               @3,0 SAY CHR(15)
               @3,90 SAY 'EMISION :> '+DTOC(DATE())
               @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)
               @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)               
               @4,102 SAY 'P g. :'+STR(PAG,2)
               @6,4 SAY 'CODIGO               N O M B R E         FORMA      CANTIDAD           MONTO     COSTO VENTAS      UTILIDAD'
               @7,4 SAY REPLI('ð',107)
               Y=8
            ENDIF   
            SKIP -1
            IF BOF()
               @55,20 SAY 'MONTO TOTAL VENTAS     S/.'+STR(TOTAL,15,2)+'             UTILIDAD    S/.'+STR(TOTUT,15,2)
               EJECT
            ENDIF   
         ENDDO   
        ELSE
         GO TOP
         DO WHILE .NOT. EOF()
            SET RELA TO D->CODIGO INTO C
            @Y,4 SAY ''+CODIGO+'  '+SUBS(C->NOM_COMER,1,30)+'  '+SUBS(C->FORMA,1,5)+'  '+STR(CANTIDAD,12,2)+'  '+STR(PRECIO,14,2)+'   '+STR(COSTO,14,2)+'  '+STR((PRECIO-COSTO),12,2)
            TOTAL=TOTAL+PRECIO
            TOTUT=TOTUT+(PRECIO-COSTO)
            Y=Y+1
            IF Y=57 OR EOF()
               EJECT
               PAG=PAG+1
               @2,0 SAY CHR(18)      
               @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
               @2,0 SAY CHR(14)+'         SALIDAS DE MEDICAMENTOS'
               @3,0 SAY "VENDEDOR: "+NOMVEND
               @3,0 SAY CHR(15)
               @3,90 SAY 'EMISION :> '+DTOC(DATE())
               @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)
               @4,5 SAY 'DEL:> '+DTOC(FEC1)+'  AL:> '+DTOC(FEC2)
               @4,102 SAY 'P g. :'+STR(PAG,2)
               @6,4 SAY 'CODIGO               N O M B R E         FORMA      CANTIDAD           MONTO     COSTO VENTAS      UTILIDAD'
               @7,4 SAY REPLI('ð',107)
               Y=8
            ENDIF   
            SKIP 
            IF EOF()
               @55,20 SAY 'MONTO TOTAL VENTAS     S/.'+STR(TOTAL,15,2)+'             UTILIDAD    S/.'+STR(TOTUT,15,2)
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


FUNCTION VENDEDOR
PARAMETER A
USE USUARIOS.LIB
LOCATE FOR CODIGO=A
IF FOUN()
   NOMVEND=ALLT(USUARIOS.NOMBRE)+" "+ALLT(USUARIOS.A_PATERNO)+" "+ALLT(USUARIOS.A_MATERNO)
   WAIT WIND ""+NOMVEND NOWA
   RETURN .T.
  ELSE
   RETURN .F.
ENDIF
