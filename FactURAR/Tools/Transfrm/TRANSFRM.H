* TRANSFRM.H - Header file for Transformer files.
*

*-- Titles
#DEFINE T_TRANSFORMER_LOC			"Transformador"

*-- Fonts
#DEFINE F_ARIAL_LOC					"Arial"
#DEFINE F_MS_SANS_SERIF_LOC			"MS Sans Serif"

*-- ASCII codes
#DEFINE	MARKER			CHR(1)
#DEFINE	TAB				CHR(9)
#DEFINE	LF				CHR(10)
#DEFINE	CR				CHR(13)
#DEFINE CR_LF			CR+LF

*-- Rule codes
#DEFINE	RULE_CODE_WIN		CHR(160)
#DEFINE	RULE_CODE_MAC		CHR(202)
#DEFINE RULE_EXCLUDE		RULE_CODE_WIN+'NOT'+RULE_CODE_WIN
#DEFINE RULE_INCLUDE		RULE_CODE_WIN+CHR(171)+RULE_CODE_WIN
#DEFINE RULE_SEPARATOR		RULE_CODE_WIN+RULE_CODE_WIN+'|'+RULE_CODE_WIN+RULE_CODE_WIN


#DEFINE FILENOTFOUND1_LOC "Archivo '"
#DEFINE FILENOTFOUND2_LOC "' no encontrado."
#DEFINE ALTERFILES_LOC	'El transformador puede modificar definitivamente los archivos. Se recomienda que haga una copia de seguridad de los archivos que se van a procesar. ¿Desea continuar?'
#DEFINE ABORT1_LOC		'Proceso anulado debido a un error.'
#DEFINE ABORT2_LOC		'Proceso anulado manualmente.'
#DEFINE NOFILES_LOC		'Ningún archivo'
#DEFINE HAS1FILE_LOC	'1 archivo'
#DEFINE HASMANYFILE_LOC	' archivos'
#DEFINE SCANNED_LOC		'recorridos'
#DEFINE PROCESSED_LOC	'procesados'
#DEFINE SECONDS_LOC		' segundos.'
#DEFINE NOFONTRULE_LOC	'No hay reglas de fuente'
#DEFINE FONTRULE1_LOC	' regla de fuente'
#DEFINE FONTRULE2_LOC	' agregados.'
#DEFINE FONTRULE3_LOC	'Agregar reglas de fuente de transformador'
#DEFINE SCANNING_LOC	'Recorriendo ...'
#DEFINE SCANNING2_LOC	[Recorriendo: ]
#DEFINE NOFILESTOPROCESS_LOC	'No hay archivos para procesar.'
#DEFINE LOGSTART_LOC	'Inicio de registro de transformador'
#DEFINE LOGEND_LOC	'Fin de registro de transformador'
#DEFINE NOPROCESS_LOC	'No se puede procesar el archivo:  '
#DEFINE PROJECT_LOC		'Proyecto:  '
#DEFINE CLASSLIB_LOC	'Biblioteca de clases:  '
#DEFINE FORM_LOC	'Formulario:  '
#DEFINE MENU_LOC	'Menú:  '
#DEFINE REPORT_LOC	'Informe:  '
