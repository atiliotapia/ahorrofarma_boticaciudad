#DEFINE C_CONVERSION_LOC	"Microsoft Visual FoxPro Converter Utility Version 6.00a (01/01/98)"

*- CONVERT.H
*-
*- Header file for Convert.PRG
*- (c) Microsoft Corporation 1995

*- debug #DEFINES -- no need to localize these
#DEFINE L_SHOWVERSION	.F.
#DEFINE L_DEBUG         .F.
#DEFINE L_USEVCX		.F.
#DEFINE L_DEBUGSUSPEND	.F.

#DEFINE	C_LATESTVER		"06.00.8000.00"

*- current version numbers
#DEFINE C_SCXVERSTAMP	"VERSION =  3.00"
#DEFINE C_PJXVERSTAMP	260					&& 1.3

*- various common special chars
#DEFINE	C_CRLF			CHR(13)+CHR(10)	&& return/linefeed
#DEFINE	C_CR			CHR(13)			&& return
#DEFINE	C_LF			CHR(10)			&& linefeed
#DEFINE	C_TAB			CHR(9)			&& tab
#DEFINE	C_TAB2			CHR(9)+CHR(9)	&& 2 tabs
#DEFINE C_NULL			CHR(0)			&& null char

*- error messages (need localizing)
#DEFINE E_INVALIDFILE_LOC 	"Ha seleccionado un archivo no válido."
#DEFINE	E_INVALPJX_LOC		"Ha seleccionado un archivo de proyecto no válido."
#DEFINE	E_INVALFPC_LOC		"Ha seleccionado un archivo de catálogo no válido."
#DEFINE E_INVALDBF_LOC	 	"El formato de archivo no es válido."
#DEFINE	E_WRONGFMT_LOC		"El archivo de pantalla no tiene un formato conocido."
#DEFINE	E_WRONGFMT2_LOC		"El archivo de informe o de etiqueta no tiene un formato conocido."
#DEFINE	E_NOSCX_LOC			"Debe seleccionar un archivo .SCX."
#DEFINE	E_NOOPEN_LOC		"No se puede abrir "
#DEFINE	E_NOCLOSE_LOC		"No se puede cerrar "
#DEFINE E_FILE_LOC			"Archivo "
#DEFINE E_NOSCXFILE_LOC 	"No se puede usar Converter - falta el archivo TAZMAIN.SCX."
#DEFINE E_HAS20FILE_LOC		"Ha seleccionado un archivo de FoxPro 2.0. El Transportador debe convertirlo primero al formato de 2.6."
#DEFINE E_NOTRANS_LOC		"No se puede encontrar el programa transportador. Se canceló la conversión."
#DEFINE E_NOPLATOBJS_LOC	"Ha seleccionado una pantalla de FoxPro sin objetos de la plataforma actual. El Transportador debe convertirla primero."
#DEFINE E_NODIR_LOC			"Error al crear el directorio de copia de seguridad. Se canceló la operación."
#DEFINE E_NOFILE_LOC		"No se pudo encontrar el archivo indicado en "
#DEFINE E_OPCANC_LOC		". Se canceló la operación."
#DEFINE E_NOCONVERT_LOC		"No se ha convertido."
#DEFINE E_NOCONVERT1_LOC	" no se encuentra. " + E_NOCONVERT_LOC
#DEFINE E_NOCONVERT2_LOC	" no se pudo abrir. " + E_NOCONVERT_LOC
#DEFINE E_NOCONVERT3_LOC	" es de sólo lectura. " + E_NOCONVERT_LOC
#DEFINE E_NOCONVERT4_LOC	" es un archivo oculto o de sistema. " + E_NOCONVERT_LOC
#DEFINE E_NOBACKUP_LOC		". No se ha hecho copia de seguridad."
#DEFINE E_NOSTART_LOC		"Ha habido un problema al iniciar Converter."
#DEFINE E_BADFOX1_LOC		"Debe utilizar FoxPro versión "
#DEFINE E_BADFOX2_LOC		" o posteriormente para ejecutar Converter."
#DEFINE E_NOOPENSRC_LOC		"No se puede abrir el archivo de origen "
#DEFINE E_FILENOEXIST_LOC	"El archivo @1 no existe."
#DEFINE E_BADCODEPAGE_LOC	"La tabla de códigos @1 no es válida."
#DEFINE E_BADCALL_LOC		"Se han pasado parámetros erróneos al convertidor. Para convertir archivos, ábralos desde el menú Archivo."
#DEFINE E_FILEOPEN_LOC		"El archivo ya está abierto."
#DEFINE E_NA_LOC			"Característica no disponible todavía."
#DEFINE E_NOCREATE_LOC		"Error al crear "
#DEFINE E_NOWRITE_LOC		"Error al escribir en "
#DEFINE E_NOFINDS_LOC		"Algunos archivos faltan o no se pudieron encontrar. No se convertirán. ¿Desea continuar?"
#DEFINE E_FATAL_LOC			"Ocurrió un error en Converter y no puede continuar."
#DEFINE E_FATAL2_LOC		" El error se ha registrado en "
#DEFINE E_FATAL3_LOC		". ¿Desea abrir el archivo de registro?"
#DEFINE E_FATAL1_LOC		"Error fatal en Converter: "
#DEFINE E_ERR1_LOC			"Error: "
#DEFINE E_ERR2_LOC			"Número de error: "
#DEFINE E_ERR3_LOC			"Método: "
#DEFINE E_ERR4_LOC			"Línea: "
#DEFINE E_ERR5_LOC			"Código que produce el error: "
#DEFINE E_ERR6_LOC			"Archivo que se está procesando: "
#DEFINE E_ERR7_LOC			"No se ha grabado"
#DEFINE E_NOMIG_LOC			"Imposible migrar el archivo."
#DEFINE E_MIGSTART_LOC		"Empezar la migración al formato de FoxPro 2.x."
#DEFINE E_MIGEND_LOC		"Se ha completado correctamente la migración al formato de FoxPro 2.x."
#DEFINE E_MACROEXPR1_LOC	"No se puede procesar una expresión de macro en la directiva del generador."
#DEFINE E_PROPTOOLONG_LOC	"La expresión en el registro nº es demasiado larga "
#DEFINE E_WARNING_LOC		"ADVERTENCIA"
#DEFINE E_EXPRNOCONV_LOC	"La expresión no se ha encontrado."
#DEFINE E_SEELOGFILE_LOC	"Ver los detalles en el archivo de registro."
#DEFINE E_DISKFULL_LOC		"El disco está lleno y el convertidor no puede continuar. No se puede salvar el archivo de registro."
#DEFINE E_NOINCLUDE_LOC		"Imposible compilar el archivo. Consulte el archivo .ERR para ver detalles y compile manualmente."
#DEFINE E_NOINCLUDE1_LOC	"Imposible compilar el archivo  "
#DEFINE E_NOINCLUDE2_LOC 	"  . Consulte el archivo .ERR para ver detalles y compile manualmente."
	


