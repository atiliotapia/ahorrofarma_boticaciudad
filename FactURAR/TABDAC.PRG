PROCEDURE GENERAL
SET BELL TO 60,1
SET ESCAPE OFF
SET EXACT ON
SET EXCLU OFF
DEFI WIND PREPARA FROM 10,20 TO 14,60;
     CLOSE FLOAT GROW SHADOW 
DEFI WIND MOSTRAR FROM 10,15 TO 20,65;
     CLOSE FLOAT GROW SHADOW  COLOR  RB/BG
DEFI WIND AYUDAS FROM 22,7 TO 24,73;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 6
DEFI WIND PEDII FROM 9,18 TO 16,55 DOUBLE

********Verificando c¢digos de asignaci¢n espec¡fica********
SELE A
     USE ATENCION
SELE B
     USE ASIGNESP
X=0     
SELE A
GO TOP
DO WHILE !EOF()
   COD=ASIGNESPEC
   IF COD!=SPACE(6)
      SELE B
      LOCATE FOR CODIGO=COD
      IF !FOUN()
         WAIT WIND 'CODIGO NO ENCONTRADO '+COD+'   Presione cualquier tecla ...'
         WAIT WIND '­­­­­­­­­­  NO SE PODRA ELABORAR REPORTE   !!!!!!!!!!' TIME 1
         CLOS ALL
         RETURN
      ENDIF
      SELE A
   ENDIF
   SKIP
ENDDO
*******************Verificaci¢n concluida*******************
CLOS ALL
MES=0
SWIMP=0
STORE 0 TO NUMFIN,NUMFFI,NUMFINR,NUMFFIR
NOMMES=SPACE(10)
MESITO=SPACE(8)
FECTAB=SPACE(8)
SIGA=0
ACTI WIND AYUDAS
CLEA
SET COLO TO I
@0,9  SAY '< F 1 > AYUDA'
@0,47 SAY '< ESC > SALIR'
ACTI WIND PEDII
FIN=DATE()
FFI=DATE()
ON KEY LABEL F1 DO AYUDAR
SET COLO TO WR/B
@5,4 SAY 'Seleccione per¡odo de proceso'
@1,4 SAY 'FECHA INICIAL :>' GET FIN ERROR 'VUELVA A INGRESAR'
@3,4 SAY 'FECHA FINAL   :>' GET FFI ERROR 'VUELVA A INGRESAR'
READ
IF LASTKEY()=27 .OR. FFI<FIN
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   CLOS ALL
   RETURN
ENDIF   
DEAC WIND AYUDAS
DEAC WIND PEDII
*IF FIN=FFI
*   USE TABNEW
*   SET ORDE TO 1
*   SEEK FIN
*   IF FOUND()
*      ACTI WIND PREPARA
*      @0,4 SAY '®® INGRESE CLAVE ¯¯'
*      SET COLO TO N/N
*      ACCE TO CLAVTAB
*      SET COLO TO R/GB
*      DEAC WIND PREPARA
*      IF CLAVTAB!='NUEVOS'
*         CLOS ALL
*         RETURN
*      ENDIF  
*   ENDIF
*ENDIF
*ON KEY LABEL F1
*CLOSE ALL
*DEAC WIND PEDII


****************************
*******DE UN SOLO DIA*******
****************************
IF FIN=FFI
SWIMP=0
MES=MONTH(DATE())
*SELE A
*     USE ATENCTDO
*     SET ORDE TO 1
SELE B
     USE MEDICTDO
     SET ORDE TO 1
SELE C
     USE FACTURA
     SET ORDE TO FECHA
*SELE D
*     USE PACIENTE
*     SET ORDE TO 2
SELE F
     USE PACICONV
     SET ORDE TO 2
SELE G
     USE TABNEW
     SET ORDE TO 1
SELE H
     USE ATENCION
     SET ORDE TO 1
SELE I
     USE ASIGNESP
     SET ORDE TO 1
REPLA ALL VAR_H WITH 0
REPLA ALL VAR_A WITH 0
REPLA ALL VAR_M WITH 0
REPLA ALL TOTAL WITH 0
TITULOTAB=" "
DO DIARIO

SW=0
SELE G
SEEK FIN
IF FOUN()
   SW=1
ENDIF
*DELE ALL FOR CTOD(FIN)=FECHA
IF SW=0
   APPE BLAN
ENDIF
REPLA FECHA WITH FIN
REPLA DESDE WITH 0, HASTA WITH 0
SELE I
GO TOP
DO WHILE !EOF()   
   VAR='I'+CODIGO
   SELE G
   REPLA &VAR WITH I->VAR_H
   SELE I
   SKIP
ENDDO   
SELE G
REPLA TIPO WITH 'H'
IF SW=0
   APPE BLAN
  ELSE
   SKIP
ENDIF
REPLA FECHA WITH FIN
*REPLA DESDE WITH NUMFIN, HASTA WITH NUMFFI
SELE I
GO TOP
DO WHILE !EOF()   
   VAR='I'+CODIGO
   SELE G
   REPLA &VAR WITH I->VAR_A
   SELE I
   SKIP
ENDDO   
SELE G
REPLA TIPO WITH 'A'
IF SW=0
   APPE BLAN
  ELSE
   SKIP
ENDIF
REPLA FECHA WITH FIN
*REPLA DESDE WITH NUMFINR, HASTA WITH NUMFFIR
SELE I
GO TOP
DO WHILE !EOF()   
   VAR='I'+CODIGO
   SELE G
   REPLA &VAR WITH I->VAR_M
   SELE I
   SKIP
ENDDO   
SELE G
REPLA TIPO WITH 'M'
WAIT WIND '<< Concluido >>' NOWA
ENDIF  
DEAC WIND AYUDAS
CLOS ALL


****************************
*******DE VARIOS DIAS*******
****************************
SERIEB="000"
IF FIN<FFI
   MES=MONTH(DATE())
   SELE B
        USE ASIGNESP
        SET ORDE TO 1
        REPLA ALL VAR_H WITH 0
        REPLA ALL VAR_A WITH 0
        REPLA ALL VAR_M WITH 0
        REPLA ALL TOTAL WITH 0
   SELE A
        USE TABNEW
        SET ORDE TO 1
   SEEK FIN
   IF FOUND()
      WAIT WIND 'Procesando  ....' NOWA
      SKIP
      NUMFIN=DESDE
      SKIP
      NUMFINR=DESDE
      SKIP -2
      DO WHILE !EOF()
         SELE B
         GO TOP
         DO WHILE !EOF()
            VAR='TABNEW->I'+CODIGO
            REPLA VAR_H WITH (VAR_H+&VAR)
            SKIP
         ENDDO
         SELE A
         SKIP
         NUMFFI=HASTA
         SELE B
         GO TOP
         DO WHILE !EOF()
            VAR='TABNEW->I'+CODIGO
            REPLA VAR_A WITH (VAR_A+&VAR)
            SKIP
         ENDDO
         SELE A
         SKIP
         NUMFFIR=HASTA
         SELE B
         GO TOP
         DO WHILE !EOF()
            VAR='TABNEW->I'+CODIGO
            REPLA VAR_M WITH (VAR_M+&VAR)
            SKIP
         ENDDO
         SELE A
         SKIP
         IF FECHA>FFI
            EXIT
         ENDIF   
      ENDDO
      FECHA='Del :> '+DTOC(FIN)+' Al :> '+DTOC(FFI)
      SELE B 
      REPLA ALL TOTAL WITH VAR_H+VAR_A+VAR_M
      SEEK '145002'
      TOTMED=TOTAL
      SUM ALL TOTAL TO TOT01
      TOTRRP=TOT01-TOTMED
      WAIT WIND 'Imprimiendo .....' NOWA
      ACTI WIND PREPARA NOSHOW
      *REPO FORM RPTABLDO TO PRIN
      REPO FORM RPTABLDO PREV
      DEAC WIND PREPARA
      WAIT WIND '<< Concluido >>' NOWA
     ELSE
      WAIT WIND 'Fecha inicial no registrado   ­­ NO SE PODRA ELABORAR REPORTE !!' NOWA
   ENDIF
