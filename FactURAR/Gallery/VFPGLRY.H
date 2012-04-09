#DEFINE CR		CHR(13)
#DEFINE LF		CHR(10)
#DEFINE CRLF	CHR(13)+CHR(10)
#DEFINE TAB		CHR(9)

* Messagebox constants
#DEFINE MSG_YESNO	36
#DEFINE MSG_YES		6
#DEFINE MSG_NO		7

*Shortcut menu prompts
#DEFINE MENU_VIEW_LOC				"\<Vista"
#DEFINE MENU_VIEW_LGICON_LOC		"Iconos gran\<des"
#DEFINE MENU_VIEW_SMICON_LOC		"Iconos pequ\<eños"
#DEFINE MENU_VIEW_LIST_LOC			"\<Lista"
#DEFINE MENU_VIEW_DETAILS_LOC		"\<Detalles"

#DEFINE MENU_CUT_LOC				"Cor\<tar"
#DEFINE MENU_COPY_LOC				"\<Copiar"
#DEFINE MENU_PASTE_LOC				"\<Pegar"
#DEFINE MENU_PASTELINK_LOC			"Pegar en\<lace"
#DEFINE MENU_UNDO_LOC				"\<Deshacer"

#DEFINE MENU_CREATELINK_LOC			"Crear en\<lace"
#DEFINE MENU_REMOVE_LOC				"\<Quitar"
#DEFINE MENU_RENAME_LOC				"Ca\<mbiar nombre"
#DEFINE MENU_NEW_LOC				"\<Nuevo"
#DEFINE MENU_NEW_FOLDER_LOC			"\<Carpeta"
#DEFINE MENU_NEW_ITEM_LOC			"\<Elemento"
#DEFINE MENU_NEW_OBJECT_LOC			"\<Objeto"
#DEFINE MENU_NEW_LINK_LOC			"\<Enlace"
#DEFINE MENU_PROPERTIES_LOC			"P\<ropiedades"

#DEFINE MENU_QVIEW_LOC				"\<Vista rápida"
#DEFINE MENU_SHOW_LOC				"M\<ostrar"
#DEFINE MENU_OPENWITH_LOC			"Abr\<ir con..."
#DEFINE MENU_PRINT_LOC				"\<Imprimir"

#DEFINE MENU_NEWFORM_LOC			"Nuevo \<formulario"
#DEFINE MENU_NEWREPO_LOC			"Nuevo \<informe"
#DEFINE MENU_NEWAPP_LOC				"Nue\<va aplicación"
#DEFINE MENU_NEWDATA_LOC			"Nu\<eva base de datos"
#DEFINE MENU_NEWTABLE_LOC			"Nueva \<Tabla"

#DEFINE MENU_ACTIVEX_LOC			"Actuali\<zar controles"
#DEFINE MENU_SYSTEM_LOC				"Instalar en mi sis\<tema"
#DEFINE MENU_NEWCLSID_LOC			"Cambiar clase\<s registradas..."
#DEFINE MENU_ADDFORM_LOC			"Agregar a for\<mulario"
#DEFINE MENU_ADDPROJECT_LOC			"\<Agregar a proyecto"
#DEFINE MENU_MODIFY_LOC				"Mo\<dificar..."
#DEFINE MENU_RUN_LOC				"Ejecu\<tar"
#DEFINE MENU_TYPELIB_LOC			"\<Ver tipo de biblioteca..."
#DEFINE MENU_REGREMOTE_LOC			"Re\<gistro remoto..."
#DEFINE MENU_VERSION_LOC			"\<Información de la versión..."

#DEFINE MENU_SAMPLE_LOC				"Ver \<ejemplo"
#DEFINE MENU_SAMPLEOPEN_LOC			"\<Abrir"
#DEFINE MENU_SAMPLERUN_LOC			"Ejecu\<tar"
#DEFINE MENU_HELP_LOC				"\<Ayuda..."
#DEFINE MENU_WEBHELP_LOC			"Ayuda Web e\<xtendida..."
#DEFINE MENU_PREVIEW_LOC			"\<Vista preliminar"
#DEFINE MENU_OPEN_LOC				"\<Abrir"
#DEFINE MENU_ADDHYPER_LOC			"Agregar hipervínculo a \<formulario..."
#DEFINE MENU_CLSBROWSER_LOC			"Ver en e\<xaminador"
#DEFINE MENU_CLASSFORM_LOC			"Crear \<formulario..."

