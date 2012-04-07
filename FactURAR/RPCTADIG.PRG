PROCEDURE RPMEDICI
DEFI WIND AVISO FROM 12,14 TO 14,64 COLO SCHE 12
DIADIA=DATE()
ACTI WIND AVISO
@0,10 SAY 'FECHA DE REPORTE :> ' GET DIADIA  ERROR '... Fecha Err¢nea ...'
READ 
IF LAST()=27
   DEAC WIND AVISO
   RETURN
ENDIF
DEAC WIND AVISO
*DIADIA=CTOD(DIADIA)
FIC='MED'+SUBS(CMONTH(DIADIA),1,3)+SUBS(STR(YEAR(DIADIA),4),3,2)
IF PRINT()
   ACTI WIND AVISO
   @0,0 SAY '<< IMPRIMIENDO >>        Por favor espere  .....'
   SELE A
        USE (FIC)
   SELE B
        USE MEDICINAS
        SET ORDE TO 1
   SELE C
        USE USUARIOS.LIB
*   LOCATE FOR CODIGO=CODUSU
*   NOMUSU=NOMBRE+A_PATERNO+A_MATERNO
   TOTMON=0
   SET DEVI TO PRIN
   @0,0 SAY CHR(15)
   @0,0 SAY '  '   
   @0,0 SAY 'MINISTERIO DE SALUD                                                                                             HORA EMISION:>'+TIME()
   @1,0 SAY ''+TITULO01
   @1,0 SAY CHR(18)   
   @1,0 SAY '  '
   @1,25 SAY 'MEDICINAS DIGITADAS - CUENTA CORRIENTE'
   @1,25 SAY 'MEDICINAS DIGITADAS - CUENTA CORRIENTE'
   @2,35 SAY 'FECHA :> '+DTOC(DIADIA)
*   @4,2  SAY 'DIGITADOR :> '+NOMUSU
   @6,0  SAY 'CTA.CTE. CODIGO      D E S C R I P C I O N       FORMA    CANTIDAD   P.UNIT  DIG.'
   @7,0  SAY '******** ************************************************************************' 
   Y=8
   SELE A
   DO WHILE !EOF()
      IF FECHA=DIADIA
         IF Y>56
            EJECT
            @0,0 SAY CHR(15)
            @0,0 SAY '  '   
            @0,0 SAY 'MINISTERIO DE SALUD                                                                                             HORA EMISION:>'+TIME()
            @1,0 SAY ''+TITULO01
            @1,0 SAY CHR(18)   
            @1,0 SAY '  '
            @1,25 SAY 'MEDICINAS DIGITADAS - CUENTA CORRIENTE'
            @1,25 SAY 'MEDICINAS DIGITADAS - CUENTA CORRIENTE'
            @2,35 SAY 'FECHA :> '+DTOC(DIADIA)
*            @4,0  SAY 'DIGITADOR :> '+NOMUSU
            @6,0  SAY 'CTA.CTE. CODIGO      D E S C R I P C I O N       FORMA    CANTIDAD   P.UNIT  DIG.'
            @7,0  SAY '******** ************************************************************************' 
            Y=8
         ENDIF
         SET RELA TO MEDICINA1 INTO B
         CODDIG=DIGITADOR
         SELE C
         LOCATE FOR CODDIG=CODIGO
         DIG=SUBS(NOMBRE,1,1)+SUBS(A_PATERNO,1,1)+SUBS(A_MATERNO,1,1)
         SELE A
         @Y,0 SAY ' '+STR(CUENTA_C,6)+'  '+MEDICINA1+'  '+SUBS(B->NOM_COMER,1,30)+' '+SUBS(B->FORMA,1,9)+' '+STR(CANTIDAD1,6,2)+' '+STR(PREC_MED1,9,2)+'  '+DIG
         Y=Y+1
         TOTMON=TOTMON+(PREC_MED1*CANTIDAD1*(1+CONVENIO/100))
      ENDIF
      SKIP
   ENDDO
   @Y,0  SAY '---------------------------------------------------------------------------------'
   @Y+1,20 SAY 'MONTO TOTAL DIGITADO :> '+STR(TOTMON,12,2)+' Nuevos Soles'
   EJECT
   SET DEVI TO SCRE
