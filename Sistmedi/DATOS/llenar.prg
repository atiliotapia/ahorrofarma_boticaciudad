sele a
use C:\SIGEF\FACTURAR\medicina

sele b
use maesmedi
set orde to codigo
sele a
go top
do while !eof()
   scatter memvar memo
   sele b
   seek m.codigo
   if !foun()
   ?m.codigo,m.nom_comer,m.nom_gener,m.forma,m.cod_lab,m.laborato
    insert into maesmedi from memvar
   endif
   sele a
   skip
enddo
