*
* Define Global Constants
*
#DEFINE debugversion     .T.    && enables asserts.  Should usually be .T.

*- used in Windows VFP 3.0 conversion dialog
#DEFINE C_MSGBOXTITLE_LOC	"Converter"
#DEFINE C_ASK1_LOC			"Preguntar para cada archivo;No preguntar para"		&& nuevo botón de opción para impedir mostrar el cuadro de diálogo durante la conversión
#DEFINE C_ASK2_LOC			" los archivos;No preguntar para ningún archivo"		&& nuevo botón de opción para impedir mostrar el cuadro de diálogo durante la conversión

#DEFINE C_OVERWRITE1_LOC		"Transportar todos los objetos sobrescribirá todas las "
* Filetype constants for FoxPro 2.0 and FoxPro 2.5/2.6 formats
#DEFINE C_OVERWRITE2_LOC		" definiciones de objeto existentes en el archivo."

#DEFINE MB_OKCANCEL             1       && OK and Cancel buttons
#DEFINE IDCANCEL				2       && Cancel button pressed

* Filetype constants for FoxPro 2.0 and FoxPro 2.5/2.6 formats
#DEFINE c_20pjxtype        1
#DEFINE c_25scxtype       12
#DEFINE c_20scxtype        2
#DEFINE c_25frxtype       13
#DEFINE c_20frxtype        3
#DEFINE c_25lbxtype       14
#DEFINE c_20lbxtype        4

*- indexes into gAShowMe array, controls display of transporter dialog for various file types
#DEFINE N_MAXTRANFILETYPES	3				&& number of file types that transporter can handle (All,PJX, SCX, FRX)
#DEFINE N_TRANFILE_PJX	1
#DEFINE N_TRANFILE_SCX	2
#DEFINE N_TRANFILE_FRX	3

* FoxPro 1.02 and FoxBASE+ formats.  Note that the FoxBASE+ types are never
* actually passed in m.tp_filetype.  They are inferred in GetOldReportType and
* GetOldLabelTypefrom the ID byte in the report/label files.  The suffix tells
* us how the file was called, by REPORT FORM ... or by MODIFY REPORT ...
#DEFINE c_frx102repo      23
#DEFINE c_frx102modi      33
#DEFINE c_fbprptrepo      43
#DEFINE c_fbprptmodi      53
#DEFINE c_lbx102repo      24
#DEFINE c_lbx102modi      34
#DEFINE c_fbplblrepo      44
#DEFINE c_fbplblmodi      54
#DEFINE c_db4type		  70

* Definitions for Objtype fields in screens/reports/labels
#DEFINE c_otheader         1
#DEFINE c_otworkar         2
#DEFINE c_otindex          3
#DEFINE c_otrel            4
#DEFINE c_ottext           5
#DEFINE c_otline           6
#DEFINE c_otbox            7
#DEFINE c_otrepfld         8
#DEFINE c_otband           9
#DEFINE c_otgroup         10
#DEFINE c_otlist          11
#DEFINE c_ottxtbut        12
#DEFINE c_otradbut        13
#DEFINE c_otchkbox        14
#DEFINE c_otfield         15
#DEFINE c_otpopup         16
#DEFINE c_otpicture       17
#DEFINE c_otrepvar        18
#DEFINE c_ot20lbxobj      19
#DEFINE c_otinvbut        20
#DEFINE c_otpdset         21
#DEFINE c_otspinner       22
#DEFINE c_otfontdata      23

#DEFINE C_OBJTYPELIST c_otlist,c_ottxtbut,c_otbox,c_otradbut,c_otchkbox,c_otfield, c_otpopup,c_otinvbut,c_otspinner,c_otpicture,c_otline,c_otrepfld,c_otrepvar,c_ottext

* Window types
#DEFINE c_user             1
#DEFINE c_system           2
#DEFINE c_dialog           3
#DEFINE c_alert            4

* ObjCode definitions
#DEFINE c_sgsay            0
#DEFINE c_sgget            1
#DEFINE c_sgedit           2
#DEFINE c_sgfrom           3
#DEFINE c_sgbox            4
#DEFINE c_sgboxd           5
#DEFINE c_sgboxp           6
#DEFINE c_sgboxc           7

#DEFINE c_lnvertical       0
#DEFINE c_lnhorizontal     1

