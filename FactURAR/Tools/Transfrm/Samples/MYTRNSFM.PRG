* MyTrnsfm.prg
* Example of subclassing the Transformer.
* To run the subclassed Transformer, execute:
*      DO Transfrm WITH "MyTrnsfm.prg,MyTransformer","MyTrnsfm.prg,MyTransformFiles"
*
	
#DEFINE CAPTION_LOC	"Mi transformador"
#DEFINE SUBCLASS_LOC	"  Se ha creado una subclase del proceso de transformación."
#DEFINE MENU_LOC	"Menú: "
#DEFINE REPORT_LOC	"Informe: "


DEFINE CLASS MyTransformer AS Transformer

	Caption=CAPTION_LOC

ENDDEFINE



DEFINE CLASS MyTransformFiles AS TransformFiles


	cGetFileExt='pjx|scx|vcx|mnx|frx'


	FUNCTION Do(tlAddFontRules)
		MESSAGEBOX(SUBCLASS_LOC,48, ;
			this.parent.Caption)
	RETURN oTransformFiles::Do(tlAddFontRules)
	ENDFUNC


	PROTECTED FUNCTION ProcessMenuRules
	ACTIVATE SCREEN
	? MENU_LOC+DBF()
	GO BOTTOM
	ENDFUNC


	PROTECTED FUNCTION ProcessReportRules
	ACTIVATE SCREEN
	? REPORT_LOC+DBF()
	GO BOTTOM
	ENDFUNC


ENDDEFINE
