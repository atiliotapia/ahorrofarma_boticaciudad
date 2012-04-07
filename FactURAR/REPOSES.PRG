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
USE PACISESS NOUPDATE
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
      @0,17 SAY 'ATENCIONES PACIENTES SEGURO INTEGRAL SALUD' COLO B/W*
      TIPO=' '
      CONF=' '
      NOMPAC=SPACE(30)
      FECALTA=SPACE(8)
      FECINGR=SPACE(8)
      A=REGRO
      USE PACISESS NOUPDATE
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
         *EDUC=CENTRO_ED         
         NOMPAC=NOMBRE
         HISTO=HISTORIA
         TPTP=TIPO
         VIAD=VIA_ADM
         PLNN=PLAN
         IF TIPO='A'         
            @3,0 SAY '** PACIENTE AMBULATORIO **' COLO W/GR*
           ELSE
            @3,0 SAY '** PACIENTE HOSPITALIZADO **' COLO W/GR*
            @3,40 SAY 'SERVICIO' COLO W/GR
         ENDIF
         USE SERVICIO NOUPDATE
         SET ORDE TO 1
         SEEK SERV
         NOMSERV=SUBS(NOMBRE,1,20)
         @3,49 SAY +NOMSERV
         @4,0 SAY 'CODIGO           DESCRIPCION            CANTIDAD    PRECIO(SIN IGV)   FECHA' COLO W/GR
         @5,0 SAY 'อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ' COLO W/GR
         X=1
         USE ATENSESS NOUPDATE
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
               WAIT WIND '[ESC] SALIR     [F8] IMPRIMIR     [F12] IMPRIME CONSOLIDADO' NOWA
               ON KEY LABEL F8 DO IMPRATEN
               ON KEY LABEL F12 DO IMPRATCONS
               READ
               ON KEY LABEL F12
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
SELE A
     USE PACISESS ALIAS PACISESS NOUPDATE
     SET ORDE TO CUENTA_C
SELE B
     USE MEDISESS ALIAS MEDISESS NOUPDATE
     SET ORDE TO CUENTA_C
SELE C
     USE SERVICIO ALIAS SERVICIO NOUPDATE
     SET ORDE TO CODIGO
SELE D
     USE MEDICINA ALIAS MEDICINA NOUPDATE
     SET ORDE TO CODIGO
