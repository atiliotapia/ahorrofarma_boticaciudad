PROCEDURE PRELIMINAR
SET BELL TO 60,1
SET EXACT ON
DEFI WIND PREPARA FROM 10,20 TO 14,60;
     CLOSE FLOAT GROW SHADOW 
DEFI WIND PRESPREL FROM 6,10 TO 22,70;
     CLOSE FLOAT GROW SHADOW  COLOR  RB/BG TITLE 'REPORTE DE RECAUDACIONES - CAJA'
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
@5,2 SAY '  Ingrese valores diferentes  '
@1,4 SAY 'FACTURA INICIAL:  ' GET FIN PICT '99999999' VALID FACTU(FIN) ERROR 'NUMERO DE FACTURA NO EXISTE'
READ
IF LASTKEY()=27
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   RETURN
ENDIF   
@3,4 SAY 'FACTURA FINAL  :  ' GET FFI PICT '99999999' VALID FACTU(FFI) ERROR 'NUMERO DE FACTURA NO EXISTE'
READ
IF LASTKEY()=27 .OR. FFI<FIN
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   RETURN
ENDIF   
CLOSE ALL
DEAC WIND PEDII
DEAC WIND AYUDAS

ACTI WIND PREPARA
@1,6 SAY '.... Reporte en proceso ....' colo gb*/b+

SWIMP=0
STORE 0 TO CANSAL,PRESAL,TOTAL,PREESPEC,CANESPEC,EXON
STORE 0 TO TOTLAB,TOTRAY,TOTMAT,TOTESE,TOTCOM,TOTCEX,TOTEME,TOTDEN,TOTEST,TOTOPE,TOTVAR,TOTALES
STORE 0 TO TOTECO,TOTMAT,TOTEST,TOTESE,TOTCOM
MES=MONTH(DATE())

SELE A
     USE ATENCTDO
     SET ORDE TO 1
SELE C
     USE FACTURA
     SET ORDE TO 1
SELE D
     USE PACIENTE
     SET ORDE TO 2
SELE E
     USE PACICONV
     SET ORDE TO 2     
