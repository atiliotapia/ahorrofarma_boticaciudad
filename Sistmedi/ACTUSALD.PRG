LPARAMETERS MESES,ANIOSS
********M.TIPO TIENE LOS VALORES********
*CTDO=CONTADO
****************************************
********M.SUBTIPO TIENE LOS VALORES*****
*R=CREDITO
*E=EXONERADO
*D=DONACION
****************************************
   SWIMP=0
   TOT1=0
   TOT2=0
   STORE 0 TO CANSAL,PRESAL
        
      WAIT WIND '......  PROCESANDO VENTAS AL CONTADO  ......' NOWA
      SELE FACTURA
      SET ORDE TO REGIREGI
      SELE MEDICTDO
      SET FILTE TO MONTH(FECHA)=MESES AND YEAR(FECHA)=ANIOSS
      DO WHILE !EOF()
         SET RELA TO STR(REGISTRO,8)+"M" INTO FACTURA
         IF FACTURA.TIPO="M"
            M.NUMERO=REGISTRO
            M.FECHA=FECHA
            M.MEDICO=0
            M.TIPO="CTDO"
            M.DIGITADOR=FACTURA.DIGITADOR
            IF FACTURA.FECHA_EMIS!=FACTURA.FECHA
               M.SUBTIPO="R"
              ELSE
               M.SUBTIPO=" "
            ENDIF
            IF MEDICTDO.SINCOSTO="S"
               M.SUBTIPO="D"
            ENDIF
            SELE MEDICTDO
            IF MEDICINA1!=SPACE(7)
               M.COD_MED=MEDICINA1
               M.CANT_MED=CANTID1 
               M.PREC_MED=PREC_UNI1*(1-EXONERAR/100)
               INSERT INTO TPMOVIVENT FROM MEMVAR
            ENDIF
            SELE MEDICTDO
            IF MEDICINA2!=SPACE(7)
               M.COD_MED=MEDICINA2
               M.CANT_MED=CANTID2 
               M.PREC_MED=PREC_UNI2*(1-EXONERAR/100)
               INSERT INTO TPMOVIVENT FROM MEMVAR
            ENDIF
            SELE MEDICTDO
            IF MEDICINA3!=SPACE(7)
               M.COD_MED=MEDICINA3
               M.CANT_MED=CANTID3 
               M.PREC_MED=PREC_UNI3*(1-EXONERAR/100)
               INSERT INTO TPMOVIVENT FROM MEMVAR
            ENDIF
            SELE MEDICTDO
            IF MEDICINA4!=SPACE(7)
               M.COD_MED=MEDICINA4
               M.CANT_MED=CANTID4 
               M.PREC_MED=PREC_UNI4*(1-EXONERAR/100)
               INSERT INTO TPMOVIVENT FROM MEMVAR
            ENDIF
            SELE MEDICTDO
            IF MEDICINA5!=SPACE(7)
               M.COD_MED=MEDICINA5
               M.CANT_MED=CANTID5 
               M.PREC_MED=PREC_UNI5*(1-EXONERAR/100)
               INSERT INTO TPMOVIVENT FROM MEMVAR
            ENDIF
            SELE MEDICTDO
            IF MEDICINA6!=SPACE(7)
               M.COD_MED=MEDICINA6
               M.CANT_MED=CANTID6 
               M.PREC_MED=PREC_UNI6*(1-EXONERAR/100)
               INSERT INTO TPMOVIVENT FROM MEMVAR
            ENDIF
            SELE MEDICTDO
            IF MEDICINA7!=SPACE(7)
               M.COD_MED=MEDICINA7
               M.CANT_MED=CANTID7 
               M.PREC_MED=PREC_UNI7*(1-EXONERAR/100)
               INSERT INTO TPMOVIVENT FROM MEMVAR
            ENDIF
            SELE MEDICTDO
            IF MEDICINA8!=SPACE(7)
               M.COD_MED=MEDICINA8
               M.CANT_MED=CANTID8 
               M.PREC_MED=PREC_UNI8*(1-EXONERAR/100)
               INSERT INTO TPMOVIVENT FROM MEMVAR
            ENDIF
            SELE MEDICTDO
            IF MEDICINA9!=SPACE(7)
               M.COD_MED=MEDICINA9
               M.CANT_MED=CANTID9 
               M.PREC_MED=PREC_UNI9*(1-EXONERAR/100)
               INSERT INTO TPMOVIVENT FROM MEMVAR
            ENDIF
            SELE MEDICTDO
            IF MEDICINA10!=SPACE(7)
               M.COD_MED=MEDICINA10
               M.CANT_MED=CANTID10 
               M.PREC_MED=PREC_UNI10*(1-EXONERAR/100)
               INSERT INTO TPMOVIVENT FROM MEMVAR
            ENDIF
            SELE MEDICTDO
         ENDIF 
         SKIP
      ENDDO   
      
      WAIT WIND "ACTUALIZACION CONCLUIDO" NOWA