#DEFINE c_ocboxgrp         1

* Attempt to preserve colors of text, lines and boxes when transporting to DOS?
#DEFINE c_maptextcolor     .T.

* Field counts
#DEFINE c_20scxfld        57
#DEFINE c_scxfld          79
#DEFINE c_20frxfld        36
#DEFINE c_frxfld          74
#DEFINE c_frx30fld        75		&& field count for 3.0 FRX file (11/1/95 jd)
#DEFINE c_ot20label       30
#DEFINE c_20lbxfld        17
#DEFINE c_20pjxfld        33
#DEFINE c_pjxfld          31

* Strings for product names
#DEFINE c_foxwin_loc   "FoxPro para Windows"
#DEFINE c_foxmac_loc   "FoxPro para Macintosh"
#DEFINE c_foxdos_loc   "FoxPro para MS-DOS/UNIX"
#DEFINE c_winname  "WINDOWS"
#DEFINE c_macname  "MAC"
#DEFINE c_dosname  "DOS"
#DEFINE c_unixname "DOS"
#DEFINE c_dosnum    1
#DEFINE c_winnum    2
#DEFINE c_macnum    3
#DEFINE c_unixnum   4

* Metrics for various objects, report bands, etc.
#DEFINE c_radhght      1.308
#DEFINE c_chkhght      1.308
#DEFINE c_listht       1.000
#DEFINE c_adjfld       0.125
#DEFINE c_adjlist      0.125
#DEFINE c_adjtbtn      0.769
#DEFINE c_adjrbtn      0.308
#DEFINE c_vchkbox      0.154
#DEFINE c_vradbtn      0.154
#DEFINE c_vlist        0.500
#DEFINE c_hpopup       1.000
#DEFINE c_adjbox       0.500
#DEFINE c_chkpixel        12

#DEFINE c_charrptheight   66
#DEFINE c_charrptwidth    80
#DEFINE c_linesperinch    (66/11)
#DEFINE c_charsperinch    13.71

#DEFINE c_pathsep ":"   && path separator character

#DEFINE c_mapfonts 3    && number of specially mapped fonts

* Version codes, put into Objcode fields in the header record
#DEFINE c_25scx           63
#DEFINE c_25frx           53

* Major file types
#DEFINE c_report           0
#DEFINE c_screen           1
#DEFINE c_label            2
#DEFINE c_project          3

* Error codes
#DEFINE c_error1   "Minor"
#DEFINE c_error2   "Serious"
#DEFINE c_error3   "Fatal"

* Return values
#DEFINE c_yes              1
#DEFINE c_no               0
#DEFINE c_cancel          -1

* Codepage translation.
#DEFINE c_cptrans       .T.    && do special CP translation for FoxBASE+ and FoxPro 1.02?
* The following four contants may need to be localized.
#DEFINE c_doscp          437   && default DOS code page
#DEFINE c_wincp         1252   && default Windows code page
#DEFINE c_maccp        10000
#DEFINE c_unixcp           0

* bands[] array indexes
#DEFINE c_tobandvpos       1
#DEFINE c_tobandheight     2
#DEFINE c_fmbandvpos       3
#DEFINE c_fmbandheight     4

* Frequently used strings.  Make them #DEFINES to simplify localization.
#DEFINE c_converting   "Converting"
#DEFINE c_transporting "Transporting"

#DEFINE C_2DCONTROLS_LOC "Controles 2D"

* Defines used in converting FoxBASE+ reports
#DEFINE maxliterals   55
#DEFINE litpoolsize   1452
#DEFINE maxrepflds   24
#DEFINE h_page   1
#DEFINE h_break 3
#DEFINE l_item   4
#DEFINE f_break 5
#DEFINE f_page   7
#DEFINE f_rpt   8

#define c_space 40
#DEFINE dos_code  1
#DEFINE win_code  2
#DEFINE mac_code  3
#DEFINE unix_code 4
#DEFINE c_2dmark '2'
#DEFINE c_3dmark '3'

