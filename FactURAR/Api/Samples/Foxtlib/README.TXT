========================================================================
		DLL de control OLE : FOXTLIB
========================================================================

ControlWizard ha creado este proyecto para la DLL de control OLE 
FOXTLIB, que contiene 1 control. 

Esta estructura de proyecto no s�lo muestra las bases para escribir
un control OLE, sino que tambi�n es un punto de partida para escribir 
las caracter�sticas espec�ficas del control.

Este archivo contiene un resumen de lo que encontrar� en cada uno de 
los archivos que componen la DLL de control OLE FOXTLIB.

foxtlib.mak
	Archivo de proyecto de Visual C++ para crear el control OLE.
        
foxtlib.h
        Archivo de inclusi�n principal para la DLL de
        control OLE. Incluye otros archivos de inclusi�n espec�ficos del 	proyecto, como resource.h.
	
foxtlib.cpp
        Archivo de c�digo de origen principal, que contiene c�digo para la 
        inicializaci�n, finalizaci�n y contabilidad de la DLL. 
	
foxtlib.rc
        Lista de recursos de Microsoft Windows que utiliza
        el proyecto. Este archivo puede editarse directamente en el 
        editor de recursos de Visual C++. 
	
foxtlib.def
        Este archivo contiene informaci�n sobre la DLL de control OLE
        que se debe proporcionar para que se ejecute en Microsoft Windows.      

foxtlib.clw
        Este archivo contiene informaci�n utilizada por ClassWizard para
        editar clases existentes o agregar clases nuevas. ClassWizard tambi�n 
	lo utiliza para almacenar informaci�n necesaria para 	        	generar	y editar mapas de mensajes y mapas de datos de 	cuadros de di�logos y para generar funciones miembro prototipo. 
	
foxtlib.odl
        Este archivo contiene el c�digo de origen del Lenguaje de descripci�n
        de objetos para la biblioteca de tipos del control.
	

/////////////////////////////////////////////////////////////////////////////
Control Foxtlib:

FoxtlibCtl.h
        Este archivo contiene la declaraci�n de la clase de C++ CFoxtlibCtrl.
	
FoxtlibCtl.cpp
        Este archivo contiene la implementaci�n de la clase de C++ 		CFoxtlibCtrl. 
	
FoxtlibPpg.h
        Este archivo contiene la declaraci�n de la clase de C++ 		CFoxtlibPropPage. 
	
FoxtlibPpg.cpp
        Este archivo contiene la implementaci�n de la clase de C++ 		CFoxtlibPropPage. 
	
FoxtlibCtl.bmp
        Este archivo contiene un mapa de bits que utilizar� un contenedor 	para representar el control CFoxtlibCtrl cuando aparezca en una         	paleta de herramientas. Este mapa de bits se incluye mediante el 	archivo de recursos principal foxtlib.rc.

/////////////////////////////////////////////////////////////////////////////
Soporte de ayuda:

MakeHelp.bat
        Use este archivo de proceso por lotes para crear el archivo de Ayuda 	del control OLE, foxtlib.hlp.
	
foxtlib.hpj
        Este archivo es el archivo del proyecto de Ayuda utilizado por el
        compilador de Ayuda para crear el archivo de ayuda del control OLE.
	
*.bmp
        Archivos de mapa de bits requeridos por los temas est�ndar del 		archivo de Ayuda est�ndar para los comandos est�ndar de la 		biblioteca Foundation Class de Microsoft. Estos archivos se 		encuentran en el subdirectorio HLP.
	
foxtlib.rtf
        Este archivo contiene los temas de ayuda est�ndar para las 		propiedades, eventos y m�todos comunes admitidos por muchos controles 	OLE. Puede editarlo para agregar o quitar temas espec�ficos del 	control adicionales. Este archivo se encuentra en el subdirectorio 	HLP.

/////////////////////////////////////////////////////////////////////////////
Otros archivos est�ndar:

stdafx.h, stdafx.cpp
        Estos archivos se utilizan para crear un archivo de encabezado
        precompilado (PCH) denominado stdafx.pch y un archivo de tipos 		precompilados (PCT) denominado stdafx.obj. 

resource.h
        Archivo de encabezado est�ndar, que define nuevos Id. de recursos
        El editor de recursos de Visual C++ lee y actualiza este archivo.

/////////////////////////////////////////////////////////////////////////////
Otras notas:

ControlWizard utiliza "TODO:" para indicar partes del c�digo fuente que debe 
agregar o personalizar.

/////////////////////////////////////////////////////////////////////////////
