
# Respaldo Manual de MongoDB Atlas

Este documento proporciona instrucciones para realizar un respaldo manual de tu base de datos alojada en **MongoDB Atlas** utilizando la herramienta **`mongodump`**.

## Requisitos previos

- Tener **MongoDB Database Tools** instaladas. Puedes descargarlas desde el siguiente enlace:  
  [MongoDB Database Tools](https://www.mongodb.com/try/download/database-tools)
  
- Tener acceso a tu base de datos en MongoDB Atlas y contar con el **URI de conexión**, que incluye tu usuario y contraseña.

## Pasos para crear el respaldo

### 1. Obtener el URI de conexión

1. Ve a tu proyecto en [MongoDB Atlas](https://cloud.mongodb.com/).
2. Selecciona el clúster que deseas respaldar.
3. Haz clic en el botón **"Connect"** (Conectar).
4. En la opción **"Connect using MongoDB Shell"**, copia la cadena de conexión similar a esta:

   ```
   mongodb+srv://<usuario>:<contraseña>@cluster0.xxxxx.mongodb.net/<nombre_de_base_de_datos>
   ```

   Reemplaza `<usuario>`, `<contraseña>` y `<nombre_de_base_de_datos>` por los datos correspondientes de tu base de datos en MongoDB Atlas.

### 2. Ejecutar el comando `mongodump`

1. Abre la terminal o línea de comandos en tu computadora.

2. Ejecuta el siguiente comando para realizar el respaldo de tu base de datos **completa**. Asegúrate de reemplazar los valores `<usuario>`, `<contraseña>`, y `<nombre_de_base_de_datos>` con los datos de tu conexión:

   ```bash
   mongodump --uri="mongodb+srv://xxxxxxx:xxxxxx@cluster0.tdvcdrk.mongodb.net/espacios" --out="respaldo_$(date +%Y-%m-%d)"
   ```

   ### Explicación del comando:
   - `--uri="mongodb+srv://xxxxx:193xxxxx57@cluster0.tdvcdrk.mongodb.net/espacios"`: Es tu cadena de conexión de MongoDB Atlas con tu usuario, contraseña y base de datos (`espacios`).
   - `--out="respaldo_$(date +%Y-%m-%d)"`: La opción `--out` indica la ubicación donde se almacenarán los archivos del respaldo. El nombre de la carpeta se genera dinámicamente con la fecha actual, por ejemplo, `respaldo_2025-04-10`.

### 3. Verificar el respaldo

Después de ejecutar el comando, deberías ver una estructura de carpetas similar a esta:

```
respaldo_2025-04-10/
└── espacios/
    ├── miColeccion.bson
    └── miColeccion.metadata.json
```

Esto significa que el respaldo se ha realizado con éxito. Los archivos `.bson` contienen los datos de las colecciones y los archivos `.json` contienen los metadatos.

### 4. Respaldar solo una colección

Si solo deseas respaldar una colección específica, usa el siguiente comando:

```bash
mongodump --uri="mongodb+srv://xxxxxx:xxxxx@cluster0.tdvcdrk.mongodb.net/espacios" --collection=nombreDeTuColeccion --out="respaldo_$(date +%Y-%m-%d)"
```

Reemplaza `nombreDeTuColeccion` con el nombre de la colección que deseas respaldar.

---

## Restauración del Respaldo

Para restaurar un respaldo creado con `mongodump`, puedes usar la herramienta **`mongorestore`**.

### Comando de restauración básico:

```bash
mongorestore --uri="mongodb+srv://xxxxx:xxxxx@cluster0.tdvcdrk.mongodb.net/espacios" --dir="respaldo_2025-04-10/espacios"
```

Esto restaurará el respaldo de la base de datos `espacios` desde la carpeta `respaldo_2025-04-10`.

---

## Automatización del Respaldo

Si deseas automatizar este proceso, puedes crear un script en bash para ejecutar el comando de respaldo periódicamente (por ejemplo, diario o semanalmente). De igual manera, puedes usar **cron jobs** (en sistemas Unix/Linux) o **Tareas Programadas** (en Windows) para programar la ejecución del script.

---

## Notas Adicionales

- Los respaldos realizados con `mongodump` son completos, pero **no incluyen las configuraciones** del clúster de MongoDB, como los índices o las configuraciones del usuario.
- El proceso de respaldo no interrumpe el funcionamiento de la base de datos, por lo que puedes realizar respaldos sin afectar la disponibilidad.

---


