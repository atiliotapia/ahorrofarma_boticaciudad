* _framewk.h

***********************************************************
* localization strings, constants, 
* and tunable expressions for _framewk.vcx,
* framework-enabling header file for global template classes

***********************************************************

* _application class

#DEFINE APP_MEDIATOR_SUPERCLASS      "_formmediator"
* note: don't use TRANSFORM() or trim below, need the padding spaces:
#DEFINE APP_META_FAVE_ID              STR(RECNO())
#DEFINE APP_META_UNAVAILABLE_LOC     "Metatabla en uso o no disponible:"
#DEFINE APP_META_WRONGFORMAT_LOC     "La metatabla tiene una estructura incorrecta:"
#DEFINE APP_META_MISSINGINDEX_LOC    "Falta uno o más índices"+CHR(13)+"requeridos en la metatabla:"


#DEFINE PJX_META_DOC_FORM_TYPE       "F"
#DEFINE PJX_META_DOC_REPORT_TYPE     "R"
#DEFINE PJX_META_DOC_HEADER_TYPE     "A" 

#DEFINE APP_FEATURE_NOT_AVAILABLE_LOC "Característica no disponible."
#DEFINE APP_FILE_NOT_FOUND_LOC        "Archivo no encontrado"
#DEFINE APP_READY_TO_SHUTDOWN_LOC     "¿Realmente desea salir?"
#DEFINE APP_LOADING_LOC               "Cargando..."

#DEFINE APP_PM_WIN_TITLE_LOC         "Administrador de proyectos - "
#DEFINE APP_ALREADY_EXISTS_LOC       "ya existe"
#DEFINE APP_GO_PAD_LOC               "\<Ir a"
#DEFINE APP_GO_PAD_HOTKEY_LOC        ALT+G
#DEFINE APP_GO_MESSAGE_LOC           "Examina la tabla, el cursor o la vista seleccionados actualmente"

#DEFINE APP_USER_FAVES_CLEAR_LOC     "¿Desea borrar su lista Favoritos ahora?"
#DEFINE APP_USER_FAVES_CORRUPT_LOC   "Las entradas de sus Favoritos están dañadas y serán borradas."
#DEFINE APP_META_TABLE_CHANGED_LOC   "La tabla documento de "+THIS.cCaption+ " ha cambiado. "+ CHR(13)+"Algunos de sus Favoritos puede que no se ejecuten correctamente. "+                                     CHR(13)+CHR(13)+                                     APP_USER_FAVES_CLEAR_LOC




#DEFINE APP_MACRO_RESTORE_LOC        "Restaurar"
#DEFINE APP_OUTPUT_ONE_REC_LOC       "Registro actual"

* _dialog fonts
#DEFINE DIALOG_SMALLFONT_NAME        "MS Sans Serif"
#DEFINE DIALOG_LARGEFONT_NAME        "Arial"

* _aboutbox class
#DEFINE ABOUT_LOC                    "Acerca de"

* _options class
#DEFINE OPTIONS_LOC                      "Opciones de usuario"
#DEFINE OPTIONS_DEFAULTS_SAVED_LOC       "Se han guardado los valores predeterminados de las opciones de usuario"
#DEFINE OPTIONS_APPLIED_LOC              "Se han aplicado las opciones de usuario."
#DEFINE OPTIONS_DEFAULTS_SHOWN_LOC       "Se muestran los valores predeterminados de las opciones de usuario guardadas."
#DEFINE OPTIONS_NOT_STORED_LOC           "Aún no se han guardado los valores predeterminados de las opciones de usuario."
#DEFINE CHANGEPASSWORD_LOC               "Cambiar contraseña"
#DEFINE OPTIONS_CONFIRM_PASSWORD_LOC     "Vuelva a escribir su nueva contraseña para confirmarla."
#DEFINE OPTIONS_PASSWORD_UNCONFIRMED_LOC "Contraseña no confirmada."+CHR(13)+"Vuelva a intentarlo."
#DEFINE OPTIONS_PASSWORD_CONFIRMED_LOC   "Se ha aceptado su nueva contraseña."

* _UserLogInClass
#DEFINE LOGIN_CAPTION_LOC            "Inicio de sesión de usuario"
#DEFINE LOGIN_ADD_USER_LOC           "¿Desea agregar un nuevo usuario?"
#DEFINE LOGIN_NEW_USER_INFO_LOC      "Almacene una nueva contraseña para este usuario ahora."+ CHR(13)+CHR(13)+"Este nuevo usuario recibirá acceso de nivel básico."

#DEFINE LOGIN_USER_NOT_FOUND_LOC     "El usuario no está en la lista."
#DEFINE LOGIN_WRONG_PASSWORD_LOC     "Contraseña incorrecta para este usuario."
#DEFINE LOGIN_EMPTY_PASSWORD_LOC     "No se permite una contraseña vacía."
#DEFINE LOGIN_TRIES_EXCEEDED_LOC     "Se ha superado el límite de intentos de iniciar sesión."

* user permissions and levels are provided for, although
* not evaluated, in the basic framework
#DEFINE USER_PERMISSION_DENIED_LOC  "Su nivel de usuario no le permite tener acceso a esta función."

* _documentpicker and descendent classes
#DEFINE DOCUMENTPICKER_NO_DOCUMENTS_LOC   "No hay documentos registrados disponibles."
#DEFINE DOCUMENTPICKER_NO_APP_LOC         "Debe pasar una referencia a un descendiente de un objeto desde _APPLICATION"

#DEFINE NEWOPEN_CAPTION_NEW_LOC           "Elija el documento que desea crear"
#DEFINE NEWOPEN_CAPTION_OPEN_LOC          "Elija el documento que desea abrir"

#DEFINE REPORTPICKER_CAPTION_RUN_LOC      "Elija el informe que desea ejecutar"
* report editing may be offered at some point:
#DEFINE REPORTPICKER_CAPTION_MODIFY_LOC   "Elija el informe que desea modificar"

#DEFINE FAVORITEPICKER_CAPTION_ADD_LOC    "Documentos disponibles para Favoritos"
#DEFINE FAVORITEPICKER_ADDBUTTON_LOC      "\<Agregar"
#DEFINE FAVORITEPICKER_CLOSEBUTTON_LOC    "\<Cerrar"
#DEFINE FAVORITEPICKER_CAPTION_START_LOC  "Tutorial"
#DEFINE FAVORITEPICKER_DOC_ALREADY_LOC    "ya se ha seleccionado para Favoritos."

#DEFINE FAVORITEPICKER_PICKED_LOC         "* "
#DEFINE FAVORITEPICKER_PICKED_LEN         LEN(FAVORITEPICKER_PICKED_LOC)

* _errorlogviewer class
#DEFINE ERRORVIEWER_CAPTION_LOC        "Visor del registro de errores"
#DEFINE ERRORVIEWER_EMPTY_LOC          "El registro de errores no tiene registros."
#DEFINE ERRORVIEWER_UNAVAILABLE_LOC    "El registro de errores no está disponible."
#DEFINE ERRORVIEWER_IN_USE_LOC         "El registro de errores está en uso. Ciérrelo antes de continuar."

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


#DEFINE WINDOWTYPE_MODELESS   0
#DEFINE WINDOWTYPE_MODAL      1
#DEFINE WINDOWTYPE_READ       2
#DEFINE WINDOWTYPE_READMODAL  3

