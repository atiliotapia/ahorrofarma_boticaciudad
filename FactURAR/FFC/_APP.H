* _app.h

***********************************************************
localization strings and constants for _app.vcx 
***********************************************************

* _datasession class
#DEFINE DATA_MESSAGEBOX_TITLE_LOC    "Mensaje de datos"
#DEFINE DATA_OK_TO_SAVE_LOC          "¿Desea guardar sus modificaciones?"
#DEFINE DATA_OK_TO_REVERT_LOC        "¿Desea cancelar sus modificaciones?"
#DEFINE DATA_UPDATE_CONFLICT_LOC     "Los registros están bloqueados por otro usuario. "+CHR(13)+CHR(13) +                                     "No puede actualizarlos hasta que se cancele el otro bloqueo."



#DEFINE DATA_HAS_BEEN_EDITED_LOC     "Puede que otros usuarios hayan cambiado los datos desde que comenzó a modificarlos. "+CHR(13)+CHR(13) +"¿Desea sobrescribir los cambios de los otros usuarios, "+CHR(13)+                                     "o cancelar sus modificaciones en los registros de esta tabla?"


#DEFINE DATA_SAVE_BEFORE_CLOSE_LOC   "Tiene un trabajo abierto."+CHR(13)+CHR(13)+"¿Desea guardar las modificaciones antes de cerrarlo?"

#DEFINE DATA_CANCEL_UNFINISHED_LOC   "Tiene un trabajo abierto que aún no se puede guardar."+CHR(13)+CHR(13)+"¿Realmente desea cerrarlo y perder las modificaciones?"

                                     

* _error class
* error logging
#DEFINE ERROR_MESSAGEBOX_TITLE_LOC   "Mensaje de error"
#DEFINE ERROR_IN_ERROR_METHOD_LOC    "Fallo en el controlador de errores"
#DEFINE ERROR_SERIOUS_CLASS_LOC      "Error importante de clase"
#DEFINE ERROR_CANNOT_BE_LOGGED_LOC   "La aplicación terminará y no podrá agregar información acerca de este error al registro de errores."
#DEFINE ERROR_LOCK_LOC               "Un archivo o registro no está disponible"
#DEFINE ERROR_PRINT_LOC              "La impresora o el controlador de impresora que necesita no está disponible"
#DEFINE ERROR_USER_FIX_LOC           "Solucione el problema, o espere y vuelva a intentarlo."
#DEFINE ERROR_USER_NOTE_LOC          "Anote la información de este error."

* error log display
#DEFINE ERROR_LOG_EMPTY_LOC          "El registro de errores no contiene entradas."
#DEFINE ERROR_LOG_UNAVAILABLE_LOC    "El registro de errores no está disponible."

* error continuation choices
#DEFINE ERROR_USER_CHOICES_LOC       "¿Desea continuar con la ejecución del programa?"

#DEFINE ERROR_DEVEND_LOC             ERROR_USER_CHOICES_LOC+CHR(13)+CHR(13)+                                     "Choose: "+CHR(13)+CHR(13)+                                     "Seleccione SÍ para continuar con el programa,"+CHR(13)+                                     "NO para detenerlo"+CHR(13)+                                     " o CANCELAR para salir completamente del mismo."






#DEFINE ERROR_USEREND_LOC            ERROR_USER_CHOICES_LOC+CHR(13)+CHR(13)+                                     "Choose: "+CHR(13)+CHR(13)+                                     "Seleccione Aceptar para continuar con el programa"+CHR(13)+                                     "o Cancelar para salir por completo del mismo."




               
#DEFINE ERROR_OCCURRED_LOC           "Se produjo un error"
#DEFINE ERROR_LOG_LOC                "¿Desea guardar los detalles en los archivos de registro de errores?"


***********************************************************
* Messagebox subset from FOXPRO.H
***********************************************************