*- Other strings to localize
#DEFINE C_CONVERT1_LOC		"¿Desea convertir la pantalla "
#DEFINE C_CONVERT2_LOC		" al formato de Visual FoxPro 6.0?" && (El archivo original todavía estará disponible.)"
#DEFINE C_CONVERT3_LOC		"¿Desea convertir "
#DEFINE C_CONVERT3p_LOC		"project "
#DEFINE C_CONVERT3c_LOC		"catalog "
#DEFINE C_CONVERT3r_LOC		"report "
#DEFINE C_CONVERT3l_LOC		"label "
#DEFINE C_CONVERT4_LOC		" (y todos los formularios e informes dentro de él) al formato de Visual FoxPro 6.0?" && (Los archivos originales todavía estarán disponibles.)"
#DEFINE	C_GETP1_LOC			"Seleccione el archivo de pantalla:"
#DEFINE C_INSMESS1_LOC		"*- Inicio de la directiva #INSERT - "
#DEFINE C_INSMESS2_LOC		"*- Fin de la directiva #INSERT"
#DEFINE C_INSMESS3_LOC		"*- No se pudo encontrar el archivo de directiva #INSERT"
#DEFINE	C_PROCESS_LOC		"Procesando: "
#DEFINE C_SSETS_LOC			" conjuntos de pantallas."
#DEFINE C_NEWFORM_LOC 		"Nuevo formulario: "
#DEFINE C_OF_LOC	 		" de "
#DEFINE C_PROJSTAT_LOC		"Estado del proyecto"
#DEFINE C_PROJNAME_LOC		"Proyecto: "
#DEFINE C_COMPLETE_LOC		"Completado: "
#DEFINE	C_PERCHAR_LOC		"%"
#DEFINE	C_BACKFILES_LOC		"Haciendo copia de seguridad de los archivos del proyecto..."
#DEFINE C_MAXFILES_LOC		" archivos."
#DEFINE C_OVERWRITE_LOC		" existe. ¿Desea sobrescribir?"
#DEFINE C_SAYSCOMMENT_LOC	"*- SAYs de 2.6 que hay que actualizar"
#DEFINE C_THERMMSG1_LOC		"Convirtiendo el proyecto "
#DEFINE C_THERMMSG2_LOC		"Convirtiendo la pantalla "
#DEFINE C_THERMMSG3_LOC		"Convirtiendo el archivo de formato "
#DEFINE C_THERMMSG4_LOC		"Convirtiendo el archivo de catálogo "
#DEFINE C_THERMMSG5_LOC		"Convirtiendo el archivo "
#DEFINE C_THERMMSG6_LOC		"Transportando el proyecto "
#DEFINE C_THERMMSG7_LOC		"Transportando la pantalla "
#DEFINE C_THERMMSG8_LOC		"Convirtiendo el informe "
#DEFINE C_THERMMSG9_LOC		"Transportando el informe "
#DEFINE C_THERMMSG10_LOC	"Actualizando el informe "
#DEFINE C_THERMMSG11_LOC	"Migrando la pantalla "
#DEFINE C_THERMMSG12_LOC	"Migrando el informe "
#DEFINE C_THERMMSG13_LOC	"Migrando el archivo de formato "
#DEFINE C_THERMTITLE_LOC	""
#DEFINE C_PROJTASK1_LOC		"Convirtiendo pantallas..."
#DEFINE C_PROJTASK2_LOC		"Convirtiendo otros archivos..."
#DEFINE C_PROJTASK3_LOC		"Migrando archivos..."
#DEFINE C_PROJTASK4_LOC		"Convirtiendo el proyecto..."
#DEFINE C_PROJTASK5_LOC		"Convirtiendo el catálogo..."
#DEFINE C_PROJTASK6_LOC		"Configuraciones predeterminadas de la versión 3.0..."
#DEFINE C_CONVMSG_LOC		"Convertido." + CHR(13)
#DEFINE C_NOTCONVMSG_LOC	"No se ha convertido."
#DEFINE C_FILECONV_LOC		"El archivo ya se ha convertido"
#DEFINE C_CREATMSG_LOC		". Se creó un archivo SPR."
#DEFINE C_NOCONVMSG_LOC		"No es necesaria la conversión."
#DEFINE C_CONVLOG_LOC		"Registro de conversión para "
#DEFINE C_CONVVERS_LOC		"Convertidor: "
#DEFINE C_LOGEND_LOC		"*- fin del registro"
#DEFINE C_CODESRC_LOC		"Código vario"
#DEFINE C_CODEHDR_LOC		"*- Código de "
#DEFINE C_CODEHDR1_LOC		"*----------------------------------------------" + C_CRLF
#DEFINE C_LOCFILE_LOC		"Encontrar "
#DEFINE C_LOCFILE2_LOC		"Buscar archivo:"
#DEFINE C_LOCFILE3_LOC		"No se encontró el archivo " + JustFName(cTmpFname) + " ¿Desea encontrarlo?"
#DEFINE C_ERRLOG_LOC		"Error"		&& nombre del archivo de registro por si hay errores y no se especifica ningún archivo de registro -- DON'T EXCEED 6 CHARACTERS
#DEFINE C_BEGIN_LOC			"Empezar la conversión"
#DEFINE C_END_LOC			"Fin de la conversión"
#DEFINE C_SUCCESSCONV_LOC	"La conversión correcta duró "
#DEFINE C_SECONDS_LOC		" segundos."
#DEFINE C_COMPILE_LOC		"Compilando."
#DEFINE C_ESCAPE_LOC		"Se presionó ESC. ¿Desea cancelar la conversión?"
#DEFINE C_ESCLOGMSG_LOC		"Se canceló la conversión a petición del usuario."
#DEFINE C_MIGRATEMSG_LOC	"Migrando el archivo..."
#DEFINE C_FILEFOUNDMSG_LOC	"Ese archivo ya forma parte de este proyecto. No se convirtió ni agregó al proyecto."
#DEFINE C_MACLOGMSG_LOC	"(Versión Macintosh)"
#DEFINE C_WHEREIS_LOC		"Dónde está"
*- comments that will be inserted into code
#DEFINE C_PARM1_CMMT_LOC	"*- [CONVERTER] Instrucción Parameter generada por Converter" + CHR(13) + "*- [CONVERTER] Pasar estos valores al nuevo formulario" + CHR(13)
#DEFINE C_PARM2_CMMT_LOC	"*- [CONVERTER] Necesitamos agregar código especial por si no se transfiere ningún parámetro;" + CHR(13) + "*- [CONVERTER] no transferiremos parámetros predeterminados que no deba haber allí" + CHR(13)
#DEFINE C_OPENTAB_CMMT_LOC	"*- [CONVERTER] Abrir tablas para que haya campos disponibles" + CHR(13)
#DEFINE C_SETIDX_CMMT_LOC	"*- [CONVERTER] Abrir el archivo de índice .IDX de tipo antiguo especificado en el entorno de pantalla" + CHR(13)
#DEFINE C_PROCS_CMMT_LOC	"*- [CONVERTER] Principio de CLEANUP y otros procedimientos de formulario de la versión 2.x" + CHR(13)
#DEFINE C_PROCSEND_CMMT_LOC	"*- [CONVERTER] Fin de CLEANUP y otros procedimientos del formulario de la versión 2.x" + CHR(13)
#DEFINE C_VALID_CMMT_LOC	"*- [CONVERTER] Principio de procedimientos VALID/WHEN del formulario de 2.x" + CHR(13)
#DEFINE C_VALIDEND_CMMT_LOC	"*- [CONVERTER] Fin de los procedimientos VALID/WHEN de formulario de la versión 2.x" + CHR(13)
#DEFINE C_INCLUDE_CMMT_LOC	"*- [CONVERTER] Nuevo archivo INCLUDE, con #DEFINEs" + CHR(13)
#DEFINE C_EXTERN_CMMT_LOC	"*- [CONVERTER] Declarar matrices" + CHR(13)
#DEFINE C_SYS16_CMMT_LOC	"*- [CONVERTER] Sustitución de SYS(16) para dar cabida al código en la nueva posición" + CHR(13)
#DEFINE C_SYS16END_CMMT_LOC	"*- [CONVERTER] Fin de la sustitución de SYS(16)" + CHR(13)
#DEFINE C_RETVAL_CMMT_LOC	"*- [CONVERTER] _rval almacenará el valor devuelto" + CHR(13)
#DEFINE C_SETUP_CMMT_LOC	"*- [CONVERTER] Recordar el entorno" + CHR(13)
#DEFINE C_CLEANUP_CMMT_LOC	"*- [CONVERTER] Restaurar el entorno" + CHR(13)
#DEFINE C_MACRO_CMMT_LOC	"*- [CONVERTER] No se puede procesar una macro en la directiva del generador" + CHR(13)
#DEFINE C_H_CMMT_LOC		"*- [CONVERTER] Archivo de encabezado para "
#DEFINE C_SETSKIP_CMMT_LOC	"*- [CONVERTER] Establecer SET SKIP TO" + CHR(13)
#DEFINE C_FRXDESTROY_LOC	"*- [CONVERTER] Restablecer tablas para compatibilidad" + CHR(13)
#DEFINE C_CONV_CMMT_LOC		"*- [CONVERTER] "
#DEFINE C_GOTO1_CMMT_LOC	"*- [CONVERTER] Restablecer punteros de registro" + CHR(13)
#DEFINE C_GOTO2_CMMT_LOC	"*- [CONVERTER] Recordar punteros de registro" + CHR(13)
#DEFINE C_GOTOVAR1_CMMT_LOC	"*- [CONVERTER] Declarar variables para punteros de registro" + CHR(13)
#DEFINE C_GOTOVAR2_CMMT_LOC	"*- [CONVERTER] Liberar variables para punteros de registro" + CHR(13)

