SET DATE FRENCH
SET EXACT ON
SET NEAR ON
DEFI WIND TODO FROM 0,0 TO 24,79;
     CLOSE FLOAT GROW SHADOW COLOR BG/RB NONE
DEFI WIND PREPARA FROM 10,20 TO 14,60;
     CLOSE FLOAT GROW SHADOW 
DEFI WIND AYUDAS FROM 22,7 TO 24,73;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 6
DEFI WIND PEDII FROM 9,18 TO 16,55 DOUBLE
MES=0
NOMMES=SPACE(10)
MESITO=SPACE(8)
DEAC WIND TODO
ACTI WIND AYUDAS
CLEA
SET COLO TO I
@0,14 SAY 'SELECCIONE EL  PERIODO DE PROCESO'
ACTI WIND PEDII
FIN=DATE()
@0,19 SAY '[ dd/mm/aaaa ]'
@5,2 SAY '  Fechas iguales para un d¡a  '
@1,4 SAY 'FECHA INICIAL:  ' GET FIN 
READ
IF LASTKEY()=27
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   RETURN
ENDIF   
FFI=FIN
@3,4 SAY 'FECHA FINAL  :  ' GET FFI VALID FECHA(FFI,FIN) ERROR 'FECHA FINAL DEBE SER MAYOR QUE FECHA INICIAL'
READ
IF LASTKEY()=27
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   RETURN
ENDIF   
*FFI=CTOD(FFI)
CLOSE ALL
ACTI WIND AYUDAS
CLEA
?'  þ'
STORE 0 TO CANSAL,PRESAL,CANESPEC,PREESPEC,TOTAL,TOT1,TOT2
MES=MONTH(DATE())
IF MES<10
   MESES='0'+SUBS(STR(MES,2),2,1)
  ELSE
   MESES=STR(MES,2)
ENDIF  
CLOS DATABASE
?'  þ   þ'
?'  þ   þ   ¯'
?'  þ   þ   ¯   P'
?'  þ   þ   ¯   P   R'
SET SAFE OFF
CREA TABLE C:\SIGEP\TEMP\TEMP2002 (CODIGO C(7), CANTIDAD N(9,2), PRECIO N(12,2))
USE C:\SIGEP\TEMP\TEMP2002
INDE ON CODIGO TAG CODIGO
?'  þ   þ   ¯   P   R   O'
?'  þ   þ   ¯   P   R   O   C'
?'  þ   þ   ¯   P   R   O   C   E'
INDE ON PRECIO TAG PRECIO 
SET SAFE ON
?'  þ   þ   ¯   P   R   O   C   E   S'

SELE A
     USE MEDICTDO ALIAS MEDICTDO
     * INDE MDCO
     SET ORDE TO 1
     ?'  þ   þ   ¯   P   R   O   C   E   S   A'
SELE B
     USE FACTURA ALIAS FACTURA
     * INDE FECFTMED
     SET ORDE TO 2
     ?'  þ   þ   ¯   P   R   O   C   E   S   A   N'
SELE C
     USE MEDICINA ALIAS MEDICINA
     SET ORDE TO CODIGO
     * INDE MEDI
     ?'  þ   þ   ¯   P   R   O   C   E   S   A   N   D'
SELE D
     USE C:\SIGEP\TEMP\TEMP2002
     SET ORDE TO CODIGO
     ?'  þ   þ   ¯   P   R   O   C   E   S   A   N   D   O'
     ?'  þ   þ   ¯   P   R   O   C   E   S   A   N   D   O   ®'
