****Controla el avance del proceso
LPARAMETERS lnMax, lcTexto
*lnmax=10
*lctexto="Procesado"
 

LOCAL nStat, lnPorcen, lcExp

lcExp = IIF(LEN(lcTexto) > 23, LEFT(lcTexto,25)+" ..", lcTexto)
*- Si no está creado el contador lo crea
IF TYPE('__gnContaMsg__') = 'U'
  PUBLIC __gnContaMsg__
  __gnContaMsg__ = 1
ENDIF
 

nStat       = __gnContaMsg__ * ( 160 / lnMax )
lnPorcen    = INT( 100 * ( __gnContaMsg__ / lnMax ))
SET MESSAGE TO lcExp + " " + REPLICATE( "|", nStat ) + " " + ;
      ALLTRIM( STR(lnPorcen) ) + "%"
__gnContaMsg__ = __gnContaMsg__ + 1
 

*- Si ha llegado al cien %, borra la variable global
IF lnPorcen = 100
  RELEASE __gnContaMsg__
  SET MESSAGE TO ""
ENDIF
RETURN

