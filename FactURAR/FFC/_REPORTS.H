* _REPORTS.H

* Header file for _REPORTS.VCX classes

* common dialog flag constants and results for ShowFont:
#DEFINE cdlCFScreenFonts                        0x1
#DEFINE cdlCFANSIOnly                           0x400
#DEFINE cdlCFForceFontExist                     0x10000
#DEFINE cdlCFNoStyleSel	                        0x100000
#DEFINE cdlCFFixedPitchOnly	                    0x4000	

* common dialog constants for ShowOpen/ShowSave:
#DEFINE cdlOFNPathMustExist                     0x800	
#DEFINE cdlOFNNoChangeDir                       0x8
#DEFINE cdlOFNHideReadOnly                      0x4
#DEFINE cdlOFNExplorer                          0x80000	
#DEFINE cdlOFNFileMustExist                     0x1000	
#DEFINE cdlOFNOverwritePrompt                   0x2
#DEFINE cdlOFNNoReadOnlyReturn                  0x8000

#DEFINE VERTICAL_SCROLLBAR_WIDTH                5

#DEFINE SHOWTEXT_TEXT_EDITOR_LOC                "Visor de texto"

#DEFINE WINDOWSTATE_MAXIMIZED                   2
#DEFINE WINDOWSTATE_NORM                        0

* _dialog fonts
#DEFINE SYSTEM_LARGEFONTS            FONTMETRIC(1, 'MS Sans Serif', 8, '') # 13 OR ;
                                     FONTMETRIC(4, 'MS Sans Serif', 8, '') # 2 OR ;
                                     FONTMETRIC(6, 'MS Sans Serif', 8, '') # 5 OR ;
                                     FONTMETRIC(7, 'MS Sans Serif', 8, '') # 11
                                     
#DEFINE DIALOG_SMALLFONT_NAME        "MS Sans Serif"
#DEFINE DIALOG_LARGEFONT_NAME        "Arial"

* destinations:
#DEFINE OUTPUT_PRINT_REPORT_LOC                "Imprimir informe"
#DEFINE OUTPUT_PRINT_LIST_LOC                  "Imprimir lista de la tabla"
#DEFINE OUTPUT_SCREEN_LOC                      "Vista previa"
#DEFINE OUTPUT_TEXTFILE_LOC                    "Archivo de texto"
#DEFINE OUTPUT_HTMLFILE_LOC                    "Archivo HTML"
#DEFINE OUTPUT_PRINTFILE_LOC                   "Archivo de imagen impresa"
#DEFINE OUTPUT_EXPORT_LOC                      "Exportar tabla"

* screen options:
#DEFINE OUTPUT_SCREEN_PREVIEW_LOC              "Vista previa del informe"
#DEFINE OUTPUT_SCREEN_GRAPHICAL_LOC            "Vista previa del informe gráfico"
#DEFINE OUTPUT_SCREEN_ASCII_LOC                "Vista previa del informe de texto"
#DEFINE OUTPUT_SCREEN_BROWSE_LOC               "Vista de examen de tabla"
#DEFINE OUTPUT_SCREEN_LIST_LOC                 "Vista de lista simple de tabla"

* HTML options:
#DEFINE OUTPUT_HTML_FILEONLY_LOC               "Sólo generar, no mostrar"
#DEFINE OUTPUT_HTML_VIEWSOURCE_LOC             "Ver el origen generado"
#DEFINE OUTPUT_HTML_WEBVIEW_LOC                "Ver el resultado en el explorador web"

#DEFINE OUTPUT_KEY_FOR_TOOLBAR_LOC             "Presione Ctrl-R para mostrar la barra de herramientas Vista previa de informe si es necesario..."

* print options:
#DEFINE OUTPUT_PRINT_OPTIONS_WINDEFAULT_LOC    "Impresora predeterminada de Windows"
#DEFINE OUTPUT_PRINT_OPTIONS_VFPDEFAULT_LOC    "Impresora predeterminada de VFP"
#DEFINE OUTPUT_PRINT_OPTIONS_SETVFPDEFAULT_LOC "Seleccionar y utilizar nuevos valores predeterminados para VFP"

#DEFINE OUTPUT_DESTINATION_TEXTFILE_LOC        "Seleccione el nombre del archivo de texto de destino"
#DEFINE OUTPUT_SOURCE_REPORT_LOC               "Seleccione un informe"

#DEFINE OUTPUT_REPORT_NOT_FOUND_LOC            "No se encuentra el informe"

#DEFINE OUTPUT_REPORT_OR_DATASOURCE_REQUIRED_LOC "Este cuadro de diálogo necesita información del informe o del origen de datos."
#DEFINE MB_ICONEXCLAMATION                     48

* export options

#DEFINE OUTPUT_EXPORT_EXCEL97   "Excel 97"
#DEFINE OUTPUT_EXPORT_EXCEL5    "Excel 5.0"
#DEFINE OUTPUT_EXPORT_EXCEL2    "Excel 2.0"
#DEFINE OUTPUT_EXPORT_FOX2X     "Fox 2.X"
#DEFINE OUTPUT_EXPORT_FOXPLUS   "Xbase"
#DEFINE OUTPUT_EXPORT_FIXEDLEN  "Fixed Length"
#DEFINE OUTPUT_EXPORT_DELIMITED "Delimited"
#DEFINE OUTPUT_EXPORT_LOTUS2    "Lotus 2.x"
#DEFINE OUTPUT_EXPORT_DIF       "Data Interchange Format"
#DEFINE OUTPUT_EXPORT_SYMPHONY  "Symphony 1.10"
#DEFINE OUTPUT_EXPORT_CSV       "Separated Values"


