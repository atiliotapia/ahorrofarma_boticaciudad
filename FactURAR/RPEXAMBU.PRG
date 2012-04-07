SET ECHO OFF
SET TALK OFF
DEFI WIND PEDII FROM 9,18 TO 16,55 SHADOW
DEFI WIND CENSO FROM 1,0 TO 24,79 TITLE 'EXONERACIONES - PACIENTES AMBULATORIOS'
DEFI WIND TIPO FROM 9,25 TO 16,50 DOUBLE 
SET NEAR ON
FIN=DATE()
SELE A
     USE FACTURA NOUPDATE
     SET ORDE TO FECHA
SELE B
     USE ATENCTDO NOUPDATE
     SET ORDE TO REGISTRO
SELE C
     USE USUARIOS.LIB ALIAS USUARIOS
     SET ORDE TO CODIGO
SELE A
ACTI WIND PEDII
@0,19 SAY '[ dd/mm/aaaa ]'
@5,2 SAY '  Fechas iguales para un d¡a  '
@1,4 SAY 'FECHA INICIAL:  ' GET FIN
READ
IF LASTKEY()=27
   DEAC WIND PEDII
   RETURN
ENDIF   
FFI=FIN
@3,4 SAY 'FECHA FINAL  :  ' GET FFI
READ
IF LASTKEY()=27
   DEAC WIND PEDII
   RETURN
ENDIF   
DEAC WIND PEDII
ACTI WIND CENSO
@0,0 SAY "PERIODO :> "+DTOC(FIN)+"-"+DTOC(FFI) COLO G+/B
SELE A
SEEK FIN
@1,0 SAY 'REGISTRO              PACIENTE            FECHA     TOTAL  EXONERAD  DIGITAD' COLO GR+/B
@2,0 SAY REPL('Í',78) COLO GR+/B
Y=3
TOTP=0
TOTT=0
TOTE=0
DO WHILE !EOF()
   IF FECHA>=FIN AND FECHA<=FFI
      IF TIPO="C"
         NUM=REGISTRO
         SELE B
         SEEK NUM
         IF FOUN() AND EXONERAR>0
 	        TOT=PREC_ATE1*CANTIDAD1+PREC_ATE2*CANTIDAD2+PREC_ATE3*CANTIDAD3+PREC_ATE4*CANTIDAD4+PREC_ATE5*CANTIDAD5
            @Y,1 SAY +STR(REGISTRO,6)+' '+SUBS(NOMBRE,1,30)+' '+DTOC(FECHA)+' '+STR(TOT,8,2)+' '+STR(EXONERAR,8,2)+'  '+DIGI_EXON
	        Y=Y+1
	        TOTP=TOTP+1
	        TOTT=TOTT+TOT
	        TOTE=TOTE+EXONERAR
	        IF Y=20
               READ
		       IF LASTKEY()=27
			      DEAC WIND CENSO
    		      RETURN
		       ENDIF   
               Y=3
               @3,0 CLEA TO 20,78
            ENDIF  
         ENDIF
      ENDIF
   ENDIF
   SELE A
   SKIP
ENDDO
@20,0 SAY 'TOTALES -> '+STR(TOTP,5)+' Pacientes       CUENTA S/.'+STR(TOTT,9,2)+'    EXONERADO S/.'+STR(TOTE,9,2) COLO G/B
@21,0 SAY REPL('Û',78) COLO RB/B
@21,10 SAY 'F8-Imprime' COLO W/RB
@21,64 SAY 'ESC-Salir' COLO W/RB
@21,10 SAY 'F8' COLO GR+/RB
@21,64 SAY 'ESC' COLO GR+/RB
ON KEY LABEL F8 DO IMPRIME
SET ESCAPE ON
STORE .F. TO mexit
ON ESCAPE STORE .T. TO mexit
DO WHILE NOT mexit
   IF LASTKEY()!=-1 .AND. LASTKEY()!=-4
      CLEAR TYPEAHEAD
   ENDIF   
ENDDO
ON KEY LABEL F8
DEAC WIND CENSO
CLOS ALL
SET NEAR OFF
RETURN




FUNCTION FECHAS
PARAMETER FEC
FEC=CTOD(FEC)
IF DTOC(FEC)!='  /  /  '
   RETURN .T.
  ELSE
   RETURN .F. 
ENDIF

PROCEDURE IMPRIME
		SET DEVI TO PRIN
		@0,0 SAY CHR(15)
		Y=8
		X=0
		MONTEXON=0
		PG=1
		@1,26 SAY 'EXONERACIONES  PACIENTES  AMBULATORIOS  '+TITULO01
		@4,3 SAY 'PERIODO:> '+DTOC(FIN)+' - '+DTOC(FFI)
		@4,92 SAY 'Pg.  '+STR(PG,2)
		@5,0 SAY +REPLI('ð',110)
        @6,0 SAY ' REGISTRO             PACIENTE             FECHA     TOTAL S/.   MONTO EXON             PERSONAL'
		@7,0 SAY +REPLI('ð',110)
        SELE A
        SEEK FIN
        Y=8
        DO WHILE !EOF()
           IF FECHA>=FIN AND FECHA<=FFI
              IF TIPO="C"
                 NUM=NUMERO
                 SELE B
                 SEEK NUM
                 IF FOUN() AND EXONERAR>0
                    TOT=PREC_ATE1*CANTIDAD1+PREC_ATE2*CANTIDAD2+PREC_ATE3*CANTIDAD3+PREC_ATE4*CANTIDAD4+PREC_ATE5*CANTIDAD5
                    SET RELA TO DIGI_EXON INTO USUARIOS
                    @Y,1 SAY +STR(REGISTRO,6)+'  '+SUBS(NOMBRE,1,30)+'  '+DTOC(FECHA)+'  '+STR(TOT,8,2)+'     '+STR(EXONERAR,8,2)+'      '+SUBS(USUARIOS.NOMBRE,1,8)+' '+SUBS(USUARIOS.A_PATERNO,1,10)+' '+SUBS(USUARIOS.A_MATERNO,1,10)
        	        Y=Y+1
                    IF Y=56
   	                   EJECT
   	                   PG=PG+1
                       @1,26 SAY 'EXONERACIONES  PACIENTES  AMBULATORIOS  '+TITULO01
		 	           @4,3 SAY 'PERIODO:> '+DTOC(FIN)+' - '+DTOC(FFI)
		 	           @4,92 SAY 'Pg.  '+STR(PG,2)
		 	           @5,0 SAY +REPLI('ð',110)
         	           @6,0 SAY ' REGISTRO             PACIENTE             FECHA     TOTAL S/.   MONTO EXON             PERSONAL'
         	           @7,0 SAY +REPLI('ð',110)
	   	               Y=8
	   	               IF LASTKEY()=27
	   			          EJECT
		                  SET DEVI TO SCREE
    		              EXIT
                       ENDIF
        	        ENDIF   
		         ENDIF
              ENDIF
             ELSE
              EXIT
           ENDIF
           SELE A
           SKIP
        ENDDO
		@56,0 SAY +REPLI('-',110)
		@57,0 SAY 'TOTALES -> '+STR(TOTP,5)+' Pacientes                   CUENTA S/.'+STR(TOTT,9,2)+'                EXONERADO S/.'+STR(TOTE,9,2)
		@58,0 SAY +REPLI('-',110)
        EJECT
		SET DEVI TO SCRE

