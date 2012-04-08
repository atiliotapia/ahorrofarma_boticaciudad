--------------------------------------------
Notas de la versi�n

Controlador de Microsoft(R) ODBC para Oracle
--------------------------------------------

(c) 1998 Microsoft Corporation
	  
------------------------
C�mo usar este documento
------------------------

Para ver el archivo L�ame en el Bloc de notas de Windows, maximice la 
ventana del Bloc de notas y seleccione la opci�n Ajuste de l�nea del 
men� Edici�n. Para imprimir el archivo L�ame, �bralo en el Bloc de 
notas o en otro procesador de texto y utilice el comando Imprimir 
del men� Archivo.

Para obtener informaci�n acerca de los cambios en relaci�n con la 
versi�n anterior de este controlador, consulte la secci�n "Lo nuevo" 
de este archivo.

-------------------
Informaci�n general
-------------------

El controlador de Microsoft ODBC para Oracle se ajusta a la 
especificaci�n Conectividad abierta de bases de datos (ODBC) descrita 
en la Referencia del programador de ODBC (versi�n 2.0) de la 
plataforma. El controlador de Oracle permite conectar una aplicaci�n 
compatible con ODBC a una base de datos Oracle.


----------------------
Requisitos del sistema
----------------------

Para poder utilizar el controlador ODBC para Oracle, debe tener 
instalado el software de cliente Oracle, versi�n 7.3 o posterior, en 
el sistema Windows. El controlador de Microsoft ODBC para Oracle 
admite solamente SQL*Net 2.3 o posterior. Para obtener m�s 
informaci�n acerca de los productos de Oracle, consulte la 
documentaci�n de Oracle.

--------
Lo nuevo
--------

Esta versi�n del controlador Microsoft ODBC para Oracle incluye 
algunas mejoras de rendimiento y estabilidad. Encontrar� que el 
controlador tiene una mayor funcionalidad y velocidad debido a las 
siguientes caracter�sticas que se han agregado:

   � Control de configuraci�n mejorado gracias a una serie de 
     elementos agregados al Administrador de or�genes de datos 
     ODBC, incluyendo opciones de Conversi�n, Rendimiento y 
     personalizaci�n.

   � Archivo de Ayuda ampliado.

Esta versi�n incluye tambi�n las caracter�sticas de la versi�n 
anterior, incluyendo:

   � B�squeda extendida mejorada compatible con enlaces de filas. 
        Vea "Funciones de nivel 2" en la Ayuda.
	Para obtener informaci�n espec�fica, consulte la Referencia
        del programador de Microsoft ODBC 3.0 y la Gu�a del SDK. 

   * Integraci�n con Microsoft(r) Transaction Server para 
     transacciones distribuidas.
        Vea "Usar Microsoft Transaction Server" en la Ayuda.

   � Compatibilidad con la sintaxis de Oracle Packaged Procedure en 
     las funciones de cat�logo. 
        Vea "Devolver par�metros matriciales de procedimientos
        almacenados" en la Ayuda.

   � Implementaci�n de SQLDescribeParam para ofrecer una mayor 
     precisi�n en la descripci�n de los par�metros de instrucciones 
     SQL. 
        Vea "Funciones de nivel 2" en la Ayuda.

   � Posibilidad de devolver matrices de procedimientos almacenados. 
        Vea " Devolver par�metros matriciales de procedimientos 
        almacenados " en la Ayuda.
   
   � Compatibilidad con marcadores. 
        Vea "Funciones de nivel 2" y "Tabla de opciones de 
        instrucciones" en la Ayuda.

   � Archivo de Ayuda ampliado.

Esta versi�n del controlador Microsoft ODBC para Oracle cuenta con 
mayor estabilidad debido a las pruebas que se han realizado frente 
a distintos entornos, como Microsoft Transaction Server e Internet 
Information Server.