ENDIF
CLOS ALL
RETURN




PROCEDURE DIARIO
Y=7
STOR 0 TO MAT1,ESE1,COM1,VARIOS1
Y=Y+2				
SELE C
SEEK FIN
IF FOUND()
   NUMFIN=NUMERO
   DO WHILE !EOF()
      COD=REGISTRO
      IF TIPO='M'
         STOR 0 TO MAT,ESE,MED,VARIOS,TOTAL03
         SELE B
         SEEK COD
         IF FOUND()
            IF MEDICINA1!=SPACE(7)
               IF SUBS(MEDICINA1,1,1)='0'
                  MAT=MAT+(PREC_UNI1*CANTID1)
                 ELSE
                  IF SUBS(MEDICINA1,1,1)='2'                 
                     ESE=ESE+(PREC_UNI1*CANTID1)
                    ELSE 
                     MED=MED+(PREC_UNI1*CANTID1)
                  ENDIF   
               ENDIF   
            ENDIF   
            IF MEDICINA2!=SPACE(7)
               IF SUBS(MEDICINA2,1,1)='0'
                  MAT=MAT+(PREC_UNI2*CANTID2)
                 ELSE 
                  IF SUBS(MEDICINA2,1,1)='2'
                     ESE=ESE+(PREC_UNI2*CANTID2)
                    ELSE
                     MED=MED+(PREC_UNI2*CANTID2)
                  ENDIF   
               ENDIF 
            ENDIF   
            IF MEDICINA3!=SPACE(7)
               IF SUBS(MEDICINA3,1,1)='0'
                  MAT=MAT+(PREC_UNI3*CANTID3)
                 ELSE
                  IF SUBS(MEDICINA3,1,1)='2'                 
                     ESE=ESE+(PREC_UNI3*CANTID3)
                    ELSE
                     MED=MED+(PREC_UNI3*CANTID3)
                  ENDIF   
               ENDIF 
            ENDIF   
            IF MEDICINA4!=SPACE(7)
               IF SUBS(MEDICINA4,1,1)='0'   
                  MAT=MAT+(PREC_UNI4*CANTID4)
                 ELSE
                  IF SUBS(MEDICINA4,1,1)='2'                    
                     ESE=ESE+(PREC_UNI4*CANTID4)
                    ELSE
                     MED=MED+(PREC_UNI4*CANTID4)
                  ENDIF   
               ENDIF 
            ENDIF   
            IF MEDICINA5!=SPACE(7)
               IF SUBS(MEDICINA5,1,1)='0'   
                  MAT=MAT+(PREC_UNI5*CANTID5)
                 ELSE 
                  IF SUBS(MEDICINA5,1,1)='2'    
                     ESE=ESE+(PREC_UNI5*CANTID5)
                    ELSE              
                     MED=MED+(PREC_UNI5*CANTID5)
                  ENDIF   
               ENDIF 
            ENDIF   

            IF MEDICINA6!=SPACE(7)
               IF SUBS(MEDICINA6,1,1)='0'   
                  MAT=MAT+(PREC_UNI6*CANTID6)
                 ELSE 
                  IF SUBS(MEDICINA6,1,1)='2'    
                     ESE=ESE+(PREC_UNI6*CANTID6)
                    ELSE              
                     MED=MED+(PREC_UNI6*CANTID6)
                  ENDIF   
               ENDIF 
            ENDIF   
            IF MEDICINA7!=SPACE(7)
               IF SUBS(MEDICINA7,1,1)='0'   
                  MAT=MAT+(PREC_UNI7*CANTID7)
                 ELSE 
                  IF SUBS(MEDICINA7,1,1)='2'    
                     ESE=ESE+(PREC_UNI7*CANTID7)
                    ELSE              
                     MED=MED+(PREC_UNI7*CANTID7)
                  ENDIF   
               ENDIF 
            ENDIF   
            IF MEDICINA8!=SPACE(7)
               IF SUBS(MEDICINA8,1,1)='0'   
                  MAT=MAT+(PREC_UNI8*CANTID8)
                 ELSE 
                  IF SUBS(MEDICINA8,1,1)='2'    
                     ESE=ESE+(PREC_UNI8*CANTID8)
                    ELSE              
                     MED=MED+(PREC_UNI8*CANTID8)
                  ENDIF   
               ENDIF 
            ENDIF   
            IF MEDICINA9!=SPACE(7)
               IF SUBS(MEDICINA9,1,1)='0'   
                  MAT=MAT+(PREC_UNI9*CANTID9)
                 ELSE 
                  IF SUBS(MEDICINA9,1,1)='2'    
                     ESE=ESE+(PREC_UNI9*CANTID9)
                    ELSE              
                     MED=MED+(PREC_UNI9*CANTID9)
                  ENDIF   
               ENDIF 
            ENDIF   
            IF MEDICINA10!=SPACE(7)
               IF SUBS(MEDICINA10,1,1)='0'   
                  MAT=MAT+(PREC_UNI10*CANTID10)
                 ELSE 
                  IF SUBS(MEDICINA10,1,1)='2'    
                     ESE=ESE+(PREC_UNI10*CANTID10)
                    ELSE              
                     MED=MED+(PREC_UNI10*CANTID10)
                  ENDIF   
               ENDIF 
            ENDIF   

            VARIOS=REDONDEO
            IF EXONERAR=0
               MAT1=MAT1+MAT
               ESE1=ESE1+ESE
               COM1=COM1+MED
               VARIOS1=VARIOS1+VARIOS
              ELSE
               MAT=(MAT*(100-EXONERAR)/100)
               ESE=(ESE*(100-EXONERAR)/100)
               MED=(MED*(100-EXONERAR)/100)
               MAT1=MAT1+MAT
               ESE1=ESE1+ESE
               COM1=COM1+MED
               VARIOS1=VARIOS1+VARIOS
               MAT1=VAL(STR(MAT1,12,2))
               ESE1=VAL(STR(ESE1,12,2))
               COM1=VAL(STR(COM1,12,2))
               VARIOS1=VAL(STR(VARIOS1,12,2))               
            ENDIF   
         ENDIF
         SELE C
      ENDIF   
      SELE C
      *NUMFFIR=NUMERO
      NUMFFI=NUMERO
      SKIP
      IF FECHA>FIN
         EXIT
      ENDIF   
   ENDDO   
ENDIF
SELE I
LOCATE FOR CODIGO='145002'
REPLA VAR_M WITH VAR_M+(ESE1+COM1)
LOCATE FOR CODIGO='146099'
REPLA VAR_M WITH VAR_M+MAT1
LOCATE FOR CODIGO='145099'
REPLA VAR_M WITH VAR_M+VARIOS1

REPLA ALL TOTAL WITH (VAR_H+VAR_A+VAR_M)
SEEK '145002'
TOTMED=TOTAL
SUM ALL TOTAL TO TOT01
TOTRRP=TOT01-TOTMED
FECHA='FECHA :> '+DTOC(FIN)
WAIT WIND 'Imprimiendo .....' NOWA
SERIEB=" "
DEFI POPU IMPRE01 FROM 10,20
DEFINE BAR 1 OF IMPRE01 PROMPT '\<P a n t a l l a'
DEFINE BAR 2 OF IMPRE01 PROMPT '\<I m p r e s o r a'
ON SELECTION POPUP IMPRE01 DO IMPRES WITH BAR()
ACTI POPU IMPRE01
RETURN


PROCEDURE IMPRES
PARAMETER A
DO CASE
   CASE A=1
        REPO FORM RPTABLDO PREV
   CASE A=2
        ACTI WIND PREPARA NOSHOW
        REPO FORM RPTABLDO TO PRIN
        DEAC WIND PREPARA
ENDCASE




PROCEDURE DETALLADO
SET BELL TO 60,1
SET ESCAPE OFF
SET EXACT ON
DEFI WIND PREPARA FROM 10,20 TO 14,60;
     CLOSE FLOAT GROW SHADOW 
