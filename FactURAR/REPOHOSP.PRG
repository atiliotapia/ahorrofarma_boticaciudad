PROCEDURE REPOATEN
DEFI WIND TODO FROM 0,0 TO 24,79;
     CLOSE FLOAT GROW SHADOW COLOR BG/RB
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
USE PACIENTE
SET ORDE TO 1
* INDE PACI
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
   SET COLO TO RB/GR+ 
   CLEA
   SET COLO TO I
   @0,2 SAY '<0> + <ENTER> SALIR'
   @0,37 SAY '<F10> LISTADO DE PACIENTES'
   ACTI WIND PREPARA
   SET COLO TO WR/B
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
      SET COLO TO RB/GR+ 
      SET MESS WIND TODO
      ACTI WIND TODO
      SET COLO TO B/W*
      @0,20 SAY 'ATENCIONES  DE PACIENTES HOSPITALIZADOS'
      TIPO=' '
      CONF=' '
      NOMPAC=SPACE(30)
      FECALTA=SPACE(8)
      FECINGR=SPACE(8)
      A=REGRO
      SELE A
           USE PACIENTE ALIAS PACIENTE NOUPDATE
           SET ORDE TO CUENTA_C
      SELE B
           USE ATENHOSP ALIAS ATENHOSP NOUPDATE
           SET ORDE TO CUENTA_C
      SELE C
           USE SERVICIO ALIAS SERVICIO NOUPDATE
           SET ORDE TO CODIGO
      SELE D
           USE ATENCION ALIAS ATENCION NOUPDATE
           SET ORDE TO CODIGO
      SELE A
      SEEK A
      IF FOUND()
         SET COLO TO WR/B
         @1,0 SAY 'CTA. CTE.'
         @1,22 SAY 'HISTORIA'
         @1,43 SAY 'SERVICIO'
         @2,0  SAY 'NOMBRE'
         @2,45 SAY 'FECHA INGRESO'
         @3,0 SAY 'GARANTIA'
         SET COLO TO W+/BG
         @1,10 SAY ''+STR(REGRO,8)
         @1,31 SAY ''+STR(HISTORIA,8)
         @2,7 SAY ''+NOMBRE
         @2,59 SAY ''+DTOC(FECHA_INGR)
         @3,9 SAY ''+STR(GARANTIA,12,2)
         NOMPAC=NOMBRE
         HISTO=HISTORIA
         FECINGR=FECHA_INGR
         GARAN=GARANTIA
         PAG=1
         @3,70 SAY 'P g. '+STR(PAG,3)
         @4,0 SAY '  CODIGO             DESCRIPCION              CANTID       M O N T O   FECHA'
         @5,0 SAY 'ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ'
         FECINGR=FECHA_INGR
         SERV=SERVICIO
         SELE SERVICIO
         SET ORDE TO 1
         SEEK SERV
         @1,52 SAY ''+SUBS(NOMBRE,1,20)
         SET COLO TO WR/B
         Y=6
         TOTAL=0
         SELE ATENHOSP
         SEEK A
         DO WHILE !EOF()
            IF CUENTA_C=A
               SET RELA TO ATENCION1 INTO D
               @Y,2 SAY''+STR(ATENCION1,6)+'    '+SUBS(D->NOMBRE,1,30)+'       '+STR(CANTIDAD1,1)+'    '+STR((CANTIDAD1*PREC_ATE1),12,2)+'  '+DTOC(FECHA)
               TOTAL=TOTAL+(CANTIDAD1*PREC_ATE1)
               Y=Y+1
               IF Y=22
                  @22,20 SAY 'Presione <ENTER> para continuar....'
                  WAIT''
                  Y=6
                  @Y,0 CLEA
                  PAG=PAG+1
                  @3,70 SAY 'P g. '+STR(PAG,3)
               ENDIF   
            ENDIF
            SKIP
            IF EOF() OR CUENTA_C!=A
               SET COLO TO GR+
               @22,40 SAY ' TOTAL :> '+STR(TOTAL,12,2)+' '
               WAIT WIND '[ESC] SALIR     [F8] IMPRIMIR' NOWA
               ON KEY LABEL F8 DO IMPRATEN
               READ
               ON KEY LABEL F8
               EXIT
            ENDIF   
         ENDDO
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