#DEFINE C_SELECTFILE_LOC	"Seleccione el archivo o directorio que desee actualizar."

*- These #defines are used by the LOCWORD procedure
#DEFINE C_TABLE_LOC			"Tabla"
#DEFINE C_QUERY_LOC			"Consulta"
#DEFINE C_FORM_LOC			"Pantalla"
#DEFINE C_REPORT_LOC		"Informe"
#DEFINE C_LABEL_LOC			"Etiqueta"
#DEFINE C_PROGRAM_LOC		"Programa"
#DEFINE C_CATALOG_LOC		"Catálogo"


*- file type parameters that will be passed to converter
*- do not localize
#DEFINE C_SCREENTYPEPARM	"SCREEN"
#DEFINE C_PROJECTTYPEPARM	"PROJECT"
#DEFINE C_CATALOGTYPEPARM	"CATALOG"
#DEFINE C_REPORTTYPEPARM	"REPORT"
#DEFINE C_MENUTYPEPARM		"MENU"
#DEFINE C_LABELTYPEPARM		"LABEL"
#DEFINE C_DB4QUERYTYPEPARM	"DB4QUERY"
#DEFINE C_DB4FORMTYPEPARM	"DB4FORM"
#DEFINE C_DB4REPORTTYPEPARM	"DB4REPORT"
#DEFINE C_DB4LABELTYPEPARM	"DB4LABEL"
#DEFINE C_DB4VERSIONPARM	"DBASE"
#DEFINE C_FOXVERSIONPARM	"FOX"
#DEFINE C_FMTTYPEPARM		"FORMAT"
#DEFINE C_FPLUSFRXTYPEPARM	"FB+FRX"