DEFI WIND MOSTRAR FROM 10,15 TO 20,65;
     CLOSE FLOAT GROW SHADOW  COLOR  RB/BG
DEFI WIND AYUDAS FROM 22,7 TO 24,73;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 6
DEFI WIND PEDII FROM 9,18 TO 16,55 DOUBLE
MES=0
SWIMP=0
NOMMES=SPACE(10)
MESITO=SPACE(8)
SERIEB='   '
SIGA=0
ACTI WIND AYUDAS
CLEA
SET COLO TO I
@0,14 SAY 'SELECCIONE LOS LIMITES DE PROCESO'
ACTI WIND PEDII
STORE 0 TO FIN,FFI
*@0,19 SAY '[ dd/mm/aa ]'
@5,2 SAY '  Ingrese valores diferentes  '
@1,4 SAY 'SERIE  :>' GET SERIEB 
@2,4 SAY 'FACTURA INICIAL:  ' GET FIN PICT '99999999' VALID FACTU(SERIEB,FIN) ERROR 'NUMERO DE FACTURA NO EXISTE'
READ
IF LASTKEY()=27
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   RETURN
ENDIF   
@3,4 SAY 'FACTURA FINAL  :  ' GET FFI PICT '99999999' VALID FACTU(SERIEB,FFI) ERROR 'NUMERO DE FACTURA NO EXISTE'
READ
IF LASTKEY()=27 .OR. FFI<FIN
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   CLOS ALL
   RETURN
ENDIF   
CLOSE ALL
DEAC WIND PEDII
DEAC WIND AYUDAS
SWIMP=0
STORE 0 TO CANSAL,PRESAL,TOTAL,PREESPEC,CANESPEC,EXON
STORE 0 TO TOTMAT,TOTESE,TOTCOM,TOTVAR,TOTDCT,TOTALES,TOTCOBRADO
MES=MONTH(DATE())

*SELE A
*     USE ATENCTDO
*     SET ORDE TO REGISTRO
SELE B
     USE MEDICTDO
     SET ORDE TO REGISTRO
SELE C
     USE FACTURA ALIAS FACTURA
     SET ORDE TO SERFAC
     SET FILTE TO SERIE=SERIEB
*SELE D
*     USE PACIENTE
*     SET ORDE TO FACTURA
*SELE E
*     USE PACICONV
*     SET ORDE TO FACTURA

*SELE D
*SEEK FFI
*FECTAB=DTOC(FECHA_ALTA)
FECTAB=DTOC(DATE())
SELE C
SEEK SERIEB+STR(FIN,8)
IF FOUND()
   SET DEVI TO PRINT
   @0,2 SAY ''+TITULO02
   @1,2 SAY ''+TITULO01+'         I N G R E S O S  E N  F A R M A C I A'
   @2,2 SAY '     HUANCAYO                                                      FECHA EMIS:> '+FECTAB
   @3,2 SAY 'SERIE : '+SERIEB
   @4,2 SAY '    NUMERO         SUB                                            TOTAL            TOTAL'
   @5,2 SAY '   COMPROB.       TOTAL        DESCUENTO       REDONDEO         FACTURADO         COBRADO'
   @6,1 SAY 'נננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננ'
   Y=7
   DO WHILE !EOF()
      COD=NUMERO
      *IF DTOC(FECHA)!="  /  /  "
      *******
      DO CASE
      CASE TIPO='V'
      CASE TIPO='M'
           COD=NUMERO
           COD1=REGISTRO
           STOR 0 TO MAT,ESE,MED,VARIOS,MAT1,ESE1,MED1
           SELE B
           SEEK COD1
           IF FOUND()
              IF COD>90000000
                 @Y,1 SAY 'F  '+STR((COD-90000000),8)
                ELSE
                 @Y,1 SAY 'B  '+STR(COD,8)
              ENDIF
              IF MEDICINA1!=SPACE(7)
                 IF SUBS(MEDICINA1,1,1)='3'
                    MAT=MAT+(PREC_UNI1*CANTID1)
                   ELSE
                    IF SUBS(MEDICINA1,1,1)='2'                 
                       ESE=ESE+(PREC_UNI1*CANTID1)
                      ELSE 
                       MED=MED+(PREC_UNI1*CANTID1)
                    ENDIF   
                 ENDIF   
              ENDIF   
              IF MEDICINA2!=SPACE(7)
                 IF SUBS(MEDICINA2,1,1)='3'
                    MAT=MAT+(PREC_UNI2*CANTID2)
                   ELSE 
                    IF SUBS(MEDICINA2,1,1)='2'
                       ESE=ESE+(PREC_UNI2*CANTID2)
                      ELSE
                       MED=MED+(PREC_UNI2*CANTID2)
                    ENDIF   
                 ENDIF 
              ENDIF   
              IF MEDICINA3!=SPACE(7)
                 IF SUBS(MEDICINA3,1,1)='3'
                    MAT=MAT+(PREC_UNI3*CANTID3)
                   ELSE
                    IF SUBS(MEDICINA3,1,1)='2'                 
                       ESE=ESE+(PREC_UNI3*CANTID3)
                      ELSE
                       MED=MED+(PREC_UNI3*CANTID3)
                    ENDIF   
                 ENDIF 
              ENDIF   
              IF MEDICINA4!=SPACE(7)
                 IF SUBS(MEDICINA4,1,1)='3'   
                    MAT=MAT+(PREC_UNI4*CANTID4)
                   ELSE
                    IF SUBS(MEDICINA4,1,1)='2'                    
                       ESE=ESE+(PREC_UNI4*CANTID4)
                      ELSE
                       MED=MED+(PREC_UNI4*CANTID4)
                    ENDIF   
                 ENDIF 
              ENDIF   
              IF MEDICINA5!=SPACE(7)
                 IF SUBS(MEDICINA5,1,1)='3'   
                    MAT=MAT+(PREC_UNI5*CANTID5)
                   ELSE 
                    IF SUBS(MEDICINA5,1,1)='2'    
                       ESE=ESE+(PREC_UNI5*CANTID5)
                      ELSE              
                       MED=MED+(PREC_UNI5*CANTID5)
                    ENDIF   
                 ENDIF 
              ENDIF   


              IF MEDICINA6!=SPACE(7)
                 IF SUBS(MEDICINA6,1,1)='3'   
                    MAT=MAT+(PREC_UNI6*CANTID6)
                   ELSE 
                    IF SUBS(MEDICINA6,1,1)='2'    
                       ESE=ESE+(PREC_UNI6*CANTID6)
                      ELSE              
                       MED=MED+(PREC_UNI6*CANTID6)
                    ENDIF   
                 ENDIF 
              ENDIF   
              IF MEDICINA7!=SPACE(7)
                 IF SUBS(MEDICINA7,1,1)='3'   
                    MAT=MAT+(PREC_UNI7*CANTID7)
                   ELSE 
                    IF SUBS(MEDICINA7,1,1)='2'    
                       ESE=ESE+(PREC_UNI7*CANTID7)
                      ELSE              
                       MED=MED+(PREC_UNI7*CANTID7)
                    ENDIF   
                 ENDIF 
              ENDIF   
              IF MEDICINA8!=SPACE(7)
                 IF SUBS(MEDICINA8,1,1)='3'   
                    MAT=MAT+(PREC_UNI8*CANTID8)
                   ELSE 
                    IF SUBS(MEDICINA8,1,1)='2'    
                       ESE=ESE+(PREC_UNI8*CANTID8)
                      ELSE              
                       MED=MED+(PREC_UNI8*CANTID8)
                    ENDIF   
                 ENDIF 
              ENDIF   
              IF MEDICINA9!=SPACE(7)
                 IF SUBS(MEDICINA9,1,1)='3'   
                    MAT=MAT+(PREC_UNI9*CANTID9)
                   ELSE 
                    IF SUBS(MEDICINA9,1,1)='2'    
                       ESE=ESE+(PREC_UNI9*CANTID9)
                      ELSE              
                       MED=MED+(PREC_UNI9*CANTID9)
                    ENDIF   
                 ENDIF 
              ENDIF   
              IF MEDICINA10!=SPACE(7)
                 IF SUBS(MEDICINA10,1,1)='3'   
                    MAT=MAT+(PREC_UNI10*CANTID10)
                   ELSE 
                    IF SUBS(MEDICINA10,1,1)='2'    
                       ESE=ESE+(PREC_UNI10*CANTID10)
                      ELSE              
                       MED=MED+(PREC_UNI10*CANTID10)
                    ENDIF   
                 ENDIF 
              ENDIF   

              VARIOS=REDONDEO
              DCT=0
              IF EXONERAR=0
                 @Y,10 SAY +STR((MAT+MED+ESE),14,2)+'   '+'              '+'   '+STR(VARIOS,14,2)+'   '+STR((MAT+ESE+MED+VARIOS),14,2)
                 Y=Y+1                                                                                                             
                 TOTVAR=TOTVAR+VARIOS
                 TOTMAT=TOTMAT+MAT
                 TOTCOM=TOTCOM+MED+ESE
                ELSE
                 MAT1=(MAT*(100-EXONERAR)/100)
                 ESE1=(ESE*(100-EXONERAR)/100)
                 MED1=(MED*(100-EXONERAR)/100)
                 MAT1=VAL(STR(MAT1,12,2))
                 ESE1=VAL(STR(ESE1,12,2))
                 MED1=VAL(STR(MED1,12,2))
                 DCT=(MAT+ESE+MED-MAT1-ESE1-MED1)                              
                 @Y,10 SAY +STR((MAT+MED+ESE),14,2)+'   '+STR(DCT,14,2)+'   '+STR(VARIOS,14,2)+'   '+STR((MAT+MED+ESE-DCT+VARIOS),14,2)
                 Y=Y+1                                                                                                             
                 TOTVAR=TOTVAR+VARIOS
                 TOTMAT=TOTMAT+MAT
                 TOTCOM=TOTCOM+MED+ESE
                 TOTDCT=TOTDCT+DCT
              ENDIF   
              SELE FACTURA
              IF !EMPTY(FECHA)
                 TOTCOBRADO=TOTCOBRADO+MAT+MED+ESE+VARIOS-DCT
                 @Y-1,78 SAY+STR((MAT+MED+ESE-DCT+VARIOS),14,2)
                ELSE
                 @Y-1,2 SAY '-R'
                 @Y-1,78 SAY '          0.00'
              ENDIF
           ENDIF
           SELE C
      CASE TIPO='A'
           IF COD>90000000
              @Y,1 SAY 'F  '+STR((COD-90000000),8)
             ELSE
              @Y,1 SAY 'B  '+STR(COD,8)
           ENDIF
           @Y,10 SAY '              A  N  U  L  A  D  O'
           Y=Y+1                                                                     
      ENDCASE
      *ENDIF
      SELE FACTURA
      SKIP
      IF NUMERO>FFI OR Y=50 OR EOF()
         IF Y=50
            TOTALES=TOTMAT+TOTCOM+TOTVAR-TOTDCT
            @Y,1 SAY '============================================================================================='
            @Y+1,2 SAY ' V  A  N '+'  '+STR((TOTMAT+TOTCOM),14,2)+'   '+STR(TOTDCT,14,2)+'   '+STR(TOTVAR,14,2)+'   '+STR(TOTALES,14,2)+'   '+STR(TOTCOBRADO,14,2)
            EJECT
            @0,2 SAY ''+TITULO02
            @1,2 SAY ''+TITULO01+'         I N G R E S O S  E N  F A R M A C I A'
            @2,2 SAY '     HUANCAYO                                                                            FECHA EMIS:> '+FECTAB
            @3,2 SAY 'SERIE : '+SERIEB
            @4,2 SAY '    NUMERO         SUB                                            TOTAL         '
            @5,2 SAY '   COMPROB.       TOTAL        DESCUENTO       REDONDEO         FACTURADO       '
            @6,1 SAY 'נננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננ'
            @7,2 SAY ' VIENEN  '+'  '+STR((TOTMAT+TOTCOM),14,2)+'   '+STR(TOTDCT,14,2)+'   '+STR(TOTVAR,14,2)+'   '+STR(TOTALES,14,2)+'   '+STR(TOTCOBRADO,14,2)
            Y=8
           ELSE 
            TOTALES=TOTMAT+TOTCOM+TOTVAR-TOTDCT
            @Y,1 SAY '============================================================================================='
            @Y+1,1 SAY 'T O T A L'+''+STR((TOTMAT+TOTCOM),14,2)+'   '+STR(TOTDCT,14,2)+'   '+STR(TOTVAR,14,2)+'   '+STR(TOTALES,14,2)+'   '+STR(TOTCOBRADO,14,2)
            EJECT
            EXIT
         ENDIF   
      ENDIF
   ENDDO         
   SET DEVI TO SCREE   
