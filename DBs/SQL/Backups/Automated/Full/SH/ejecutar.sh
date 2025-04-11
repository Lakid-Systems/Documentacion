#!/bin/bash

# Variables
DB_NAME="Hospital"
DB_USER="root"
DB_PASS="12345678"
DB_HOST="localhost"
BACKUP_DIR="/Users/irvingmorales/Desktop/SH"
RETENTION_DAYS=7  # Días que se mantendrán los respaldos

# Crear la carpeta si no existe
mkdir -p "$BACKUP_DIR"

# Obtener la fecha y hora
TIMESTAMP=$(date "+%Y%m%d_%H%M%S")
HORA_INICIO=$(date "+%Y-%m-%d %H:%M:%S")
BACKUP_FILE="${BACKUP_DIR}/${DB_NAME}_${TIMESTAMP}.sql"

echo "====================================="
echo "Iniciando respaldo de base de datos..."
echo "Base de datos: $DB_NAME"
echo "Fecha y hora de inicio: $HORA_INICIO"
echo "====================================="

# Ejecutar mysqldump y verificar si se realizó correctamente
mysqldump -u "$DB_USER" -p"$DB_PASS" -h "$DB_HOST" "$DB_NAME" > "$BACKUP_FILE" 2> "$BACKUP_DIR/error.log"

if [ $? -ne 0 ]; then
    echo "Error: No se pudo realizar el respaldo. Revisa error.log para más detalles."
    exit 1
fi

# Obtener detalles del respaldo
HORA_FIN=$(date "+%Y-%m-%d %H:%M:%S")
FILE_SIZE=$(stat -f%z "$BACKUP_FILE")

echo "====================================="
echo " ___            _              "
echo "|_ _|_ ____   _(_)_ __   __ _  "
echo " | || '__\ \ / / |  _ \ / _\ | "
echo " | || |   \ V /| | | | | (_| | "
echo "|___|_|    \_/ |_|_| |_|\__, | "
echo "                        |___/  "
echo "Respaldo completado con éxito."
echo "Fecha y hora de finalización: $HORA_FIN"
echo "Tamaño del archivo: $FILE_SIZE bytes"
echo "Archivo guardado en: $BACKUP_FILE"
echo "====================================="

# Eliminar respaldos antiguos (más de 7 días)
find "$BACKUP_DIR" -name "${DB_NAME}_*.sql" -mtime +$RETENTION_DAYS -exec rm {} \;

echo "Limpieza completada: Se eliminaron respaldos mayores a $RETENTION_DAYS días."
