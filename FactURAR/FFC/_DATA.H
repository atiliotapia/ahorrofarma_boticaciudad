* _DATA.H

***********************************
* Constants for classes
#DEFINE MB_ICONEXCLAMATION		48
#DEFINE MB_QUESTIONYESNO	36
#DEFINE MB_ISYES			6

***********************************
* strings for _cbodistinctvalues classes

#DEFINE NO_TABLE_LOC "Debe indicar el alias de la tabla en la propiedad controlSource, en el formato 'alias.columna'."

***********************************
* strings for _cbolookup classes

#DEFINE NO_LOOKUP_TABLE_LOC "Debe especificar una tabla de búsqueda en la propiedad 'lookup_table' (combo box " + THIS.name + ")."
#DEFINE NO_DISPLAY_COLUMN_LOC "Debe indicar una columna de presentación en la propiedad 'display_column' (combo box " + THIS.name + ")."
#DEFINE NO_RETURN_COLUMN_LOC "Debe especificar una columna de retorno en la propiedad 'return_column' (combo box " + THIS.name + ")."

***********************************
* strings for _conflicts classes

#DEFINE CS_NOALIAS_LOC					"No ha especificado un cursor."
#DEFINE CS_ROWCONFLICT_LOC				"Conflictos en la fila:"
#DEFINE CS_NOCONFLICTS1_LOC				"No hay conflictos."
#DEFINE CS_NOCONFLICTS_LOC				"No hay más conflictos."
#DEFINE CS_NOBUFFER_LOC					"El búfer de datos debe estar activado para comprobar los conflictos."
#DEFINE WAIT_REVERTFAIL_LOC		"Fallo al volver"
#DEFINE WAIT_REVERT1_LOC		"1 fila vuelve a su valor original"
#DEFINE	WAIT_UPDATEOK_LOC		"Actualización completa"
#DEFINE	WAIT_UPDATEFAIL1_LOC	"Error al actualizar, la clave principal ha cambiado"

***********************************
* strings for _execsp classes

#DEFINE BADPARMS_LOC	"Debe pasar 3 parámetros como mínimo a esta clase."

***********************************
* strings for _offline classes
#DEFINE C_NODATABASE_LOC	"No ha especificado una base de datos o una vista."
#DEFINE C_NOVIEWS_LOC		"No ha especificado vistas para poner fuera de línea."
#DEFINE C_OKONLINE_LOC		"Las vistas se han puesto en línea."
#DEFINE C_RECORDCONLICT_LOC "Conflicto de registro al actualizar con la vista: "
#DEFINE C_FAILONLINE_LOC 	"Error al poner la vista en línea: "
#DEFINE C_NOOPEN_LOC 		"No se puede abrir la siguiente vista: "
#DEFINE C_FAILOFFLINE_LOC	"Error al poner la siguiente vista fuera de línea: "
#DEFINE C_OKOFFLINE_LOC		"Las vistas se han puesto fuera de línea."

***********************************
* strings for _datachecker class

#define NOBUFF1_LOC 'El búfer de datos no está habilitado.'
	#define WINDMSG_LOC "Ha pasado un valor incorrecto a conflictmanager.handlerecord"
* Declare constants & variables
#define CR_LOC CHR(13)
#define SAVE_LOC "¿Desea sobrescribir el valor actual con su modificación?" + CR_LOC + "(Seleccione 'Cancelar' para recuperar el valor original.)"
#define CONFLICT_LOC "Conflicto de datos"
#define VERIFY_LOC "Comprobar modificaciones"
#define ORG_LOC "Valor original: "
#define CUR_LOC "Valor actual: "
#define CHG_LOC "Su modificación: "
#define MEMO_LOC " es un campo Memo."
#define FIELD_LOC "Campo: "
#define RECORD_LOC "Número de registro: "
#define VALCHG1_LOC "Otro usuario ha modificado un valor."
#define VALCHG2_LOC "Se ha modificado un valor."
#define SAVECHG_LOC '¿Desea guardar los cambios?'
#define SAVECHG2_LOC 'Guardar cambios'

***********************************
* strings for _datanavbtns class
#define NUM_LOC "Número de error: "
#define PROG_LOC "Procedimiento: "
#define MSG_LOC "Mensaje de error:"
#define SELTABLE_LOC "Tabla de selección:"
#define OPEN_LOC "Abrir"
#define SAVE1_LOC "¿Realmente desea guardar los cambios?"
#define CONFLICT_LOC "Unable to resolve data conflict."