#DEFINE MENU_SETWALL_LOC			"Establecer tapiz VFP"
#DEFINE MENU_CLEARWALL_LOC			"Borrar tapiz VFP"
#DEFINE MENU_FORMWALL_LOC			"Establecer tapi\<z de formulario"

#DEFINE MENU_BROWSER_LOC			"\<Examinar"
#DEFINE MENU_QUICKFORM_LOC			"\<Formulario rápido"
#DEFINE MENU_QUICKREPORT_LOC		"Infor\<me rápido"

#DEFINE MENU_MAILMERGE_LOC			"\<Combinar correo en Word"
#DEFINE MENU_PIVOT_LOC				"\<Tabla dinámica de Excel"
#DEFINE MENU_OUTHTML_LOC			"\<Exportar a HTML"

#DEFINE MENU_OPENCATALOG_LOC		"\<Abrir catálogo"
#DEFINE MENU_ADDCATALOG_LOC			"Agr\<egar catálogo"

#DEFINE MENU_BUILD_LOC				"\<Generar"

* Shared Objects
#DEFINE OBJ_SHARED					"VFPGLRY!SHAREDOBJ"
#DEFINE OBJ_GLRYUTIL				"VFPGLRY!GLRYUTILOBJ"
#DEFINE OBJ_REGISTRY				"VFPGLRY!REGOBJ"


#DEFINE WIN_PJX_DESIGN_LOC			"ADMINISTRADOR DE PROYECTO -"
#DEFINE WIN_SCX_DESIGN_LOC			"DISEÑADOR DE FORMULARIO -"
#DEFINE WIN_VCX_DESIGN_LOC			"DISEÑADOR DE CLASE -"
#DEFINE WIN_FRX_DESIGN_LOC			"DISEÑADOR DE INFORME -"
#DEFINE WIN_MNX1_DESIGN_LOC			"DISEÑADOR DE MENÚ -"
#DEFINE WIN_MNX2_DESIGN_LOC			"DISEÑADOR DE ACCESO DIRECTO -"
#DEFINE WIN_DBC_DESIGN_LOC			"DISEÑADOR DE BASE DE DATOS -"
#DEFINE WIN_PJX_DESIGN_FLAG			1
#DEFINE WIN_SCX_DESIGN_FLAG			2
#DEFINE WIN_VCX_DESIGN_FLAG			4
#DEFINE WIN_FRX_DESIGN_FLAG			8
#DEFINE WIN_MNX1_DESIGN_FLAG		16
#DEFINE WIN_MNX2_DESIGN_FLAG		32
#DEFINE WIN_DBC_DESIGN_FLAG			64

* File Extensions
#DEFINE	LOCALSRV_EXTN		"EXE"
#DEFINE	INPROCSRV_EXTN		"DLL"
#DEFINE	TYPELIB_EXTN		"TLB"
#DEFINE	TYPELIB2_EXTN		"OLB"
#DEFINE	REMOTEREG_EXTN		"VBR"
#DEFINE	CONTROL_EXTN		"OCX"
#DEFINE	PROJECT_EXTN		"PJX"
#DEFINE	FORM_EXTN			"SCX"
#DEFINE	CLASS_EXTN			"VCX"
#DEFINE	REPORT_EXTN			"FRX"

#DEFINE	OLECONTROL_CLASS	"OLECONTROL"

* _ActiveXFolder
#DEFINE C_DEFACTX_PARENT	"ACTXSYSCTRLS"
#DEFINE REGPROMPT1_LOC	"No se encontró controles ActiveX registrados en el cuadro de diálogo Opciones. "+"¿Desea buscar en todo el Registro?"

#DEFINE MSG_ADDACTIVEX1_LOC "Leyendo en Registro para componentes ActiveX..."
#DEFINE MSG_ADDACTIVEX2_LOC	"Procesado "
#DEFINE MSG_ADDACTIVEX3_LOC	"% completo"
#DEFINE MSG_ADDACTIVEX4_LOC	"Agregando elementos ActiveX al catálogo..."
#DEFINE MSG_ADDACTIVEX5_LOC "Buscando clases disponibles en el Registro..."
#DEFINE TMP_ADDACTIVEXTMP_LOC	"Actualizando en catálogo..."
#DEFINE HKEY_CLASSES_ROOT		-2147483648  && BITSET(0,31)
#DEFINE HKEY_CURRENT_USER		-2147483647  && BITSET(0,31)+1


