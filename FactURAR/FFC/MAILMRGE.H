*- MAILMRGE.H
*- #DEFINEs for MAILMRGE.VCX

#DEFINE L_DEBUG .F.

*- localize these
#DEFINE C_STARTWORD60_LOC	"Iniciando Microsoft Word ..."
#DEFINE C_STARTWORD20_LOC	"Iniciando Microsoft Word 2.0..."
#DEFINE C_STARTWORD80_LOC	"Iniciando Microsoft Word ..."
#DEFINE C_OPENDATA80_LOC	"Abriendo origen de datos..."
#DEFINE C_MMSAVEAS_LOC		"Guardar datos combinados como:"
#DEFINE C_DFLTNAME_LOC		"mrgdata.txt"
#DEFINE C_DFLTDBF_LOC		"mrgdata.dbf"

#DEFINE E_NOOPENWORD_LOC	"Error al obtener objeto Word OLE."
#DEFINE E_FILEERR_LOC		"Error al escribir los datos combinados."
#DEFINE E_NOMSWLAUNCH_LOC	"No se pudo iniciar Microsoft Word."
#DEFINE E_WRONGWORD_LOC		"Está ejecutando una versión incorrecta de Microsoft Word. Se canceló la combinación de datos."
#DEFINE E_NOWORDERR_LOC		"No se pudo encontrar Microsoft Word para Windows @1 en este equipo."
#DEFINE E_NOWORDMACERR_LOC	"Microsoft Word para Macintosh 6.0 no está instalado en este equipo."
#DEFINE E_MSWCOMMFAIL_LOC	"No se pudo completar la tarea. Compruebe si MS Word tiene algún cuadro de diálogo abierto u otro problema..."
#DEFINE E_NODBC_LOC			"Las tablas DBC no son compatibles todavía con los controladores ODBC. Debe usar una tabla FoxPro libre."
#DEFINE E_DDEERR_LOC		"La última acción DDE no finalizó correctamente. El código de error DDE es @1."

*- error messages for bad values in MailMerge class
#DEFINE E_BADWORDPROC_LOC	"Valor no válido para procesador de palabras."
#DEFINE E_BADEXDOC_LOC		"Se especificó un documento que no existe."
#DEFINE E_BADMRGDATA_LOC	"No se especificó un destino para la combinación de datos."
#DEFINE E_BADTEMPLATE_LOC	"Valor no válido para la plantilla Word."
#DEFINE E_NODATA_LOC		"No se especificó un origen de datos."
#DEFINE E_NOFIELDS_LOC		"No ha especificado campos de datos."

#DEFINE	E_ODBC1_LOC			"No se puede encontrar el archivo ODBC.INI. compruebe que ODBC está correctamente instalado."
#DEFINE	E_ODBC2_LOC			"No se pudo encontrar los archivos del controlador ODBC para FoxPro. Compruebe si está instalado."
#DEFINE	E_ODBC3_LOC			"Entrada de los archivos FoxPro no válida en el archivo ODBC.INI."
#DEFINE	E_ODBCDLL_LOC		"No se pudo comprobar si los archivos ODBC instalados son correctos."

#DEFINE E_NOOPENTBL_LOC		"No se puede abrir la tabla de datos para uso compartido. Se canceló Mailmerge."
#DEFINE E_NOREPLACETBL_LOC	"No se pudo reemplazar el archivo. Se canceló Mailmerge."
#DEFINE E_NOAPPLESCRIPT_LOC	"AppleScript" + CHR(170) + " no está instalado en este equipo. Inicie Word y complete la combinación de datos manualmente."

#DEFINE C_LOCATEDLL_LOC		"El asistente no pudo comprobar si tiene ODBC instalado. ¿Desea continuar como si lo tuviera?"
#DEFINE C_NOVERIFYMSW_LOC	"El asistente no pudo comprobar si tiene Microsoft Word instalado. ¿Desea continuar como si lo tuviera?"
#DEFINE C_COPYFOX2_LOC		"No tiene los controladores ODBC para tablas Visual FoxPro 3.0. "+"¿Desea copiar la tabla seleccionada al tipo FoxPro 2.5 "+							"para que se pueda generar un archivo de datos combinados?"


#DEFINE C_COPYFOX3_LOC		"Ha seleccionado una vista como su origen de datos. " +"Debe copiar la vista para poder generar un archivo de datos combinados. ¿Desea continuar?"

#DEFINE C_COPYPROMPT_LOC	"Copiar tabla a:"
#DEFINE C_ERROR_SQL_LOC		"La instrucción SQL generada es demasiado larga. Seleccione menos campos."
#DEFINE C_LOCATE_LOC		"Buscar "
#DEFINE	C_ODBCOLDVER_LOC	"La configuración de la versión en los archivos de origen de datos ODBC para FoxPro está establecida para archivos FoxPro 2.0. "+"El Asistente para combinar datos puede no procesar caracteres internacionales o campos General correctamente. "+							"Puede cambiar esta configuración a FoxPro 2.6 si utiliza el Panel de control ODBC."