SELE C
SEEK FFI
FECTAB=DTOC(FECHA)
SEEK FIN
DO WHILE !EOF()
   IF DTOC(FECHA)!='  /  /  '
      WAIT WIND 'PROCESANDO REGISTRO  '+STR(NUMERO,8) NOWA
      COD=NUMERO      
      IF TIPO='C'
         STOR 0 TO RAYOS,LABOR,DENTA,CEXT,EMER,SALA,VARIOS,TOTAL02
         SELE A
         SEEK COD
         IF FOUND()
            IF ATENCION1!=0
               IF INT(ATENCION1/1000)=81
                  RAYOS=RAYOS+(PREC_ATE1*CANTIDAD1)
                 ELSE
                  IF INT(ATENCION1/1000)=13
                     LABOR=LABOR+(PREC_ATE1*CANTIDAD1)
                    ELSE
                     IF INT(ATENCION1/1000)=4
                        DENTA=DENTA+(PREC_ATE1*CANTIDAD1)
                       ELSE
                        IF ATENCION1=1001 OR ATENCION1=2001 OR ATENCION1=28001 OR ATENCION1=31001 OR ATENCION1=41001 OR ATENCION1=48001 OR ATENCION1=49001
                           CEXT=CEXT+(PREC_ATE1*CANTIDAD1)
                          ELSE
                           IF ATENCION1=87001 OR ATENCION1=87002 OR ATENCION1=87003
                              EMER=EMER+(PREC_ATE1*CANTIDAD1)
                             ELSE
                              IF ATENCION1=9 OR ATENCION1=10 OR ATENCION1=11
                                 SALA=SALA+(PREC_ATE1*CANTIDAD1)
                                ELSE
                                 VARIOS=VARIOS+(PREC_ATE1*CANTIDAD1)
                              ENDIF   
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF            
            ENDIF
            IF ATENCION2!=0
               IF INT(ATENCION2/1000)=81
                  RAYOS=RAYOS+(PREC_ATE2*CANTIDAD2)
                 ELSE
                  IF INT(ATENCION2/1000)=13
                     LABOR=LABOR+(PREC_ATE2*CANTIDAD2)
                    ELSE
                     IF INT(ATENCION2/1000)=4
                        DENTA=DENTA+(PREC_ATE2*CANTIDAD2)
                       ELSE
                        IF ATENCION2=1001 OR ATENCION2=2001 OR ATENCION2=28001 OR ATENCION2=31001 OR ATENCION2=41001 OR ATENCION2=48001 OR ATENCION2=49001
                           CEXT=CEXT+(PREC_ATE2*CANTIDAD2)
                          ELSE
                           IF ATENCION2=87001 OR ATENCION2=87002 OR ATENCION2=87003
                              EMER=EMER+(PREC_ATE2*CANTIDAD2)
                             ELSE
                              IF ATENCION2=9 OR ATENCION2=10 OR ATENCION2=11
                                 SALA=SALA+(PREC_ATE2*CANTIDAD2)
                                ELSE
                                 VARIOS=VARIOS+(PREC_ATE2*CANTIDAD2)
                              ENDIF   
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF            
            ENDIF
            IF ATENCION3!=0
               IF INT(ATENCION3/1000)=81
                  RAYOS=RAYOS+(PREC_ATE3*CANTIDAD3)
                 ELSE
                  IF INT(ATENCION3/1000)=13
                     LABOR=LABOR+(PREC_ATE3*CANTIDAD3)
                    ELSE
                     IF INT(ATENCION3/1000)=4
                        DENTA=DENTA+(PREC_ATE3*CANTIDAD3)
                       ELSE
                        IF ATENCION3=1001 OR ATENCION3=2001 OR ATENCION3=28001 OR ATENCION3=31001 OR ATENCION3=41001 OR ATENCION3=48001 OR ATENCION3=49001
                           CEXT=CEXT+(PREC_ATE3*CANTIDAD3)
                          ELSE
                           IF ATENCION3=87001 OR ATENCION3=87002 OR ATENCION3=87003
                              EMER=EMER+(PREC_ATE3*CANTIDAD3)
                             ELSE
                              IF ATENCION3=9 OR ATENCION3=10 OR ATENCION3=11
                                 SALA=SALA+(PREC_ATE3*CANTIDAD3)
                                ELSE
                                 VARIOS=VARIOS+(PREC_ATE3*CANTIDAD3)
                              ENDIF   
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF            
            ENDIF
            IF ATENCION4!=0
               IF INT(ATENCION4/1000)=81
                  RAYOS=RAYOS+(PREC_ATE4*CANTIDAD4)
                 ELSE
                  IF INT(ATENCION4/1000)=13
                     LABOR=LABOR+(PREC_ATE4*CANTIDAD4)
                    ELSE
                     IF INT(ATENCION4/1000)=4
                        DENTA=DENTA+(PREC_ATE4*CANTIDAD4)
                       ELSE
                        IF ATENCION4=1001 OR ATENCION4=2001 OR ATENCION4=28001 OR ATENCION4=31001 OR ATENCION4=41001 OR ATENCION4=48001 OR ATENCION4=49001
                           CEXT=CEXT+(PREC_ATE4*CANTIDAD4)
                          ELSE
                           IF ATENCION4=87001 OR ATENCION4=87002 OR ATENCION4=87003
                              EMER=EMER+(PREC_ATE4*CANTIDAD4)
                             ELSE
                              IF ATENCION4=9 OR ATENCION4=10 OR ATENCION4=11
                                 SALA=SALA+(PREC_ATE4*CANTIDAD4)
                                ELSE
                                 VARIOS=VARIOS+(PREC_ATE4*CANTIDAD4)
                              ENDIF   
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF            
            ENDIF
            IF ATENCION5!=0
               IF INT(ATENCION5/1000)=81
                  RAYOS=RAYOS+(PREC_ATE5*CANTIDAD5)
                 ELSE
                  IF INT(ATENCION5/1000)=13
                     LABOR=LABOR+(PREC_ATE5*CANTIDAD5)
                    ELSE
                     IF INT(ATENCION5/1000)=4
                        DENTA=DENTA+(PREC_ATE5*CANTIDAD5)
                       ELSE
                        IF ATENCION5=1001 OR ATENCION5=2001 OR ATENCION5=28001 OR ATENCION5=31001 OR ATENCION5=41001 OR ATENCION5=48001 OR ATENCION5=49001
                           CEXT=CEXT+(PREC_ATE5*CANTIDAD5)
                          ELSE
                           IF ATENCION5=87001 OR ATENCION5=87002 OR ATENCION5=87003
                              EMER=EMER+(PREC_ATE5*CANTIDAD5)
                             ELSE
                              IF ATENCION5=9 OR ATENCION5=10 OR ATENCION5=11
                                 SALA=SALA+(PREC_ATE5*CANTIDAD5)
                                ELSE
                                 VARIOS=VARIOS+(PREC_ATE5*CANTIDAD5)
                              ENDIF   
                           ENDIF
                        ENDIF
                     ENDIF
                  ENDIF
               ENDIF            
            ENDIF
            
            VARIOS=VARIOS+PREC_ESPEC
            TOTAL02=(CEXT+RAYOS+LABOR+EMER+DENTA+SALA+VARIOS-EXONERAR)
            IF EXONERAR=0
               TOTCEX=TOTCEX+CEXT
               TOTRAY=TOTRAY+RAYOS
               TOTLAB=TOTLAB+LABOR
               TOTEME=TOTEME+EMER
               TOTDEN=TOTDEN+DENTA
               TOTVAR=TOTVAR+VARIOS
               TOTOPE=TOTOPE+SALA
              ELSE
               IF EXONERAR<=CEXT
                  VARI=CEXT-EXONERAR
                  TOTCEX=TOTCEX+VARI
                  TOTRAY=TOTRAY+RAYOS
                  TOTLAB=TOTLAB+LABOR
                  TOTEME=TOTEME+EMER
                  TOTDEN=TOTDEN+DENTA
                  TOTVAR=TOTVAR+VARIOS
                  TOTOPE=TOTOPE+SALA
                 ELSE
                  IF (EXONERAR-CEXT)<=EMER
                     VARI=EMER-(EXONERAR-CEXT)
                     TOTRAY=TOTRAY+RAYOS
                     TOTLAB=TOTLAB+LABOR
                     TOTEME=TOTEME+VARI
                     TOTDEN=TOTDEN+DENTA
                     TOTVAR=TOTVAR+VARIOS
                     TOTOPE=TOTOPE+SALA
                    ELSE
                     IF (EXONERAR-CEXT-EMER)<=RAYOS
                        VARI=RAYOS-(EXONERAR-CEXT-EMER)
                        TOTRAY=TOTRAY+VARI
                        TOTLAB=TOTLAB+LABOR
                        TOTDEN=TOTDEN+DENTA
                        TOTVAR=TOTVAR+VARIOS
                        TOTOPE=TOTOPE+SALA
                       ELSE
                        IF (EXONERAR-CEXT-EMER-RAYOS)<=LABOR
                           VARI=LABOR-(EXONERAR-CEXT-EMER-RAYOS)
                           TOTLAB=TOTLAB+VARI
                           TOTDEN=TOTDEN+DENTA
                           TOTVAR=TOTVAR+VARIOS
                           TOTOPE=TOTOPE+SALA
                          ELSE
                           IF (EXONERAR-CEXT-EMER-RAYOS-LABOR)<=DENTA
                              VARI=DENTA-(EXONERAR-CEXT-EMER-RAYOS-LABOR)
                              TOTDEN=TOTDEN+VARI
                              TOTVAR=TOTVAR+VARIOS
                              TOTOPE=TOTOPE+SALA
                             ELSE 
                              IF (EXONERAR-CEXT-EMER-RAYOS-LABOR-DENTA)<=SALA
                                 VARI=SALA-(EXONERAR-CEXT-EMER-RAYOS-LABOR-DENTA)
                                 TOTVAR=TOTVAR+VARIOS
                                 TOTOPE=TOTOPE+VARI
                                ELSE 
                                 IF (EXONERAR-CEXT-EMER-RAYOS-LABOR-DENTA-SALA)<=VARIOS
                                    VARI=VARIOS-(EXONERAR-CEXT-EMER-RAYOS-LABOR-DENTA-SALA)
                                    TOTVAR=TOTVAR+VARI
                                   ELSE
                                 ENDIF
                              ENDIF       
                           ENDIF
                        ENDIF
                     ENDIF         
                  ENDIF
               ENDIF
            ENDIF         
         ENDIF
        ELSE
         IF TIPO='H'
            SELE D
            SEEK COD
            IF FOUN()
               IF (M_MEDICO+IMAGENES+LABORATORI+ECOGRAFIA+HOSPITAL+T_SALA+OTROS_ATEN)>=MONTO_EXON
                  IF (HOSPITAL+T_SALA+OTROS_ATEN)>=MONTO_EXON	        
   	                 TOTAL01=(M_MEDICO+IMAGENES+LABORATORI+ECOGRAFIA+HOSPITAL+T_SALA+OTROS_ATEN-MONTO_EXON)	             
                    ELSE
                     IF (MONTO_EXON-(HOSPITAL+T_SALA+OTROS_ATEN))<B_MEDICINA
                        INES=(MONTO_EXON-(HOSPITAL+T_SALA+OTROS_ATEN))
                        TOTAL01=(M_MEDICO+IMAGENES+LABORATORI+ECOGRAFIA+HOSPITAL+T_SALA+OTROS_ATEN+INES-MONTO_EXON)
                       ELSE
                        TOTAL01=(M_MEDICO+IMAGENES+LABORATORI+ECOGRAFIA+HOSPITAL+T_SALA+OTROS_ATEN+B_MEDICINA-MONTO_EXON)
                     ENDIF
                  ENDIF
                 ELSE
                  TOTAL01=0
               ENDIF
               IF MONTO_EXON=0
                  TOTRAY=TOTRAY+IMAGENES
                  TOTECO=TOTECO+ECOGRAFIA
                  TOTLAB=TOTLAB+LABORATORI
                  TOTMAT=TOTMAT+M_MEDICO
                  TOTEST=TOTEST+HOSPITAL
                  TOTVAR=TOTVAR+OTROS_ATEN
                  TOTESE=TOTESE+B_MEDICINA
                  TOTCOM=TOTCOM+C_MEDICINA
                  TOTOPE=TOTOPE+T_SALA
                 ELSE
                  IF MONTO_EXON<=HOSPITAL
                     VARI=HOSPITAL-MONTO_EXON
                     TOTRAY=TOTRAY+IMAGENES                                                                                                                                                     
                     TOTECO=TOTECO+ECOGRAFIA
                     TOTLAB=TOTLAB+LABORATORI
                     TOTMAT=TOTMAT+M_MEDICO
                     TOTVAR=TOTVAR+OTROS_ATEN
                     TOTEST=TOTEST+VARI
                     TOTESE=TOTESE+B_MEDICINA
                     TOTCOM=TOTCOM+C_MEDICINA
                     TOTOPE=TOTOPE+T_SALA
                    ELSE
                     IF (MONTO_EXON-HOSPITAL)<=OTROS_ATEN
                        VARI=(OTROS_ATEN-(MONTO_EXON-HOSPITAL))
                        TOTRAY=TOTRAY+IMAGENES                                                                                                                                                            
                        TOTECO=TOTECO+ECOGRAFIA
                        TOTLAB=TOTLAB+LABORATORI
                        TOTMAT=TOTMAT+M_MEDICO
                        TOTVAR=TOTVAR+VARI
                        TOTESE=TOTESE+B_MEDICINA
                        TOTCOM=TOTCOM+C_MEDICINA
                        TOTOPE=TOTOPE+T_SALA
                       ELSE
                        IF (MONTO_EXON-HOSPITAL-OTROS_ATEN)<=T_SALA
                           VARI=(T_SALA-(MONTO_EXON-HOSPITAL-OTROS_ATEN))
                           TOTRAY=TOTRAY+IMAGENES                                                                                                                                                     
                           TOTECO=TOTECO+ECOGRAFIA
                           TOTLAB=TOTLAB+LABORATORI
                           TOTMAT=TOTMAT+M_MEDICO
                           TOTESE=TOTESE+B_MEDICINA
                           TOTCOM=TOTCOM+C_MEDICINA
                           TOTOPE=TOTOPE+VARI
                          ELSE
                           IF (MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA)<=B_MEDICINA
                              VARI=(B_MEDICINA-(MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA))
                              TOTRAY=TOTRAY+IMAGENES                                                                                                                                                     
                              TOTECO=TOTECO+ECOGRAFIA
                              TOTLAB=TOTLAB+LABORATORI
                              TOTMAT=TOTMAT+M_MEDICO
                              TOTESE=TOTESE+VARI
                              TOTCOM=TOTCOM+C_MEDICINA
                             ELSE
                              IF (MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA-B_MEDICINA)<=IMAGENES
                                 VARI=(IMAGENES-(MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA-B_MEDICINA))
                                 TOTRAY=TOTRAY+VARI                                                                                                                                                     
                                 TOTECO=TOTECO+ECOGRAFIA
                                 TOTLAB=TOTLAB+LABORATORI
                                 TOTMAT=TOTMAT+M_MEDICO
                                 TOTCOM=TOTCOM+C_MEDICINA
                                ELSE
                                 IF (MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA-B_MEDICINA-IMAGENES)<=ECOGRAFIA
                                    VARI=(ECOGRAFIA-(MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA-B_MEDICINA-IMAGENES))
                                    TOTECO=TOTECO+VARI                                                                                                                                                     
                                    TOTLAB=TOTLAB+LABORATORI
                                    TOTMAT=TOTMAT+M_MEDICO
                                    TOTCOM=TOTCOM+C_MEDICINA
                                   ELSE
                                    IF (MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA-B_MEDICINA-IMAGENES-ECOGRAFIA)<=LABORATORI
                                       VARI=(LABORATORI-(MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA-B_MEDICINA-IMAGENES-ECOGRAFIA))
                                       TOTLAB=TOTLAB+VARI
                                       TOTMAT=TOTMAT+M_MEDICO
                                       TOTCOM=TOTCOM+C_MEDICINA
                                      ELSE
                                       IF (MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA-B_MEDICINA-IMAGENES-ECOGRAFIA-LABORATORI)<=M_MEDICO
                                          VARI=(M_MEDICO-(MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA-B_MEDICINA-IMAGENES-ECOGRAFIA-LABORATORI))
                                          TOTMAT=TOTMAT+VARI
                                          TOTCOM=TOTCOM+C_MEDICINA
                                         ELSE
                                          IF (MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA-B_MEDICINA-IMAGENES-ECOGRAFIA-LABORATORI-M_MEDICO)<=C_MEDICINA
                                             VARI=(C_MEDICINA-(MONTO_EXON-HOSPITAL-OTROS_ATEN-T_SALA-B_MEDICINA-IMAGENES-ECOGRAFIA-LABORATORI-M_MEDICO))
                                             TOTCOM=TOTCOM+VARI
                                            ELSE 
                                          ENDIF   
                                       ENDIF
                                    ENDIF
                                 ENDIF
                              ENDIF
                           ENDIF
                        ENDIF                      
                     ENDIF
                  ENDIF   
               ENDIF
            ENDIF   
           ELSE
    	    SELE E
	        SEEK COD
    	    IF FOUN()
    	       *****NO EXISTE EXONERACIONES*****
               TOTRAY=TOTRAY+IMAGENES
               TOTECO=TOTECO+ECOGRAFIA
               TOTDEN=TOTDEN+DENTAL
               TOTLAB=TOTLAB+LABORATORI
               TOTMAT=TOTMAT+M_MEDICO
               TOTVAR=TOTVAR+OTROS_ATEN
               TOTESE=TOTESE+B_MEDICINA
               TOTCOM=TOTCOM+C_MEDICINA
               TOTOPE=TOTOPE+T_SALA
	        ENDIF
         ENDIF
      ENDIF
      SELE C      
   ENDIF
   SKIP
   IF NUMERO>FFI
      EXIT
   ENDIF