ENDIF   
CLOS ALL
DEAC WIND AYUDAS
RETURN





PROCEDURE NEWDETADIARIO
SET BELL TO 60,1
SET ESCAPE OFF
SET EXACT ON
DEFI WIND PREPARA FROM 10,20 TO 14,60;
     CLOSE FLOAT GROW SHADOW 
DEFI WIND MOSTRAR FROM 10,15 TO 20,65;
     CLOSE FLOAT GROW SHADOW  COLOR  RB/BG
DEFI WIND AYUDAS FROM 22,7 TO 24,73;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 6
DEFI WIND PEDII FROM 9,18 TO 16,55 DOUBLE
****En el campo MAT se guarda los cobros por servicios****
*MES=0
*SWIMP=0
*SIGA=0
ACTI WIND AYUDAS
CLEA
SET COLO TO I
@0,14 SAY 'SELECCIONE LOS LIMITES DE PROCESO'
ACTI WIND PEDII
FEC01=DATE()
ON KEY LABEL F1 DO AYUDAR
@5,4 SAY 'Seleccione per¡odo de proceso'
@2,4 SAY 'FECHA     :>' GET FEC01 ERROR 'VUELVA A INGRESAR'
READ
IF LASTKEY()=27
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   RETURN
ENDIF   
CLOSE ALL
DEAC WIND PEDII
DEAC WIND AYUDAS
*SWIMP=0
*STORE 0 TO CANSAL,PRESAL,TOTAL,PREESPEC,CANESPEC,EXON
*STORE 0 TO TOTMAT,TOTESE,TOTCOM,TOTSUBT,TOTVAR,TOTDCT,TOTALES,TOTCOBRADO,TOTCOST,TOTPAGOCRE
*MES=MONTH(DATE())


SELE B
     USE MEDICTDO ALIAS MEDICTDO
     SET ORDE TO REGISTRO
SELE C
     USE FACTURA ALIAS FACTURA
     SET ORDE TO SERFAC
SELE D
     USE TABULADO ALIAS TABULADO
     SET ORDE TO FECHA
SET SAFE OFF
SELEC * FROM FACTURA;
 WHERE FECHA=FEC01 AND FECHA_EMIS!=FEC01;
 ORDER BY SERIE,NUMERO;
 INTO TABLE C:\SIGEP\TEMP\TPTABDIA

SELEC * FROM FACTURA;
 WHERE FECHA_EMIS=FEC01;
 ORDER BY SERIE,NUMERO;
 INTO TABLE C:\SIGEP\TEMP\TPTABDI1

SELECT TPTABDIA 
APPEND FROM C:\SIGEP\TEMP\TPTABDI1

**COPIA LA ESTRUCTURA DE LA TABLA TABULADO
SELECT TABULADO.*," " AS TIPCP,"   " AS SERIE,00000000 AS NUMERO," " AS TIPVT, "                    " AS NOMBRE FROM TABULADO;
 WHERE SUB_TOTAL>1000000;
 INTO  TABLE C:\SIGEP\TEMP\TPTABLDO

SET SAFE ON