#DEFINE VFP_OPTIONS_KEY1		"Software\Microsoft\VisualFoxPro\"
#DEFINE VFP_OPTIONS_KEY2		"\Options\OLEList"
#DEFINE CLSID_KEY				"CLSID"
#DEFINE PROGID_KEY				"\ProgID"
#DEFINE CONTROL_KEY				"Control"
#DEFINE SERVER_KEY				"Programmable"
#DEFINE SHELL_KEY				"\Shell\"
#DEFINE INPROC_KEY				"InProcServer32"
#DEFINE LOCALSVR_KEY			"LocalServer32"

*_ACTIVEXITEM
#DEFINE DEFWIDTH	200
#DEFINE DEFHEIGHT	150
#DEFINE ACTXCONTROL	0
#DEFINE ACTXDLLSVR	1
#DEFINE ACTXEXESVR	2
#DEFINE	MSG_GETCONTROL_LOC	"Seleccione un directorio para el control:"
#DEFINE ERR_BADCOPY_LOC		"No se pudo copiar el archivo ActiveX a la máquina local. Compruebe si hay problemas de acceso o escritura."
#DEFINE MSG_GOODINSTALL_LOC	"Componente ActiveX instalado correctamente."
#DEFINE MSG_NOVBRFILE_LOC 	"No se pudo encontrar el archivo VBR asociado con ActiveX Server. Asegúrese de que está instalado en alguna ubicación como servidor."
#DEFINE	ERR_NOACTXFILE_LOC	"No existe el nombre de archivo para este elemento."
#DEFINE WINSYS_NT	"\SYSTEM32\"
#DEFINE	WINSYS_W95	"\SYSTEM\"
#DEFINE	MSG_NOREGSVR32_LOC	"No se pudo encontrar REGSVR32.EXE en su carpeta System de Windows. Asegúrese de que está correctamente instalado."
#DEFINE REGSVR_FILE			"REGSVR32.EXE"
#DEFINE CLIREG_FILE			"CLIREG32.EXE"
#DEFINE MSG_UPDATEFILE_LOC		"¿Desea actualizar este elemento para que apunte al nuevo archivo local?"
#DEFINE	MSG_REMOTEUPDATE_LOC	"¿Desea actualizar este elemento desde su ubicación remota?"
#DEFINE MSG_NOCLIREG32_LOC 	"No se pudo encontrar CLIREG32.EXE en su carpeta FoxPro. Asegúrese de que está correctamente instalado."
#DEFINE	ITEMPICKER_CLASS	"itempicker"
#DEFINE	DATAPICKER_CLASS	"datapicker"
#DEFINE	PROJPICKER_CLASS	"projectpicker"
#DEFINE	VFPGLRY_VCX			"gallery\vfpglry.vcx"
#DEFINE	MSG_NOCLASSREG_LOC	"El componente no está correctamente registrado. Intente seleccionar Instalar en la opción del menú Sistema."
#DEFINE	MSG_NOREG_LOC		"** no registrado **"
#DEFINE	MSG_ONECLASSREG_LOC	"Sólo hay una clase registrada para este componente: "

#DEFINE	ERRCODE_GOODINSTALL	0
#DEFINE	ERRCODE_CLASSEXISTS	1
#DEFINE	ERRCODE_FAILINSTALL	2
	
*_CLASSITEM
#DEFINE MSG_NOSAMPLE_LOC	"No hay ejemplo disponible."
#DEFINE STAT_LOADCLASS_LOC	"Cargando el Diseñador de clases ..."
#DEFINE	VFP_SCREEN			"SCREEN"
#DEFINE	DEFCLASS			"DEFINE CLASS "
#DEFINE FORMNAMEVAR_LOC		"Se creó una variable pública para formulario llamada:"
#DEFINE NOHELP_LOC			"No hay ayuda disponible."
#DEFINE ERR_OBJNOTCREATED_LOC	"Esta clase no estaba creada -- la causa posible es que el evento INIT devolvió un valor .F."