SELE E
     USE MEDIHOSP ALIAS MEDIHOSP
     SET ORDE TO SERFAC

   SELE B
   SEEK FIN
   ?'  þ   þ   ¯   P   R   O   C   E   S   A   N   D   O   ®   þ'
   ?'  þ   þ   ¯   P   R   O   C   E   S   A   N   D   O   ®   þ   þ'
 
   ACTI WIND PREPARA
   SET COLO TO WR/B*
   @1,5 SAY 'ESPERE UN MOMENTO POR FAVOR ....'
   DO WHILE FECHA>=FIN AND FECHA<=FFI AND .NOT. EOF()
      DO CASE
      CASE TIPO='M'
         REGI=REGISTRO
         SELE A
         SEEK REGI
         IF FOUND()
            IF MEDICINA1!=SPACE(7)
               COD=MEDICINA1
               CANSAL=CANTID1 
               PRESAL=PREC_UNI1*CANTID1*(1-EXONERAR/100)
               TOTAL=TOTAL+PRESAL
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
            ENDIF   
            IF MEDICINA2!=SPACE(7)
               COD=MEDICINA2
               CANSAL=CANTID2 
               PRESAL=PREC_UNI2*CANTID2*(1-EXONERAR/100)
               TOTAL=TOTAL+PRESAL
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
            ENDIF   
            IF MEDICINA3!=SPACE(7)
               COD=MEDICINA3 
               CANSAL=CANTID3 
               PRESAL=PREC_UNI3*CANTID3*(1-EXONERAR/100)
               TOTAL=TOTAL+PRESAL
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
            ENDIF   
            IF MEDICINA4!=SPACE(7)
               COD=MEDICINA4
               CANSAL=CANTID4 
               PRESAL=PREC_UNI4*CANTID4*(1-EXONERAR/100)
               TOTAL=TOTAL+PRESAL
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
            ENDIF   
            IF MEDICINA5!=SPACE(7)
               COD=MEDICINA5
               CANSAL=CANTID5 
               PRESAL=PREC_UNI5*CANTID5*(1-EXONERAR/100)
               TOTAL=TOTAL+PRESAL
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
            ENDIF   
            IF MEDICINA6!=SPACE(7)
               COD=MEDICINA6
               CANSAL=CANTID6 
               PRESAL=PREC_UNI6*CANTID6*(1-EXONERAR/100)
               TOTAL=TOTAL+PRESAL
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
            ENDIF   
            IF MEDICINA7!=SPACE(7)
               COD=MEDICINA7
               CANSAL=CANTID7 
               PRESAL=PREC_UNI7*CANTID7*(1-EXONERAR/100)
               TOTAL=TOTAL+PRESAL
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
            ENDIF   
            IF MEDICINA8!=SPACE(7)
               COD=MEDICINA8
               CANSAL=CANTID8 
               PRESAL=PREC_UNI8*CANTID8*(1-EXONERAR/100)
               TOTAL=TOTAL+PRESAL
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
            ENDIF   
            IF MEDICINA9!=SPACE(7)
               COD=MEDICINA9
               CANSAL=CANTID9 
               PRESAL=PREC_UNI9*CANTID9*(1-EXONERAR/100)
               TOTAL=TOTAL+PRESAL
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
            ENDIF   
            IF MEDICINA10!=SPACE(7)
               COD=MEDICINA10
               CANSAL=CANTID10 
               PRESAL=PREC_UNI10*CANTID10*(1-EXONERAR/100)
               TOTAL=TOTAL+PRESAL
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
            ENDIF   
            CANESPEC=CANESPEC+1
            PREESPEC=PREESPEC+REDONDEO
            TOTAL=TOTAL+REDONDEO
         ENDIF
         SELE FACTURA 
      CASE TIPO='T'
              NUMSERIE=SERIE
              NUMFACTU=NUMERO
              COD1=NUMSERIE+STR(NUMFACTU,8)
              SELE MEDIHOSP
              SET ORDE TO SERFAC
              SEEK COD1
              IF FOUND()
                 DO WHILE !EOF()
                    IF SERIE_FAC=NUMSERIE AND FACTURA=NUMFACTU
                       COD=MEDICINA1
                       CANSAL=CANTIDAD1 
                       PRESAL=PREC_MED1*CANTIDAD1
                       TOTAL=TOTAL+PRESAL
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
                       SELE MEDIHOSP
                      ELSE
                       EXIT
                    ENDIF
                    SKIP
                 ENDDO
              ENDIF
              SELE FACTURA
      ENDCASE
      SKIP
   ENDDO   
   STORE ' ' TO CODPRE1,NOMPRE1,FORPRE1,CODCAN1,FORCAN1,NOMCAN1
   STORE 0 TO PREMAY1,CANPRE1,CANMAY1,PRECAN1
   ACTI WIND AYUDAS
   CLEA
   SET COLO TO RG/B*
   @0,15 SAY '.....   O R D E N A N D O   .....'
   SELE D
   SET ORDE TO PRECIO
   GO TOP
   SUM ALL PRECIO TO TOT1
   *SUM PRECIO TO TOT1 FOR SUBS(CODIGO,1,1)!='3' AND SUBS(CODIGO,1,1)!='8'
   *SUM PRECIO TO TOT2 FOR SUBS(CODIGO,1,1)='3'
   *SUM PRECIO TO TOT3 FOR SUBS(CODIGO,1,1)='8'
   ACTI WIND TODO
   SET COLO TO B/W*
   @0,25 SAY 'VENTAS DE MEDICINAS AL CONTADO'
   SET COLO TO R+/B
   @1,26 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
   SET COLO TO WR/B
   @2,5 SAY 'DEL :> '+DTOC(FIN)+'    AL :> '+DTOC(FFI)
   @3,0 SAY 'CODIGO          N O M B R E         FORMA       CONSUMO    MONTO TOTAL  % VENTAS'
   @4,0 SAY ''
   Y=5
   GO BOTT
   DO WHILE .NOT. BOF()
      SET RELA TO D->CODIGO INTO C
      @Y,0 SAY ''+CODIGO+'  '+SUBS(C->NOM_COMER,1,25)+'  '+SUBS(C->FORMA,1,5)+'  '+STR(CANTIDAD,12,2)+' '+STR(PRECIO,14,2)+'   '+STR((PRECIO/TOT1*100),5,2)
      Y=Y+1
      SKIP -1
      IF Y=20 .OR. BOF()
         IF BOF()
            ****@Y,0 SAY '         OTROS CONCEPTOS                   '+STR(CANESPEC,12,2)+'  '+STR(PREESPEC,14,2)
            SET COLO TO WR/B*
            @Y+2,10 SAY 'TOTAL MEDICINAS :> '+STR(TOT1,14,2)
            SET COLO TO WR/B
            @24,10 SAY '< F2 > GRABA'
            @24,36 SAY '< F8 > IMPRIME'
            @24,64 SAY '<ESC> SALIR'
            SET COLO TO WR/B
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
           ELSE
            @22,20 SAY 'Presione <ENTER> para continuar ...'
            WAIT''
            Y=5
            @5,0 CLEA 
         ENDIF   
      ENDIF   
   ENDDO   
   DEAC WIND TODO
   DEAC WIND PREPARA
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   SET NEAR OFF
   CLOS ALL
   RETURN