ENDDO         
CLOS ALL
DEAC WIND PREPARA
WAIT WIND 'Presione cualquier tecla para continuar ...' NOWA
ACTI WIND PRESPREL
TOTRAY=TOTRAY+TOTECO
TOTFAR=TOTMAT+TOTESE+TOTCOM
@1,2 SAY 'INICIO :' COLO B/GB
@1,25 SAY 'FINAL :' COLO B/GB
@3,10 SAY 'CONSULTORIO EXTERNO :>' COLO RB+/GB
@4,5 SAY 'DIAGNOSTICO POR IMAGENES :>' COLO RB+/GB
@5,18 SAY 'LABORATORIO :>' COLO RB+/GB
@6,10 SAY 'CONSULTA EMERGENCIA :>' COLO RB+/GB
@7,23 SAY 'DENTAL :>' COLO RB+/GB
@8,12 SAY 'SALA OP. Y PARTOS :>' COLO RB+/GB
@9,20 SAY 'MEDICINAS :>' COLO RB+/GB
@10,14 SAY 'HOSPITALIZACION :>' COLO RB+/GB
@11,23 SAY 'VARIOS :>' COLO RB+/GB
@14,13 SAY 'TOTAL RECAUDADO -->' COLO W+/GB
@1,11 SAY STR(FIN,8) COLO GR+/GB
@1,33 SAY STR(FFI,8) COLO GR+/GB
@3,35 SAY STR(TOTCEX,12,2) COLO W+/GB
@4,35 SAY STR(TOTRAY,12,2) COLO W+/GB
@5,35 SAY STR(TOTLAB,12,2) COLO W+/GB
@6,35 SAY STR(TOTEME,12,2) COLO W+/GB
@7,35 SAY STR(TOTDEN,12,2) COLO W+/GB
@8,35 SAY STR(TOTOPE,12,2) COLO W+/GB
@9,35 SAY STR(TOTFAR,12,2) COLO W+/GB
@10,35 SAY STR(TOTEST,12,2) COLO W+/GB
@11,35 SAY STR(TOTVAR,12,2) COLO W+/GB
@14,35 SAY STR((TOTCEX+TOTRAY+TOTLAB+TOTEME+TOTDEN+TOTOPE+TOTVAR+TOTFAR+TOTEST),12,2) COLO W+*/GB
READ
DEAC WIND PRESPREL
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
@5,2 SAY '  Ingrese valores diferentes  '
@1,4 SAY 'FACTURA INICIAL:  ' GET FIN PICT '99999999' VALID FACTUFAR(FIN) ERROR 'NUMERO DE FACTURA NO EXISTE'
READ
IF LASTKEY()=27
   DEAC WIND PEDII
   DEAC WIND AYUDAS
   RETURN
