# Completely Fair Scheduler (CFS) en Linux

El *Completely Fair Scheduler* (CFS) es el algoritmo de planificación predeterminado en el kernel de Linux desde la versión 2.6.23, diseñado para mejorar el rendimiento tanto en sistemas de un solo procesador como en sistemas multiprocesador (SMP), y aborda limitaciones presentes en algoritmos anteriores, como el algoritmo O(1). A continuación, se describen sus características principales y su funcionamiento:

>## 1. Asignación proporcional de tiempo de CPU
En lugar de utilizar rebanadas de tiempo discreto, como en algoritmos tradicionales, el CFS asigna una proporción de tiempo de CPU a cada tarea en función de su valor *nice*. Este valor puede oscilar entre -20 (alta prioridad) y +19 (baja prioridad), donde un valor más bajo de *nice* le otorga mayor proporción de tiempo de CPU a la tarea. Esto permite que las tareas con diferentes niveles de prioridad se ejecuten de manera justa, según su *nice*.

>## 2. Latencia objetivo
CFS introduce el concepto de **latencia objetivo**, que es el intervalo de tiempo en el que todas las tareas en el sistema deben ejecutarse al menos una vez. Esta latencia varía según el número de tareas activas, asegurando que todas las tareas tengan la oportunidad de ejecutarse, incluso cuando hay un número elevado de procesos.

>## 3. Tiempo de ejecución virtual (*vruntime*)
CFS no asigna prioridades directamente, sino que mantiene un tiempo de ejecución virtual (*vruntime*) para cada tarea, el cual aumenta o disminuye en función del valor *nice*. Las tareas de baja prioridad acumulan *vruntime* más rápido, mientras que las de alta prioridad lo hacen más lentamente. Para seleccionar la próxima tarea a ejecutar, CFS elige la tarea con el menor *vruntime*, asegurando que las tareas más interactivas, como las de entrada/salida, tengan mayor oportunidad de ejecución.

- Por ejemplo, una tarea de I/O bloquea frecuentemente y ejecuta menos tiempo de CPU, por lo que su *vruntime* es menor en comparación con una tarea intensiva en CPU, lo que le otorga mayor prioridad para ejecutar antes.

>## 4. Balanceo de carga y soporte para NUMA
CFS implementa técnicas avanzadas de balanceo de carga entre múltiples núcleos de procesamiento, adaptándose a sistemas con acceso no uniforme a la memoria (NUMA). La carga de cada hilo es una combinación de su prioridad y la utilización media de CPU. El balanceo se realiza dentro de dominios jerárquicos de núcleos para minimizar las penalidades de latencia de acceso a memoria.

- En NUMA, CFS intenta minimizar la migración de hilos entre diferentes nodos de memoria para evitar penalidades de acceso a memoria remota. Solo migra entre nodos si hay un desequilibrio severo de carga.

>## 5. Preempción
CFS permite la preempción de tareas. Si una tarea con mayor prioridad (menor *vruntime*) se vuelve elegible para ejecutarse, puede interrumpir a una tarea de menor prioridad que esté en ejecución. Esto es particularmente útil para tareas interactivas que requieren respuestas rápidas.

>## 6. Clases de planificación
Linux utiliza clases de planificación que permiten aplicar diferentes algoritmos de planificación para distintos tipos de procesos. CFS se ubica en la clase por defecto, pero el kernel también soporta una clase de planificación en tiempo real basada en los estándares POSIX, con políticas como *SCHED_FIFO* y *SCHED_RR* para tareas críticas que requieren mayor prioridad sobre los procesos normales.

>## 7. Flexibilidad y escalabilidad
Una de las principales ventajas de CFS es su capacidad para escalar en sistemas con múltiples procesadores y soportar una gran cantidad de procesos en ejecución sin degradar el rendimiento. La latencia objetivo ajustable y el enfoque en proporciones de tiempo de CPU garantizan un comportamiento justo y eficiente.