#DEFINE	C_EXCLDBC1_LOC		"Word no puede combinar datos desde la base de datos seleccionada '"
#DEFINE	C_EXCLDBC2_LOC		"' si no la abre de forma compartida. ¿Desea que el  Asistente para datos combinados abra de nuevo la base de datos de manera compartida?"


*- don't localize these

*- if these are changed, also change in MAILMRGE.H
*- supported word procs/merge types
#DEFINE		N_WORD60		1
#DEFINE		N_WORD20		3		&& not supported in 5.0
#DEFINE		N_COMMADELIM	2

*- new/old doc
#DEFINE		N_NEW_DOC		1
#DEFINE		N_EXISTING_DOC	2

*- template types
#DEFINE		N_FORMLETTER	1
#DEFINE		N_LABEL			2
#DEFINE		N_ENVELOPE		3
#DEFINE		N_CATALOG		4

*- used in startword
#DEFINE C_MSWORDMAC		"Microsoft Word"
#DEFINE C_MSWORDEXE		"winword.exe"
#DEFINE C_MSWORDWIN		"Winword"
#DEFINE C_MSWORDCREATOR	"MSWD"

#DEFINE C_WORD2				"2.0"
#DEFINE C_WORD6				"6.0"
#DEFINE C_WORD6_OR_LATER	"6.0"
#DEFINE C_WORD8				"8.0"

*- MSW 2.0 values
#DEFINE C_WIN_SECT2			"Microsoft Word 2.0"

*- MSW 6.0 values
#DEFINE C_WIN_SECT6			"Microsoft Word"
#DEFINE C_WIN_MSW6INI		"Winword6.INI"

#DEFINE C_WIN_DIR			"programdir"

*- entry in Mac FoxPro settings file
#DEFINE C_FOXPROINI_MAC		"Visual Foxpro Settings"
#DEFINE C_WORD6ID			"Word6Loc"
#DEFINE C_MAILMRG_SECT		"Mailmerge"
#DEFINE C_WORDSETTINGS		"Word Settings (6)"

*- DDE Errors
#DEFINE N_BADCHANNELERR		 6
#DEFINE N_TIMEOUTERR		 9
#DEFINE N_NOCLIENTERR		13

*- AppleScript related errors
#DEFINE N_RUNSCRIPTFAIL		1921	&& VFP error numbers
#DEFINE N_SCRIPTERROR		1917

#DEFINE L_GETFILE			.T.
#DEFINE L_DONTGETFILE		.F.

#DEFINE K_HIGHTIMEOUT	20000
#DEFINE K_DFLTTIMEOUT	 2000

*- MSW 2.0 values
#DEFINE WIN_SECT2	"Microsoft Word 2.0"
#DEFINE WIN_DIR		"programdir"

*- MSW 6.0 values
#DEFINE WIN_SECT6	"Microsoft Word"
#DEFINE WIN_MSW6INI	"Winword6.INI"
#DEFINE WIN_6OBJ	"word.basic"

*- MSW 8.0 values
#DEFINE WIN_8OBJ	"word.application.8"

*- ODBC Driver info
#DEFINE K_TAB			CHR(9)
#DEFINE C_CRLF			CHR(13) + CHR(10)
#DEFINE C_CR			CHR(13)

#DEFINE K_TOOLONG		150		&& max length of a SQL statement for DDE
#DEFINE K_TRANSFER		1024 * 20

#DEFINE K_LOCALVIEW		1
#DEFINE K_REMOTEVIEW	2
#DEFINE K_TABLE			3

#DEFINE	DBFTYPE_30		48

#DEFINE EXT_DBF			"DBF"
#DEFINE EXT_TXT			"TXT"

******************************************************************************
* Used by GetOS and other methods
******************************************************************************
* Operating System codes
#DEFINE	OS_W32S				1
#DEFINE	OS_NT				2
#DEFINE	OS_WIN95			3
#DEFINE	OS_MAC				4
#DEFINE	OS_DOS				5
#DEFINE	OS_UNIX				6


#DEFINE	REG_MSWDOC_KEY		"Word.Document"

#DEFINE	I_ENGLISH			1033			&& code for English

#DEFINE	FOXODBC_ANY			"FoxPro"

#DEFINE I_WDDIALOGMAILMERGEHELPER	680		&& Word code for Mailmerge Helper dialog

*- registry codes
#DEFINE	ERROR_SUCCESS		0
#DEFINE	ERROR_NOINIFILE		-108	&& no DLL file used to check ODBC
#DEFINE	ERROR_NOINIENTRY	-109	&& no entry found in INI file (section)
#DEFINE	ERROR_FAILINI		-110	&& no entry found in INI file

*- eof  MAILMRGE.H