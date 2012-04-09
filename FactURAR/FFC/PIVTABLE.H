*- PIVTABLE.H
*- #DEFINEs for PIVTABLE.VCX

#DEFINE L_DEBUG .F.

*- localize these
#DEFINE ALERTTITLE_LOC			"Asistentes de Microsoft Visual FoxPro"

#DEFINE		C_EXCLDBC1_LOC		"Excel no puede crear una tabla dinámica desde la base de datos seleccionada '"
#DEFINE		C_EXCLDBC2_LOC		"' si no la abre de forma compartida. ¿Desea que el Asistente para tablas dinámicas abra de nuevo la base de datos de forma compartida?"
#DEFINE 	C_STARTXL_LOC		"Iniciando Microsoft Excel..."
#DEFINE 	C_LARGEPIVOT_LOC	"Ha seleccionado un conjunto de resultados para la tabla dinámica que puede ser muy grande. "+"¿Desea continuar?"

#DEFINE 	C_NORECORDS_LOC		"La tabla seleccionada no contiene registros. No se creará la tabla dinámica de Excel."
#DEFINE		C_LONGFNAME_LOC		"Tiene instalado un origen de datos ODBC para FoxPro no compatible con tablas FoxPro de nombres largos o rutas DOS y nombres de archivo ilegales. "+"Sugerimos que instale el controlador VFP ODBC para evitar este mensaje en el futuro. "+								"Si selecciona continuar, debe cambiar el nombre o copiar la tabla seleccionada a una con un nombre de archivo DOS estándar. ¿Desea copiar el archivo ahora?"


#DEFINE 	C_COPYPROMPT_LOC	"Copiar tabla a:"
#DEFINE		C_WAITMESS_LOC		"Espere mientras se genera la tabla dinámica..."

#DEFINE 	E_NOFORM_LOC		"No se ha especificado un archivo de formulario. No se puede continuar."
#DEFINE		E_BADMSQUERY_LOC	"No se ha instalado Microsoft Query correctamente y es necesario para crear la tabla dinámica Excel."
#DEFINE		E_FAILXL_LOC		"Error al obtener el objeto Excel OLE."
#DEFINE 	E_NOREG_LOC			"Microsoft Excel no está correctamente registrado en la tabla de registro de Windows para ser utilizado con OLE."
#DEFINE		E_OLDXLVER_LOC		"La herramienta de automatización no puede utilizar su versión de Microsoft Excel. Debe tener instalada la versión 5.0 o posterior."
#DEFINE 	E_OLEERROR_LOC		"Error de automatización OLE. Su tabla dinámica Excel puede estar incompleta."

*- error checks for the automation tool
#DEFINE		E_NEEDALIAS_LOC		"La herramienta Tabla dinámica necesita que el campo cAlias tenga un valor."
#DEFINE		E_NEEDTABLE_LOC		"La herramienta Table dinámica necesita que el campo cDBCTable tenga un valor."
#DEFINE		E_NEEDDBC_LOC		"La herramienta Table dinámica necesita que el campo cDBCName tenga un valor."
#DEFINE		E_NEEDROW_LOC		"La herramienta Table dinámica necesita que el campo cPivFldRow tenga un valor."
#DEFINE		E_NEEDCOL_LOC		"La herramienta Table dinámica necesita que el campo cPovFldCol tenga un valor."
#DEFINE		E_NEEDDATA_LOC		"La herramienta Table dinámica necesita que el campo cPivFldData tenga un valor."
#DEFINE		E_NEEDFIELDS_LOC	"La herramienta Table dinámica necesita que el campo aAutoFields tenga un valor."
#DEFINE		E_NEEDFLDLIST_LOC	"La herramienta Table dinámica necesita que el campo aFldList tenga un valor."

*- localize?
#DEFINE		OLE_XLAPP			"excel.application"

*- don't localize these		
#DEFINE		C_MSQRY32			"MSQRY32.EXE"
#DEFINE		C_PATH				"Path"
#DEFINE 	QUERY_ROOT			"Software\Microsoft\Shared Tools\MSQuery"

#DEFINE 	XL_CLASS			"Excel.Sheet"
#DEFINE 	XLCOUNT				-4113						&& Excel count function constant

#DEFINE MAX_RECORDS		500
#DEFINE MAX_PIVROWS		300
#DEFINE MAX_PIVCOLS		100
#DEFINE MAX_PIVPAGES	100
#DEFINE MAX_PIVCELLS	10000

#DEFINE		OS_W32S				1
#DEFINE		OS_NT				2
#DEFINE		OS_WIN95			3

#DEFINE 	HKEY_CLASSES_ROOT   -2147483648  && BITSET(0,31)
#DEFINE 	HKEY_CURRENT_USER   -2147483647  && BITSET(0,31)+1
#DEFINE 	HKEY_LOCAL_MACHINE  -2147483646  && (( HKEY ) 0x80000002 )

#DEFINE 	ERROR_SUCCESS		0
