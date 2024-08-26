# Tipos de kernel
## Tipos de Kernel y sus diferencias
El kernel supervisa la organización de procesos y datos de cada ordenador en un segundo plano. Sin él, prácticamente nada funciona.

El kernel es el núcleo de un sistema operativo y, por tanto, la interfaz entre el software y el hardware. Es por ello por lo que se está usando continuamente. En pocas palabras: el kernel es el corazón de un sistema operativo.

Sin embargo, no solo es el núcleo del sistema, sino también un programa que controla todos los accesos al procesador y a la memoria, es responsable de los drivers (controladores) más importantes y puede acceder directamente al hardware. Un kernel es la base de la interacción entre el hardware y el software y gestiona sus recursos de la forma más eficiente posible.

### ¿Qué es el kernel?
El kernel se encuentra en el centro del sistema operativo y controla todas las funciones importantes del hardware, ya sea un sistema Linux macOS o Windows, un smartphone, un servidor, una virtualización como KVM o cualquier otro tipo de ordenador.

### ¿Cuáles son los tipos de kernel?
Si varios procesos se ejecutan en un kernel al mismo tiempo, existen los llamados multitasking kernel. Con la incorporación de la gestión de accesos, se convierte en un sistema multiusuario en el que varios usuarios pueden trabajar simultáneamente. La autenticación la realiza el kernel, que puede asignar o desvincular los procesos llamados.

### ¿Qué es el kernel de código abierto?
Linux mantiene un extenso registro sobre sus kernels. Apple ha publicado como código abierto los tipos de kernel que usa para todos sus sistemas operativos. A su vez, Microsoft también utiliza un kernel Linux para el Windows Subsystem for Linux.1

### Los tres tipos de kernel
Existen diferentes tipos de kernel para diferentes sistemas operativos y dispositivos finales. Conforme a sus características, pueden dividirse en tres grupos:

1. **Kernel monolítico**. Un kernel grande para todas las tareas. Es el único responsable de la gestión de la memoria y de los procesos, de la comunicación entre procesos y proporciona funciones de soporte de drivers y hardware. Los sistemas operativos que usan el kernel monolítico son Linux, OS X y Windows.

2. **Microkernel**. El microkernel se ha diseñado intencionadamente de un tamaño pequeño para que en caso de fallo no paralice todo el sistema operativo. No obstante, para que pueda asumir las mismas funciones que un kernel grande, está dividido en varios módulos. Como ejemplo de aplicación solo existe el componente Mach de OS X, ya que hasta ahora no hay ningún sistema operativo con microkernel.

3. **Kernel híbrido**. La combinación del kernel monolítico y el microkernel se denomina kernel híbrido. En este caso, el kernel grande se hace más compacto y modulable. Otras partes del kernel pueden cargarse dinámicamente. Esto ya ocurre en cierta medida en Linux y OS X.

### Kernel de linux
Linux, aunque comúnmente se asocia con el término "kernel monolítico," tiene varias versiones y tipos de kernels que sirven diferentes propósitos.

#### 1. Estable (Stable):

**Descripción** Es la versión del kernel que ha pasado por todas las fases de desarrollo y pruebas y se considera apta para ser utilizada en sistemas de producción. Esta versión recibe correcciones de seguridad y parches importantes.
**Propósito**: Se utiliza en entornos donde la estabilidad es prioritaria, como en servidores y sistemas de producción.

#### 2. LTS (Long-Term Support):

**Descripción** El kernel LTS es una versión del kernel estable que recibe soporte a largo plazo, generalmente durante varios años (por lo común, 2 a 6 años). Esto incluye actualizaciones de seguridad y correcciones críticas.

**Propósito**: Es ideal para entornos que requieren estabilidad y soporte prolongado, como sistemas empresariales y dispositivos embebidos.

#### 3. RT (Real-Time):

**Descripción** El kernel RT o de tiempo real está diseñado para aplicaciones que necesitan tiempos de respuesta estrictos y predecibles. Esto es crucial en sistemas donde el tiempo de respuesta es crítico, como en sistemas embebidos, automatización industrial, y dispositivos médicos.

**Propósito**: Se utiliza en aplicaciones donde los tiempos de latencia deben ser minimizados y consistentes.

#### 4. Hardened:

