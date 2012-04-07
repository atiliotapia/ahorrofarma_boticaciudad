*CLAVE='KUp[dl'
CLAVE='KVa^im'
      DECLA CLAV(6)
      FOR I=1 TO 6
         CLAV(I)=CHR(ASC(SUBS(CLAVE,I,1))-I*10)
      ENDFOR
      CLAVE=CLAV(1)
      FOR I=2 TO 6
         CLAVE=CLAVE+CLAV(I)
      ENDFOR
?CLAVE