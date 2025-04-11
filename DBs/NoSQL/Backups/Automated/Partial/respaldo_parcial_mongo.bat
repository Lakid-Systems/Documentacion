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

:: Obtener la fecha en formato YYYY-MM-DD
for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set FECHA=%%i

:: Ruta donde está mongodump (ajústala si cambia)
set MONGO_TOOLS_DIR=C:\Users\luisi\OneDrive\Escritorio\mongodb-database-tools-windows-x86_64-100.12.0\mongodb-database-tools-windows-x86_64-100.12.0\bin

:: URI de conexión (con base de datos específica)
set MONGO_URI="mongodb+srv://luisivmaraz03:19357@cluster0.tdvcdrk.mongodb.net/espacios"

:: Nombre de la base de datos
set DB_NAME=espacios

:: Carpeta de salida
set OUT_DIR=respaldo_%DB_NAME%_%FECHA%

:: Ejecutar mongodump solo para la base de datos
"%MONGO_TOOLS_DIR%\mongodump.exe" --uri=%MONGO_URI% --db=%DB_NAME% --out="%OUT_DIR%"

echo.
echo Respaldo parcial completado: Base de datos %DB_NAME% guardada en %OUT_DIR%
pause