ENDIF   
DEAC WIND AVISO
CLOS ALL
         
         





********************************
*REPORTE PARA UN SOLO DIGITADOR*
********************************
PROCEDURE UNSOLODIG
*PROCEDURE RPMEDICI
DEFI WIND AVISO FROM 12,14 TO 14,64 COLO SCHE 12
DIADIA=DATE()
FIC='MED'+SUBS(CMONTH(DIADIA),1,3)+SUBS(STR(YEAR(DIADIA),4),3,2)
IND='M'+SUBS(CMONTH(DIADIA),1,3)+SUBS(STR(YEAR(DIADIA),4),3,2)
IF PRINT()
   ACTI WIND AVISO
   @0,0 SAY '<< IMPRIMIENDO >>        Por favor espere  .....'
   SELE A
        USE (FIC)
   SELE B
        USE MEDICINAS
        SET ORDE TO 1
        *INDE MEDI
   SELE C
        USE USUARIOS.LIB
   LOCATE FOR CODIGO=CODUSU
   NOMUSU=NOMBRE+A_PATERNO+A_MATERNO
   TOTMON=0
   SET DEVI TO PRIN
   @0,0 SAY CHR(15)
   @0,0 SAY '  '   
   @0,2 SAY 'MINISTERIO DE SALUD                                                                                             HORA EMISION:>'+TIME()
   @1,2 SAY ''+TITULO01
   @1,0 SAY CHR(18)   
   @1,0 SAY '  '
   @1,25 SAY 'MEDICINAS DIGITADAS - CUENTA CORRIENTE'
   @1,25 SAY 'MEDICINAS DIGITADAS - CUENTA CORRIENTE'
   @2,35 SAY 'FECHA :> '+DTOC(DIADIA)
   @4,2  SAY 'DIGITADOR :> '+NOMUSU
   @6,2  SAY 'CTA.CTE. CODIGO      D E S C R I P C I O N       FORMA     CANTIDAD  MONTO(S/.)'
   @7,2  SAY '******** **********************************************************************' 
   Y=8
   SELE A
   DO WHILE !EOF()
      IF CODUSU=DIGITADOR AND FECHA=DIADIA
         IF Y>56
            EJECT
            @0,0 SAY CHR(15)
            @0,0 SAY '  '   
            @0,2 SAY 'MINISTERIO DE SALUD                                                                                             HORA EMISION:>'+TIME()
            @1,2 SAY ''+TITULO01
            @1,0 SAY CHR(18)   
            @1,0 SAY '  '
            @1,25 SAY 'MEDICINAS DIGITADAS - CUENTA CORRIENTE'
            @1,25 SAY 'MEDICINAS DIGITADAS - CUENTA CORRIENTE'
            @2,35 SAY 'FECHA :> '+DTOC(DIADIA)
            @4,2  SAY 'DIGITADOR :> '+NOMUSU
            @6,2  SAY 'CTA.CTE. CODIGO      D E S C R I P C I O N       FORMA     CANTIDAD  MONTO(S/.)'
            @7,2  SAY '******** **********************************************************************' 
            Y=8
         ENDIF
         SET RELA TO MEDICINA1 INTO B
         @Y,2 SAY ' '+STR(CUENTA_C,6)+'  '+MEDICINA1+'  '+SUBS(B->NOM_COMER,1,30)+' '+SUBS(B->FORMA,1,10)+' '+STR(CANTIDAD1,6,2)+' '+STR(PREC_MED1,9,2)
         Y=Y+1
         TOTMON=TOTMON+(PREC_MED1*CANTIDAD1*(1+CONVENIO/100))
      ENDIF
      SKIP
   ENDDO
   @Y,2  SAY '-------------------------------------------------------------------------------'
   @Y+1,20 SAY 'MONTO TOTAL DIGITADO :> '+STR(TOTMON,12,2)+' Nuevos Soles'
   EJECT
   SET DEVI TO SCRE
ENDIF   
DEAC WIND AVISO
CLOS ALL
         
         
FUNCTION FECHAS
PARAMETER A
IF DTOC(CTOD(A))='  /  /  '
   RETURN .F.
  ELSE
   RETURN .T. 
ENDIF
