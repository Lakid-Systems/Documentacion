# 📦 Respaldo Parcial de MongoDB con Script `.bat`

Este proyecto contiene un script en formato `.bat` que realiza un **respaldo parcial** de una base de datos MongoDB. Esto significa que solo se respalda una base de datos específica (no todas), sin incluir bases del sistema como `admin`, `config`, etc.

---

## 🧰 Requisitos

- Tener [MongoDB Database Tools](https://www.mongodb.com/try/download/database-tools) instalados.
- Contar con una URI de conexión válida.
- Sistema operativo Windows.
- Powershell habilitado (para obtener la fecha).

---

## 📁 ¿Qué hace este script?

- Realiza un respaldo de una única base de datos (por ejemplo: `espacios`).
- Crea una carpeta con la fecha actual (`respaldo_espacios_YYYY-MM-DD`) para guardar los archivos.
- Ideal para respaldos automáticos programados.
- Presentación visual con arte ASCII.

---

## ⚙️ Uso

1. **Edita el script** y asegúrate de actualizar las siguientes variables:
   - `MONGO_TOOLS_DIR`: Ruta donde están los ejecutables de `mongodump`.
   - `MONGO_URI`: URI de conexión a tu base de datos.
   - `DB_NAME`: Nombre de la base de datos a respaldar.

2. **Ejecuta el archivo `.bat`** haciendo doble clic o desde una consola.

---

## 💻 Contenido del Script `.bat`

```bat
@echo off
echo.
echo.  _          _    _     _   ____            _                     
echo. | |    __ _| | _(_) __| | / ___| _   _ ___| |_ ___ _ __ ___  ___ 
echo. | |   / _` | |/ / |/ _` | \___ \| | | / __| __/ _ \ '_ ` _ \/ __|
echo. | |__| (_| |   <| | (_| |  ___) | |_| \__ \ ||  __/ | | | | \__ \
echo. |_____\__,_|_|\_\_|\__,_| |____/ \__, |___/\__\___|_| |_| |_|___/
echo.                                  |___/                           
echo                                  ^|___/                                      
echo.

:: Obtener la fecha
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set FECHA=%%i

:: Configuración
set MONGO_TOOLS_DIR=C:\Ruta\al\bin\de\mongodb-tools
set MONGO_URI="mongodb+srv://usuario:contraseña@cluster.mongodb.net/espacios"
set DB_NAME=espacios
set OUT_DIR=respaldo_%DB_NAME%_%FECHA%

:: Ejecutar mongodump (solo base de datos específica)
"%MONGO_TOOLS_DIR%\mongodump.exe" --uri=%MONGO_URI% --db=%DB_NAME% --out="%OUT_DIR%"

echo.
echo Respaldo parcial completado: Base de datos %DB_NAME% guardada en %OUT_DIR%
pause
```

---

## 🕒 Automatización

Puedes programar este script para que se ejecute automáticamente:

1. Abre el **Programador de Tareas de Windows**.
2. Crea una nueva tarea.
3. Define un horario (diario, semanal, etc.).
4. En acciones, selecciona este `.bat`.
5. ¡Listo!

---

## ✅ Ventajas del Respaldo Parcial

- Más rápido que un respaldo completo.
- Ideal para bases de datos específicas.
- Menor uso de espacio en disco.
- Puedes incluir múltiples scripts si manejas varias bases.

---

## 🛡️ Consejos de Seguridad

- **No dejes contraseñas visibles** si el script está en un entorno compartido.
- Guarda los respaldos en ubicaciones seguras (local o en la nube).
- Considera comprimir los respaldos o hacer limpieza automática.

---