PROCEDURE REPOMEDI
DEFI WIND TODO FROM 0,0 TO 24,79;
     CLOSE FLOAT GROW SHADOW COLOR BG/RB
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
USE PACIENTE
SET ORDE TO 1
* INDE PACI
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
   SET COLO TO RB/GR+ 
   CLEA
   SET COLO TO I
   @0,2 SAY '<0> + <ENTER> SALIR'
   @0,37 SAY '<F10> LISTADO DE PACIENTES'
   ACTI WIND PREPARA
   SET COLO TO WR/B
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
      *SET COLO TO RB/GR+ 
      SET MESS WIND TODO
      ACTI WIND TODO
      SET COLO TO R/W+
      @0,20 SAY ' MEDICINAS  DE PACIENTES HOSPITALIZADOS '
      TIPO=' '
      CONF=' '
      NOMPAC=SPACE(30)
      FECALTA=SPACE(8)
      FECINGR=SPACE(8)
      A=REGRO
      SELE A
           USE PACIENTE ALIAS PACIENTE NOUPDATE
           SET ORDE TO CUENTA_C
      SELE B
           USE MEDIHOSP ALIAS MEDIHOSP NOUPDATE
           SET ORDE TO CUENTA_C
      SELE C
           USE SERVICIO ALIAS SERVICIO NOUPDATE
           SET ORDE TO CODIGO
      SELE D
           USE MEDICINA ALIAS MEDICINA NOUPDATE
           SET ORDE TO CODIGO
      SELE A
      SEEK A
      IF FOUND()
         SET COLO TO WR/B
         @1,0 SAY 'CTA. CTE.'
         @1,22 SAY 'HISTORIA'
         @1,43 SAY 'SERVICIO'
         @2,0  SAY 'NOMBRE'
         @2,45 SAY 'FECHA INGRESO'
         @3,0 SAY 'GARANTIA'
         SET COLO TO W+/BG
         @1,10 SAY ''+STR(REGRO,8)
         @1,31 SAY ''+STR(HISTORIA,8)
         @2,7 SAY ''+NOMBRE
         @2,59 SAY ''+DTOC(FECHA_INGR)
         @3,9 SAY ''+STR(GARANTIA,12,2)
         NOMPAC=NOMBRE
         HISTO=HISTORIA
         FECINGR=FECHA_INGR
         GARAN=GARANTIA
         PAG=1
         @3,70 SAY 'P g. '+STR(PAG,3)
         SET COLO TO GR+/BG
         @4,0 SAY 'CODIGO             MEDICAMENTO          FORMA    CANTID      MONTO     FECHA'
         @5,0 SAY 'ÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍÍ'
         FECINGR=FECHA_INGR
         SERV=SERVICIO
         SELE SERVICIO
         SEEK SERV
         @1,52 SAY ''+SUBS(NOMBRE,1,20)
         SET COLO TO WR/B
         Y=6
         TOTAL=0
         SELE MEDIHOSP
         SEEK A
         DO WHILE !EOF()
            IF CUENTA_C=A
               SET RELA TO MEDICINA1 INTO D
               @Y,0 SAY''+MEDICINA1+' '+SUBS(D->NOM_COMER,1,30)+'  '+SUBS(D->FORMA,1,6)+'   '+STR(CANTIDAD1,6,2)+''+STR((CANTIDAD1*PREC_MED1*(1+CONVENIO/100)),12,2)+' '+DTOC(FECHA)
               TOTAL=TOTAL+(CANTIDAD1*PREC_MED1*(1+CONVENIO/100))
               Y=Y+1
               IF Y=22
                  @22,20 SAY 'Presione <ENTER> para continuar....'
                  WAIT''
                  Y=6
                  @Y,0 CLEA
                  PAG=PAG+1
                  @3,70 SAY 'P g. '+STR(PAG,3)
               ENDIF   
            ENDIF
            SKIP
            IF EOF() OR CUENTA_C!=A
               SET COLO TO GR+
               @22,40 SAY ' TOTAL :> '+STR(TOTAL,12,2)+' '
               WAIT WIND '[ESC] SALIR     [F8] IMPRIMIR' NOWA
               ON KEY LABEL F8 DO IMPRMEDI
               READ
               ON KEY LABEL F8
               EXIT
            ENDIF   
         ENDDO
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
TOTAL=0
SELE SERVICIO
SET ORDE TO 1
SEEK SERV
NOMSERV=SUBS(NOMBRE,1,20)
SELE ATENCION
SET ORDE TO 1
IF PRIN()
   SET DEVI TO PRIN
   @0,20 SAY ' ATENCIONES DE PACIENTES HOSPITALIZADOS'
   @0,20 SAY ' ______________________________________ '
   @2,0 SAY 'CTA. CTE. '+STR(REGRO,8)
   @2,22 SAY 'HISTORIA '+STR(HISTO,8)
   @2,43 SAY 'SERVICIO '+NOMSERV
   @3,0  SAY 'NOMBRE '+NOMPAC
   @3,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
   @4,0 SAY 'GARANTIA '+STR(GARAN,12,2)
   PAG=1
   @4,70 SAY 'P g. '+STR(PAG,3)
   @5,0 SAY '  CODIGO             DESCRIPCION              CANTID        MONTO      FECHA'
   @6,0 SAY '******************************************************************************'
   SELE ATENHOSP
   SET ORDE TO CUENTA_C
   SEEK A
   DO WHILE !EOF()
      IF CUENTA_C=A
         SET RELA TO ATENCION1 INTO D
         @Y,2 SAY''+STR(ATENCION1,6)+'    '+SUBS(D->NOMBRE,1,30)+'       '+STR(CANTIDAD1,1)+'    '+STR((CANTIDAD1*PREC_ATE1),12,2)+'  '+DTOC(FECHA)
         TOTAL=TOTAL+(CANTIDAD1*PREC_ATE1)
         Y=Y+1
         SKIP
         IF Y=56 OR EOF()
            IF EOF()
               @Y+2,40 SAY ' TOTAL :> '+STR(TOTAL,12,2)+' '
               EJECT
              ELSE
               EJECT
               @0,20 SAY ' ATENCIONES DE PACIENTES HOSPITALIZADOS'
               @0,20 SAY ' ______________________________________ '
               @2,0 SAY 'CTA. CTE. '+STR(REGRO,8)
               @2,22 SAY 'HISTORIA '+STR(HISTO,8)
               @2,43 SAY 'SERVICIO '+NOMSERV
               @3,0  SAY 'NOMBRE '+NOMPAC
               @3,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
               @4,0 SAY 'GARANTIA '+STR(GARAN,12,2)
               PAG=1
               @4,70 SAY 'P g. '+STR(PAG,3)
               @5,0 SAY '  CODIGO             DESCRIPCION              CANTID        MONTO      FECHA'
               @6,0 SAY '******************************************************************************'
               Y=7
               PAG=PAG+1
            ENDIF   
         ENDIF
        ELSE
         @Y+2,40 SAY ' TOTAL :> '+STR(TOTAL,12,2)+' '
         EJECT
         EXIT
      ENDIF   
   ENDDO
   *****
   YY=1
   T=0
   *****
   SET DEVI TO SCRE
