#DEFINE CRLF CHR(13)+CHR(10)
#DEFINE	MENU_PROMPT_LOC		"Generador de Ap\<licaciones..."
#DEFINE	MENU_MESSAGE_LOC	"Ejecuta el Generador de marcos de aplicación"

#DEFINE LOG_NEWDATA_LOC	"Datos, formularios o informes agregados al proyecto."
#DEFINE LOG_UPDATE_LOC	"Proyecto actualizado con la nueva configuración del Generador de aplicaciones."

#DEFINE FRAMEWORK_HELPID	2299000008
#DEFINE OVERALL_HELPID		2299000000
#DEFINE GENERAL_HELPID		2299000007
#DEFINE CREDITS_HELPID		2299000001
#DEFINE DATA_HELPID			2299000002
#DEFINE FORMS_HELPID		2299000003
#DEFINE REPORTS_HELPID		2299000004
#DEFINE ADVANCED_HELPID		2299000005

#DEFINE C_DEFAULTSTYLE "Embossed"
#DEFINE C_NOSTYLETABLE_LOC 	"Para usar la página Datos ejecute el Asistente para formularios para crear la tabla de estilos visuales."
#DEFINE C_WIZSTYLETABLE1 "WIZARDS\FRMSTYLE.DBF"
#DEFINE C_WIZSTYLETABLE2 "WIZARDS\FRMSTYL2.DBF"
#DEFINE C_WIZSTYLETABLE3 "WIZARDS\RPTSTYLE.DBF"

#DEFINE C_RPTSTYLE1_LOC "Presentación"
#DEFINE C_RPTSTYLE2_LOC "Doble carta"
#DEFINE C_RPTSTYLE3_LOC "Ejecutivo"
#DEFINE C_RPTSTYLE1_FILE "Style1H.FRX"
#DEFINE C_RPTSTYLE2_FILE "Style2H.FRX"
#DEFINE C_RPTSTYLE3_FILE "Style3H.FRX"

#DEFINE C_FORMDESCSUFFIX_LOC " Formulario"
#DEFINE C_RPTDESCSUFFIX_LOC " Informe"

#DEFINE C_ADDFILE_LOC "¿Desea agregar también este archivo a la metatabla del marco de trabajo?"

#DEFINE APPHOOK_FILE	"APPHOOK.VCX"
#DEFINE APPHOOK_CLASS	"APPHOOK"
#DEFINE C_SELECTHOOK_LOC	"Seleccione la clase de enganche de aplicación"

#DEFINE C_INSTALLFRAMEWORK_LOC "El Generador de aplicaciones le permitirá almacenar información adicional "+"para sus formularios e informes si elige instalar una metatabla de aplicación. "+		"¿Desea instalar la metatabla ahora?" +CRLF+CRLF+C_INSTALLFRAMEWORK5_LOC


		
#DEFINE C_INSTALLFRAMEWORK1_LOC "Parece que ya tiene una metatabla de aplicación para este proyecto "+"pero no enganches de proyecto. ¿Desea instalar los enganches de proyecto ahora?" +CRLF+CRLF+C_INSTALLFRAMEWORK5_LOC


#DEFINE C_INSTALLFRAMEWORK2_LOC "Tendrá que cerrar y volver a abrir el proyecto para que surtan efecto todos los cambios."
#DEFINE C_INSTALLFRAMEWORK3_LOC "Tiene instalado un enganche de proyecto personalizado. Puede que algunas opciones de generador estén deshabilitadas."
#DEFINE C_INSTALLFRAMEWORK4_LOC "Parece que tiene una metatabla de aplicación para este proyecto, pero no es una estructura válida para el uso de este generador. Se deshabilitarán ciertas opciones de generador."
#DEFINE C_INSTALLFRAMEWORK5_LOC "Nota: ciertas fichas del generador sólo están disponibles si para crear el proyecto utiliza el Asistente para aplicaciones, que es un entorno de trabajo completo."
#DEFINE C_INSTALLFRAMEWORK6_LOC "La meta tabla de la aplicación especificada no es una meta tabla válida para este Generador. Se desactivarán algunas opciones de los generadores."

