# Respaldo Manual (Parcial) de MongoDB Atlas

Este documento proporciona instrucciones para realizar un **respaldo manual y parcial** de tu base de datos alojada en **MongoDB Atlas** utilizando la herramienta **`mongodump`**.

> ⚠️ **Importante:** El respaldo generado con `mongodump` **no es un respaldo completo del sistema**. Solo incluye los **datos y metadatos de las colecciones**, pero **no respalda configuraciones del clúster**, usuarios, reglas de acceso, índices fuera de las colecciones ni configuraciones específicas del entorno de Atlas.

---

## Requisitos previos

- Tener **MongoDB Database Tools** instaladas. Puedes descargarlas desde el siguiente enlace:  
  [MongoDB Database Tools](https://www.mongodb.com/try/download/database-tools)
  
- Tener acceso a tu base de datos en MongoDB Atlas y contar con el **URI de conexión**, que incluye tu usuario y contraseña.

---

## Pasos para crear el respaldo

### 1. Obtener el URI de conexión

1. Ve a tu proyecto en [MongoDB Atlas](https://cloud.mongodb.com/).
2. Selecciona el clúster que deseas respaldar.
3. Haz clic en el botón **"Connect"** (Conectar).
4. En la opción **"Connect using MongoDB Shell"**, copia la cadena de conexión similar a esta:

   ```bash
   mongodb+srv://<usuario>:<contraseña>@cluster0.xxxxx.mongodb.net/<nombre_de_base_de_datos>
   ```

   Reemplaza `<usuario>`, `<contraseña>` y `<nombre_de_base_de_datos>` por los datos correspondientes.

---

### 2. Ejecutar el comando `mongodump`

1. Abre la terminal o línea de comandos en tu computadora.

2. Ejecuta el siguiente comando para realizar el respaldo de tu base de datos:

   ```bash
   mongodump --uri="mongodb+srv://<usuario>:<contraseña>@cluster0.xxxxx.mongodb.net/<nombre_de_base_de_datos>" --out="respaldo_$(date +%Y-%m-%d)"
   ```

   #### Explicación del comando:
   - `--uri`: URI de conexión a tu base de datos Atlas.
   - `--out`: Directorio donde se almacenará el respaldo, nombrado con la fecha actual para organización.

---

### 3. Verificar el respaldo

Después de ejecutar el comando, deberías ver una estructura como esta:

```
respaldo_2025-04-10/
└── espacios/
    ├── miColeccion.bson
    └── miColeccion.metadata.json
```

Los archivos `.bson` contienen los **datos de las colecciones**, mientras que los `.json` contienen sus **metadatos** (estructura de índices dentro de las colecciones, etc.).

---

### 4. Respaldar solo una colección

Si solo deseas respaldar una colección específica:

```bash
mongodump --uri="mongodb+srv://<usuario>:<contraseña>@cluster0.xxxxx.mongodb.net/espacios" --collection=nombreDeTuColeccion --out="respaldo_$(date +%Y-%m-%d)"
```

Reemplaza `nombreDeTuColeccion` por la colección que quieras respaldar.

---

## Restauración del Respaldo

Para restaurar un respaldo creado con `mongodump`, puedes usar la herramienta **`mongorestore`**.

```bash
mongorestore --uri="mongodb+srv://<usuario>:<contraseña>@cluster0.xxxxx.mongodb.net/espacios" --dir="respaldo_2025-04-10/espacios"
```

Esto restaurará la base de datos `espacios` desde el respaldo.

---

## Automatización del Respaldo

Puedes automatizar este proceso con un script y programarlo para que se ejecute periódicamente:

- **Linux/macOS**: usando `cron`
- **Windows**: usando el Programador de tareas

---

## Notas Adicionales

- Este respaldo **es parcial**: contiene solo **datos y metadatos de las colecciones**.
- No se incluyen:
  - Configuraciones del clúster
  - Usuarios o roles
  - Reglas de seguridad
  - Índices definidos fuera de las colecciones
- No interrumpe el funcionamiento de la base de datos: puedes ejecutarlo mientras la base está activa.

---


