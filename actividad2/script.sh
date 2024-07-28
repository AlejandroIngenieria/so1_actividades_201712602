#!/bin/bash

# Leer la variable GITHUB_USER
read -p "Ingrese el nombre de usuario de github: " GITHUB_USER

# Verificar si la variable GITHUB_USER está definida
if [ -z "$GITHUB_USER" ]; then
  echo "Error: La variable GITHUB_USER no está definida."
  exit 1
fi

# Consultar la URL de la API de GitHub
response=$(curl -s "https://api.github.com/users/$GITHUB_USER")

# Extraer datos del JSON
id=$(echo "$response" | jq -r '.id')
created_at=$(echo "$response" | jq -r '.created_at' | cut -d"T" -f 1)

# Verificar si los datos se extrajeron correctamente
if [ -z "$id" ] || [ -z "$created_at" ]; then
  echo "Error: No se pudieron extraer los datos del usuario de GitHub."
  exit 1
fi

# Imprimir el mensaje
message="Hola $GITHUB_USER. User ID: $id. Cuenta fue creada el: $created_at."
echo "$message"

# Crear el log file
fecha=$(date +'%Y-%m-%d')
log_dir="/tmp/$fecha"
mkdir -p "$log_dir"
echo "$message" > "$log_dir/saludos.log"

