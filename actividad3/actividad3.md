# Parte 1: Gestión de Usuarios

## 1. **Creación de Usuarios**: Crea tres usuarios llamados `usuario1`, `usuario2` y `usuario3`.
```bash
sudo adduser nombre_usuario
```

#### - Creacion del usuario1
![alt text](<Parte 1/Captura desde 2024-08-04 13-11-50.png>)
### - Creacion del usuario2
![alt text](<Parte 1/Captura desde 2024-08-04 13-12-31.png>)
### - Creacion del usuario3
![alt text](<Parte 1/Captura desde 2024-08-04 13-12-58.png>)

## 2. **Asignación de Contraseñas**: Establece una nueva contraseña para cada usuario creado.
Iniciamos sesion al usuario que deseamos cambiar la contraseña
```bash
sudo -i -u usuario1
```
Estando logueados escribimos el comando passwd

![alt text](<Parte 1/paswd.png>)

## 3. **Información de Usuarios**: Muestra la información de `usuario1` usando el comando `id`.
Para ver la informacion de un usuario usamos el comando
```bash
id nombre_usuario
```
![alt text](<Parte 1/Captura desde 2024-08-04 13-15-56.png>)
## 4. **Eliminación de Usuarios**: Elimina `usuario3`, pero conserva su directorio principal.
Para eliminar el usuario3 conservando su directorio usamos el comando

```bash
sudo deluser --remove-directorio nombre_usuario
```

![alt text](<Parte 1/Captura desde 2024-08-04 13-26-36.png>)

# Parte 2: Gestión de Grupos

## 1. **Creación de Grupos**: Crea dos grupos llamados `grupo1` y `grupo2`.

Para crear grupos usamos el comando groupadd y verificamos su existencia con getent

```bash
sudo groupadd nombre_grupo

getent entidad nombre_entidad
```

![alt text](<Parte 2/Captura desde 2024-08-04 13-29-24.png>)

## 2. **Agregar Usuarios a Grupos**: Agrega `usuario1` a `grupo1` y `usuario2` a `grupo2`.
Para realizar la tarea usamos

```bash
sudo usermod -aG nombre_grupo nombre_usuario
```

![alt text](<Parte 2/Captura desde 2024-08-04 13-30-37.png>)

## 3. **Verificar Membresía**: Verifica que los usuarios han sido agregados a los grupos utilizando el comando `groups`.

![alt text](<Parte 2/Captura desde 2024-08-04 14-43-33.png>)

## 4. **Eliminar Grupo**: Elimina `grupo2`.
Para eliminar un grupo usamos el comando groupdel

```bash
sudo groupdel nombre_grupo
```

![alt text](<Parte 2/Captura desde 2024-08-04 14-45-00.png>)

# Parte 3: Gestión de Permisos

## 1. **Creación de Archivos y Directorios**:
   - Como `usuario1`, crea un archivo llamado `archivo1.txt` en su directorio principal y escribe algo en él.
   - Crea un directorio llamado `directorio1` y dentro de ese directorio, un archivo llamado `archivo2.txt`.

   Estando logueados en el usuario1 creamos el archivo1.txt usando el comando touch
    
```bash
    touch nombre_archivo
```
   
   ![alt text](<Parte 3/1.png>)

   Escribimos usando el comando vi

```bash
    vi nombre_archivo
```
Algunos comandos dentro del archivo al usar vi
```bash
    :w  # guardar
    :wq # guardar y salir
    :q  # salir si no detecta cambios
    :q! # salir sin guardar cambios
```

   ![alt text](<Parte 3/2.png>)

## 2. **Verificar Permisos**: Verifica los permisos del archivo y directorio usando el comando `ls -l` y `ls -ld` respectivamente.
![alt text](<Parte 3/4.png>)
## 3. **Modificar Permisos usando `chmod` con Modo Numérico**: Cambia los permisos del `archivo1.txt` para que sólo `usuario1` pueda leer y escribir (permisos `rw-`), el grupo pueda leer (permisos `r--`) y nadie más pueda hacer nada.