#DEFINE VFPHELPFILE		"FOXHELP.CHM"
#DEFINE MSDNHELPFILE	"MSDNVS98.COL"

*FILEITEM
#DEFINE SHELLPRINTTO	"printto"
#DEFINE SHELLDEFAULT	"open"
#DEFINE SHELLNEW		"new"
#DEFINE SHELLSHOW		"show"
#DEFINE SHELLPRINT		"print"
#DEFINE QVIEWPATH 		"QuickView\."
#DEFINE QVIEWEXEPATH	"QuickView\Shell\Open\Command"
#DEFINE BINARYTYPE		"*Binary*"			&& Binary data in any form.

*SHAREDITEM
#DEFINE MSG_NOFORM_LOC 		"No hay formularios abiertos..."
#DEFINE MSG_NOPROJECT_LOC 	"No hay proyectos abiertos..."
#DEFINE MSG_FILEADDED_LOC 	"Se agregó el archivo al proyecto correctamente."
#DEFINE MSG_FILEINPJX_LOC 	"El archivo ya está en el proyecto."
#DEFINE MSG_LOCATE_LOC 		"Buscar:"
#DEFINE ERR_NOGLRYDLOG_LOC 	"Uno de los componentes de la galería está en uso. La operación no se pudo realizar."
#DEFINE C_SELECTFORM_LOC	"Seleccionar &formulario"

*TEMPLATEITEM
#DEFINE DEFWIZCLASSLIB 	"WIZBTNS.VCX"

*File Version Strings
#DEFINE FILEVER_COMMENT_LOC 		"Comentarios: "
#DEFINE FILEVER_COMPANY_LOC 		"Nombre de la compañía: "
#DEFINE FILEVER_FILEDESC_LOC 		"Descripción del archivo: "
#DEFINE FILEVER_FILEVER_LOC 		"Versión del archivo: "
#DEFINE FILEVER_INTERNAL_LOC		"Nombre interno: "
#DEFINE FILEVER_COPYRIGHT_LOC	 	"Copyright legal: "
#DEFINE FILEVER_TRADMARK_LOC		"Marcas comerciales legales: "
#DEFINE FILEVER_FILENAME_LOC	 	"Nombre de archivo original: "
#DEFINE FILEVER_PRIVATE_LOC 		"Build privado: "
#DEFINE FILEVER_PRODUCTNAME_LOC		"Nombre de producto: "
#DEFINE FILEVER_PRODUCTVER_LOC	 	"Versión del producto: "
#DEFINE FILEVER_SPECIAL_LOC			"Build especial: "
#DEFINE FILEVER_LANGUAGE_LOC		"Idioma: "
#DEFINE FILEVER_NOVERSION_LOC		"No se encontró información de la versión."
#DEFINE MSG_FILEVERSION_LOC			"Información de la versión para: "

**Item Type Icons**
#DEFINE ICONFOLDER		"graphics\"
#DEFINE ICO_ACTXEXE		"actxexe.ico"
#DEFINE ICO_ACTXDLL		"actxdll.ico"
#DEFINE ICO_ACTXOCX		"actxocx.ico"
#DEFINE ICO_APPSTYLE	"appstyle.ico"
#DEFINE ICO_AUDIO		"audio.ico"
#DEFINE ICO_CATALOG		"catalog.ico"
#DEFINE ICO_CLASS		"class.ico"
#DEFINE ICO_CLASSLIB	"classlib.ico"
#DEFINE ICO_FILE		"file.ico"
#DEFINE ICO_FORM		"form.ico"
#DEFINE ICO_FRMSTYLE	"frmstyle.ico"
#DEFINE ICO_GIF			"gif.ico"
#DEFINE ICO_HELP		"help.ico"
#DEFINE ICO_JPEG		"jpeg.ico"
#DEFINE ICO_LABEL		"label.ico"
#DEFINE ICO_MENU		"menu.ico"
#DEFINE ICO_MSEXCEL		"excel.ico"
#DEFINE ICO_MSWORD		"word.ico"
#DEFINE ICO_MSOUTLOOK	"outlook.ico"
#DEFINE ICO_MSPOWERPNT	"powerpoint.ico"
#DEFINE ICO_MUSIC		"music.ico"
#DEFINE ICO_PICTURE		"picture.ico"
#DEFINE ICO_PROGRAM		"program.ico"
#DEFINE ICO_PROJECT		"project.ico"
#DEFINE ICO_REPORT		"report.ico"
#DEFINE ICO_RPTSTYLE	"rptstyle.ico"
#DEFINE ICO_TABLE		"table.ico"
#DEFINE ICO_TEXT		"text.ico"
#DEFINE ICO_VIEW		"view.ico"
#DEFINE ICO_WEBDOC		"webdoc.ico"
#DEFINE ICO_WEBFILE		"webfile.ico"
#DEFINE ICO_WEBSITE		"website.ico"

