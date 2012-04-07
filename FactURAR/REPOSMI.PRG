PROCEDURE REPOATEN
DEFI WIND TODO FROM 0,0 TO 24,78;
     CLOSE FLOAT GROW SHADOW COLOR BG/GR+
DEFI WIND PREPARA FROM 10,20 TO 14,60;
     CLOSE FLOAT GROW SHADOW 
DEFI WIND AVISO FROM 6,14 TO 21,68;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 12
DEFI WIND MOSTRAR FROM 10,15 TO 20,65;
     CLOSE FLOAT GROW SHADOW  COLOR  RB/BG
DEFI WIND AYUDAS FROM 22,7 TO 24,73;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 6
     
SIGA=0
A=0
USE PACISSMI NOUPDATE
SET ORDE TO 1
GO BOTTOM
REGRO=CUENTA_C
ON KEY LABEL F10 DO MOSTRAR WITH VARREAD() 
DO WHILE .T.
   CLOS ALL
   SIGA=0
   DEAC WIND TODO
   DEAC WIND AYUDAS
   ACTI WIND AYUDAS
   CLEA
   @0,2 SAY '<0> + <ENTER> SALIR' COLO I 
   @0,37 SAY '<F10> LISTADO DE PACIENTES' COLO I 
   ACTI WIND PREPARA
   @1,2 SAY 'CUENTA CORRIENTE:> 'GET REGRO PICT '99999999'  ERROR 'VUELVA A INGRESAR'  COLO WR/B
   READ
   IF REGRO=0 
      SW=0
      DEAC WIND PREPARA
      EXIT
     ELSE
      DO EXISTE WITH REGRO
      IF SIGA=1
         SW=1
        ELSE 
         SW=0
      ENDIF   
   ENDIF   
   DEAC WIND PREPARA  
   IF SW=1 
      DECLARE AATT1[200]
      DECLARE AATT2[200]
      DECLARE AATT3[200]              
      DECLARE AATT4[200]              
      SET MESS WIND TODO
      ACTI WIND TODO
      @0,14 SAY 'ATENCIONES  DE PACIENTES SEGURO MATERNO INFANTIL' COLO B/W*
      TIPO=' '
      CONF=' '
      NOMPAC=SPACE(30)
      FECALTA=SPACE(8)
      FECINGR=SPACE(8)
      A=REGRO
      USE PACISSMI NOUPDATE
      SET ORDE TO 1
      SEEK A
      IF FOUND()
         @1,0 SAY 'REGISTRO' COLO W/GR
         @1,22 SAY 'HISTORIA' COLO W/GR
         @2,0  SAY 'NOMBRE' COLO W/GR
         @1,45 SAY 'FECHA INGRESO' COLO W/GR
         @1,9 SAY ''+STR(REGRO,8)
         @1,31 SAY ''+STR(HISTORIA,8)
         @2,7 SAY ''+NOMBRE
         @1,59 SAY ''+DTOC(FECHA_INGR)
         FECINGR=FECHA_INGR
         SERV=SERVICIO
         EDUC=CENTRO_ED         
         NOMPAC=NOMBRE
         HISTO=HISTORIA
         IF TIPO='A'         
            @3,0 SAY '** PACIENTE AMBULATORIO **' COLO W/GR*
           ELSE
            @3,0 SAY '** PACIENTE HOSPITALIZADO **' COLO W/GR*
            @3,40 SAY 'SERVICIO' COLO W/GR
            USE SERVICIO NOUPDATE
            SET ORDE TO 1
            SEEK SERV
            @3,49 SAY +SUBS(NOMBRE,1,20)
         ENDIF
         *USE COLEGIOS NOUPDATE
         *SET ORDE TO 1
         *SEEK EDUC
         *@2,40 SAY 'CENTRO EDUC' COLO W/GR
         *@2,52 SAY ''+SUBS(NOMBRE,1,25)
         @4,0 SAY 'CODIGO           DESCRIPCION            CANTIDAD    PRECIO(SIN IGV)   FECHA' COLO W/GR
         @5,0 SAY 'อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ' COLO W/GR
         X=1
         USE ATENSSMI NOUPDATE
         SET ORDE TO 1
         SEEK A
         IF FOUND()
            DO WHILE .T.
               IF CUENTA_C=A
                  AATT1[X]=ATENCION1
                  AATT2[X]=CANTIDAD1
                  AATT3[X]=PREC_ATE1
                  AATT4[X]=DTOC(FECHA)                        
                  X=X+1
                  SKIP
                  IF CUENTA_C!=A
                     EXIT
                  ENDIF   
               ENDIF
            ENDDO
         ENDIF   
         Y=6      
         TOTAL=0
         FOR I=1 TO (X-1)
            COD=AATT1[I]
            USE ATENCION NOUPDATE
            SET ORDE TO 1
            SEEK COD
            @Y,0 SAY''+STR(COD,6)+'  '+SUBS(NOMBRE,1,30)+'         '+STR(AATT2[I],1)+'    '+STR((AATT3[I]*AATT2[I]),12,2)+'   '+AATT4[I]
            TOTAL=TOTAL+(AATT3[I]*AATT2[I])
            Y=Y+1
            IF I=(X-1)
               @20,20 SAY 'TOTAL :> '+STR(TOTAL,12,2)
               WAIT WIND '[ESC] SALIR     [F8] IMPRIMIR' NOWA
               ON KEY LABEL F8 DO IMPRATEN
               READ
               ON KEY LABEL F8
            ENDIF   
            IF Y=22
               @22,20 SAY 'Presione <ENTER> para continuar....'
               WAIT''
               Y=6
               @Y,0 CLEA
            ENDIF
         ENDFOR
      ENDIF   
   ENDIF   
