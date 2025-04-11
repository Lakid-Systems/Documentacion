# 📦 Respaldo Completo de MongoDB con Script `.bat`

Este proyecto contiene un script en formato `.bat` que realiza un **respaldo completo** de una base de datos MongoDB hospedada en MongoDB Atlas (o cualquier instancia remota).

---

## 🧰 Requisitos

- Tener [MongoDB Database Tools](https://www.mongodb.com/try/download/database-tools) instalados.
- Contar con una URI de conexión a tu base de datos.
- Sistema operativo Windows.
- Powershell habilitado (para obtener la fecha).

---

## 📁 ¿Qué hace este script?

- Realiza un respaldo completo de tu base de datos especificada.
- Crea una carpeta con la fecha actual (`respaldo_YYYY-MM-DD`) para guardar los archivos.
- Incluye un arte ASCII al inicio para mejor presentación.
- Está diseñado para ser utilizado manualmente o programado con el **Programador de Tareas de Windows**.

---

## ⚙️ Uso

1. **Edita el script** y asegúrate de actualizar las siguientes variables:
   - `MONGO_TOOLS_DIR`: Ruta donde tienes los ejecutables de `mongodump`.
   - `MONGO_URI`: Tu cadena de conexión a MongoDB Atlas.
   - (Opcional) Cambia la carpeta de salida si lo necesitas.

2. **Ejecuta el archivo `.bat`** haciendo doble clic o desde una consola de comandos.

3. El respaldo se guardará en una carpeta con la fecha del día.

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

:: Obtener fecha actual
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set FECHA=%%i

:: Rutas y configuración
set MONGO_TOOLS_DIR=C:\Ruta\al\bin\de\mongodb-tools
set MONGO_URI="mongodb+srv://usuario:contraseña@cluster.mongodb.net/espacios"
set OUT_DIR=respaldo_%FECHA%

:: Ejecutar respaldo completo
"%MONGO_TOOLS_DIR%\mongodump.exe" --uri=%MONGO_URI% --out="%OUT_DIR%"

echo.
echo Respaldo completado en: %OUT_DIR%
pause
```

---

## 🕒 Automatización

Puedes programar este script para que se ejecute automáticamente cada día/semanalmente:

1. Abre el **Programador de Tareas de Windows**.
2. Crea una nueva tarea.
3. Configura un **trigger** (ej. diario a las 2 AM).
4. En la acción, selecciona este `.bat`.
5. ¡Listo! Ya tienes respaldo automático.

---

## 🛡️ Recomendaciones

- **No incluyas contraseñas en texto plano** en entornos compartidos.
- Considera mover el respaldo a un lugar seguro como:
  - Carpetas sincronizadas con OneDrive, Google Drive, Dropbox, etc.
  - Un disco externo.
- Agrega compresión (`.zip`) para ahorrar espacio (puede automatizarse también).

---