FECTAB=DTOC(FEC01)
SELE TPTABDIA
GO TOP
DO WHILE !EOF()
   COD=NUMERO
   SRB=SERIE
   *******
   DO CASE
      CASE TIPO='V'
      CASE TIPO='M'
           COD=NUMERO
           COD1=REGISTRO
           STOR 0 TO MAT,ESE,MED,VARIOS,MAT1,ESE1,MED1,TOTCOST
           SELE MEDICTDO
           SEEK COD1
           IF FOUND()
              NOMNOM=NOMBRE
              IF MEDICINA1!=SPACE(7)
                 IF SUBS(MEDICINA1,1,1)='0'
                    MAT=MAT+(PREC_UNI1*CANTID1)
                   ELSE
                    IF SUBS(MEDICINA1,1,1)='2'                 
                       ESE=ESE+(PREC_UNI1*CANTID1)
                      ELSE 
                       MED=MED+(PREC_UNI1*CANTID1)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO1   
              ENDIF   
              IF MEDICINA2!=SPACE(7)
                 IF SUBS(MEDICINA2,1,1)='0'
                    MAT=MAT+(PREC_UNI2*CANTID2)
                   ELSE 
                    IF SUBS(MEDICINA2,1,1)='2'
                       ESE=ESE+(PREC_UNI2*CANTID2)
                      ELSE
                       MED=MED+(PREC_UNI2*CANTID2)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO2    
              ENDIF   
              IF MEDICINA3!=SPACE(7)
                 IF SUBS(MEDICINA3,1,1)='0'
                    MAT=MAT+(PREC_UNI3*CANTID3)
                   ELSE
                    IF SUBS(MEDICINA3,1,1)='2'                 
                       ESE=ESE+(PREC_UNI3*CANTID3)
                      ELSE
                       MED=MED+(PREC_UNI3*CANTID3)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO3
              ENDIF   
              IF MEDICINA4!=SPACE(7)
                 IF SUBS(MEDICINA4,1,1)='0'   
                    MAT=MAT+(PREC_UNI4*CANTID4)
                   ELSE
                    IF SUBS(MEDICINA4,1,1)='2'                    
                       ESE=ESE+(PREC_UNI4*CANTID4)
                      ELSE
                       MED=MED+(PREC_UNI4*CANTID4)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO4    
              ENDIF   
              IF MEDICINA5!=SPACE(7)
                 IF SUBS(MEDICINA5,1,1)='0'   
                    MAT=MAT+(PREC_UNI5*CANTID5)
                   ELSE 
                    IF SUBS(MEDICINA5,1,1)='2'    
                       ESE=ESE+(PREC_UNI5*CANTID5)
                      ELSE              
                       MED=MED+(PREC_UNI5*CANTID5)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO5    
              ENDIF   


              IF MEDICINA6!=SPACE(7)
                 IF SUBS(MEDICINA6,1,1)='0'   
                    MAT=MAT+(PREC_UNI6*CANTID6)
                   ELSE 
                    IF SUBS(MEDICINA6,1,1)='2'    
                       ESE=ESE+(PREC_UNI6*CANTID6)
                      ELSE              
                       MED=MED+(PREC_UNI6*CANTID6)
                    ENDIF   
                 ENDIF 
                 TOTCOST=TOTCOST+T_COSTO6   
              ENDIF   
              IF MEDICINA7!=SPACE(7)
                 IF SUBS(MEDICINA7,1,1)='0'   
                    MAT=MAT+(PREC_UNI7*CANTID7)
                   ELSE 
                    IF SUBS(MEDICINA7,1,1)='2'    
                       ESE=ESE+(PREC_UNI7*CANTID7)
                      ELSE              
                       MED=MED+(PREC_UNI7*CANTID7)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO7 
              ENDIF   
              IF MEDICINA8!=SPACE(7)
                 IF SUBS(MEDICINA8,1,1)='0'   
                    MAT=MAT+(PREC_UNI8*CANTID8)
                   ELSE 
                    IF SUBS(MEDICINA8,1,1)='2'    
                       ESE=ESE+(PREC_UNI8*CANTID8)
                      ELSE              
                       MED=MED+(PREC_UNI8*CANTID8)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO8    
              ENDIF   
              IF MEDICINA9!=SPACE(7)
                 IF SUBS(MEDICINA9,1,1)='0'   
                    MAT=MAT+(PREC_UNI9*CANTID9)
                   ELSE 
                    IF SUBS(MEDICINA9,1,1)='2'    
                       ESE=ESE+(PREC_UNI9*CANTID9)
                      ELSE              
                       MED=MED+(PREC_UNI9*CANTID9)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO9    
              ENDIF   
              IF MEDICINA10!=SPACE(7)
                 IF SUBS(MEDICINA10,1,1)='0'   
                    MAT=MAT+(PREC_UNI10*CANTID10)
                   ELSE 
                    IF SUBS(MEDICINA10,1,1)='2'    
                       ESE=ESE+(PREC_UNI10*CANTID10)
                      ELSE              
                       MED=MED+(PREC_UNI10*CANTID10)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO10    
              ENDIF   

              VARIOS=REDONDEO
              SUBTOT=MAT+MED+ESE
              DCT=0
              IF EXONERAR=0
                 SELECT TPTABLDO 
                 APPE BLAN
                 IF COD>90000000
                    REPLACE TIPCP WITH "F", SERIE WITH SRB, NUMERO WITH (COD-90000000)
                   ELSE
                    REPLACE TIPCP WITH "B", SERIE WITH SRB, NUMERO WITH COD
                 ENDIF
                 REPLACE TOT_COSTO WITH TOTCOST, SUB_TOTAL WITH SUBTOT, REDONDEO WITH VARIOS, TOTAL_FACT WITH (SUBTOT+VARIOS)
                 REPLACE TOT_SERVIC WITH MAT
                ELSE
                 SUBTOT1=((MAT+ESE+MED)*(100-MEDICTDO.EXONERAR)/100)
                 DCT=VAL(STR((SUBTOT-SUBTOT1),12,2))                              
                 SELECT TPTABLDO 
                 APPE BLAN
                 IF COD>90000000
                    REPLACE TIPCP WITH "F", SERIE WITH SRB, NUMERO WITH (COD-90000000)
                   ELSE
                    REPLACE TIPCP WITH "B", SERIE WITH SRB, NUMERO WITH COD
                 ENDIF
                 REPLACE TOT_COSTO WITH TOTCOST, SUB_TOTAL WITH SUBTOT, DESCUENTO WITH DCT, REDONDEO WITH VARIOS, TOTAL_FACT WITH (SUBTOT-DCT+VARIOS)
                 REPLACE TOT_SERVIC WITH (MAT*(100-MEDICTDO.EXONERAR)/100)
              ENDIF   
              SELE TPTABDIA
              IF !EMPTY(FECHA)
                 IF FECHA=FECHA_EMIS 
                    SELECT TPTABLDO
                    REPLA TOTAL_COBR WITH SUBTOT-DCT+VARIOS
                   ELSE
                    SELECT TPTABLDO
                    REPLA TOTAL_COBR WITH SUBTOT-DCT+VARIOS
                    REPLA TOT_PAGCRE WITH SUBTOT-DCT+VARIOS, NOMBRE WITH "****PAGO CREDITO****"
                 ENDIF
                ELSE
                 SELECT TPTABLDO
                 REPLACE TIPVT WITH "R", NOMBRE WITH TPTABDIA.NOMBRE
              ENDIF
           ENDIF
           SELE C
      CASE TIPO='A'
           SELECT TPTABLDO 
           APPE BLAN
           IF COD>90000000
              REPLACE TIPCP WITH "F", SERIE WITH SRB, NUMERO WITH (COD-90000000)
             ELSE
              REPLACE TIPCP WITH "B", SERIE WITH SRB, NUMERO WITH COD
           ENDIF
           REPLACE TIPVT WITH "A"
   ENDCASE
   SELE TPTABDIA
   SKIP
ENDDO         
SELECT TPTABLDO
REPORT FORM FRTABING TO PRINTER
*SET SAFETY OFF
*COPY TO C:\SIGEP\REPOXLS\TABULADODEINGRESO TYPE XLS
*SET SAFETY ON
CLOS DATA
THISFORM.RELEASE





