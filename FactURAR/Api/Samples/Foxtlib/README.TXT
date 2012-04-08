========================================================================
		DLL de control OLE : FOXTLIB
========================================================================

ControlWizard ha creado este proyecto para la DLL de control OLE 
FOXTLIB, que contiene 1 control. 

Esta estructura de proyecto no sólo muestra las bases para escribir
un control OLE, sino que también es un punto de partida para escribir 
las características específicas del control.

Este archivo contiene un resumen de lo que encontrará en cada uno de 
los archivos que componen la DLL de control OLE FOXTLIB.

foxtlib.mak
	Archivo de proyecto de Visual C++ para crear el control OLE.
        
foxtlib.h
        Archivo de inclusión principal para la DLL de
        control OLE. Incluye otros archivos de inclusión específicos del 	proyecto, como resource.h.
	
foxtlib.cpp
        Archivo de código de origen principal, que contiene código para la 
        inicialización, finalización y contabilidad de la DLL. 
	
foxtlib.rc
        Lista de recursos de Microsoft Windows que utiliza
        el proyecto. Este archivo puede editarse directamente en el 
        editor de recursos de Visual C++. 
	
foxtlib.def
        Este archivo contiene información sobre la DLL de control OLE
        que se debe proporcionar para que se ejecute en Microsoft Windows.      

foxtlib.clw
        Este archivo contiene información utilizada por ClassWizard para
        editar clases existentes o agregar clases nuevas. ClassWizard también 
	lo utiliza para almacenar información necesaria para 	        	generar	y editar mapas de mensajes y mapas de datos de 	cuadros de diálogos y para generar funciones miembro prototipo. 
	
foxtlib.odl
        Este archivo contiene el código de origen del Lenguaje de descripción
        de objetos para la biblioteca de tipos del control.
	

/////////////////////////////////////////////////////////////////////////////
Control Foxtlib:

FoxtlibCtl.h
        Este archivo contiene la declaración de la clase de C++ CFoxtlibCtrl.
	
FoxtlibCtl.cpp
        Este archivo contiene la implementación de la clase de C++ 		CFoxtlibCtrl. 
	
FoxtlibPpg.h
        Este archivo contiene la declaración de la clase de C++ 		CFoxtlibPropPage. 
	
FoxtlibPpg.cpp
        Este archivo contiene la implementación de la clase de C++ 		CFoxtlibPropPage. 
	
FoxtlibCtl.bmp
        Este archivo contiene un mapa de bits que utilizará un contenedor 	para representar el control CFoxtlibCtrl cuando aparezca en una         	paleta de herramientas. Este mapa de bits se incluye mediante el 	archivo de recursos principal foxtlib.rc.

/////////////////////////////////////////////////////////////////////////////
Soporte de ayuda:

MakeHelp.bat
        Use este archivo de proceso por lotes para crear el archivo de Ayuda 	del control OLE, foxtlib.hlp.
	
foxtlib.hpj
        Este archivo es el archivo del proyecto de Ayuda utilizado por el
        compilador de Ayuda para crear el archivo de ayuda del control OLE.
	
*.bmp
        Archivos de mapa de bits requeridos por los temas estándar del 		archivo de Ayuda estándar para los comandos estándar de la 		biblioteca Foundation Class de Microsoft. Estos archivos se 		encuentran en el subdirectorio HLP.
	
foxtlib.rtf
        Este archivo contiene los temas de ayuda estándar para las 		propiedades, eventos y métodos comunes admitidos por muchos controles 	OLE. Puede editarlo para agregar o quitar temas específicos del 	control adicionales. Este archivo se encuentra en el subdirectorio 	HLP.

/////////////////////////////////////////////////////////////////////////////
Otros archivos estándar:

stdafx.h, stdafx.cpp
        Estos archivos se utilizan para crear un archivo de encabezado
        precompilado (PCH) denominado stdafx.pch y un archivo de tipos 		precompilados (PCT) denominado stdafx.obj. 

resource.h
        Archivo de encabezado estándar, que define nuevos Id. de recursos
        El editor de recursos de Visual C++ lee y actualiza este archivo.

/////////////////////////////////////////////////////////////////////////////
Otras notas:

ControlWizard utiliza "TODO:" para indicar partes del código fuente que debe 
agregar o personalizar.

/////////////////////////////////////////////////////////////////////////////