ENDDO   
ON KEY LABEL F10
CLOSE ALL
DEAC WIND INGRESO
DEAC WIND TITULO
DEAC WIND TODO
DEAC WIND AYUDAS
RETURN



PROCEDURE REPOMEDI
DEFI WIND TODO FROM 0,0 TO 24,78;
     CLOSE FLOAT GROW SHADOW COLOR BG/GR+
DEFI WIND PREPARA FROM 10,20 TO 14,60;
     CLOSE FLOAT GROW SHADOW 
DEFI WIND AVISO FROM 6,15 TO 21,65;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 12
DEFI WIND MOSTRAR FROM 10,15 TO 20,65;
     CLOSE FLOAT GROW SHADOW  COLOR  RB/BG
DEFI WIND AYUDAS FROM 22,7 TO 24,73;
     CLOSE FLOAT GROW SHADOW  COLOR SCHEME 6
     
SIGA=0
A=0
USE PACISSMI NOUPDATE
SET ORDE TO 1
* INDE PACV
GO BOTTOM
REGRO=CUENTA_C
ON KEY LABEL F10 DO MOSTRAR WITH VARREAD() 
ON KEY LABEL F1 DO AYUDAR
DO WHILE .T.
   CLOS ALL
   SIGA=0
   DEAC WIND TODO
   DEAC WIND AYUDAS
   ACTI WIND AYUDAS
   CLEA
   @0,2 SAY '<0> + <ENTER> SALIR' COLO I
   @0,37 SAY '<F10> LISTADO DE PACIENTES' COLO I
   ACTI WIND PREPARA
   @1,2 SAY 'CUENTA CONVENIOS:> 'GET REGRO PICT '99999999'  ERROR 'VUELVA A INGRESAR' 
   READ
   IF REGRO=0 
      SW=0
      DEAC WIND PREPARA
      EXIT
     ELSE
      DO EXISTE WITH REGRO
      IF SIGA=1
         SW=1
        ELSE 
         SW=0
      ENDIF   
   ENDIF   
   DEAC WIND PREPARA  
   IF SW=1 
      DECLARE AATT1[300]
      DECLARE AATT2[300]
      DECLARE AATT3[300]              
      DECLARE AATT4[300]              
      SET MESS WIND TODO
      ACTI WIND TODO
      @0,16 SAY 'MEDICINAS DE PACIENTES - SEGURO MATERNO INFANTIL' COLO R/W+
      TIPO=' '
      CONF=' '
      NOMPAC=SPACE(30)
      FECALTA=SPACE(8)
      FECINGR=SPACE(8)
      A=REGRO
      USE PACISSMI NOUPDATE
      SET ORDE TO 1
      SEEK A
      IF FOUND()
         @1,0 SAY 'REGISTRO' COLO W/GR
         @1,22 SAY 'HISTORIA' COLO W/GR
         @1,45 SAY 'FECHA INGRESO' COLO W/GR
         @2,0  SAY 'NOMBRE' COLO W/GR
         @1,9 SAY ''+STR(REGRO,8)
         @1,31 SAY ''+STR(HISTORIA,8)
         @1,59 SAY ''+DTOC(FECHA_INGR)
         @2,7 SAY ''+NOMBRE
         FECINGR=FECHA_INGR
         SERV=SERVICIO
         EDUC=CENTRO_ED         
         NOMPAC=NOMBRE
         HISTO=HISTORIA
         IF TIPO='A'         
            @3,0 SAY '** PACIENTE AMBULATORIO **' COLO W/GR*
           ELSE
            @3,0 SAY '** PACIENTE HOSPITALIZADO **' COLO W/GR*
            @3,40 SAY 'SERVICIO' COLO W/GR
            USE SERVICIO NOUPDATE
            SET ORDE TO 1
            SEEK SERV
            @3,49 SAY +SUBS(NOMBRE,1,20)
         ENDIF
         *USE COLEGIOS NOUPDATE
         *SET ORDE TO 1
         *SEEK EDUC
         *@2,40 SAY 'CENTRO EDUC' COLO W/GR
         *@2,52 SAY ''+SUBS(NOMBRE,1,25)
         FECALTA=DTOC(DATE())
         X=1
         USE MEDISSMI NOUPDATE
         SET ORDE TO 1
         SEEK A
         IF FOUND()
            DO WHILE .T.
               IF CUENTA_C=A
                  AATT1[X]=MEDICINA1
                  AATT2[X]=CANTIDAD1
                  AATT3[X]=PREC_MED1
                  AATT4[X]=DTOC(FECHA)                        
                  X=X+1
                  SKIP
                  IF CUENTA_C!=A
                     EXIT
                  ENDIF   
               ENDIF
            ENDDO
         ENDIF
         @4,0 SAY ' CODIGO          MEDICAMENTO           CANTID     PRECIO  FECHA     COD-SES' COLO W/GR
         @5,0 SAY 'อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ' COLO W/GR
         FECALTA=DTOC(DATE())
         Y=6
         TOTAL=0
         FOR I=1 TO (X-1)
            COD=AATT1[I]
            USE MEDICINA NOUPDATE
            SET ORDE TO 1
            SEEK COD
            @Y,0 SAY''+COD+' '+SUBS(NOM_COMER,1,30)+' '+STR(AATT2[I],6,2)+' '+STR((AATT3[I]*AATT2[I]),10,2)+' '+(AATT4[I])+' '+COD_SES
            TOTAL=TOTAL+(AATT3[I]*AATT2[I])
            Y=Y+1
            IF I=(X-1)
               @20,20 SAY 'TOTAL :> '+STR(TOTAL,12,2)
               WAIT WIND '[ESC] SALIR     [F8] IMPRIMIR' NOWA
               ON KEY LABEL F8 DO IMPRMEDI
               READ
               ON KEY LABEL F8
            ENDIF   
            IF Y=22
               @22,20 SAY 'Presione <ENTER> para continuar....'
               WAIT''
               Y=6
               @Y,0 CLEA
            ENDIF   
         ENDFOR   
      ENDIF   
   ENDIF      