SELE A
GO BOTTOM
REGRO=CUENTA_C
ON KEY LABEL F10 DO MOSTRAR WITH VARREAD() 
ON KEY LABEL F1 DO AYUDAR
DO WHILE .T.
   *CLOS ALL
   SIGA=0
   DEAC WIND TODO
   DEAC WIND AYUDAS
   ACTI WIND AYUDAS
   CLEA
   @0,2 SAY '<0> + <ENTER> SALIR' COLO I
   @0,37 SAY '<F10> LISTADO DE PACIENTES' COLO I
   ACTI WIND PREPARA
   @1,2 SAY 'CUENTA CORRIENTE:> 'GET REGRO PICT '99999999'  ERROR 'VUELVA A INGRESAR' 
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
      *DECLARE AATT1[400]
      *DECLARE AATT2[400]
      *DECLARE AATT3[400]              
      *DECLARE AATT4[400]              
      *DECLARE AATT5[400]              
      SET SAFE OFF
      SELECT B.MEDICINA1,B.CANTIDAD1,B.PREC_MED1,B.FECHA,B.HORA,D.NOM_COMER,D.FORMA;
       FROM MEDISESS B, MEDICINA D;
       WHERE B.MEDICINA1 = D.CODIGO AND B.CUENTA_C=REGRO;
       ORDER BY B.FECHA,B.HORA;
       INTO TABLE C:\SIGEP\TEMP\TPMDSES
      SET SAFE ON
      SELE TPMDSES
      IF RECC()>0
         SET MESS WIND TODO
         ACTI WIND TODO
         @0,19 SAY 'MEDICINAS PACIENTES SEGURO INTEGRAL SALUD' COLO R/W+
         TIPO=' '
         CONF=' '
         NOMPAC=SPACE(30)
         FECALTA=SPACE(8)
         FECINGR=SPACE(8)
         A=REGRO
         *USE PACISESS NOUPDATE
         SELE PACISESS
         SET ORDE TO CUENTA_C
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
            NOMPAC=NOMBRE
            HISTO=HISTORIA
            TPTP=TIPO
            VIAD=VIA_ADM
            PLNN=PLAN
            IF TIPO='A'         
               @3,0 SAY '** PACIENTE AMBULATORIO **' COLO W/GR*
              ELSE
               @3,0 SAY '** PACIENTE HOSPITALIZADO **' COLO W/GR*
               @3,40 SAY 'SERVICIO' COLO W/GR
            ENDIF
         
            SELE SERVICIO
            SET ORDE TO CODIGO
            SEEK SERV
            NOMSERV=SUBS(NOMBRE,1,20)
            @3,49 SAY +NOMSERV
            FECALTA=DTOC(DATE())
            X=1
            @4,0 SAY ' CODIGO          MEDICAMENTO           CANTID     PRECIO  FECHA     COD-SES' COLO W/GR
            @5,0 SAY 'อออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออออ' COLO W/GR
            FECALTA=DTOC(DATE())
            Y=6
            TOTAL=0
            SELE TPMDSES
            GO TOP
            DO WHILE !EOF()
               @Y,0 SAY''+MEDICINA1+' '+SUBS(NOM_COMER,1,30)+' '+STR(CANTIDAD1,6,2)+' '+STR((CANTIDAD1*PREC_MED1),10,2)+' '+DTOC(FECHA)
               *@Y,0 SAY''+COD+' '+SUBS(NOM_COMER,1,30)+' '+STR(AATT2[I],6,2)+' '+STR((AATT3[I]*AATT2[I]),10,2)+' '+(AATT4[I])
               TOTAL=TOTAL+(CANTIDAD1*PREC_MED1)
               Y=Y+1
               IF Y=22
                  @22,20 SAY 'Presione <ENTER> para continuar....'
                  WAIT''
                  Y=6
                  @Y,0 CLEA
               ENDIF   
               SKIP
            ENDDO
            IF EOF()
               @21,20 SAY 'TOTAL :> '+STR(TOTAL,12,2)
               WAIT WIND '[ESC] SALIR     [F8] IMPRIMIR     [F12] IMPRIME CONSOLIDADO' NOWA
               ON KEY LABEL F8 DO IMPRMEDI
               ON KEY LABEL F12 DO IMPRMDCONS
               READ
               ON KEY LABEL F12
               ON KEY LABEL F8
            ENDIF   
         ENDIF   
        ELSE
         WAIT WIND "CUENTA NO REGISTRA MEDICINAS" NOWA
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
SELE B
   USE COLEGIOS NOUPDATE
   SET ORDE TO 1
SELE A
   USE ATENCION NOUPDATE
   SET ORDE TO 1
IF PRIN()
   SET DEVI TO PRIN
   @0,15 SAY 'ATENCIONES DE PACIENTES-SEGURO INTEGRAL DE SALUD'
   @0,15 SAY '________________________________________________'
   @2,0 SAY 'REGISTRO '+STR(REGRO,8)
   @2,22 SAY 'HISTORIA '+STR(HISTO,8)
   @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
   @3,43 SAY 'SERVICIO '+NOMSERV
   @3,0  SAY 'NOMBRE '+NOMPAC
   IF TIPO='A'         
      @4,0 SAY '** PACIENTE AMBULATORIO **'
     ELSE
      @4,0 SAY '** PACIENTE HOSPITALIZADO **'
   ENDIF
   @4,40 SAY 'SERVICIO '+NOMSERV
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
             @0,15 SAY 'ATENCIONES DE PACIENTES-SEGURO INTEGRAL DE SALUD'
             @0,15 SAY '________________________________________________'
             @2,0 SAY 'REGISTRO '+STR(REGRO,8)
             @2,22 SAY 'HISTORIA '+STR(HISTO,8)
             @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
             @3,43 SAY 'SERVICIO '+NOMSERV
             @3,0  SAY 'NOMBRE '+NOMPAC
             IF TIPO='A'         
                @4,0 SAY '** PACIENTE AMBULATORIO **' COLO W/GR*
               ELSE
                @4,0 SAY '** PACIENTE HOSPITALIZADO **'
             ENDIF
             @5,0 SAY 'CODIGO           DESCRIPCION            CANTIDAD    PRECIO(SIN IGV)   FECHA'
             @6,0 SAY '*****************************************************************************'
             Y=7
          ENDIF
       ENDIF
   ENDFOR
   SET DEVI TO SCRE
   ****PARA QUE NO CORRA********
   YY=1
   T=0
   *****************************
ENDIF
RETURN



PROCEDURE IMPRATCONS
Y=7
SELE B
   USE ATENSESS ALIAS ATENSESS
SELE C
   USE PACISESS
   SET ORDE TO CUENTA_C