** New (8/22/95) added for Localization
#DEFINE T_TITLE_LOC "Transportador de Visual FoxPro"
#DEFINE T_CONVASIS_LOC "Convertir como está"
#DEFINE T_NOCONV_LOC "Si no se transporta el archivo, no se convertirá."
#DEFINE T_NOTRANSPORT_LOC "No transportar"
#DEFINE T_RECMOD_LOC " Objetos modificados más recientemente"
#DEFINE T_NEWMOD_LOC "Los objetos son nuevos para Windows o se han modificado más recientemente que sus equivalentes de Windows."
#DEFINE T_NEWMOD1_LOC "Los objetos son nuevos para "
#DEFINE T_NEWMOD2_LOC ", o se "+CHR(13)+"han modificado más recientemente que sus "
#DEFINE T_NEWMOD3_LOC "equivalentes "
#DEFINE T_BYTRANS1_LOC  "Si transporta este archivo creará"
#DEFINE T_BYTRANS2_LOC  " definiciones para estos objetos. "
#DEFINE T_BYTRANS3_LOC  "Si transporta este archivo agregará, actualizará o " + CHR(13) + "reemplazará "
#DEFINE T_BYTRANS4_LOC  " definiciones para los objetos del archivo."
#DEFINE T_BYTRANS5_LOC  "Si transporta este archivo agregará,"
#DEFINE T_BYTRANS6_LOC	"actualizará o reemplazará definiciones de MS-DOS"
#DEFINE T_ADDUPDREPL_LOC  	"Si transporta este archivo agregará, actualizará o reemplazará las definiciones de Windows para los objetos del archivo."
#DEFINE T_UPDMSDOSDEF_LOC 	"Si transporta este archivo agregará, actualizará o reemplazará las definiciones de MS-DOS"
#DEFINE T_MSDOSDEF_LOC 		"Si transporta este archivo creará definiciones de MS-DOS para estos objetos."
#DEFINE T_OTHERPLAT_LOC		"En este archivo hay objetos definidos para "+CHR(13)+"otra plataforma distinta de "
#DEFINE T_OTHERPLAT2_LOC	"En este archivo hay objetos definidos"
#DEFINE T_OTHERPLAT3_LOC	"para otra plataforma distinta de MS-DOS."
#DEFINE T_NODOSDEF_LOC 		"En este archivo hay objetos definidos para otra plataforma distinta de MS-DOS."
#DEFINE T_OPENASIS_LOC "Abrir tal y como está"
#DEFINE T_NEWDOSOBJ_LOC "Transportar los objetos nuevos a MS-DOS"
#DEFINE T_TRANSOBJ_LOC "Transportar objetos desde:"
#DEFINE T_REPLOBJ_LOC "Todos los objetos -- Reemplazar las definiciones existentes."
#DEFINE T_REPORT_FILE_LOC "Archivo de informe:"
#DEFINE T_LABEL_FILE_LOC  "Archivo de etiqueta:"
#DEFINE T_SCREEN_FILE_LOC "Archivo de pantalla:"
#DEFINE T_SPIN_LOC	"Control numérico"
#DEFINE T_SEXPR_LOC	"SAY Expresión"
#DEFINE T_GFIELD_LOC	"GET Campo"
#DEFINE T_FIELD_LOC	"Campo"
#DEFINE T_POPUP_LOC	"Emergente"
#DEFINE T_PICTURE_LOC	"Imagen"
#DEFINE T_RPTVAR_LOC	"Variable de informe"
#DEFINE T_INVBTN_LOC	"Botón Inv"
#DEFINE T_PDRIVER_LOC "Controlador de impresora"
#DEFINE T_FONTDATA_LOC "Datos de fuente"
#DEFINE T_UNKNOWNVERS_LOC "Versión de FoxPro desconocida."
#DEFINE T_ENERGIZE_LOC "Energize"
#DEFINE	T_SELTRANS_LOC	"Seleccione el archivo que desea transportar"
#DEFINE T_TRANSPORT_LOC "Transportar"
#DEFINE T_TRANSPERR_LOC "Error del transportador"
#DEFINE T_LINENO_LOC	"Número de línea: "
#DEFINE T_CLEANUP_LOC	"Presione cualquier tecla para limpiar y salir..."
#DEFINE T_OBJNEWMOD_LOC "Estos objetos son nuevos para la plataforma Windows o se han modificado más recientemente"
#DEFINE T_OBJMOD_LOC "Estos objetos se han modificado más recientemente en "
#DEFINE T_OBJNEW1_LOC "Estos objetos son nuevos para "
#DEFINE T_OBJNEW2_LOC " plataforma o se han modificado más recientemente en "
#DEFINE T_UNCHECK1_LOC "Desactivar cualquier elemento que"
#DEFINE T_UNCHECK2_LOC "no"
#DEFINE T_UNCHECK3_LOC "desee transportar."
#DEFINE T_EXPPROMPT_LOC "Expresión/Petición"
#DEFINE T_TYPE_LOC "Tipo"
#DEFINE T_VARIABLE_LOC "Variable"
#DEFINE T_STAT_LOC "Estat"
#DEFINE T_FONT_LOC "Fuente"
#DEFINE T_FONT1_LOC "Fuente..."
#DEFINE T_OK_LOC "Aceptar"
#DEFINE T_CANCEL_LOC "Cancelar"
#DEFINE T_TRANSOPEN_LOC "\!Transportar y abrir;Abrir tal y como está;\?Cancelar"
#DEFINE T_TRANSOPEN1_LOC "\!Transportar y abrir;\?Cancelar"
#DEFINE T_TRANSOPEN2_LOC "Transportar y abrir"

