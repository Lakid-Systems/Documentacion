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

for /f %%i in ('powershell -NoProfile -Command "Get-Date -Format yyyy-MM-dd"') do set FECHA=%%i


set MONGO_TOOLS_DIR=C:\Users\luisi\OneDrive\Escritorio\mongodb-database-tools-windows-x86_64-100.12.0\mongodb-database-tools-windows-x86_64-100.12.0\bin


set MONGO_URI="mongodb+srv://luisivmaraz03:19357@cluster0.tdvcdrk.mongodb.net/espacios"


set OUT_DIR=respaldo_%FECHA%


"%MONGO_TOOLS_DIR%\mongodump.exe" --uri=%MONGO_URI% --out="%OUT_DIR%"

echo.
echo Respaldo completado en la carpeta: %OUT_DIR%
pause