SET SAFE OFF
SELECT ATENSESS.ATENCION1, SUM(ATENSESS.CANTIDAD1),;
  SUM(ATENSESS.CANTIDAD1*ATENSESS.PREC_ATE1);
 FROM ATENSESS;
 WHERE ATENSESS.CUENTA_C = REGRO;
 GROUP BY ATENSESS.ATENCION1;
 ORDER BY ATENSESS.ATENCION1;
 INTO TABLE C:\SIGEP\TEMP\TMPSES01.DBF
SET SAFE ON
CLOS ALL
SELE A
   USE ATENCION NOUPDATE
   SET ORDE TO 1
SELE D      
   USE C:\SIGEP\TEMP\TMPSES01
   SET RELA TO ATENCION1 INTO A
IF PRIN()
   SET DEVI TO PRIN
   @0,15 SAY 'ATENCIONES DE PACIENTES-SEGURO INTEGRAL DE SALUD'
   @0,15 SAY '________________________________________________'
   @2,0 SAY 'REGISTRO '+STR(REGRO,8)
   @2,22 SAY 'HISTORIA '+STR(HISTO,8)
   @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
   @3,0  SAY 'NOMBRE '+NOMPAC
   @3,40 SAY 'PLAN '+PLNN
   DO CASE
      CASE TPTP="A"
           IF VIAD="C"
              @4,0 SAY '** PACIENTE AMB. C.EXT. **'
             ELSE
              @4,0 SAY '** PACIENTE AMB. EMERG. **'
           ENDIF
      CASE TPTP="H"
           @4,0 SAY '** HOSPITALIZADO NORMAL **'
      CASE TPTP="G"
           @4,0 SAY '** HOSPITALIZADO CIRUGIA**'
      CASE TPTP="U"
           @4,0 SAY '** HOSPITALIZADO U.C.I. **'
      CASE TPTP="O"
           @4,0 SAY '** PACIENTE ODONTOLOGIA **'
   ENDCASE
   @4,40 SAY 'SERVICIO '+NOMSERV
   @5,0 SAY 'CODIGO           DESCRIPCION            CANTIDAD    PRECIO UNIT.      TOTAL'
   @6,0 SAY '*****************************************************************************'
   TOTAL=0
   SELE D
   GO TOP
   DO WHILE !EOF()
       @Y,0 SAY''+STR(ATENCION1,6)+'  '+SUBS(A->NOMBRE,1,30)+'         '+STR(SUM_CANTID,3)+'  '+STR((SUM_EXP_3/SUM_CANTID),10,2)+'  '+STR((SUM_EXP_3),12,2)
       TOTAL=TOTAL+SUM_EXP_3
       Y=Y+1
       SKIP
       IF Y=56 OR EOF()
          IF EOF()
             @Y+2,40 SAY ' TOTAL :> '+STR(TOTAL,12,2)+' '
             EJECT
            ELSE
             EJECT
             @0,15 SAY 'ATENCIONES DE PACIENTES-SEGURO INTEGRAL DE SALUD'
             @0,15 SAY '________________________________________________'
             @2,0 SAY 'REGISTRO '+STR(REGRO,8)
             @2,22 SAY 'HISTORIA '+STR(HISTO,8)
             @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
             @3,43 SAY 'SERVICIO '+NOMSERV
             @3,0  SAY 'NOMBRE '+NOMPAC
             @3,40 SAY 'PLAN '+PLNN
             DO CASE
                CASE TPTP="A"
                     IF VIAD="C"
                        @4,0 SAY '** PACIENTE AMB. C.EXT. **'
                       ELSE
                        @4,0 SAY '** PACIENTE AMB. EMERG. **'
                     ENDIF
                CASE TPTP="H"
                     @4,0 SAY '** HOSPITALIZADO NORMAL **'
                CASE TPTP="G"
                     @4,0 SAY '** HOSPITALIZADO CIRUGIA**'
                CASE TPTP="U"
                     @4,0 SAY '** HOSPITALIZADO U.C.I. **'
                CASE TPTP="O"
                     @4,0 SAY '** PACIENTE ODONTOLOGIA **'
             ENDCASE
             @4,40 SAY 'SERVICIO '+NOMSERV
             @5,0 SAY 'CODIGO           DESCRIPCION            CANTIDAD    PRECIO UNIT.      TOTAL'
             @6,0 SAY '*****************************************************************************'
             Y=7
          ENDIF
       ENDIF
   ENDDO
   SET DEVI TO SCRE
   ****PARA QUE NO CORRA********
   YY=1
   T=0
   *****************************
ENDIF
RETURN






