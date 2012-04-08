*- Automate.h
*-
*- #DEFINEs for the AUTOMATE.VCX class

#DEFINE L_DEBUG				.F.

#DEFINE E_UNSUPPORTEDOS_LOC	"Esta clase no se puede utilizar en el sistema operativo actual."
#DEFINE	E_ODBC1_LOC			"No se encuentra el archivo ODBC.INI. Compruebe que ODBC está correctamente instalado."
#DEFINE	E_ODBC2_LOC			"No se pudo encontrar los archivos del controlador ODBC para FoxPro. Compruebe si está instalado."
#DEFINE	E_ODBC3_LOC			"Entrada de los archivos FoxPro no válida en el archivo ODBC.INI."
#DEFINE	E_ODBCDLL_LOC		"No se pudo comprobar si los archivos ODBC instalados son correctos."
#DEFINE E_NOREGISTRY_LOC	"No se pudo cargar el archivo de procedimiento REGISTRY. Asegúrese de que está en la ruta actual."
#DEFINE C_FILEUSE2_LOC		"El archivo está en uso. Seleccione otro."
#DEFINE E_NODATA_LOC		"No se especificó un origen de datos."
#DEFINE E_NOFIELDS_LOC		"No ha especificado campos de datos."
#DEFINE E_NOALIAS_LOC		"No se pudo encontrar el alias especificado."
#DEFINE C_ODBCOLDVER_LOC 	"Tiene instalado un controlador ODBC de una versión anterior de FoxPro."

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

*- ODBC Driver info
#DEFINE ODBC_DRVR		"Driver"
#DEFINE ODBC_DRVR32		"Driver32"

#DEFINE		ODBC_FOX_DSN		"FoxPro Files"
#DEFINE		ODBC_FOX_FIL		"FoxPro 2.6"
#DEFINE 	FOXODBC_25			"FoxPro Files (*.dbf)"
#DEFINE 	FOXODBC_26			"Microsoft FoxPro Driver (*.dbf)"
#DEFINE 	FOXODBC_26FIX		"Microsoft FoxPro 2.6 Driver (*.dbf)"
#DEFINE 	FOXODBC_30			"Visual FoxPro"
#DEFINE 	FOXODBC_30a			"Visual FoxPro Database"
#DEFINE 	FOXODBC_30b			"Visual FoxPro Tables"
#DEFINE		C_DRIVEID			"DriverID"
#DEFINE		FOX_DRIVEID			24
#DEFINE 	ODBC_DATA_KEY		"Software\ODBC\ODBC.INI\"	&& ODBC Registry key
#DEFINE		C_FIL				"FIL"
#DEFINE		C_FOX2				"FoxPro 2.0"
#DEFINE 	HKEY_CLASSES_ROOT   -2147483648  && BITSET(0,31)
#DEFINE 	HKEY_CURRENT_USER   -2147483647  && BITSET(0,31)+1
#DEFINE 	HKEY_LOCAL_MACHINE  -2147483646  && (( HKEY ) 0x80000002 )

#DEFINE		FOXODBC_ANY			"FoxPro"

#DEFINE	ODBC_FILE 			"ODBC.INI"
#DEFINE	ODBC_FILE_68K 		"ODBC Preferences"
#DEFINE	ODBC_FILE_PPC 		"ODBC Preferences PPC"
#DEFINE	ODBC_SOURCE			"ODBC Data Sources"			&& Localization ????
#DEFINE	ODBC_32SOURCE		"ODBC 32 bit Data Sources"	&& Localization ????

*- registry codes
#DEFINE 	ERROR_SUCCESS		0
#DEFINE		ERROR_NOINIFILE		-108	&& no DLL file used to check ODBC
#DEFINE		ERROR_NOINIENTRY	-109	&& no entry found in INI file (section)
#DEFINE		ERROR_FAILINI		-110	&& no entry found in INI file