**Descripción** Este tipo de kernel está reforzado con características de seguridad adicionales para proteger contra vulnerabilidades y ataques. Incluye parches y configuraciones que dificultan la explotación de errores de seguridad.

**Propósito**: Es ideal para sistemas que requieren un nivel muy alto de seguridad, como servidores expuestos a internet, infraestructuras críticas, y sistemas que manejan datos sensibles.

#### 5. Zen:

**Descripción** El kernel Zen está optimizado para ofrecer un rendimiento superior, especialmente en tareas relacionadas con el uso cotidiano del escritorio y el gaming. Incluye parches y configuraciones que mejoran la latencia y el rendimiento general del sistema.

**Propósito**: Es popular entre los entusiastas y gamers que buscan un kernel con rendimiento mejorado y una experiencia más fluida en el uso de sus sistemas.

#### 6. Linux-libre:

**Descripción** Linux-libre es una versión del kernel que ha sido "limpiada" de cualquier componente de software propietario o blobs binarios (código cerrado). Esto está en línea con la filosofía del software libre que promueve la utilización de software que respete las libertades de los usuarios.

**Propósito**: Es utilizado por personas y organizaciones que buscan una versión del kernel que cumpla estrictamente con los principios del software libre, como las distribuciones GNU.
Estos distintos tipos de kernels en Linux permiten a los usuarios elegir el más adecuado según sus necesidades, ya sea para un entorno de producción estable, un sistema con requerimientos de tiempo real, o un sistema enfocado en la seguridad o el rendimiento.


## User vs Kernel Mode
Existen básicamente dos modos para el código de un sistema: modo kernel o modo usuario. El código en modo kernel tiene acceso ilimitado al hardware, mientras que el código en modo usuario tiene acceso restringido al SCI. Cuando se produce un error en el modo de usuario, no ocurre mucho: de hecho, en ese momento el kernel interviene y repara los posibles daños. Por otro lado, un fallo del kernel puede hacer caer todo el sistema. No obstante, existen precauciones de seguridad para evitarlo.

| Criterio                      | Modo Kernel                                                                                  | Modo Usuario                                                                                                   |
|-------------------------------|----------------------------------------------------------------------------------------------|----------------------------------------------------------------------------------------------------------------|
| **Acceso a Recursos**         | En modo kernel, el programa tiene acceso directo e irrestricto a los recursos del sistema.   | En modo usuario, el programa de aplicación no tiene acceso directo a los recursos del sistema. Para acceder a los recursos, se debe realizar una llamada al sistema. |
| **Interrupciones**            | En modo kernel, todo el sistema operativo puede fallar si ocurre una interrupción.           | En modo usuario, solo falla un proceso si ocurre una interrupción.                                             |
| **Modos**                     | El modo kernel también es conocido como modo maestro, modo privilegiado, o modo sistema.     | El modo usuario también es conocido como modo no privilegiado, modo restringido, o modo esclavo.              |
| **Espacio de direcciones virtuales** | En modo kernel, todos los procesos comparten un único espacio de direcciones virtuales. | En modo usuario, todos los procesos obtienen un espacio de direcciones virtuales separado.                   |
| **Nivel de privilegio**       | En modo kernel, las aplicaciones tienen más privilegios en comparación con el modo usuario.  | Mientras que en modo usuario, las aplicaciones tienen menos privilegios.                                       |
| **Restricciones**             | Como el modo kernel puede acceder tanto a los programas de usuario como a los del kernel, no hay restricciones. | Mientras que el modo usuario necesita acceder a los programas del kernel ya que no puede acceder a ellos directamente. |
| **Valor del bit de modo**     | El bit de modo del modo kernel es 0.                                                          | Mientras que el bit de modo del modo usuario es 1.                                                             |
| **Referencias de Memoria**    | Es capaz de referenciar ambas áreas de memoria.                                              | Solo puede hacer referencias a la memoria asignada para el modo usuario.                                       |
| **Fallo del Sistema**         | Un fallo del sistema en modo kernel es severo y complica las cosas.                          | En modo usuario, un fallo del sistema puede ser recuperado simplemente reanudando la sesión.                   |
| **Acceso**                    | Solo se permite operar la funcionalidad esencial en este modo.                               | Los programas de usuario pueden acceder y ejecutarse en este modo para un sistema dado.                        |
| **Funcionalidad**             | El modo kernel puede referirse a cualquier bloque de memoria en el sistema y también dirigir la CPU para la ejecución de una instrucción, lo que lo convierte en un modo muy potente y significativo. | El modo usuario es un modo estándar y típico de visualización, lo que implica que la información no puede ejecutarse por sí sola ni referirse a ningún bloque de memoria; necesita una Interfaz de Protocolo de Aplicación (API) para lograr estas cosas. |


