* _TABLE.H

***********************************
* constants for _Table* classes

#DEFINE DB_BUFLOCKRECORD        2
#DEFINE DB_BUFOPTRECORD         3    

#DEFINE FILTER_MAX_FILTER       255

#DEFINE MB_ICONEXCLAMATION   48
#DEFINE MB_YESNOCANCEL        3
#DEFINE IDYES                 6
#DEFINE IDNO                  7

***********************************
* localization for _Table* classes

* _TableFind* buttons and dialog class strings

#DEFINE FIND_LOOKFOR_LOC          "B\<uscar:"
#DEFINE FIND_LOOKIN_LOC           "Buscar \<en:"
#DEFINE FIND_OPTIONS_LOC          "Opciones"
#DEFINE FIND_WRAPAROUND_LOC       "Bú\<squeda continua"
#DEFINE FIND_MATCHCASE_LOC        "Coi\<ncidir mayúsculas y minúsculas"
#DEFINE FIND_SKIPMEMOS_LOC        "\<Omitir memos"
#DEFINE FIND_FIND_LOC             "\<Buscar"
#DEFINE FIND_FINDNEXT_LOC         "Buscar \<siguiente"
#DEFINE FIND_CANCEL_LOC           "\<Cancelar"
#DEFINE FIND_NOFIND_LOC           "No se encuentra"
#DEFINE FIND_CAPTION_LOC          "Buscar"
#DEFINE FIND_FINDIN_LOC           "Buscar en"

***********************************
* _TableSetFilterDialog strings:

#DEFINE SETFILTER_CAPTION_LOC     "\<Establecer filtro"
#DEFINE SETFILTER_APPLY_LOC       "\<Aplicar"
#DEFINE SETFILTER_MAXLENGTH_LOC   "El filtro debe tener menos de 255 caracteres."
#DEFINE SETFILTER_INVALID_LOC     "El tipo del filtro debe ser lógico."
#DEFINE SETFILTER_BUILDEXPR_LOC   "\<Generar expresión"
#DEFINE SETFILTER_SIMPLE_LOC      "Simple"
#DEFINE SETFILTER_COMPLEX_LOC     "Complejo"
#DEFINE SETFILTER_CANCEL_LOC      "\<Cancelar"
#DEFINE SETFILTER_EDIT_LOC        "\<Edición"
#DEFINE SETFILTER_NEED_LIB_LOC    "Falta la biblioteca _TABLE.VCX"


**********************************
* _TableSimpleFilterDialog strings:

#DEFINE FILTER_CANCELLED_LOC             "Cancelado"
#DEFINE FILTER_SECONDS_LOC               "Segundos"
#DEFINE FILTER_TOO_LONG_LOC              "Expresión demasiado larga"
#DEFINE FILTER_RECORDS_LOC               "Registros"
#DEFINE FILTER_NUMERIC_REQUIRED_LOC      "Campo numérico; se espera un número"
#DEFINE FILTER_NUMERIC_NO_QUOTES_LOC     "Campo numérico; no se puede utilizar comillas"
#DEFINE FILTER_MISSING_VALUE_LOC         "Falta un valor"
#DEFINE FILTER_CHECKING_OPEN_TABLES_LOC  "Comprobando archivos abiertos.. "
#DEFINE FILTER_NO_SINGLE_QUOTES_LOC      "No puede haber comillas simples en el valor"
#DEFINE FILTER_QUERY_LIST_FULL_LOC       "La lista de consulta está llena."

***********************************
* _Table class strings:

#DEFINE TABLE_MESSAGE_TITLE_ROW_CHANGED_LOC "Los datos de esta fila han cambiado"

#DEFINE TABLE_MESSAGE_ROW_CHANGED_LOC       "Antes de pasar a otro registro,"+CHR(13)+"¿desea: "+CHR(13)+CHR(13)+                                            "  GUARDAR los cambios (Sí)"+CHR(13)+                                            "  DESHACER los cambios (No) o"+CHR(13)+                                            "  PERMANECER en el registro (Cancelar)?"




************************
* _dialog fonts
#DEFINE SYSTEM_LARGEFONTS            FONTMETRIC(1, 'MS Sans Serif', 8, '') # 13 OR ;
                                     FONTMETRIC(4, 'MS Sans Serif', 8, '') # 2 OR ;
                                     FONTMETRIC(6, 'MS Sans Serif', 8, '') # 5 OR ;
                                     FONTMETRIC(7, 'MS Sans Serif', 8, '') # 11

#DEFINE DIALOG_SMALLFONT_NAME        "MS Sans Serif"
#DEFINE DIALOG_LARGEFONT_NAME        "Arial"