#DEFINE T_NOSTAND_LOC	"El Transportador no se puede ejecutar como un programa autónomo."
#DEFINE T_INVALIDSCR_LOC	"El nombre de pantalla/informe no es válido."
#DEFINE T_WHEREIS_LOC	"Dónde está "
#DEFINE T_CONVFRX_LOC	"Debe convertir este archivo a un archivo .FRX antes de que"+CHR(13)+"pueda usarlo. Use el Administrador de catálogos para abrir el archivo"+CHR(13)+						"o elija Convertir archivos dBASE en el menú Ejecutar."


#DEFINE T_UNKNOWNFRX_LOC	"Formato de informe desconocido"
#DEFINE T_TRANSNOTHING_LOC "El transportador no tiene nada que hacer."
#DEFINE T_INVFILEFORMAT_LOC	"El formato de archivo es desconocido o no es válido"
#DEFINE T_NORECS_LOC	"No hay registros para transportar"
#DEFINE T_COMVPRMPT1_LOC	"¿Desea convertir el archivo de informe de la versión 1.02 al formato 2.6?"
#DEFINE T_COMVPRMPT2_LOC	"¿Desea convertir el archivo de informe FoxBASE+/dBASE III al formato de FoxPro 2.6?"
#DEFINE T_COMVPRMPT3_LOC	"¿Desea convertir el archivo de etiqueta de la versión 1.02 al formato 2.6?"
#DEFINE T_COMVPRMPT4_LOC	"¿Desea convertir el archivo de etiqueta FoxBASE+/dBASE III al formato de FoxPro 2.6?"
#DEFINE T_COMVPRMPT5_LOC	"¿Desea convertir el archivo de pantalla de la versión 2.0 al formato 2.6?"
#DEFINE T_COMVPRMPT6_LOC	"¿Desea convertir el archivo de informe de la versión 2.0 al formato 2.6?"
#DEFINE T_COMVPRMPT7_LOC	"¿Desea convertir el archivo de proyecto de la versión 2.0 al formato 2.6?"
#DEFINE T_UNKOPERATION_LOC	"Operación de actualización desconocida"
#DEFINE T_UNKFOXVER_LOC		"Versión desconocida de FoxPro."
#DEFINE T_SAMELINE_LOC		"Las plataformas de origen y de destino son las mismas "
#DEFINE T_NOOPENREPT_LOC	"No se pudo abrir el formulario de informe FoxBASE+ "
#DEFINE T_TOTAL1_LOC	"*** Total ***"
#DEFINE T_YESNO_LOC		"\<Sí;\!\?\<No"

#DEFINE T_THAN_LOC		"Que "
#DEFINE T_EQIVOBJS_LOC	" Objetos equivalentes"
#DEFINE	T_OBJSNEWTO_LOC	"Objetos nuevos para "
#DEFINE	T_OBJINFILE_LOC "para los objetos del archivo."
#DEFINE T_THERMSCR_LOC	" pantalla: "
#DEFINE T_THERMRPT_LOC	" informe: "
#DEFINE T_THERMLBL_LOC	" etiqueta: "
#DEFINE T_ASSERTFAIL_LOC	"Falló la aserción: "
#DEFINE T_THANMAC_LOC	"Que objetos equivalentes de Macintosh"