ENDDO   
ON KEY LABEL F1
ON KEY LABEL F10
CLOSE ALL
DEAC WIND INGRESO
DEAC WIND TITULO
DEAC WIND TODO
DEAC WIND AYUDAS
RETURN



PROCEDURE IMPRATEN
Y=7
USE SERVICIO
SET ORDE TO 1
SEEK SERV
NOMSERV=SUBS(NOMBRE,1,20)
SELE B
   USE COLEGIOS NOUPDATE
   SET ORDE TO 1
SELE A
   USE ATENCION NOUPDATE
   SET ORDE TO 1
IF PRIN()
   SET DEVI TO PRIN
   @0,16 SAY 'ATENCIONES DE PACIENTES-SEGURO MATERNO INFANTIL'
   @0,16 SAY '_______________________________________________'
   @2,0 SAY 'REGISTRO '+STR(REGRO,8)
   @2,22 SAY 'HISTORIA '+STR(HISTO,8)
   @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
   @3,0  SAY 'NOMBRE '+NOMPAC
   *SELE B
   *SEEK EDUC
   *@3,40 SAY 'CENTRO EDUC '+SUBS(NOMBRE,1,25)
   IF TIPO='A'         
      @4,0 SAY '** PACIENTE AMBULATORIO **'
     ELSE
      @4,0 SAY '** PACIENTE HOSPITALIZADO **'
      @4,40 SAY 'SERVICIO '+NOMSERV
   ENDIF
   @5,0 SAY 'CODIGO           DESCRIPCION            CANTIDAD    PRECIO(SIN IGV)   FECHA'
   @6,0 SAY '*****************************************************************************'
   TOTAL=0
   FOR I=1 TO (X-1)
       COD=AATT1[I]
       SELE A
       SEEK COD
       @Y,0 SAY''+STR(COD,6)+'  '+SUBS(NOMBRE,1,30)+'         '+STR(AATT2[I],1)+'    '+STR((AATT3[I]*AATT2[I]),12,2)+'   '+AATT4[I]
       TOTAL=TOTAL+(AATT3[I]*AATT2[I])
       Y=Y+1
       IF Y=56 OR I=(X-1)
          IF I=(X-1)
             @Y+2,40 SAY ' TOTAL :> '+STR(TOTAL,12,2)+' '
             EJECT
            ELSE
             EJECT
             @0,16 SAY 'ATENCIONES DE PACIENTES-SEGURO MATERNO INFANTIL'
             @0,16 SAY '_______________________________________________'
             @2,0 SAY 'REGISTRO '+STR(REGRO,8)
             @2,22 SAY 'HISTORIA '+STR(HISTO,8)
             @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
             @3,43 SAY 'SERVICIO '+NOMSERV
             @3,0  SAY 'NOMBRE '+NOMPAC
             *USE COLEGIOS NOUPDATE
             *SET ORDE TO 1
             *SEEK EDUC
             *@3,40 SAY 'CENTRO EDUC '+SUBS(NOMBRE,1,25)
             IF TIPO='A'         
                @4,0 SAY '** PACIENTE AMBULATORIO **' COLO W/GR*
               ELSE
                @4,0 SAY '** PACIENTE HOSPITALIZADO **'
                @4,40 SAY 'SERVICIO '+NOMSERV
             ENDIF
             @5,0 SAY 'CODIGO           DESCRIPCION            CANTIDAD    PRECIO(SIN IGV)   FECHA'
             @6,0 SAY '*****************************************************************************'
             Y=7
          ENDIF
       ENDIF
   ENDFOR
   SET DEVI TO SCRE
