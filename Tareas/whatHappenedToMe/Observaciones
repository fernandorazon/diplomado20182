##Reporte técnico

-A correr la aplicación se mostró el siguiente error:

  -2018-03-01 12:39:46.270557-0600 prueba[2196:41064] *** Terminating app due to uncaught exception 'NSUnknownKeyException', reason: '[<prueba.ViewController 0x7fda94e051c0> setValue:forUndefinedKey:]: this class is not key value coding-compliant for the key outletText.'

  -Con la consecuente caìda del hilo de ejecución.

-El proyecto tal y como lo recibí contenía una serie de errores técnicos:

  -El UITextfield declarado como variable no estaba correctamente declarado como un outlet del controlador. Debido a que no considero que sea el mejor objeto para regresar un texto se sustituyó por un label llamado showLabel correctamente instanciado.

  -Existían dos botones y dos TextFieds agregados a la vista que no estaban instancias en el controlador. Se borraron los Textfields y se dejó solamente un botón.

  -La función actionButton no estaba especificada como una acción del controlador, por lo que se tuvo que especificar.

  -El sender de la función actionButton estaba como Any, se cambio para que fuera específicamente el UIButton.

  -Comenté la línea que especificaba el nombre del botones y en su lugar agregué el nombre del botón desde la propia vista. 

  -Se agregaron constraints al botón y al label para que estén siempre centrados según los requerimientos del cliente.

##Conclusiones

  - En esta actividad aprendí un nuevo objeto de la vista llamado TextField.
  
  - Indague sobre algunos problemas de caida de hilos y de instancias del controlador a la vista.