## Interruptions vs traps
### ¿Qué es una Trampa (traps) en un Sistema Operativo?
Una trampa en un sistema operativo es una interrupción generada por software, provocada por un error o una excepción que ocurre mientras un programa se está ejecutando. Cuando se produce una trampa, la CPU cambia del modo usuario al modo kernel y salta al manejador de trampas, un punto predefinido en el sistema operativo. Las trampas pueden ocurrir por varias razones, como división por cero, acceso a direcciones de memoria erróneas, ejecución de instrucciones incorrectas, u otros eventos inesperados que podrían hacer que el programa falle o arroje resultados incorrectos.

Las trampas también pueden ser creadas intencionalmente por el software para solicitar un servicio específico al sistema operativo, como leer de un archivo o asignar memoria. El manejador de trampas del sistema operativo es responsable de gestionar la trampa y tomar la acción adecuada según la causa de la misma. Por ejemplo, si una instrucción ilegal activa la trampa, el manejador de trampas puede finalizar el programa y notificar al usuario del error. Si la trampa es provocada por una solicitud de un servicio específico, el manejador de trampas puede llevar a cabo el servicio solicitado y devolver el control al programa.

### ¿Qué es una Interrupción (interruptions) en un Sistema Operativo?
Un dispositivo de hardware, como un teclado, ratón o unidad de disco, puede enviar una señal de interrupción a un sistema operativo, lo que indica a la CPU que detenga temporalmente la ejecución del programa que está corriendo y cambie a otra tarea. En los sistemas informáticos modernos, las interrupciones son una técnica crucial para proporcionar servicios de entrada/salida (I/O) y multitarea.

Cuando ocurre una interrupción, la CPU cambia inmediatamente del modo usuario al modo kernel y transfiere el control al manejador de interrupciones del sistema operativo. Después de identificar el origen de la interrupción, el manejador de interrupciones toma la acción necesaria, como leer datos del dispositivo o realizar actividades adicionales de entrada/salida.

Las interrupciones se pueden dividir en dos categorías: interrupciones de hardware e interrupciones de software.

Las interrupciones de hardware son generadas por componentes de hardware externos, mientras que las interrupciones de software son generadas por software que se está ejecutando en la CPU.

Las interrupciones de hardware se dividen además en interrupciones enmascarables e interrupciones no enmascarables. Las interrupciones enmascarables pueden ser habilitadas o deshabilitadas por software, pero el sistema no puede ignorar ni deshabilitar las interrupciones no enmascarables.

### Diferencias

| **Trampa (Trap)**                                                                                      | **Interrupción (Interrupt)**                                                                            |
|--------------------------------------------------------------------------------------------------------|---------------------------------------------------------------------------------------------------------|
| La trampa es una señal que un software de usuario envía al sistema operativo para que realice una actividad particular de inmediato. | La interrupción es una señal de hardware que indica a la CPU que algo debe ser atendido de inmediato.  |
| El procedimiento es sincronizado.                                                                      | El proceso es asincrónico.                                                                               |
| Cada trampa es interrumpible.                                                                           | No todas las interrupciones son trampas.                                                                 |
| Puede ocurrir solo desde dispositivos basados en software. Los dispositivos de hardware y software podrían ser la causa. | Puede ocurrir solo desde dispositivos basados en software. Los dispositivos de hardware y software podrían ser la causa. |
| Es generada por una instrucción del programa de usuario.                                                | Son producidas por hardware.                                                                             |
| También se conoce como interrupción de software.                                                        | También se conoce como interrupción de hardware.                                                         |
| Se lleva a cabo la funcionalidad especializada del sistema operativo y se transfiere el control al manejador de trampas. | Obliga al procesador a iniciar un programa manejador de interrupciones en particular.                    |