Los permisos en formato numerico funcionan de la siguiente manera
- Propietario (usuario): rw- corresponde a 6 (4 para leer + 2 para escribir).
- Grupo: r-- corresponde a 4 (4 para leer).
- Otros: --- corresponde a 0 (sin permisos).



![alt text](<Parte 3/Captura desde 2024-08-04 13-52-07.png>)
## 4. **Modificar Permisos usando `chmod` con Modo Simbólico**: Agrega permiso de ejecución al propietario del `archivo2.txt`.
- u: Se refiere al propietario (user) del archivo.
- +x: Añade el permiso de ejecución (execute).
- archivo2.txt: Es el archivo al cual se le están modificando los permisos.

![alt text](<Parte 3/Captura desde 2024-08-04 13-53-47.png>)

## 5. **Cambiar el Grupo Propietario**: Cambia el grupo propietario de `archivo2.txt` a `grupo1`.
Para realizar la tarea se utilizo el comando chown

```bash
    sudo chown :nombre_grupo nombre_archivo
```

![alt text](<Parte 3/Captura desde 2024-08-04 13-55-22.png>)

## 6. **Configurar Permisos de Directorio**: Cambia los permisos del `directorio1` para que sólo el propietario pueda entrar (permisos `rwx`), el grupo pueda listar contenidos pero no entrar (permisos `r--`), y otros no puedan hacer nada.

- Propietario (usuario): rwx corresponde a 7 (4 para leer + 2 para escribir + 1 para ejecutar).
- Grupo: r-- corresponde a 4 (4 para leer).
- Otros: --- corresponde a 0 (sin permisos).


![alt text](<Parte 3/Captura desde 2024-08-04 13-56-49.png>)

## 7. **Comprobación de Acceso**: Intenta acceder al `archivo1.txt` y `directorio1/archivo2.txt` como `usuario2`. Nota cómo el permiso de directorio afecta el acceso a los archivos dentro de él.

Para comprobar el acceso creamos el usuario2 nuevamente e intentamos acceder con el comando CAT

```bash
    cat directorio_especifico
```

![alt text](<Parte 3/Captura desde 2024-08-04 14-04-29.png>)

## 8. **Verificación Final**: Verifica los permisos y propietario de los archivos y directorio nuevamente con `ls -l` y `ls -ld`.

![alt text](<Parte 3/Captura desde 2024-08-04 14-05-57.png>)

# Reflexión: (Opcional)

Contestar las siguientes preguntas:

## ¿Por qué es importante gestionar correctamente los usuarios y permisos en un sistema operativo?
Una correcta administracion de usuario y permisos crea un entorno mas seguro para todos los usuarios, permitiendo que solo aquellos con el correcto conocimiento en la manipulacion de ciertos archivos sean los unicos capaces de gestionarlos.
## ¿Qué otros comandos o técnicas conocen para gestionar permisos en Linux?

```bash
    chmod # Cambia los permisos de archivos y directorios
    chown # Cambia el propietario y/o grupo de archivos y directorios.
    chgrp # Cambia el grupo de archivos y directorios.
    umask # Establece los permisos predeterminados para archivos y directorios nuevos.
    ls -l # Muestra los permisos actuales de archivos y directorios.
    getfacl & setfacl # Gestionan listas de control de acceso (ACLs) para permisos más detallados y específicos.
    sudo # Permite ejecutar comandos con privilegios elevados para tareas administrativas.
    find (-perm | -user | -group) # Busca archivos con permisos específicos, propiedad de un usuario o grupo determinado.
    passwd # Cambia la contraseña de un usuario y gestiona políticas de contraseñas.
    usermod & useradd # Modifica y añade usuarios, gestionando grupos y configuraciones.

```
