
#define MESSAGE_LOC			"Microsoft Visual FoxPro"
#define ERRORTITLE_LOC		"Microsoft Visual FoxPro"
#define ERRORMESSAGE_LOC "Error #" + alltrim(str(m.nError)) + " en " + m.cMethod +	" (" + alltrim(str(m.nLine)) + "): " + m.cMessage



#define MB_ICONEXCLAMATION		48
#define MB_ABORTRETRYIGNORE		2
#define MB_OK					0
#DEFINE MB_YESNO                4       && Yes and No buttons
#DEFINE IDYES           		6       && Yes button pressed

* These are the countries and regions to enable DBCS:  Japan, Korea, PRC, Taiwan
#DEFINE DBCS_LOC "81 82 86 88"

#DEFINE NUM_AFIELDS  16   			&& number of columns in AFIELDS array
#DEFINE DT_MEMO  	"M"
#DEFINE DT_GENERAL  "G"

#DEFINE TAGDELIM	 " *"

#DEFINE BMP_LOCAL		"dblview.bmp"
#DEFINE BMP_REMOTE		"dbrview.bmp"
#DEFINE BMP_TABLE		"dbtable.bmp"

#DEFINE C_FREETABLE_LOC		"Tablas libres"
#DEFINE C_MAXFIELDS_LOC 	"El número máximo de campos por los que se puede ordenar es"
#DEFINE C_NOTAG_LOC 		"No puede combinar etiquetas de índice y campos."
#DEFINE C_READONLY_LOC		"El archivo es de sólo lectura y esta aplicación no puede utilizarlo. Seleccione otro."
#DEFINE E_BADDBCTABLE_LOC	"La tabla seleccionada no tiene un vínculo primario con su DBC. "+"Puede solucionarlo con el comando VALIDATE DATABASE RECOVER."

#DEFINE C_TPROMPT_LOC		"Seleccione el archivo que desea abrir:"
#DEFINE C_READ2_LOC			"El archivo está abierto en modo exclusivo por otro."
#DEFINE C_READ3_LOC			"El archivo ya está en uso. Seleccione otro."
#DEFINE C_READ4_LOC			"El DBF es parte de un DBC. Seleccione una tabla del contenedor DBC."