PROCEDURE IMPRMEDI
Y=7
*SELE B
*   USE COLEGIOS NOUPDATE
*   SET ORDE TO 1
*SELE A
*   USE MEDICINAS NOUPDATE
*   SET ORDE TO 1
IF PRIN()
   SET DEVI TO PRIN
   @0,20 SAY 'MEDICINAS  DE PACIENTES-SEGURO INTEGRAL DE SALUD'
   @0,20 SAY '________________________________________________'
   @2,0 SAY 'REGISTRO '+STR(REGRO,8)
   @2,22 SAY 'HISTORIA '+STR(HISTO,8)
   @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
   @3,0  SAY 'NOMBRE '+NOMPAC
   IF TIPO='A'         
      @4,0 SAY '** PACIENTE AMBULATORIO **'
     ELSE
      @4,0 SAY '** PACIENTE HOSPITALIZADO **'
   ENDIF
   @4,40 SAY 'SERVICIO '+NOMSERV
   @5,0 SAY ' CODIGO           DESCRIPCION                CANTIDAD        PRECIO     FECHA     HORA'
   @6,0 SAY '****************************************************************************************'
   TOTAL=0
   SELE TPMDSES
   GO TOP
   DO WHILE !EOF()
      @Y,1 SAY''+MEDICINA1+'  '+SUBS(NOM_COMER,1,30)+' '+SUBS(FORMA,1,4)+'   '+STR(CANTIDAD1,6,2)+' '+STR((CANTIDAD1*PREC_MED1),12,2)+'  '+DTOC(FECHA)+' '+HORA
      *@Y,1 SAY''+COD+'  '+SUBS(NOM_COMER,1,30)+' '+SUBS(FORMA,1,4)+'   '+STR(AATT2[I],6,2)+' '+STR((AATT3[I]*AATT2[I]),12,2)+'  '+(AATT4[I])+' '+AATT5[I]
      TOTAL=TOTAL+(CANTIDAD1*PREC_MED1)
      Y=Y+1
      IF Y=56
            EJECT
            @0,20 SAY 'MEDICINAS  DE PACIENTES-SEGURO INTEGRAL DE SALUD'
            @0,20 SAY '________________________________________________'
            @2,0 SAY 'REGISTRO '+STR(REGRO,8)
            @2,22 SAY 'HISTORIA '+STR(HISTO,8)
            @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
            @3,0  SAY 'NOMBRE '+NOMPAC
            IF TIPO='A'         
               @4,0 SAY '** PACIENTE AMBULATORIO **' COLO W/GR*
              ELSE
               @4,0 SAY '** PACIENTE HOSPITALIZADO **'
            ENDIF
            @4,40 SAY 'SERVICIO '+NOMSERV
            @5,0 SAY ' CODIGO           DESCRIPCION                CANTIDAD        PRECIO     FECHA     HORA'
            @6,0 SAY '****************************************************************************************'
            Y=7
      ENDIF
      SKIP
   ENDDO
   @Y+2,40 SAY ' TOTAL :> '+STR(TOTAL,12,2)+' '
   EJECT
   SET DEVI TO SCRE
   ****PARA QUE NO CORRA********
   YY=1
   T=0
   *****************************
ENDIF
RETURN



PROCEDURE IMPRMDCONS
Y=7
*SELE B
*   USE MEDISESS ALIAS MEDISESS
*SELE C
*   USE PACISESS
*   SET ORDE TO CUENTA_C

SET SAFE OFF
SELECT MEDISESS.MEDICINA1, SUM(MEDISESS.CANTIDAD1),;
  SUM(MEDISESS.CANTIDAD1*MEDISESS.PREC_MED1);
 FROM MEDISESS;
 WHERE MEDISESS.CUENTA_C = REGRO;
 GROUP BY MEDISESS.MEDICINA1;
 ORDER BY MEDISESS.MEDICINA1;
 INTO TABLE C:\SIGEP\TEMP\TMPSES02.DBF