#DEFINE C_NOHELP_LOC	"No se pudo cargar el archivo FOXHELP.CHM. Este archivo de Ayuda contiene sugerencias útiles para la programación de sus aplicaciones mediante el Generador de aplicaciones y otras herramientas."

#DEFINE C_DATAPAGEOPEN_LOC	"Hay elementos importantes seleccionados en la página de datos que todavía no han sido procesados. ¿Desea procesarlos antes de salir?"

#DEFINE C_FORMSFOLDER		"FORMS"
#DEFINE C_MENUSFOLDER		"MENUS"
#DEFINE C_REPORTSFOLDER		"REPORTS"
#DEFINE C_DATAFOLDER		"DATA"
#DEFINE C_GALLERYCLASS		"galleryutils"
#DEFINE C_GALLERYCLASSLIB	"GALLERY\VFPGLRY.VCX"
#DEFINE C_WEBCLASSLIB		"GALLERY\_WEBVIEW.VCX"
#DEFINE C_HTMHELP			"WIZARDS\_FRAMEWK.HTM"
#DEFINE C_WEBCLASS			"_webform"
#DEFINE	C_WEBCAPTION_LOC	"¿Qué es lo siguiente?"
#DEFINE C_NOWEBFILE_LOC		"No se pudo encontrar uno de los archivos de Ayuda del Generador de aplicaciones. "+"Asegúrese de que GALLERY\_WEBVIEW.VCX y WIZARDS\_FRAMEWK.HTM "+							"se instalan de forma apropiada en el directorio raíz de Visual FoxPro."



#DEFINE C_NOFRAMEWORK_LOC "Parece que la aplicación no contiene clases de marco de VFP. Se deshabilitarán ciertas tablas."
#DEFINE C_FAILAPPOBJ_LOC	"No se pudo crear un objeto App"
#DEFINE	C_NOUPDATEGO_LOC "No se puedo actualizar el menú Ir a. Asegúrese de que el archivo no está en uso."

#DEFINE	C_NOUPDATE1_LOC "No se pudo actualizar la clase Application. Asegúrese de que el archivo "
#DEFINE	C_NOUPDATE2_LOC " no está en uso."
#DEFINE C_NOFIND_LOC	"No se pudo encontrar la clase Application."
#DEFINE C_NOSPLASH_LOC	"No se pudo encontrar la clase Splash."

#DEFINE C_NOPROJ_LOC	"Debe tener un proyecto abierto."
#DEFINE C_WIZFILEEXISTS1_LOC	"El archivo "
#DEFINE C_WIZFILEEXISTS2_LOC	" ya existe. ¿Desea que el Asistente genere uno nuevo?"

#DEFINE C_METAEXCL1_LOC	"No se pudo "
#DEFINE C_METAEXCL2_LOC	" abrir la metatabla porque se puede usar de forma exclusiva. Debe cerrarla o abrirla en forma compartida para utilizarla con el Generador de aplicaciones."

#DEFINE APP_BUILDER_TOPFORM 	"_topform"
#DEFINE APP_BUILDER_APP		 	"_application"
#DEFINE APP_BUILDER_SPLASH 		"_splash"

#DEFINE TOPMENU_OBJTYPE			5
#DEFINE NORMALMENU_OBJTYPE		1

#DEFINE APP_BUILDER_CLASS_PREFIX 	  "app"
#DEFINE	APP_BUILDER_FILE_SUFFIX		  "_app"

#DEFINE APP_BUILDER_MAINMENU_SUFFIX   "_main"
#DEFINE APP_BUILDER_TOPMENU_SUFFIX    "_top"		
#DEFINE APP_BUILDER_APPENDMENU_SUFFIX "_append"		
#DEFINE APP_BUILDER_GOMENU_SUFFIX     "_go"