*- SCX Array numbers
#DEFINE	A_PLATFORM		1
#DEFINE	A_UNIQUEID		2
#DEFINE	A_TIMESTAMP		3
#DEFINE	A_OBJTYPE		4
#DEFINE	A_OBJCODE		5
#DEFINE	A_NAME			6
#DEFINE	A_EXPR			7
#DEFINE	A_VPOS			8
#DEFINE	A_HPOS			9
#DEFINE	A_HEIGHT		10
#DEFINE	A_WIDTH			11
#DEFINE	A_STYLE			12
#DEFINE	A_PICTURE		13
#DEFINE	A_ORDER			14
#DEFINE	A_UNIQUE		15
#DEFINE	A_COMMENT		16
#DEFINE	A_ENVIRON		17
#DEFINE	A_BOXCHAR		18
#DEFINE	A_FILLCHAR		19
#DEFINE	A_TAG			20
#DEFINE	A_TAG2			21
#DEFINE	A_PENRED		22
#DEFINE	A_PENGREEN		23
#DEFINE	A_PENBLUE		24
#DEFINE	A_FILLRED		25
#DEFINE	A_FILLGREEN		26
#DEFINE	A_FILLBLUE		27
#DEFINE	A_PENSIZE		28
#DEFINE	A_PENPAT		29
#DEFINE	A_FILLPAT		30
#DEFINE	A_FONTFACE		31
#DEFINE	A_FONTSTYLE		32
#DEFINE	A_FONTSIZE		33
#DEFINE	A_MODE			34
#DEFINE	A_RULER			35
#DEFINE	A_RULERLINES	36
#DEFINE	A_GRID			37
#DEFINE	A_GRIDV			38
#DEFINE	A_GRIDH			39
#DEFINE	A_SCHEME		40
#DEFINE	A_SCHEME2		41
#DEFINE	A_COLORPAIR		42
#DEFINE	A_LOTYPE		43
#DEFINE	A_RANGELO		44
#DEFINE	A_HITYPE		45
#DEFINE	A_RANGEHI		46
#DEFINE	A_WHENTYPE		47
#DEFINE	A_WHEN			48
#DEFINE	A_VALIDTYPE		49
#DEFINE	A_VALID			50
#DEFINE	A_ERRORTYPE		51
#DEFINE	A_ERROR			52
#DEFINE	A_MESSTYPE		53
#DEFINE	A_MESSAGE		54
#DEFINE	A_SHOWTYPE		55
#DEFINE	A_SHOW			56
#DEFINE	A_ACTIVTYPE		57
#DEFINE	A_ACTIVATE		58
#DEFINE	A_DEACTTYPE		59
#DEFINE	A_DEACTIVATE	60
#DEFINE	A_PROCTYPE		61
#DEFINE	A_PROCCODE		62
#DEFINE	A_SETUPTYPE		63
#DEFINE	A_SETUPCODE		64
#DEFINE	A_FLOAT			65
#DEFINE	A_CLOSE			66
#DEFINE	A_MINIMIZE		67
#DEFINE	A_BORDER		68
#DEFINE	A_SHADOW		69
#DEFINE	A_CENTER		70
#DEFINE	A_REFRESH		71
#DEFINE	A_DISABLED		72
#DEFINE	A_SCROLLBAR		73
#DEFINE	A_ADDALIAS		74
#DEFINE	A_TAB			75
#DEFINE	A_INITIALVAL	76
#DEFINE	A_INITIALNUM	77
#DEFINE	A_SPACING		78
#DEFINE	A_CURPOS		79

*- PJX Array numbers
#DEFINE	A_OPENFILES		1
#DEFINE	A_CLOSEFILES	2
#DEFINE	A_DEFWINDOWS	3
#DEFINE	A_RELWINDOWS	4
#DEFINE	A_READMODAL		5
#DEFINE	A_GETBORDERS	6
#DEFINE	A_READCYCLE		7
#DEFINE	A_READNOLOCK	8
#DEFINE	A_MULTIREADS	9
#DEFINE	A_ASSOCWINDS	10