ENDIF
RETURN



PROCEDURE IMPRMEDI
Y=7
TOTAL=0
SELE SERVICIO
SET ORDE TO 1
SEEK SERV
NOMSERV=SUBS(NOMBRE,1,20)
SELE MEDICINA
SET ORDE TO 1
IF PRIN()
   SET DEVI TO PRIN
   @0,20 SAY ' MEDICINAS  DE PACIENTES HOSPITALIZADOS'
   @0,20 SAY ' ______________________________________ '
   @2,0 SAY 'CTA. CTE. '+STR(REGRO,8)
   @2,22 SAY 'HISTORIA '+STR(HISTO,8)
   @2,43 SAY 'SERVICIO '+NOMSERV
   @3,0  SAY 'NOMBRE '+NOMPAC
   @3,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
   @4,0 SAY 'GARANTIA '+STR(GARAN,12,2)
   PAG=1
   @4,70 SAY 'P g. '+STR(PAG,3)
   @5,0 SAY 'CODIGO             MEDICAMENTO          FORMA    CANTID      MONTO     FECHA'
   @6,0 SAY '******************************************************************************'
   SELE MEDIHOSP
   SET ORDE TO CUENTA_C
   SEEK A
   DO WHILE !EOF()
      IF CUENTA_C=A
         SET RELA TO MEDICINA1 INTO D
         @Y,0 SAY''+MEDICINA1+' '+SUBS(D->NOM_COMER,1,30)+'  '+SUBS(D->FORMA,1,6)+'   '+STR(CANTIDAD1,6,2)+''+STR((CANTIDAD1*PREC_MED1*(1+CONVENIO/100)),12,2)+' '+DTOC(FECHA)+' '+HORA
         TOTAL=TOTAL+(CANTIDAD1*PREC_MED1*(1+CONVENIO/100))
         Y=Y+1
         SKIP
         IF Y=56 OR EOF()
            IF EOF()
               @Y+2,40 SAY ' TOTAL :> '+STR(TOTAL,12,2)+' '
               EJECT
              ELSE
               EJECT
               @0,20 SAY ' MEDICINAS  DE PACIENTES HOSPITALIZADOS'
               @0,20 SAY ' ______________________________________ '
               @2,0 SAY 'CTA. CTE. '+STR(REGRO,8)
               @2,22 SAY 'HISTORIA '+STR(HISTO,8)
               @2,43 SAY 'SERVICIO '+NOMSERV
               @3,0  SAY 'NOMBRE '+NOMPAC
               @3,45 SAY 'FECHA INGRESO '+DTOC(FECINGR)
               @4,0 SAY 'GARANTIA '+STR(GARAN,12,2)
               PAG=PAG+1
               @4,70 SAY 'P g. '+STR(PAG,3)
               @5,0 SAY 'CODIGO             MEDICAMENTO          FORMA    CANTID      MONTO     FECHA'
               @6,0 SAY '******************************************************************************'
               Y=7
               PAG=PAG+1
            ENDIF   
         ENDIF
        ELSE
         @Y+2,40 SAY ' TOTAL :> '+STR(TOTAL,12,2)+' '
         EJECT
         EXIT
      ENDIF   
   ENDDO
   SET DEVI TO SCRE