PROCEDURE DETADIARIO
SET BELL TO 60,1
SET ESCAPE OFF
SET EXACT ON
DEFI WIND PREPARA FROM 10,20 TO 14,60;
     CLOSE FLOAT GROW SHADOW 
DEFI WIND MOSTRAR FROM 10,15 TO 20,65;
     CLOSE FLOAT GROW SHADOW  COLOR  RB/BG
DEFI WIND AYUDAS FROM 22,7 TO 24,73;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 6
DEFI WIND PEDII FROM 9,18 TO 16,55 DOUBLE
****En el campo MAT se guarda los cobros por servicios****
MES=0
SWIMP=0
NOMMES=SPACE(10)
MESITO=SPACE(8)
SERIEB='   '
SIGA=0
ACTI WIND AYUDAS
CLEA
SET COLO TO I
@0,14 SAY 'SELECCIONE LOS LIMITES DE PROCESO'
ACTI WIND PEDII
FIN=DATE()
FFI=DATE()
SERIEB='   '
DIGITB='      '
NOMCAJERO=SPACE(20)
ON KEY LABEL F1 DO AYUDAR
@5,4 SAY 'Seleccione per¡odo de proceso'
@1,4 SAY 'DIGITADOR :>' GET DIGITB VALID CAJEROS(DIGITB) ERROR 'VUELVA A INGRESAR'
@3,4 SAY 'FECHA     :>' GET FIN ERROR 'VUELVA A INGRESAR'
READ
IF LASTKEY()=27
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   RETURN
ENDIF   
CLOSE ALL
DEAC WIND PEDII
DEAC WIND AYUDAS
SWIMP=0
STORE 0 TO CANSAL,PRESAL,TOTAL,PREESPEC,CANESPEC,EXON
STORE 0 TO TOTMAT,TOTESE,TOTCOM,TOTSUBT,TOTVAR,TOTDCT,TOTALES,TOTCOBRADO,TOTCOST,TOTPAGOCRE
MES=MONTH(DATE())

SELE B
     USE MEDICTDO ALIAS MEDICTDO
     SET ORDE TO REGISTRO
SELE C
     USE FACTURA ALIAS FACTURA
     SET ORDE TO SERFAC
SELE D
     USE TABULADO ALIAS TABULADO
     SET ORDE TO FECHA
SET SAFE OFF
IF DIGITB=SPACE(6)
   SELEC * FROM FACTURA;
    WHERE FACTURA.FECHA=FIN AND FACTURA.FECHA_EMIS!=FIN;
    ORDER BY FACTURA.SERIE,FACTURA.NUMERO;
    INTO TABLE C:\SIGEP\TEMP\TPTABDIA

   SELEC * FROM FACTURA;
    WHERE FACTURA.FECHA_EMIS=FIN;
    ORDER BY FACTURA.SERIE,FACTURA.NUMERO;
    INTO TABLE C:\SIGEP\TEMP\TPTABDI1

  SELE TPTABDIA
  APPE FROM C:\SIGEP\TEMP\TPTABDI1
  ELSE
   SELEC * FROM FACTURA;
    WHERE FECHA_EMIS=FIN AND DIGITADOR=DIGITB;
    ORDER BY SERIE,NUMERO;
    INTO TABLE C:\SIGEP\TEMP\TPTABDIA
ENDIF
SET SAFE ON
FECTAB=DTOC(FIN)
SELE TPTABDIA
GO TOP

SET DEVI TO PRINT
@0,0 SAY CHR(15)
@0,2 SAY ''+TITULO02
@0,90 SAY 'Fecha Emis.:> '+DTOC(DATE())
@1,2 SAY ''+TITULO01+'         I N G R E S O S  E N  F A R M A C I A'
@1,90 SAY ' Hora Emis.:> '+TIME()
@2,2 SAY '                           CORRESPONDIENTE AL:> '+FECTAB
IF DIGITB=SPACE(6)
   @3,2 SAY 'REPORTE GENERAL'
  ELSE
   @3,2 SAY 'CAJERO: '+NOMCAJERO