*- SCX/PJX Array property mappings
#DEFINE	M_READONLY		"ReadOnly"
#DEFINE	M_READCYCLE		"ReadCycle"
#DEFINE	M_READNOLOCK	"ReadLock"
#DEFINE	M_READNOMOUSE	"ReadNoMouse"
#DEFINE	M_READSAVE		"ReadSave"
#DEFINE	M_READTIME		"ReadTimeout"
#DEFINE	M_READOBJ		"ReadObject"
#DEFINE	M_ASSOCWINDS	"WindowList"
#DEFINE	M_NAME			"Name"
#DEFINE	M_DATASOURCE	"ControlSource"
#DEFINE	M_CAPTION		"Caption"
#DEFINE	M_EXPR			"RowSource"
#DEFINE	M_VPOS			"Top"
#DEFINE	M_HPOS			"Left"
#DEFINE	M_HEIGHT		"Height"
#DEFINE	M_WIDTH			"Width"
#DEFINE	M_LSTYLE		"RowSourceType"
#DEFINE	M_STYLE			"Style"
#DEFINE	M_PICTURE		""
#DEFINE	M_FPICTURE		"Picture"	&& "Bitmap" Wallpaper
#DEFINE	M_ICON			"Icon"		&& Icon (Windows)
#DEFINE	M_UNIQUE		""
#DEFINE	M_ENVIRON		""
#DEFINE	M_BOXCHAR		""
#DEFINE	M_FILLCHAR		"DataType"
#DEFINE	M_TAG			""
#DEFINE	M_TAGD			"BottomCaption"  && DOS Only
#DEFINE	M_TAG2			""
#DEFINE	M_PEN			"ForeColor"
#DEFINE	M_BACKCOLOR		"BackColor"
#DEFINE M_FILLCOLOR		"FillColor"
#DEFINE	M_PENSIZE		"BorderWidth"
#DEFINE	M_PENPAT		"BorderStyle"
#DEFINE M_BORDERCOLOR	"BorderColor"
#DEFINE	M_FILLPAT		"FillStyle"
#DEFINE	M_FONTFACE		"FontName"
#DEFINE	M_FONTSIZE		"FontSize"
#DEFINE	M_FONTBOLD		"FontBold"
#DEFINE	M_FONTITAL		"FontItalic"
#DEFINE	M_FONTUNDER		"FontUnderline"
#DEFINE M_FONTSHADOW	"FontShadow"
#DEFINE M_FONTOUTLINE	"FontOutline"
#DEFINE M_FONTCONDENSE	"FontCondense"
#DEFINE M_FONTEXTEND	"FontExtend"
#DEFINE	M_FONTOPAQ		"FontOpaque"
#DEFINE	M_FONTTRANS		"FontTransparent"
#DEFINE	M_MODE			"BackStyle"
#DEFINE	M_RULER			""
#DEFINE	M_RULERLINES	""
#DEFINE	M_GRID			""
#DEFINE	M_GRIDV			""
#DEFINE	M_GRIDH			""
#DEFINE	M_SCHEME		"ColorScheme"
#DEFINE	M_SCHEME2		""
#DEFINE	M_COLORPAIR		""
#DEFINE	M_RANGELO		"LowValue"
#DEFINE	M_RANGEHI		"HighValue"
#DEFINE	M_RANGE2LO		"RangeLow"
#DEFINE	M_RANGE2HI		"RangeHigh"
#DEFINE	M_1STELEMENT	"FirstElement"
#DEFINE	M_NUMELEMENTS	"NumberOfElements"
#DEFINE	M_WHEN			"ReadWhen"
#DEFINE	M_WHEN2			"When"
#DEFINE	M_VALID			"ReadValid"
#DEFINE	M_VALID2		"Valid"
#DEFINE	M_ERROR			"ErrorMessage"		&& Error method
#DEFINE	M_MESSAGE		"Message"  			&& "StatusBarText"
#DEFINE	M_SHOW			"ReadShow"
#DEFINE	M_ACTIVATE		"ReadActivate"
#DEFINE	M_DEACTIVATE	"ReadDeactivate"
#DEFINE	M_PROCCODE		""
#DEFINE M_CLEANUP		"Unload"
#DEFINE	M_SETUP1		"Load"
#DEFINE	M_SETUP2		"Load"				&&??? may change
#DEFINE	M_FLOAT			"Movable"
#DEFINE	M_CLOSE			"Closable"
#DEFINE	M_MINIMIZE		"MinButton"
#DEFINE M_MAXIMIZE		"MaxButton"
#DEFINE M_CONTROLBOX	"ControlBox"
#DEFINE M_GROW			"Sizable"
#DEFINE M_MDI			"MDIChild"
#DEFINE M_DESKTOP		"Desktop"
#DEFINE M_WINDOW		"Window"
#DEFINE	M_BORDER		"BorderStyle"
#DEFINE	M_SHADOW		"Shadow"
#DEFINE	M_CENTER		"AutoCenter"
#DEFINE	M_HALF			"HalfHeightCaption"
#DEFINE	M_REFRESH		""
#DEFINE	M_ENABLED		"Enabled"
#DEFINE	M_SCROLLBAR		"ScrollBars"
#DEFINE	M_ADDALIAS		""
#DEFINE	M_TAB			"AllowTabs"
#DEFINE	M_FORMTABS		"Tabs"
#DEFINE	M_FORMPAGES		"PageCount"
#DEFINE	M_INITIALVAL	""
#DEFINE	M_INITIALNUM	""
#DEFINE	M_BUTTONS		"ButtonCount"
#DEFINE	M_SPACING		"ButtonSpacing"
#DEFINE	M_CURPOS		""
#DEFINE	M_READ			"WindowType"
#DEFINE	M_ALIGN			"Alignment"
#DEFINE M_VALUE			"Value"
#DEFINE M_INIT			"Init"
#DEFINE M_SHAPE			"Shape"
#DEFINE M_CURVE			"Curvature"
#DEFINE M_FORMAT		"Format"
#DEFINE M_INPUTMSK		"InputMask"
#DEFINE M_MAXLEN		"MaxLength"
#DEFINE M_SPINLO		"SpinnerLowValue"
#DEFINE M_SPINHI		"SpinnerHighValue"
#DEFINE M_KEYLO			"KeyboardLowValue"
#DEFINE M_KEYHI			"KeyboardHighValue"
#DEFINE M_SPININC		"Increment"
#DEFINE M_SPECIAL		"SpecialEffect"
#DEFINE M_ERASEPAGE		"ErasePage"
#DEFINE M_DRAWFRAME		"DrawFrame"
#DEFINE M_RELEASEWIND	"ReleaseWindows"
#DEFINE M_RELEASEERASE	"ReleaseErase"
#DEFINE M_TERMINATEREAD	"TerminateRead"
#DEFINE M_STRETCH		"Stretch"
#DEFINE M_COLORSOURCE	"ColorSource"
#DEFINE M_MARGIN		"Margin"
#DEFINE M_READSIZE		"ReadSize"		&& property for listboxes
#DEFINE M_TABSTOP		"TabStop"		&& use for SAYs (read-only textboxes)
#DEFINE M_SCALEMODE		"ScaleMode"
#DEFINE M_DISFORECOLOR	"DisabledForeColor"
#DEFINE M_DISBACKCOLOR	"DisabledBackColor"
#DEFINE M_ITEMFORECOLOR	"ItemForeColor"
#DEFINE M_ITEMBACKCOLOR	"ItemBackColor"
#DEFINE M_DISITEMFORECOLOR	"DisabledItemForeColor"
#DEFINE M_DISITEMBACKCOLOR	"DisabledItemBackColor"
#DEFINE M_SELITEMBACKCOLOR	"SelectedItemBackColor"
#DEFINE M_WORDWRAP		"WordWrap"
#DEFINE M_DEFAULT		"Default"
#DEFINE M_CANCEL		"Cancel"		&& new Cancel property
#DEFINE M_FORMACTIVATE	"Activate"		&& Form activate
#DEFINE M_AUTOACTIVATE	"AutoActivate"
#DEFINE M_ZOOMBOX		"ZoomBox"