ENDIF
RETURN


PROCEDURE IMPRMEDI
Y=7
USE SERVICIO
SET ORDE TO 1
SEEK SERV
NOMSERV=SUBS(NOMBRE,1,20)
SELE B
   USE COLEGIOS NOUPDATE
   SET ORDE TO 1
SELE A
   USE MEDICINAS NOUPDATE
   SET ORDE TO 1
IF PRIN()
   SET DEVI TO PRIN
   @0,21 SAY 'MEDICINAS  DE PACIENTES-SEGURO MATERNO INFANTIL'
   @0,21 SAY '_______________________________________________'
   @2,0 SAY 'REGISTRO '+STR(REGRO,8)
   @2,22 SAY 'HISTORIA '+STR(HISTO,8)
   @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
   @3,0  SAY 'NOMBRE '+NOMPAC
   *SELE B
   *SEEK EDUC
   *@3,40 SAY 'CENTRO EDUC '+SUBS(NOMBRE,1,25)
   IF TIPO='A'         
      @4,0 SAY '** PACIENTE AMBULATORIO **'
     ELSE
      @4,0 SAY '** PACIENTE HOSPITALIZADO **'
      @4,40 SAY 'SERVICIO '+NOMSERV
   ENDIF
   @5,0 SAY 'CODIGO           DESCRIPCION            CANTIDAD    PRECIO(SIN IGV)   FECHA    COD-SES'
   @6,0 SAY '****************************************************************************************'
   TOTAL=0
   FOR I=1 TO (X-1)
       COD=AATT1[I]
       SELE A
       SEEK COD
       @Y,1 SAY''+COD+'  '+SUBS(NOM_COMER,1,30)+'   '+STR(AATT2[I],6,2)+' '+STR((AATT3[I]*AATT2[I]),12,2)+'   '+(AATT4[I])+' '+COD_SES
       TOTAL=TOTAL+(AATT3[I]*AATT2[I])
       Y=Y+1
       IF Y=56 OR I=(X-1)
          IF I=(X-1)
             @Y+2,40 SAY ' TOTAL :> '+STR(TOTAL,12,2)+' '
             EJECT
            ELSE
             EJECT
             @0,21 SAY 'MEDICINAS  DE PACIENTES-SEGURO MATERNO INFANTIL'
             @0,21 SAY '_______________________________________________'
             @2,0 SAY 'REGISTRO '+STR(REGRO,8)
             @2,22 SAY 'HISTORIA '+STR(HISTO,8)
             @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
             @3,0  SAY 'NOMBRE '+NOMPAC
             *SELE B
             *SEEK EDUC
             *@3,40 SAY 'CENTRO EDUC '+SUBS(NOMBRE,1,25)
             IF TIPO='A'         
                @4,0 SAY '** PACIENTE AMBULATORIO **' COLO W/GR*
               ELSE
                @4,0 SAY '** PACIENTE HOSPITALIZADO **'
                @4,40 SAY 'SERVICIO '+NOMSERV
             ENDIF
             @5,0 SAY 'CODIGO           DESCRIPCION            CANTIDAD    PRECIO(SIN IGV)   FECHA    COD-SES'
             @6,0 SAY '****************************************************************************************'
             Y=7
          ENDIF
       ENDIF
   ENDFOR
   SET DEVI TO SCRE
ENDIF
RETURN


PROCEDURE EXISTE
PARAMETER A
USE PACISSMI NOUPDATE
SET ORDE TO 1
SEEK A
IF FOUND()
   SIGA=1
  ELSE
   SIGA=0 
ENDIF
RETURN




PROCEDURE MOSTRAR
PARAMETER A
IF A='REGRO'
   USE PACISSMI NOUPDATE
   SET ORDE TO 1
   DEFI POPU AXAX PROM FIEL STR(CUENTA_C,8)+'  '+NOMBRE+'  '+DTOC(FECHA_INGR)+'  '+DTOC(FECHA_ALTA)+'  '+STR(CENTRO_ED,3)+'    '+TIPO TITLE 'CTA CTEฤฤฤฤฤฤฤฤฤN  O  M  B  R  EฤฤฤฤฤฤฤฤF_INGRESOฤฤฤF_ALTAฤฤฤC_EDฤTIPO' FOOTER '<,,PgUp,PgDn> BUSCAR        <ENTER> SELECCIONAR' COLO SCHE 8 SCROL
   ON SELECTION POPU AXAX DEAC POPUP AXAX
   ACTI POPU AXAX
   REGRO=CUENTA_C
ENDIF
RETURN