ENDIF
@4,2 SAY '                       SUB                                            TOTAL            TOTAL'
@5,2 SAY ' COMPROBANTE          TOTAL        DESCUENTO       REDONDEO         FACTURADO         COBRADO'
@6,1 SAY 'נננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננ'
Y=7
DO WHILE !EOF()
   COD=NUMERO
   SRB=SERIE
   *******
   DO CASE
      CASE TIPO='V'
      CASE TIPO='M'
           COD=NUMERO
           COD1=REGISTRO
           STOR 0 TO MAT,ESE,MED,VARIOS,MAT1,ESE1,MED1
           SELE MEDICTDO
           SEEK COD1
           IF FOUND()
              IF COD>90000000
                 @Y,1 SAY 'F  '+SRB+'-'+STR((COD-90000000),8)
                ELSE
                 @Y,1 SAY 'B  '+SRB+'-'+STR(COD,8)
              ENDIF
              IF MEDICINA1!=SPACE(7)
                 IF SUBS(MEDICINA1,1,1)='0'
                    MAT=MAT+(PREC_UNI1*CANTID1)
                   ELSE
                    IF SUBS(MEDICINA1,1,1)='2'                 
                       ESE=ESE+(PREC_UNI1*CANTID1)
                      ELSE 
                       MED=MED+(PREC_UNI1*CANTID1)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO1   
              ENDIF   
              IF MEDICINA2!=SPACE(7)
                 IF SUBS(MEDICINA2,1,1)='0'
                    MAT=MAT+(PREC_UNI2*CANTID2)
                   ELSE 
                    IF SUBS(MEDICINA2,1,1)='2'
                       ESE=ESE+(PREC_UNI2*CANTID2)
                      ELSE
                       MED=MED+(PREC_UNI2*CANTID2)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO2    
              ENDIF   
              IF MEDICINA3!=SPACE(7)
                 IF SUBS(MEDICINA3,1,1)='0'
                    MAT=MAT+(PREC_UNI3*CANTID3)
                   ELSE
                    IF SUBS(MEDICINA3,1,1)='2'                 
                       ESE=ESE+(PREC_UNI3*CANTID3)
                      ELSE
                       MED=MED+(PREC_UNI3*CANTID3)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO3
              ENDIF   
              IF MEDICINA4!=SPACE(7)
                 IF SUBS(MEDICINA4,1,1)='0'   
                    MAT=MAT+(PREC_UNI4*CANTID4)
                   ELSE
                    IF SUBS(MEDICINA4,1,1)='2'                    
                       ESE=ESE+(PREC_UNI4*CANTID4)
                      ELSE
                       MED=MED+(PREC_UNI4*CANTID4)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO4    
              ENDIF   
              IF MEDICINA5!=SPACE(7)
                 IF SUBS(MEDICINA5,1,1)='0'   
                    MAT=MAT+(PREC_UNI5*CANTID5)
                   ELSE 
                    IF SUBS(MEDICINA5,1,1)='2'    
                       ESE=ESE+(PREC_UNI5*CANTID5)
                      ELSE              
                       MED=MED+(PREC_UNI5*CANTID5)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO5    
              ENDIF   


              IF MEDICINA6!=SPACE(7)
                 IF SUBS(MEDICINA6,1,1)='0'   
                    MAT=MAT+(PREC_UNI6*CANTID6)
                   ELSE 
                    IF SUBS(MEDICINA6,1,1)='2'    
                       ESE=ESE+(PREC_UNI6*CANTID6)
                      ELSE              
                       MED=MED+(PREC_UNI6*CANTID6)
                    ENDIF   
                 ENDIF 
                 TOTCOST=TOTCOST+T_COSTO6   
              ENDIF   
              IF MEDICINA7!=SPACE(7)
                 IF SUBS(MEDICINA7,1,1)='0'   
                    MAT=MAT+(PREC_UNI7*CANTID7)
                   ELSE 
                    IF SUBS(MEDICINA7,1,1)='2'    
                       ESE=ESE+(PREC_UNI7*CANTID7)
                      ELSE              
                       MED=MED+(PREC_UNI7*CANTID7)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO7 
              ENDIF   
              IF MEDICINA8!=SPACE(7)
                 IF SUBS(MEDICINA8,1,1)='0'   
                    MAT=MAT+(PREC_UNI8*CANTID8)
                   ELSE 
                    IF SUBS(MEDICINA8,1,1)='2'    
                       ESE=ESE+(PREC_UNI8*CANTID8)
                      ELSE              
                       MED=MED+(PREC_UNI8*CANTID8)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO8    
              ENDIF   
              IF MEDICINA9!=SPACE(7)
                 IF SUBS(MEDICINA9,1,1)='0'   
                    MAT=MAT+(PREC_UNI9*CANTID9)
                   ELSE 
                    IF SUBS(MEDICINA9,1,1)='2'    
                       ESE=ESE+(PREC_UNI9*CANTID9)
                      ELSE              
                       MED=MED+(PREC_UNI9*CANTID9)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO9    
              ENDIF   
              IF MEDICINA10!=SPACE(7)
                 IF SUBS(MEDICINA10,1,1)='0'   
                    MAT=MAT+(PREC_UNI10*CANTID10)
                   ELSE 
                    IF SUBS(MEDICINA10,1,1)='2'    
                       ESE=ESE+(PREC_UNI10*CANTID10)
                      ELSE              
                       MED=MED+(PREC_UNI10*CANTID10)
                    ENDIF   
                 ENDIF
                 TOTCOST=TOTCOST+T_COSTO10    
              ENDIF

              VARIOS=REDONDEO
              SUBTOT=MAT+MED+ESE
              DCT=0
              IF EXONERAR=0
                 @Y,14 SAY +STR(SUBTOT,14,2)+'   '+'              '+'   '+STR(VARIOS,14,2)+'   '+STR((SUBTOT+VARIOS),14,2)
                 Y=Y+1                                                                                                             
                 TOTVAR=TOTVAR+VARIOS
                 TOTSUBT=TOTSUBT+MAT+MED+ESE
                 TOTMAT=TOTMAT+MAT
                ELSE
                 SUBTOT1=((MAT+ESE+MED)*(100-EXONERAR)/100)
                 DCT=VAL(STR((SUBTOT-SUBTOT1),12,2))                              
                 @Y,14 SAY +STR(SUBTOT,14,2)+'   '+STR(DCT,14,2)+'   '+STR(VARIOS,14,2)+'   '+STR((SUBTOT-DCT+VARIOS),14,2)
                 Y=Y+1                                                                                                             
                 TOTVAR=TOTVAR+VARIOS
                 TOTSUBT=TOTSUBT+MAT+MED+ESE
                 TOTDCT=TOTDCT+DCT
                 TOTMAT=TOTMAT+(MAT*(100-MEDICTDO.EXONERAR)/100)
              ENDIF   
              SELE TPTABDIA
              IF !EMPTY(FECHA)
                 IF FECHA=FECHA_EMIS
                    TOTCOBRADO=TOTCOBRADO+SUBTOT+VARIOS-DCT
                    @Y-1,82 SAY+STR((SUBTOT-DCT+VARIOS),14,2)
                   ELSE
                    TOTCOBRADO=TOTCOBRADO+SUBTOT+VARIOS-DCT
                    TOTPAGOCRE=TOTPAGOCRE+SUBTOT+VARIOS-DCT
                    @Y-1,82 SAY+STR((SUBTOT-DCT+VARIOS),14,2)+'****PAGO CREDITO****'
                 ENDIF
                ELSE
                 @Y-1,2 SAY '-R'
                 @Y-1,82 SAY '          0.00  '+SUBS(NOMBRE,1,20)
              ENDIF
           ENDIF
           SELE C
      CASE TIPO='A'
           IF COD>90000000
              @Y,1 SAY 'F  '+SRB+'-'+STR((COD-90000000),8)
             ELSE
              @Y,1 SAY 'B  '+SRB+'-'+STR(COD,8)
           ENDIF
           @Y,14 SAY '              A  N  U  L  A  D  O'
           Y=Y+1                                                                     
   ENDCASE
   SELE TPTABDIA
   SKIP
   IF Y=50 OR EOF()
      IF Y=50
         TOTALES=TOTSUBT+TOTVAR-TOTDCT
         @Y,1 SAY '================================================================================================='
         @Y+1,1 SAY ' V  A  N     '+''+STR(TOTSUBT,14,2)+'   '+STR(TOTDCT,14,2)+'   '+STR(TOTVAR,14,2)+'   '+STR(TOTALES,14,2)+'   '+STR(TOTCOBRADO,14,2)
         EJECT
         @0,2 SAY ''+TITULO02
         @0,90 SAY 'Fecha Emis.:> '+DTOC(DATE())
         @1,2 SAY ''+TITULO01+'         I N G R E S O S  E N  F A R M A C I A'
         @1,90 SAY ' Hora Emis.:> '+TIME()
         @2,2 SAY '                           CORRESPONDIENTE AL:> '+FECTAB
         IF DIGITB=SPACE(6)
            @3,2 SAY 'REPORTE GENERAL'
           ELSE
            @3,2 SAY 'CAJERO: '+NOMCAJERO
         ENDIF
         @4,2 SAY '                       SUB                                            TOTAL            TOTAL'
         @5,2 SAY ' COMPROBANTE          TOTAL        DESCUENTO       REDONDEO         FACTURADO         COBRADO'
         @6,1 SAY 'נננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננננ'
         @7,1   SAY ' VIENEN      '+''+STR(TOTSUBT,14,2)+'   '+STR(TOTDCT,14,2)+'   '+STR(TOTVAR,14,2)+'   '+STR(TOTALES,14,2)+'   '+STR(TOTCOBRADO,14,2)
         Y=8
        ELSE 
         TOTALES=TOTSUBT+TOTVAR-TOTDCT
         @Y,1 SAY '================================================================================================='
         @Y+1,1 SAY 'T O T A L    '+''+STR(TOTSUBT,14,2)+'   '+STR(TOTDCT,14,2)+'   '+STR(TOTVAR,14,2)+'   '+STR(TOTALES,14,2)+'   '+STR(TOTCOBRADO,14,2)
         @Y+3,30 SAY "VENTAS AL CONTADO"+STR((TOTCOBRADO-TOTPAGOCRE),14,2)
         @Y+4,30 SAY "VENTAS AL CREDITO"+STR((TOTALES-TOTCOBRADO),14,2)
         @Y+5,30 SAY "                   ------------"
         @Y+6,30 SAY "     TOTAL VENTAS"+STR(TOTALES-TOTPAGOCRE,14,2)
         @Y+7,30 SAY "COBROS  DIFERIDOS"+STR(TOTPAGOCRE,14,2)
         @Y+8,30 SAY "                   ------------"
         @Y+9,30 SAY "TOTAL   RECAUDADO"+STR(TOTALES,14,2)
         @Y+10,30 SAY"                   ============"
         EJECT
         EXIT
      ENDIF   
   ENDIF
ENDDO         
SET DEVI TO SCREE   
SELE TABULADO
SEEK FIN
IF FOUN()
   REPLA TOT_COSTO WITH TOTCOST,TOT_SERVIC WITH TOTMAT
   REPLA SUB_TOTAL WITH TOTSUBT, DESCUENTO WITH TOTDCT, REDONDEO WITH TOTVAR, TOTAL_FACT WITH TOTALES, TOTAL_COBR WITH TOTCOBRADO, TOT_PAGCRE WITH TOTPAGOCRE
  ELSE
   APPE BLAN
   REPLA FECHA WITH FIN,TOT_COSTO WITH TOTCOST,TOT_SERVIC WITH TOTMAT
   REPLA SUB_TOTAL WITH TOTSUBT, DESCUENTO WITH TOTDCT, REDONDEO WITH TOTVAR, TOTAL_FACT WITH TOTALES, TOTAL_COBR WITH TOTCOBRADO, TOT_PAGCRE WITH TOTPAGOCRE