*- DataNav properties
#DEFINE M_AUTOLOADENV		"AutoOpenTables"
#DEFINE M_AUTOUNLOADENV		"AutoCloseTables"
#DEFINE M_ALIAS				"Alias"
#DEFINE M_WORKAREA			"WorkArea"
#DEFINE M_CURSORSRC			"CursorSource"
#DEFINE M_SOURCETYPE		"SourceType"
#DEFINE M_ORDER				"Order"
#DEFINE M_FILTER			"Filter"
#DEFINE M_EXCLUSIVE			"Exclusive"
#DEFINE M_CHILDALIAS		"ChildAlias"
#DEFINE M_CHILDINDEXTAG		"ChildOrder"
#DEFINE M_PARENTALIAS		"ParentAlias"
#DEFINE M_PARENTINDEXEXPR	"RelationalExpr"
#DEFINE M_RELATIONTYPE		"RelationType"
#DEFINE M_ONETOMANY			"OneToMany"
#DEFINE M_INITIALALIAS		"InitialSelectedAlias"


*- 3.0 Form Controls Classes - don't localize
#DEFINE	T_FSET		"formset"
#DEFINE	T_FORM		"form"
#DEFINE	T_LABEL		"label"
#DEFINE	T_LINE		"line"
#DEFINE	T_SHAPE		"shape"
#DEFINE	T_LIST		"listbox"
#DEFINE	T_BTN		"commandgroup"
#DEFINE	T_BTNGRP	"commandgroup"
#DEFINE	T_RADIO		"optionbutton"
#DEFINE	T_RADIOGRP	"optiongroup"
#DEFINE	T_CBOX		"checkbox"
#DEFINE	T_SAY		"textbox"
#DEFINE	T_GET		"textbox"
#DEFINE	T_EDIT		"editbox"
#DEFINE	T_POPUP		"combobox"
#DEFINE	T_SPIN		"spinner"
#DEFINE	T_OLE		"oleboundcontrol"
#DEFINE	T_PICT		"image"
#DEFINE	T_INV		"commandgroup"
#DEFINE	T_INVGRP	"commandgroup"
#DEFINE	T_PAGE		"pageframe"
#DEFINE T_DATANAV	"dataenvironment"
#DEFINE T_CURSOR	"cursor"
#DEFINE T_RELATION	"relation"
#DEFINE	T_SUBCLASS	"????"

*- Misc things
#DEFINE C_TRUE			.T.				&& 1=1
#DEFINE C_FALSE			.F.				&& 1=2
#DEFINE	C_SCXEXT		"SCX"			&& 2.x screen extension
#DEFINE	C_SCTEXT		"SCT"			&& 2.x screen memo extension
#DEFINE	C_SPREXT		"SPR"			&& 2.x screen gen extension
#DEFINE	C_VCXEXT		"VCX"			&& 3.0 visual class extension
#DEFINE	C_VCTEXT		"VCT"			&& 3.0 visual class extension
#DEFINE C_MACEXT		"_MAC"			&& extension to add for Mac files

#DEFINE C_SEP			" = "			&& property separator
#DEFINE C_WINFONT		"MS SANS SERIF"	&& FPW default font
#DEFINE C_WINFSIZE		8				&& FPW default font size
#DEFINE C_MAXWINDS		25
#DEFINE C_MAXPLATFORMS	4	
#DEFINE C_MAXSCREENS	5
#DEFINE C_20SCXFLDS		57
#DEFINE C_30SCXFLDS		23
#DEFINE C_SCXFLDS		79
#DEFINE C_PJX40FLDS		28
#DEFINE C_PJX30FLDS		26
#DEFINE C_PJX25FLDS		31
#DEFINE C_PJX20FLDS		33
#DEFINE C_FPCFLDS		10
#DEFINE C_20FRXFLDS		36
#DEFINE C_FRXFLDS		74
#DEFINE C_30FRXFLDS		75
#DEFINE C_20LBXFLDS		17
#DEFINE C_30DBCFLDS		8				&& field count for DBCs -- need to be recompiled in 5.0
#DEFINE C_FILELEN		30
#DEFINE C_DOS     		"DOS"
#DEFINE C_WINDOWS 		"WINDOWS"
#DEFINE C_MAC     		"MAC"
#DEFINE C_UNIX    		"UNIX"
#DEFINE C_All    		"ALL"
#DEFINE C_DEFSET		"Formset"
#DEFINE C_PAGEFRAME		"PageFrame1"
#DEFINE C_DEFPAGE		"Page1"
#DEFINE C_DEFDATANAV	"DataEnvironment"
#DEFINE C_DEFCURSOR		"Cursor1"
#DEFINE C_BACKDIR		"OLD"
#DEFINE C_FORMCLASS		"form"
#DEFINE C_THERMCLASS1	"thermometer"		&& single progress bar
#DEFINE C_THERMCLASS2	"therm2"			&& double progress bar
#DEFINE N_THERM2X		.80					&& portion of second bar devoted to converting project files -- must be < .097
#DEFINE N_THERM3X		.90					&& portion of second bar devoted to converting project files -- must be < .097
#DEFINE C_SELITEMCOLOR	"164,200,240"		&& color for selected item in list
#DEFINE C_DELOAD_METH	"Init"				&& DataEnvironment method where IDX files are opened
#DEFINE C_SEPARATOR		"*----- "
#DEFINE K_TIMEOUT_FACTOR	1000			&& VFP seems to measure READTIMEOUT in milliseconds
#DEFINE N_BLOCKSZ		0					&& block size for newly created scx files
#DEFINE N_BUFFSZ		1024				&& amount to read at one time from compiled FRX code

* Definitions for Objtype fields in screens/reports/labels
#DEFINE N_OTHEADER         1

