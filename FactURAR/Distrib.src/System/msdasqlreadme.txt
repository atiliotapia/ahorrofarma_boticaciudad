-----------------------------------------------------------
Archivo Léame del Proveedor de Microsoft OLE DB para ODBC
-----------------------------------------------------------

(c) Microsoft Corporation, 1998

Este documento ofrece noticias de última hora u otra información que 
sirve de complemento a la documentación del Proveedor de Microsoft 
OLE DB para ODBC.

Consulte el archivo Léame del Data Access SDK para obtener más 
información acerca de OLE DB.

---------
CONTENIDO
---------
1. DESCRIPCIÓN DEL PRODUCTO
2. NUEVAS CARACTERÍSTICAS
3. NOTAS TÉCNICAS
4. LIMITACIONES CONOCIDAS


---------------------------
1. DESCRIPCIÓN DEL PRODUCTO
---------------------------
El Proveedor de ODBC ofrece el acceso, con un alto rendimiento, a 
cualquier base de datos ODBC.

-------------------------
2. NUEVAS CARACTERÍSTICAS
-------------------------
La versión 2.0 de este proveedor maneja mejor los bloques grandes de 
datos e incluye mejoras en el rendimiento y la escala. 

-----------------
3. NOTAS TÉCNICAS
-----------------
* Nueva propiedad de nombre de servidor
Se ha agregado una nueva propiedad, DBPROP_SERVER_NAME. Esta propiedad 
contiene información sobre el origen de datos, no es una propiedad de 
inicialización. Devuelve, durante el inicio, el nombre del servidor 
al que está conectado. En muchos casos, éste será el mismo que el de 
la propiedad DBPROP_INIT_DATASOURCE. Por ejemplo, al conectar con un 
origen de datos ODBC, podría especificar un DSN (nombre descriptivo) 
y el servidor le diría el nombre del servidor al que está conectado.

* IOpenRowset no pone entre comillas los nombres de tabla.
El proveedor ODBC no pone entre comillas los nombres de tablas que se 
pasan a través de una Id de base de datos, como por ejemplo 
IOpenRowset. Por tanto, al intentar abrir una tabla frente al 
proveedor ODBC que requiere el nombre entrecomillado (por ejemplo, 
cuando el nombre de tabla contiene caracteres extendidos), el cliente 
debe agregar las comillas al nombre de la tabla de forma manual o 
ejecutar simplemente SELECT * FROM <nombre de tabla entrecomillado>.

* Los parámetros booleanos no se convierten a "True"/"False".
La especificación OLE DB requiere que los booleanos convertidos a 
tipos de datos string aparezcan como las cadenas "True" o "False". 
Al utilizar el proveedor ODBC, si el controlador ODBC subyacente no 
admite SQLDescribeParam y el cliente OLE DB no especifica el tipo de 
parámetro, el proveedor ODBC convertirá los valores de los parámetros 
booleanos a "-1" y "0" cuando el tipo de datos del parámetro es una 
cadena. Para asegurar una conversión correcta, en relación con los 
controladores ODBC que no admiten parámetros descriptivos, el cliente 
de OLE DB debe llamar siempre a SetParameterInfo para especificar los 
tipos de parámetros.

-------------------------
4. LIMITACIONES CONOCIDAS
-------------------------
* No utilice DBPROP_INIT_LOCATION con MSDASQL y una base de datos de 
  Microsoft Access.
  Si cuando intenta inicializar MSDASQL (el proveedor ODBC), 
  establece la propiedad de inicialización DBPROP_INIT_LOCATION a 
  un valor válido y especifica que DATASOURCE es un origen de datos 
  de Microsoft Access, el sistema se bloqueará. No utilice la 
  propiedad DBPROP_INIT_LOCATION con MSDASQL y un origen de datos de 
  Microsoft Access.