PROCEDURE IMPRIMA
PARAMETER A
   ACTI WIND PREPARA
   SET COLO TO WR/B*
   CLEA
   @1,9 SAY 'VERIFIQUE IMPRESORA'
   WAIT''
   CLEA
   PAG=1
   IF PRINTSTATUS()
      @0,9 SAY 'I M P R I M I E N D O'
      @2,8 SAY '<< M E D I C I N A S >>'
      SET DEVI TO PRINT
      @0,0 SAY CHR(15)
      @0,0 SAY CHR(15)
      @2,41 SAY 'V E N T A S    D E    M E D I C I N A S    A L    C O N T A D O'
      @2,41 SAY 'V E N T A S    D E    M E D I C I N A S    A L    C O N T A D O'      
      @3,55 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
      @4,5 SAY 'DEL :> '+DTOC(FIN)+'    AL :> '+DTOC(FFI)      
      @4,128 SAY 'P g :'+STR(PAG,4)
      @5,4 SAY REPLI('ð',133)
      @6,4 SAY 'ORDEN CODIGO              N O M B R E           FORMA     C O N S U M O      CONS VALORADO    % VENTAS   TOTAL ACUMULADO   % ACUMULAD'
      @7,4 SAY REPLI('ð',133)
      Y=8
      TOTAL=0
      X=1
      SELE D
      GO BOTT
      DO WHILE .NOT. BOF()
         TOTAL=TOTAL+PRECIO
         SET RELA TO D->CODIGO INTO C
         @Y,4 SAY+STR(X,4)+'  '+CODIGO+'  '+SUBS(C->NOM_COMER,1,30)+'  '+SUBS(C->FORMA,1,6)+'     '+STR(CANTIDAD,12,2)+'    '+STR(PRECIO,14,2)+'       '+STR((PRECIO/TOT1*100),5,2)+'  '+STR(TOTAL,14,2)+'          '+STR((TOTAL/TOT1*100),5,2)
         X=X+1
         Y=Y+1
         IF Y=50
            EJECT
            PAG=PAG+1
            @2,41 SAY 'V E N T A S    D E    M E D I C I N A S    A L    C O N T A D O'
            @2,41 SAY 'V E N T A S    D E    M E D I C I N A S    A L    C O N T A D O'
            @3,55 SAY 'FECHA DE EMISION :> '+DTOC(DATE())
            @4,5 SAY 'DEL :> '+DTOC(FIN)+'    AL :> '+DTOC(FFI)
            @4,128 SAY 'P g :'+STR(PAG,4)
            @5,4 SAY REPLI('ð',133)
            @6,4 SAY 'ORDEN CODIGO              N O M B R E           FORMA     C O N S U M O      CONS VALORADO    % VENTAS   TOTAL ACUMULADO   % ACUMULAD'
            @7,4 SAY REPLI('ð',133)
            Y=8            
         ENDIF   
         SKIP -1
         IF BOF()
            ****@Y,4 SAY '         OTROS      CONCEPTOS                   '+STR(CANESPEC,12,2)+'  '+STR(PREESPEC,14,2)            
            @Y+2,20 SAY 'TOTAL MEDICINAS :>  '+STR(TOT1,14,2)
            EJECT
         ENDIF   
      ENDDO   
      SET DEVI TO SCREE
      DEAC WIND PREPARA
   ENDIF
