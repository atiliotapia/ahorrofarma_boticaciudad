-----------------------------------------------------------
Archivo L�ame del Proveedor de Microsoft OLE DB para ODBC
-----------------------------------------------------------

(c) Microsoft Corporation, 1998

Este documento ofrece noticias de �ltima hora u otra informaci�n que 
sirve de complemento a la documentaci�n del Proveedor de Microsoft 
OLE DB para ODBC.

Consulte el archivo L�ame del Data Access SDK para obtener m�s 
informaci�n acerca de OLE DB.

---------
CONTENIDO
---------
1. DESCRIPCI�N DEL PRODUCTO
2. NUEVAS CARACTER�STICAS
3. NOTAS T�CNICAS
4. LIMITACIONES CONOCIDAS


---------------------------
1. DESCRIPCI�N DEL PRODUCTO
---------------------------
El Proveedor de ODBC ofrece el acceso, con un alto rendimiento, a 
cualquier base de datos ODBC.

-------------------------
2. NUEVAS CARACTER�STICAS
-------------------------
La versi�n 2.0 de este proveedor maneja mejor los bloques grandes de 
datos e incluye mejoras en el rendimiento y la escala. 

-----------------
3. NOTAS T�CNICAS
-----------------
* Nueva propiedad de nombre de servidor
Se ha agregado una nueva propiedad, DBPROP_SERVER_NAME. Esta propiedad 
contiene informaci�n sobre el origen de datos, no es una propiedad de 
inicializaci�n. Devuelve, durante el inicio, el nombre del servidor 
al que est� conectado. En muchos casos, �ste ser� el mismo que el de 
la propiedad DBPROP_INIT_DATASOURCE. Por ejemplo, al conectar con un 
origen de datos ODBC, podr�a especificar un DSN (nombre descriptivo) 
y el servidor le dir�a el nombre del servidor al que est� conectado.

* IOpenRowset no pone entre comillas los nombres de tabla.
El proveedor ODBC no pone entre comillas los nombres de tablas que se 
pasan a trav�s de una Id de base de datos, como por ejemplo 
IOpenRowset. Por tanto, al intentar abrir una tabla frente al 
proveedor ODBC que requiere el nombre entrecomillado (por ejemplo, 
cuando el nombre de tabla contiene caracteres extendidos), el cliente 
debe agregar las comillas al nombre de la tabla de forma manual o 
ejecutar simplemente SELECT * FROM <nombre de tabla entrecomillado>.

* Los par�metros booleanos no se convierten a "True"/"False".
La especificaci�n OLE DB requiere que los booleanos convertidos a 
tipos de datos string aparezcan como las cadenas "True" o "False". 
Al utilizar el proveedor ODBC, si el controlador ODBC subyacente no 
admite SQLDescribeParam y el cliente OLE DB no especifica el tipo de 
par�metro, el proveedor ODBC convertir� los valores de los par�metros 
booleanos a "-1" y "0" cuando el tipo de datos del par�metro es una 
cadena. Para asegurar una conversi�n correcta, en relaci�n con los 
controladores ODBC que no admiten par�metros descriptivos, el cliente 
de OLE DB debe llamar siempre a SetParameterInfo para especificar los 
tipos de par�metros.

-------------------------
4. LIMITACIONES CONOCIDAS
-------------------------
* No utilice DBPROP_INIT_LOCATION con MSDASQL y una base de datos de 
  Microsoft Access.
  Si cuando intenta inicializar MSDASQL (el proveedor ODBC), 
  establece la propiedad de inicializaci�n DBPROP_INIT_LOCATION a 
  un valor v�lido y especifica que DATASOURCE es un origen de datos 
  de Microsoft Access, el sistema se bloquear�. No utilice la 
  propiedad DBPROP_INIT_LOCATION con MSDASQL y un origen de datos de 
  Microsoft Access.