#DEFINE N_MAXTRANFILETYPES	3				&& number of file types that transporter can handle (All,PJX, SCX, FRX)
#DEFINE N_TRANFILE_PJX	1
#DEFINE N_TRANFILE_SCX	2
#DEFINE N_TRANFILE_FRX	3

#DEFINE C_CURSSOURCTYPE		1
#DEFINE N_PIXELMODE			1				&& scalemode type
#DEFINE I_DEFCOLORSOURCE	3				&& default color source
#DEFINE I_WINCPCOLORSOURCE	5				&& Windows Control Panel / Window Colors

#DEFINE I_DISKFULLERR		56				&& disk full error number

#DEFINE C_LOGEXT		"LOG"				&& extension for log file

#DEFINE C_CONTROLS		"CTL"
#DEFINE C_DNO			"DNO"
#DEFINE C_VCX			"VCX"
#DEFINE N_VCXTYPE		99
#DEFINE C_30VERS		"3.0"

#DEFINE C_TRANSPORT		"transprt"			&& transport program to use, if _transport is empty
											&& it is passed the following parms:
											&& m.g_scrndbf		file to transport (C)
											&& m.tp_filetype	file type (N) see transprt.prg for possible values
											&& m.dummy			not used
											&& m.gAShowMe		3 X 6 array
											&& m.gOTherm		ref to thermometer object
											&& m.cRealName		name of file to display in dialogs
											&& m.lPJX			called as part of a project?

#DEFINE C_DATANAVLOAD	"THIS.DataEnvironment.OpenTables"
#DEFINE C_SETSKIP		"SET SKIP TO "		&& don;t localize -- for SET SKIP to in DataEnvironment
#DEFINE C_SELECT		C_SETSKIP_CMMT_LOC + ;
						"SELECT "			&& don;t localize -- for SET SKIP to in DataEnvironment
#DEFINE C_DATANAVOPEN	"PROCEDURE Init" + C_CR
#DEFINE C_FRXDEDESTROY	C_CR + "PROCEDURE Destroy" + C_CR + ;
						C_FRXDESTROY_LOC + ;
						"THIS.OpenTables" + C_CR + ;
						"THIS.Init" + C_CR
