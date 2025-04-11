#!/bin/bash

# Variables
DB_NAME="hospital_general_8a_idgs2_220732"
DB_USER="root"
DB_PASS="12345678"
DB_HOST="localhost"
TABLE_NAME="tbb_cirugias"
BACKUP_DIR="/Users/irvingmorales/Desktop/SH/Partial"

# Crear las carpetas si no existen
mkdir -p "$BACKUP_DIR"

# Obtener la hora de inicio
HORA_INICIO=$(date "+%Y-%m-%d %H:%M:%S")

# Arte ASCII
echo "====================================="
echo " ___            _              "
echo "|_ _|_ ____   _(_)_ __   __ _  "
echo " | || '__\ \ / / | '_ \ / _\` | "
echo " | || |   \ V /| | | | | (_| | "
echo "|___|_|    \_/ |_|_| |_|\__, | "
echo "                        |___/  "
echo "Iniciando respaldo de base de datos..."
echo "Nombre de la base de datos: $DB_NAME"
echo "Fecha y hora de inicio: $HORA_INICIO"
echo "Procesando..."
echo "=====================================" 

# Crear el nombre del archivo de respaldo
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${TABLE_NAME}_$(date '+%Y%m%d_%H%M%S').sql"

# Ejecutar mysqldump
mysqldump -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" "$DB_NAME" "$TABLE_NAME" > "$BACKUP_FILE"
if [ $? -ne 0 ]; then
    echo "Error: No se pudo realizar el respaldo."
    exit 1
fi

# Obtener la hora de finalización
HORA_FIN=$(date "+%Y-%m-%d %H:%M:%S")

# Obtener el tamaño del archivo de respaldo
FILE_SIZE=$(stat -f%z "$BACKUP_FILE")

# Mostrar la información en la terminal
echo "====================================="
echo "Respaldo completado con éxito."
echo "Fecha y hora de finalización: $HORA_FIN"
echo "Tamaño del archivo: $FILE_SIZE bytes"
echo "Archivo guardado en: $BACKUP_FILE"
echo "====================================="

# Guardar la información en el archivo de logs
{
    echo "Tipo de restauración: Partial"
    echo "Fecha de inicio: $HORA_INICIO"
    echo "Fecha de finalización: $HORA_FIN"
    echo "Tamaño del archivo: $FILE_SIZE bytes"
    echo "Archivo guardado en: $BACKUP_FILE"
    echo "Host: $DB_HOST"
    echo "====================================="
} 

exit 0