ENDIF
RETURN



PROCEDURE EXISTE
PARAMETER A
USE PACIENTE 
SET ORDE TO 1
*INDE PACI
SEEK A
IF FOUND()
   SIGA=1
  ELSE
   SIGA=0 
ENDIF
RETURN



PROCEDURE MOSTRAR
PARAMETER A
ON KEY LABEL F1
ON KEY LABEL F10
IF A='REGRO'
   USE PACIENTE 
   SET ORDE TO 1
   *INDE PACI
   DEFI POPU AXAX FROM 0,0 TO 20,65 PROM FIEL STR(CUENTA_C,8)+'  '+NOMBRE+'  '+DTOC(FECHA_INGR)+'  '+STR(SERVICIO,2)+'  '+DTOC(FECHA_ALTA) TITLE 'CTA CTEÄÄÄÄÄÄÄÄN  O  M  B  R  EÄÄÄÄÄÄÄÄF_INGRESOÄSERVÄÄF_ALTA' FOOTER '<,,PgUp,PgDn> BUSCAR        <ENTER> SELECCIONAR' COLO SCHE 8 SCROL
   ON SELECTION POPU AXAX DEAC POPUP AXAX
   ACTI POPU AXAX
   REGRO=CUENTA_C
ENDIF
ON KEY LABEL F1 DO AYUDAR
ON KEY LABEL F10 DO MOSTRAR WITH VARREAD() 
RETURN



PROCEDURE AYUDAR
ON KEY LABEL F1
ON KEY LABEL F10
ACTI WIND MOSTRAR
CLEA
@0,17 SAY '!!!  ERROR  !!!' 
@4,17 SAY 'NO SE ENCUENTRA'
@6,16 SAY 'FICHERO DE AYUDAS'
@8,20 SAY 'Presione cualquier tecla ...'
WAIT''
DEAC WIND MOSTRAR
ON KEY LABEL F10 DO MOSTRAR WITH VARREAD() 
ON KEY LABEL F1 DO AYUDAR
RETURN