#DEFINE STAT_LOADING_LOC	"Cargando el Generador de aplicaciones...."
#DEFINE STAT_APPBLDR_LOC	"Generador de aplicaciones"
#DEFINE STAT_UPDATE_LOC		"Espere mientras se actualiza la aplicación..."

#DEFINE FORM_TYPE_EXTENSIONS	"SCX;VCX;PRG"
#DEFINE REPORT_TYPE_EXTENSIONS	"FRX;LBX;PRG"
#DEFINE BADFILETYPE_LOC	"Se ha seleccionado un tipo de archivo no válido."
#DEFINE NOTINMETA_LOC	"Se han encontrado en la metatabla archivos que ya no existen en el proyecto. ¿Desea quitarlos de la metatabla?"
#DEFINE DELETEFROMMETA_LOC	"¿Realmente desea quitar este documento de la metatabla?"
#DEFINE WRITEOUTPROJECT_LOC	"El Generador de aplicaciones contiene actualmente datos de otro proyecto. ¿Desea guardar estas modificaciones?"

#DEFINE CAPTION_LOC	"Generador de aplicaciones"
#DEFINE UPDATINGAPP_LOC	"Actualizando la aplicación..."

#DEFINE CLEANUPMETA_LOC	"Esta rutina sincronizará el proyecto activo con las entradas de la meta tabla de la aplicación, agregando o quitando archivos de esta para que correspondan con los del proyecto activo. ¿Desea continuar?"

#DEFINE STAT_UPDATEMETA_LOC	"Quitando de la metatabla archivos no encontrados en el proyecto activo..."
#DEFINE STAT_UPDATEPJX_LOC	"Agregando a la metatabla archivos nuevos encontrados en el proyecto activo..."
#DEFINE STAT_REFRESHDONE_LOC	"Actualización finalizada."

#DEFINE	ADDAPPOBJ_LOC	"¿Desea agregar un objeto mediador a este formulario para permitir que se utilice con el marco de la aplicación?"

#DEFINE	MSG_ERROR_LOC	"Número de error: "
#DEFINE	MSG_METHOD_LOC	"Método: "
#DEFINE	MSG_LINENUM_LOC	"Número de línea: "
#DEFINE	MSG_LINE_LOC	"Línea: "
#DEFINE	MSG_MESSAGE_LOC "Mensaje: "
#DEFINE	MSG_ERRORCONTINUE_LOC	"¿Desea seguir ejecutando el generador?"

#DEFINE APPOBJECT_PATH		"\libs\"
#DEFINE APPOBJECT_FILE		"_app.vcx"
#DEFINE APPOBJECT_NAME		"_application"

#DEFINE	FRMOBJECT_CLASS		"_formmediator"
#DEFINE	FRMOBJECT_FILE		"_framewk.vcx"
#DEFINE	FRMOBJECT_NAME		"app_mediator"

#DEFINE C_BASEAPPCLASS		"_application"
#DEFINE C_BASEAPPCLASSLIB	"WIZARDS\_FRAMEWK.VCX"

#DEFINE C_TABLEWIZ "WIZARDS\WZTABLE.APP"
#DEFINE C_DATAWIZ "WIZARDS\WZDBC.APP"

#DEFINE C_NOHOOKFILE_LOC	"No se pudo encontrar el siguiente archivo en la carpeta Wizards: "+APPHOOK_FILE +CRLF+CRLF+"Este archivo es necesario para usar el Generador de aplicaciones."

		
#DEFINE METAFIELD1	"DOC_TYPE"

#DEFINE LOCATEHELP_LOC	"Busque el archivo de ayuda FOXHELP.CHM:"

#DEFINE MENU_ONTOP_LOC		"\<Siempre visible"
#DEFINE MENU_CLEANUP_LOC	"\<Postprograma"
#DEFINE MENU_HELP_LOC		"A\<sistencia"
#DEFINE MENU_CANCEL_LOC		"Cancelar"

#DEFINE C_PJXEXISTS_LOC	"Ya existe este nombre de proyecto, ¿Desea sobrescribirlo?"