ENDIF   
@3,4 SAY 'FACTURA FINAL  :  ' GET FFI PICT '99999999' VALID FACTUFAR(FFI) ERROR 'NUMERO DE FACTURA NO EXISTE'
READ
IF LASTKEY()=27 .OR. FFI<FIN
   DEAC WIND PEDII
   DEAC WIND AYUDAS
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
     USE MEDICTDO
     SET ORDE TO 1
SELE C
     USE FACTMEDI
     SET ORDE TO 1
SELE C
SEEK FFI
FECTAB=DTOC(FECHA)
TOTALMED=0
SEEK FIN
DO WHILE !EOF()
   IF DTOC(FECHA)!='  /  /  '
      WAIT WIND 'PROCESANDO REGISTRO  '+STR(NUMERO,8) NOWA
      COD=NUMERO      
      STORE 0 TO TOT01,TOT02,TOT03,TOT04,TOT05
      IF TIPO='M'
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
         ENDIF
         TOTALMED=TOTALMED+TOT01+TOT02+TOT03+TOT04+TOT05
         TOTALMED=TOTALMED-((TOT01+TOT02+TOT03+TOT04+TOT05)*EXONERAR/100)
      ENDIF 
      SELE C      
   ENDIF
   SKIP
   IF NUMERO>FFI
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
PARAMETER A
IF A>0
   USE FACTURA
   SET ORDE TO 1
   * INDE NUMFAC
   SEEK A
   IF FOUND()
      RETURN .T.
     ELSE
      RETURN .F.
   ENDIF    
  ELSE
   RETURN .F.
ENDIF


FUNCTION FACTUFAR
PARAMETER A
IF A>0
   USE FACTMEDI
   SET ORDE TO 1
   * INDE FACMED
   SEEK A
   IF FOUND()
      RETURN .T.
     ELSE
      RETURN .F.
   ENDIF    
  ELSE
   RETURN .F.
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