SET SAFE ON
*CLOS ALL
*SELE A
*   USE MEDICINA NOUPDATE
*   SET ORDE TO 1
*SELE D      
*   USE C:\SIGEP\TEMP\TMPSES02
*   SET RELA TO MEDICINA1 INTO A
SELE TMPSES02
SET RELA TO MEDICINA1 INTO D
IF PRIN()
   SET DEVI TO PRIN
   @0,20 SAY 'MEDICINAS  DE PACIENTES-SEGURO INTEGRAL DE SALUD'
   @0,20 SAY '________________________________________________'
   @2,0 SAY 'REGISTRO '+STR(REGRO,8)
   @2,22 SAY 'HISTORIA '+STR(HISTO,8)
   @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
   @3,0  SAY 'NOMBRE '+NOMPAC
   @3,40 SAY 'PLAN '+PLNN
   DO CASE
      CASE TPTP="A"
           IF VIAD="C"
              @4,0 SAY '** PACIENTE AMB. C.EXT. **'
             ELSE
              @4,0 SAY '** PACIENTE AMB. EMERG. **'
           ENDIF
      CASE TPTP="H"
           @4,0 SAY '** HOSPITALIZADO NORMAL **'
      CASE TPTP="G"
           @4,0 SAY '** HOSPITALIZADO CIRUGIA**'
      CASE TPTP="U"
           @4,0 SAY '** HOSPITALIZADO U.C.I. **'
      CASE TPTP="O"
           @4,0 SAY '** PACIENTE ODONTOLOGIA **'
   ENDCASE
   @4,40 SAY 'SERVICIO '+NOMSERV
   @5,0 SAY 'CODIGO           DESCRIPCION                 CANTIDAD    PRECIO UNIT.      TOTAL'
   @6,0 SAY '****************************************************************************************'
   TOTAL=0
   SELE TMPSES02
   GO TOP
   DO WHILE !EOF()
      @Y,1 SAY''+MEDICINA1+'  '+SUBS(D->NOM_COMER,1,30)+' '+SUBS(D->FORMA,1,4)+'   '+STR(SUM_CANTID,7,2)+' '+STR((SUM_EXP_3/SUM_CANTID),10,2)+'  '+STR((SUM_EXP_3),12,2)
      TOTAL=TOTAL+SUM_EXP_3
      Y=Y+1
      SKIP
      IF Y=56 OR EOF()
         IF EOF()
             @Y+2,40 SAY ' TOTAL :> '+STR(TOTAL,12,2)+' '
             EJECT
            ELSE
             EJECT
             @0,20 SAY 'MEDICINAS  DE PACIENTES-SEGURO INTEGRAL DE SALUD'
             @0,20 SAY '________________________________________________'
             @2,0 SAY 'REGISTRO '+STR(REGRO,8)
             @2,22 SAY 'HISTORIA '+STR(HISTO,8)
             @2,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
             @3,0  SAY 'NOMBRE '+NOMPAC
             @3,40 SAY 'PLAN '+PLNN
             DO CASE
                CASE TPTP="A"
                     IF VIAD="C"
                        @4,0 SAY '** PACIENTE AMB. C.EXT. **'
                       ELSE
                        @4,0 SAY '** PACIENTE AMB. EMERG. **'
                     ENDIF
                CASE TPTP="H"
                     @4,0 SAY '** HOSPITALIZADO NORMAL **'
                CASE TPTP="G"
                     @4,0 SAY '** HOSPITALIZADO CIRUGIA**'
                CASE TPTP="U"
                     @4,0 SAY '** HOSPITALIZADO U.C.I. **'
                CASE TPTP="O"
                     @4,0 SAY '** PACIENTE ODONTOLOGIA **'
             ENDCASE
             @4,40 SAY 'SERVICIO '+NOMSERV
             @5,0 SAY 'CODIGO           DESCRIPCION                 CANTIDAD    PRECIO UNIT.      TOTAL'
             @6,0 SAY '****************************************************************************************'
             Y=7
         ENDIF
      ENDIF
   ENDDO
   SET DEVI TO SCRE
   ****PARA QUE NO CORRA********
   YY=1
   T=0
   *****************************
ENDIF
RETURN



PROCEDURE EXISTE
PARAMETER A
IF !USED("PACISESS")
   USE PACISESS NOUPDATE
  ELSE
   SELE PACISESS
ENDIF
SET ORDE TO CUENTA_C
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
   USE PACISESS NOUPDATE
   SET ORDE TO 1
   DEFI POPU AXAX PROM FIEL STR(CUENTA_C,8)+'  '+NOMBRE+'  '+DTOC(FECHA_INGR)+'  '+DTOC(FECHA_ALTA)+'  '+STR(CENTRO_ED,3)+'    '+TIPO TITLE 'CTA CTEฤฤฤฤฤฤฤฤฤN  O  M  B  R  EฤฤฤฤฤฤฤฤF_INGRESOฤฤฤF_ALTAฤฤฤC_EDฤTIPO' FOOTER '<,,PgUp,PgDn> BUSCAR        <ENTER> SELECCIONAR' COLO SCHE 8 SCROL
   ON SELECTION POPU AXAX DEAC POPUP AXAX
   ACTI POPU AXAX
   REGRO=CUENTA_C
ENDIF
RETURN