ENDIF
CLOS ALL
DEAC WIND AYUDAS
RETURN





PROCEDURE PRELIMINAR
RETURN




PROCEDURE PRELIMED
SET BELL TO 60,1
SET EXACT ON
DEFI WIND PREPARA FROM 10,20 TO 14,60;
     CLOSE FLOAT GROW SHADOW 
DEFI WIND PRESPREL FROM 10,10 TO 18,70;
     CLOSE FLOAT GROW SHADOW  COLOR  RB/BG TITLE 'REPORTE DE RECAUDACIONES - FARMACIA'
DEFI WIND AYUDAS FROM 22,7 TO 24,73;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 5
DEFI WIND PEDII FROM 9,18 TO 16,55 DOUBLE
MES=0
SWIMP=0
NOMMES=SPACE(10)
MESITO=SPACE(8)
SIGA=0
ACTI WIND AYUDAS
CLEA
@0,14 SAY 'SELECCIONE LOS LIMITES DE PROCESO' COLO I
ACTI WIND PEDII
STORE 0 TO FIN,FFI
SERI01='   '
@5,2 SAY '  Ingrese valores diferentes  '
@1,4 SAY 'NUMERO DE SERIE:  ' GET SERI01 PICT '999' 
@2,4 SAY 'FACTURA INICIAL:  ' GET FIN PICT '99999999' VALID FACTUFAR(SERI01,FIN) ERROR 'NUMERO DE FACTURA NO EXISTE'
READ
IF LASTKEY()=27
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   RETURN
ENDIF   
@3,4 SAY 'FACTURA FINAL  :  ' GET FFI PICT '99999999' VALID FACTUFAR(SERI01,FFI) ERROR 'NUMERO DE FACTURA NO EXISTE'
READ
IF LASTKEY()=27 .OR. FFI<FIN
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   CLOS ALL
   RETURN
ENDIF   
CLOSE ALL
DEAC WIND PEDII
DEAC WIND AYUDAS

ACTI WIND PREPARA
@1,6 SAY '.... Reporte en proceso ....' colo gb*/b+

SWIMP=0
MES=MONTH(DATE())

SELE A
     USE MEDICTDO ALIAS MEDICTDO
     SET ORDE TO 1
SELE C
     USE FACTURA ALIAS FACTURA
     SET ORDE TO SERFAC
*SELE D
*     USE MEDIHOSP ALIAS MEDIHOSP
*     SET ORDE TO SERFAC
SELE C
SEEK SERI01+STR(FFI,8)
FECTAB=DTOC(FECHA)
TOTALMED=0
SEEK SERI01+STR(FIN,8)
DO WHILE !EOF()
   IF DTOC(FECHA)!='  /  /  '
      WAIT WIND 'PROCESANDO REGISTRO  '+STR(NUMERO,8) NOWA
      COD=REGISTRO
      STORE 0 TO TOT01,TOT02,TOT03,TOT04,TOT05,TOT06,TOT07,TOT08,TOT09,TOT10
      DO CASE
         CASE TIPO='M'
              SELE A
              SEEK COD
              IF FOUND()
                 IF MEDICINA1!=SPACE(7)
                    TOT01=PREC_UNI1*CANTID1
                 ENDIF
                 IF MEDICINA2!=SPACE(7)
                    TOT02=PREC_UNI2*CANTID2
                 ENDIF
                 IF MEDICINA3!=SPACE(7)
                    TOT03=PREC_UNI3*CANTID3
                 ENDIF
                 IF MEDICINA4!=SPACE(7)
                    TOT04=PREC_UNI4*CANTID4
                 ENDIF
                 IF MEDICINA5!=SPACE(7)
                    TOT05=PREC_UNI5*CANTID5
                 ENDIF
                 IF MEDICINA6!=SPACE(7)
                    TOT06=PREC_UNI6*CANTID6
                 ENDIF
                 IF MEDICINA7!=SPACE(7)
                    TOT07=PREC_UNI7*CANTID7
                 ENDIF
                 IF MEDICINA8!=SPACE(7)
                    TOT08=PREC_UNI8*CANTID8
                 ENDIF
                 IF MEDICINA9!=SPACE(7)
                    TOT09=PREC_UNI9*CANTID9
                 ENDIF
                 IF MEDICINA10!=SPACE(7)
                    TOT10=PREC_UNI10*CANTID10
                 ENDIF
              ENDIF
              TOTALMED=TOTALMED+TOT01+TOT02+TOT03+TOT04+TOT05+TOT06+TOT07+TOT08+TOT09+TOT10
              TOTALMED=TOTALMED-VAL(STR(((TOT01+TOT02+TOT03+TOT04+TOT05+TOT06+TOT07+TOT08+TOT09+TOT10)*EXONERAR/100),12,2))+REDONDEO
*        CASE TIPO='T'
*             NUMSERIE=SERIE
*             NUMFACTU=NUMERO
*             COD1=NUMSERIE+STR(NUMFACTU,8)
*             SELE MEDIHOSP
*             SET ORDE TO SERFAC
*             SEEK COD1
*             IF FOUND()
*                DO WHILE !EOF()
*                   IF SERIE_FAC=NUMSERIE AND FACTURA=NUMFACTU
*                      PRESAL=PREC_MED1*CANTIDAD1
*                      TOTALMED=TOTALMED+PRESAL
*                     ELSE
*                      EXIT
*                   ENDIF
*                   SKIP
*                ENDDO
*             ENDIF
      ENDCASE
      SELE FACTURA
   ENDIF
   SKIP
   IF NUMERO>FFI OR SERIE!=SERI01
      EXIT
   ENDIF
ENDDO         
CLOS ALL
DEAC WIND PREPARA
WAIT WIND 'Presione cualquier tecla para continuar ...' NOWA
ACTI WIND PRESPREL
@1,2 SAY 'INICIO :' COLO B/GB
@2,2 SAY 'FINAL :' COLO B/GB
@6,13 SAY 'TOTAL RECAUDADO -->' COLO W+/GB
@1,11 SAY STR(FIN,8) COLO GR+/GB
@2,11 SAY STR(FFI,8) COLO GR+/GB
@6,35 SAY STR(TOTALMED,12,2) COLO W+*/GB
READ
DEAC WIND PRESPREL
RETURN








PROCEDURE FECHA
PARAMETER A
IF DTOC(CTOD(A))='  /  /  '
   RETURN .F.
  ELSE
   RETURN .T.
ENDIF    

           
FUNCTION FACTU
PARAMETER A,B
IF B>0
   USE FACTURA
   SET ORDE TO SERFAC
   SEEK A+STR(B,8)
   IF FOUND()
      RETURN .T.
     ELSE
      RETURN .F.
   ENDIF    
  ELSE
   RETURN .F.
ENDIF


FUNCTION FACTUFAR
PARAMETER A,B
IF B>0
   USE FACTURA
   SET ORDE TO SERFAC
   SEEK A+STR(B,8)
   IF FOUND()
      RETURN .T.
     ELSE
      RETURN .F.
   ENDIF    
  ELSE
   RETURN .F.
ENDIF


FUNCTION CAJEROS
PARAMETER A
USE USUARIOS.LIB
LOCATE FOR CODIGO=A
IF FOUN()
   NOMCAJERO=ALLT(USUARIOS.NOMBRE)+" "+ALLT(USUARIOS.A_PATERNO)+" "+ALLT(USUARIOS.A_MATERNO)
   WAIT WIND ""+NOMCAJERO NOWA
   RETURN .T.
  ELSE
   RETURN .T.
ENDIF



PROCEDURE AYUDAR
ON KEY LABEL F1
ACTI WIND MOSTRAR
CLEA
@0,15 SAY '!!!  ERROR  !!!' 
@4,15 SAY 'NO SE ENCUENTRA'
@6,14 SAY 'FICHERO DE AYUDAS'
@8,20 SAY 'Presione cualquier tecla ...'
WAIT''
DEAC WIND MOSTRAR
ON KEY LABEL F1 DO AYUDAR
RETURN