RETURN



PROCEDURE GRABAR
NOMFIC=SPACE(8)
ACTI WIND PREPARA
SET COLO TO WR/B
CLEA
@1,2 SAY 'NOMBRE DEL FICHERO ' GET NOMFIC
READ
IF LASTKEY()=27
   DEAC WIND PREPARA
   RETURN
ENDIF   
NOMFIC=ALLT(NOMFIC)
IF NOMFIC!=SPACE(8)
   CLEA
   BASBAK=NOMFIC+'.DBF'
   DELE FILE (BASBAK)
   CREA TABLE (BASBAK) (CODIGO C(7), CANTIDAD N(9,2), PRECIO N(12,2))
   SELE E
      USE (BASBAK)
   SELE D
   GO TOP
   ACTI WIND PREPARA
   SET COLO TO WR/B*
   CLEA
   @1,6 SAY 'G  R  A  B  A  N  D  O...'
   DO WHILE .NOT. EOF()
      CODI=CODIGO
      CANT=CANTIDAD
      PREC=PRECIO
      SELE E
      APPE BLANK
      REPLA CODIGO WITH CODI,CANTIDAD WITH CANT,PRECIO WITH PREC
      SELE D
      SKIP       
   ENDDO
   SELE E 
   APPE BLANK
   REPLA CANTIDAD WITH CANESPEC,PRECIO WITH PREESPEC
   SELE D
   DEAC WIND PREPARA
   ON KEY LABEL F2
  ELSE  
   DEAC WIND PREPARA
ENDIF   
RETURN
   
          

FUNCTION FECHA
PARAMETER A,B
IF A>=B
   RETURN .T.
  ELSE
   RETURN .F.
ENDIF    