#DEFINE MB_OK                   0       && OK button only
#DEFINE MB_OKCANCEL             1       && OK and Cancel buttons
#DEFINE MB_ABORTRETRYIGNORE     2       && Abort, Retry, and Ignore buttons
#DEFINE MB_YESNOCANCEL          3       && Yes, No, and Cancel buttons
#DEFINE MB_YESNO                4       && Yes and No buttons
#DEFINE MB_RETRYCANCEL          5       && Retry and Cancel buttons

#DEFINE MB_ICONSTOP             16      && Critical message
#DEFINE MB_ICONQUESTION         32      && Warning query
#DEFINE MB_ICONEXCLAMATION      48      && Warning message
#DEFINE MB_ICONINFORMATION      64      && Information message

#DEFINE MB_APPLMODAL            0       && Application modal message box
#DEFINE MB_DEFBUTTON1           0       && First button is default
#DEFINE MB_DEFBUTTON2           256     && Second button is default
#DEFINE MB_DEFBUTTON3           512     && Third button is default
#DEFINE MB_SYSTEMMODAL          4096    && System Modal

*-- MsgBox return values
#DEFINE IDOK            1       && OK button pressed
#DEFINE IDCANCEL        2       && Cancel button pressed
#DEFINE IDABORT         3       && Abort button pressed
#DEFINE IDRETRY         4       && Retry button pressed
#DEFINE IDIGNORE        5       && Ignore button pressed
#DEFINE IDYES           6       && Yes button pressed
#DEFINE IDNO            7       && No button pressed

***********************************************************
* Data-handling subset from FOXPRO.H
***********************************************************
*-- Cursor buffering modes
#DEFINE DB_BUFOFF               1
#DEFINE DB_BUFLOCKRECORD        2
#DEFINE DB_BUFOPTRECORD         3        
#DEFINE DB_BUFLOCKTABLE         4
#DEFINE DB_BUFOPTTABLE          5

*-- Update types for views/cursors
#DEFINE DB_UPDATE               1
#DEFINE DB_DELETEINSERT         2

*-- WHERE clause types for views/cursors
#DEFINE DB_KEY                  1
#DEFINE DB_KEYANDUPDATABLE      2
#DEFINE DB_KEYANDMODIFIED       3
#DEFINE DB_KEYANDTIMESTAMP      4

*-- Remote connection login prompt options
#DEFINE DB_PROMPTCOMPLETE       1
#DEFINE DB_PROMPTALWAYS         2
#DEFINE DB_PROMPTNEVER          3

*-- Remote transaction modes
#DEFINE DB_TRANSAUTO            1
#DEFINE DB_TRANSMANUAL          2

*-- Source Types for CursorGetProp()
#DEFINE DB_SRCLOCALVIEW         1
#DEFINE DB_SRCREMOTEVIEW        2
#DEFINE DB_SRCTABLE             3


***********************************************************
* System Toolbar subset from FOXPRO.H, Tastrade STRINGS.H
***********************************************************
*-- Toolbar Positions
#DEFINE TOOL_NOTDOCKED  -1
#DEFINE TOOL_TOP        0
#DEFINE TOOL_LEFT       1
#DEFINE TOOL_RIGHT      2
#DEFINE TOOL_BOTTOM     3

*-- Toolbar names
#DEFINE TB_FORMDESIGNER_LOC  "Diseñador de formularios"
#DEFINE TB_STANDARD_LOC      "Estándar"
#DEFINE TB_LAYOUT_LOC        "Diseño"
#DEFINE TB_QUERY_LOC		 "Diseñador de consultas"
#DEFINE TB_VIEWDESIGNER_LOC  "Diseñador de vistas"
#DEFINE TB_COLORPALETTE_LOC  "Paleta de colores"
#DEFINE TB_FORMCONTROLS_LOC  "Controles del formulario"
#DEFINE TB_DATADESIGNER_LOC  "Diseñador de bases de datos"
#DEFINE TB_REPODESIGNER_LOC  "Diseñador de informes"
#DEFINE TB_REPOCONTROLS_LOC  "Controles del informe"
#DEFINE TB_PRINTPREVIEW_LOC  "Vista preliminar"

