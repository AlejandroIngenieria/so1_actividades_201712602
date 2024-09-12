#include <stdio.h>
#include <stdlib.h>
#include <unistd.h>
#include <sys/types.h>
#include <sys/wait.h>

int main()
{
    pid_t pid = fork();

    if (pid < 0)
    {
        // Error al crear el proceso
        perror("Error al crear el proceso");
        exit(1);
    }

    printf("El id del proceso a testear es %d\n", pid);

    if (pid == 0)
    {
        // Proceso hijo
        printf("Soy el proceso hijo y voy a terminar.\n");
        exit(0); // El hijo termina, se convierte en zombie
    }
    else
    {
        // Proceso padre
        printf("Soy el proceso padre. Mi hijo se convirtió en un proceso zombie.\n");
        sleep(60); // Esperar 60 segundos para ver al proceso hijo como zombie
        printf("Proceso padre ha terminado.\n");
    }

    return 0;
}
