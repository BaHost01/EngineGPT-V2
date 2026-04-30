@echo off

REM Diretório de compilação
SET "BUILD_DIR=%ENGINE_GPT_HOME%\bin\Release"

REM Verificar se o diretório existe, se não, criar
if not exist "%BUILD_DIR%" mkdir "%BUILD_DIR%"

REM Comando para compilar com CMake e MinGW
cd /d "%ENGINE_GPT_HOME%"
cmake -B"%BUILD_DIR%" -H"%ENGINE_GPT_HOME%" -G "MinGW Makefiles"
cmake --build "%BUILD_DIR%" --config Release

echo Compilação concluída!
pause