#DEFINE C_GOTOVARPRE	"_iconv"
#DEFINE C_GOTOVAREXT	"GoToPlaceHolder"
#DEFINE C_GOTO1			 C_CR + C_GOTO1_CMMT_LOC + ;
						[LOCAL aTbl, iLen, i, iRec, cVar, iPrev] + C_CR + ;
						[iPrev = SELECT()] + C_CR + ;
						"DIMENSION aTbl[1,2]" + C_CR + ;
						[iLen = AUSED(aTbl)] + C_CR + ;
						[FOR i = 1 TO iLen] + C_CR + ;
						C_TAB + "cVar = '_iconv' + PROPER(aTbl[i,1]) + 'GoToPlaceHolder'" + C_CR +;
						C_TAB + [IF TYPE(cVar) # 'N'] + C_CR + ;
						C_TAB + C_TAB + [iRec = -2] + C_CR + ;
						C_TAB + [ELSE] + C_CR + ;
						C_TAB + C_TAB + [iRec = EVAL(cVar)] + C_CR + ;
						C_TAB + [ENDIF] + C_CR + ;
						C_TAB + "IF USED(aTbl[i,1])" + C_CR + ;
						C_TAB + C_TAB + "SELECT (aTbl[i,1])" + C_CR + ;
						C_TAB + C_TAB + [DO CASE] + C_CR + ;
						C_TAB + C_TAB + C_TAB + [CASE BETWEEN(iRec, 1, RECCOUNT())] + C_CR + ;
						C_TAB + C_TAB + C_TAB + C_TAB + [GOTO iRec] + C_CR + ;
						C_TAB + C_TAB + C_TAB + [CASE iRec = 0] + C_CR + ;
						C_TAB + C_TAB + C_TAB + C_TAB + [GO TOP] + C_CR + ;
						C_TAB + C_TAB + C_TAB + C_TAB + [SKIP IIF(!BOF(),-1,0)] + C_CR + ;
						C_TAB + C_TAB + C_TAB + [CASE iRec = -1] + C_CR + ;
						C_TAB + C_TAB + C_TAB + C_TAB + [GO BOTTOM] + C_CR + ;
						C_TAB + C_TAB + C_TAB + C_TAB + [SKIP IIF(!EOF(),1,0)] + C_CR + ;
						C_TAB + C_TAB + C_TAB + [OTHERWISE] + C_CR + ;
						C_TAB + C_TAB + C_TAB + C_TAB + [GO TOP] + C_CR + ;
						C_TAB + C_TAB + [ENDCASE] + C_CR + ;
						C_TAB + [ENDIF] + C_CR + ;
						[NEXT] + C_CR + ;
						[IF iPrev > 0] + C_CR + ;
						C_TAB + [IF USED(iPrev)] + C_CR + ;
						C_TAB + C_TAB + [SELECT (iPrev)] + C_CR + ;
						C_TAB + [ENDIF] + C_CR + ;
						[ENDIF] + C_CR + ;
						[RELEASE aTbl, iLen, i, iRec, cVar, iPrev] + C_CR

#DEFINE C_GOTO2A		[IF USED("]
#DEFINE C_GOTO2			[")] + C_CR + C_TAB + [SELECT ]
#DEFINE C_GOTO3			[ = IIF(BOF(), 0, IIF(EOF(), -1, RECNO()))] + C_CR + ;
						[ENDIF] + C_CR

*- code for setup and cleanup in SCX files
#DEFINE C_SETUP_CODE		C_SETUP_CMMT_LOC + ;
							[PRIVATE m.compstat, m.currarea, m.rborder, m.talkstat] + C_CRLF + ;
							[IF SET("TALK") = "ON"] + C_CRLF + ;
							C_TAB + [SET TALK OFF] + C_CRLF + ;
							C_TAB + [m.talkstat = "ON"] + C_CRLF + ;
							[ELSE] + C_CRLF + ;
							C_TAB + [m.talkstat = "OFF"] + C_CRLF + ;
							[ENDIF] + C_CRLF + ;
							[m.compstat = SET("COMPATIBLE")] + C_CRLF + ;
							[SET COMPATIBLE FOXPLUS] + C_CRLF + ;
							C_CRLF + ;
							[m.rborder = SET("READBORDER")] + C_CRLF + ;
							[SET READBORDER ON] + C_CRLF + ;
							C_CRLF + ;
							[m.currarea = SELECT()] + C_CRLF + ;
							C_CRLF

#DEFINE C_CLEANUP_CODE		C_CLEANUP_CMMT_LOC + ;
							[IF TYPE("rborder") == 'C'] + C_CRLF + ;
							C_TAB + [SET READBORDER &rborder] + C_CRLF + ;
							[ENDIF] + C_CRLF + ;
							C_CRLF + ;
							[IF TYPE("talkstat") == 'C'] + C_CRLF + ;
							C_TAB + [IF m.talkstat = "ON"] + C_CRLF + ;
							C_TAB + C_TAB + [SET TALK ON] + C_CRLF + ;
							C_TAB + [ENDIF] + C_CRLF + ;
							[ENDIF] + C_CRLF + ;
							C_CRLF + ;
							[IF TYPE("compstat") == 'C'] + C_CRLF + ;
							C_TAB + [IF m.compstat = "ON"] + C_CRLF + ;
							C_TAB + C_TAB + [SET COMPATIBLE ON] + C_CRLF + ;
							C_TAB + [ENDIF] + C_CRLF + ;
							[ENDIF] + C_CRLF + C_CRLF

#DEFINE C_SCXBACKEXT	"S2X"
#DEFINE C_SCTBACKEXT	"S2T"
#DEFINE C_FPCBACKEXT	"C2C"
#DEFINE C_FCTBACKEXT	"C2T"
#DEFINE C_FRXBACKEXT	"F2X"
#DEFINE C_FRTBACKEXT	"F2T"
#DEFINE C_LBXBACKEXT	"L2X"
#DEFINE C_LBTBACKEXT	"L2T"
#DEFINE C_VCXBACKEXT	"V3X"
#DEFINE C_VCTBACKEXT	"V3T"

#DEFINE N_3D			0
#DEFINE N_PLAIN			1
#DEFINE C_OPAQUE		1
#DEFINE N_TRANSPARENT	0
#DEFINE L_CONVERT		.T.
#DEFINE L_NOCONVERT		.F.

#DEFINE C_IDBYTE30		CHR(48)

#DEFINE DT_DFLTTIME		"01/01/95 12:00"
*- Project types that need to be converted
#DEFINE C_SCREENSET		"s"
#DEFINE C_SCREEN		"S"
#DEFINE C_MENU			"M"
#DEFINE C_QUERY			"Q"
#DEFINE C_REPORT		"R"
#DEFINE C_LABEL			"B"
#DEFINE C_FORMAT		"F"
#DEFINE C_HEADER		"H"

*- other (may be 3.0) project types
#DEFINE C_SCXTYPE		"K"
#DEFINE C_VCXTYPE		"V"
#DEFINE C_PRGTYPE		"P"
#DEFINE C_DBCTYPE		"d"			&& 3.0 database

*- catalog manager file types
#DEFINE C_FPCCATTYPE		"fpc"
#DEFINE C_FPCSCREENTYPE		"scx"
#DEFINE C_FPCLABELTYPE		"lbx"
#DEFINE C_FPCCSQUERYTYPE	"csq"
#DEFINE C_FPCUPQUERYTYPE	"fpq"
#DEFINE C_FPCSQLQUERYTYPE	"qpr"
#DEFINE C_FPCREPORTTYPE		"frx"
#DEFINE C_FPCDBFTYPE		"dbf"
#DEFINE C_FPCAPPTYPE		"app"
#DEFINE C_FPCPRGTYPE		"prg"

#DEFINE C_DB4CATTYPE		"cat"
#DEFINE C_DB4SCREENTYPE		"scr"
#DEFINE C_DB4LABELTYPE		"lbl"
#DEFINE C_DB4UPQUERYTYPE	"upd"
#DEFINE C_DB4SQLQUERYTYPE	"qbe"
#DEFINE C_DB4REPORTTYPE		"frm"
#DEFINE C_DB4DBFTYPE		"dbf"

*- DBase IV values
#DEFINE dbiv_lbl_type 11
#DEFINE dbiv_scr_type 18
#DEFINE dbiv_frm_type  7

*- FRX ObjType values for new DataEnvironment objects
#DEFINE N_FRX_DATAENV	25
#DEFINE N_FRX_CURSOR	26
#DEFINE N_FRX_RELATION	26

*- these codes replicate FOXPRO.H #DEFINEs

*-- MessageBox parameters
#DEFINE MB_OK                   0       && OK button only
#DEFINE MB_OKCANCEL             1       && OK and Cancel buttons
#DEFINE MB_ABORTRETRYIGNORE     2       && Abort, Retry, and Ignore buttons
#DEFINE MB_YESNOCANCEL          3       && Yes, No, and Cancel buttons
#DEFINE MB_YESNO                4       && Yes and No buttons
#DEFINE MB_RETRYCANCEL          5       && Retry and Cancel buttons

*-- MsgBox return values
#DEFINE IDOK            1       && OK button pressed
#DEFINE IDCANCEL        2       && Cancel button pressed
#DEFINE IDABORT         3       && Abort button pressed
#DEFINE IDRETRY         4       && Retry button pressed
#DEFINE IDIGNORE        5       && Ignore button pressed
#DEFINE IDYES           6       && Yes button pressed
#DEFINE IDNO            7       && No button pressed

*-- Low Level File Constants
#DEFINE F_READONLY              0
#DEFINE F_WRITEONLY             1
#DEFINE F_READWRITE             2
#DEFINE F_READONLY_UNBUFF       10
#DEFINE F_WRITEONLY_UNBUFF      11
#DEFINE F_READWRITE_UNBUFF      12

*- end of CONVERT.H