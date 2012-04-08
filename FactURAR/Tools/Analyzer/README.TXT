	Autor:          Calvin Hsia
	alias de email:   v-calvh
	Fecha de creación: 9/28/94
	Descripción:
		Este documento incluye los asistentes para formato y 		documentación.
		No habrá una versión 3.0 de Foxdoc.
		
	Para ejecutar el app necesita WZFOXDOC.APP

       Todos los archivos CPP y HPP son el código de origen.
       FDKeywrd es la tabla de palabras clave.


El analizador de código es una herramienta que permite a los usuarios desplazarse por sus programas de Foxpro.

Toma la salida del asistente para formato y lo muestra de una manera interactiva. Consta de un formulario simple con un marco de páginas de 2 páginas.

La primera página tiene un cuadro de lista que muestra todos los símbolos del usuario y una cuadrícula que muestra donde se encuentra dentro del código el símbolo seleccionado en cuadro de lista. Por ejemplo, si hay un símbolo FOO en el código, puede elegir FOO en el cuadro de lista y la cuadrícula mostrará en qué archivo existe una referencia a este símbolo, si es en un programa, un archivo de menú, un archivo de pantalla, una biblioteca de clases o un contenedor de bases de datos. Si hace doble clic en el elemento de la cuadrícula, el archivo de referencia se abrirá para su examen.

Existe un menú en el analizador que le permite desplazarse por el código. Presione Ctrl-N para desplazarse a la siguiente aparición de FOO. Mientras busque en un VCX, verá una línea:

	FOO=BAR

Resalte BAR con el cursor y, a continuación, presione Ctrl-D para ir a la definición de BAR. Ctrl-R irá a cualquier referencia.

La segunda página tiene un control esquema que mostrará la jerarquía de árbol de llamada del programa o de la jerarquía de clases.