* Operating System codes
#DEFINE	OS_W32S				1
#DEFINE	OS_NT				2
#DEFINE	OS_WIN95			3
#DEFINE	OS_MAC				4
#DEFINE	OS_DOS				5
#DEFINE	OS_UNIX				6

* DLL Paths for various operating systems
#DEFINE DLLPATH_NT			"\SYSTEM32\"
#DEFINE DLLPATH_WIN95		"\SYSTEM\"

* DLL files used to read INI files
#DEFINE	DLL_KERNEL_NT		"KERNEL32.DLL"
#DEFINE	DLL_KERNEL_WIN95	"KERNEL32.DLL"

* DLL files used to read registry
#DEFINE	DLL_ADVAPI_NT		"ADVAPI32.DLL"
#DEFINE	DLL_ADVAPI_WIN95	"ADVAPI32.DLL"

* DLL files used to read ODBC info
#DEFINE DLL_ODBC_NT			"ODBC32.DLL"
#DEFINE DLL_ODBC_WIN95		"ODBC32.DLL"

* Registry roots
#DEFINE HKEY_CLASSES_ROOT           -2147483648  && BITSET(0,31)
#DEFINE HKEY_CURRENT_USER           -2147483647  && BITSET(0,31)+1
#DEFINE HKEY_LOCAL_MACHINE          -2147483646  && BITSET(0,31)+2
#DEFINE HKEY_USERS                  -2147483645  && BITSET(0,31)+3

* Misc
#DEFINE APP_PATH_KEY		"\Shell\Open\Command"
#DEFINE OLE_PATH_KEY		"\Protocol\StdFileEditing\Server"
#DEFINE VFP_OPTIONS_KEY1	"Software\Microsoft\VisualFoxPro\"
#DEFINE VFP_OPTIONS_KEY2	"\Options"
#DEFINE CURVER_KEY			"\CurVer"

* Error Codes
#DEFINE ERROR_SUCCESS		0	&& OK
#DEFINE ERROR_EOF 			259 && no more entries in key

* Note these next error codes are specific to this Class, not DLL
#DEFINE ERROR_NOAPIFILE		-101	&& DLL file to check registry not found
#DEFINE ERROR_KEYNOREG		-102	&& key not registered
#DEFINE ERROR_BADPARM		-103	&& bad parameter passed
#DEFINE ERROR_NOENTRY		-104	&& entry not found
#DEFINE	ERROR_BADKEY		-105	&& bad key passed
#DEFINE	ERROR_NONSTR_DATA	-106	&& data type for value is not a data string
#DEFINE ERROR_BADPLAT		-107	&& platform not supported
#DEFINE ERROR_NOPLAT		-111	&& call not supported on this platform


* Data types for keys
#DEFINE REG_SZ 				1	&& Data string
#DEFINE REG_EXPAND_SZ 		2	&& Unicode string
#DEFINE REG_BINARY 			3	&& Binary data in any form.
#DEFINE REG_DWORD 			4	&& A 32-bit number.

* Data types labels
#DEFINE REG_BINARY_LOC		"*Binario*"			&& Datos binarios en cualquier formulario.
#DEFINE REG_DWORD_LOC 		"*Dword*"			&& Número de 32 bits.
#DEFINE REG_UNKNOWN_LOC		"*Tipo desconocido*"	&& tipo desconocido

#DEFINE APPHOOK_FILE	"APPHOOK.VCX"
#DEFINE APPHOOK_CLASS	"APPHOOK"
