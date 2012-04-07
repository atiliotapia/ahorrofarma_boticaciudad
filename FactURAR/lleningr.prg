SELE A
USE MEDICINA
SELE B
USE C:\SIGEF\SISTMEDI\DATOS\INGRMEDI
X=0
SELE A
GO TOP
DO WHILE !EOF()
   COD=codigo
   can=cant_stock
   costo=prec_comp
   tot=total_comp
   prec=prec_vent
   gan=ganancia
   fven=f_ven
   lot=lote
   codlab=cod_lab
   if can!=0
      sele ingrmedi
      appe blan
      repla codigo with cod
      repla i_cantidad with can
      repla i_precio with prec
      repla i_total with tot
      repla i_fven with fven
      repla i_lote with lot
      repla ganancia with gan
      repla prec_vent with prec
      repla codi_labo with codlab
   endif
   sele medicina
   skip
ENDDO