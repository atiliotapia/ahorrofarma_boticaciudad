--------------------------------------------
Notas de la versión

Controlador de Microsoft(R) ODBC para Oracle
--------------------------------------------

(c) 1998 Microsoft Corporation
	  
------------------------
Cómo usar este documento
------------------------

Para ver el archivo Léame en el Bloc de notas de Windows, maximice la 
ventana del Bloc de notas y seleccione la opción Ajuste de línea del 
menú Edición. Para imprimir el archivo Léame, ábralo en el Bloc de 
notas o en otro procesador de texto y utilice el comando Imprimir 
del menú Archivo.

Para obtener información acerca de los cambios en relación con la 
versión anterior de este controlador, consulte la sección "Lo nuevo" 
de este archivo.

-------------------
Información general
-------------------

El controlador de Microsoft ODBC para Oracle se ajusta a la 
especificación Conectividad abierta de bases de datos (ODBC) descrita 
en la Referencia del programador de ODBC (versión 2.0) de la 
plataforma. El controlador de Oracle permite conectar una aplicación 
compatible con ODBC a una base de datos Oracle.


----------------------
Requisitos del sistema
----------------------

Para poder utilizar el controlador ODBC para Oracle, debe tener 
instalado el software de cliente Oracle, versión 7.3 o posterior, en 
el sistema Windows. El controlador de Microsoft ODBC para Oracle 
admite solamente SQL*Net 2.3 o posterior. Para obtener más 
información acerca de los productos de Oracle, consulte la 
documentación de Oracle.

--------
Lo nuevo
--------

Esta versión del controlador Microsoft ODBC para Oracle incluye 
algunas mejoras de rendimiento y estabilidad. Encontrará que el 
controlador tiene una mayor funcionalidad y velocidad debido a las 
siguientes características que se han agregado:

   · Control de configuración mejorado gracias a una serie de 
     elementos agregados al Administrador de orígenes de datos 
     ODBC, incluyendo opciones de Conversión, Rendimiento y 
     personalización.

   · Archivo de Ayuda ampliado.

Esta versión incluye también las características de la versión 
anterior, incluyendo:

   · Búsqueda extendida mejorada compatible con enlaces de filas. 
        Vea "Funciones de nivel 2" en la Ayuda.
	Para obtener información específica, consulte la Referencia
        del programador de Microsoft ODBC 3.0 y la Guía del SDK. 

   * Integración con Microsoft(r) Transaction Server para 
     transacciones distribuidas.
        Vea "Usar Microsoft Transaction Server" en la Ayuda.

   · Compatibilidad con la sintaxis de Oracle Packaged Procedure en 
     las funciones de catálogo. 
        Vea "Devolver parámetros matriciales de procedimientos
        almacenados" en la Ayuda.

   · Implementación de SQLDescribeParam para ofrecer una mayor 
     precisión en la descripción de los parámetros de instrucciones 
     SQL. 
        Vea "Funciones de nivel 2" en la Ayuda.

   · Posibilidad de devolver matrices de procedimientos almacenados. 
        Vea " Devolver parámetros matriciales de procedimientos 
        almacenados " en la Ayuda.
   
   · Compatibilidad con marcadores. 
        Vea "Funciones de nivel 2" y "Tabla de opciones de 
        instrucciones" en la Ayuda.

   · Archivo de Ayuda ampliado.

Esta versión del controlador Microsoft ODBC para Oracle cuenta con 
mayor estabilidad debido a las pruebas que se han realizado frente 
a distintos entornos, como Microsoft Transaction Server e Internet 
Information Server.
