	Autor:          Calvin Hsia
	alias de email:   v-calvh
	Fecha de creaci�n: 9/28/94
	Descripci�n:
		Este documento incluye los asistentes para formato y 		documentaci�n.
		No habr� una versi�n 3.0 de Foxdoc.
		
	Para ejecutar el app necesita WZFOXDOC.APP

       Todos los archivos CPP y HPP son el c�digo de origen.
       FDKeywrd es la tabla de palabras clave.


El analizador de c�digo es una herramienta que permite a los usuarios desplazarse por sus programas de Foxpro.

Toma la salida del asistente para formato y lo muestra de una manera interactiva. Consta de un formulario simple con un marco de p�ginas de 2 p�ginas.

La primera p�gina tiene un cuadro de lista que muestra todos los s�mbolos del usuario y una cuadr�cula que muestra donde se encuentra dentro del c�digo el s�mbolo seleccionado en cuadro de lista. Por ejemplo, si hay un s�mbolo FOO en el c�digo, puede elegir FOO en el cuadro de lista y la cuadr�cula mostrar� en qu� archivo existe una referencia a este s�mbolo, si es en un programa, un archivo de men�, un archivo de pantalla, una biblioteca de clases o un contenedor de bases de datos. Si hace doble clic en el elemento de la cuadr�cula, el archivo de referencia se abrir� para su examen.

Existe un men� en el analizador que le permite desplazarse por el c�digo. Presione Ctrl-N para desplazarse a la siguiente aparici�n de FOO. Mientras busque en un VCX, ver� una l�nea:

	FOO=BAR

Resalte BAR con el cursor y, a continuaci�n, presione Ctrl-D para ir a la definici�n de BAR. Ctrl-R ir� a cualquier referencia.

La segunda p�gina tiene un control esquema que mostrar� la jerarqu�a de �rbol de llamada del programa o de la jerarqu�a de clases.

