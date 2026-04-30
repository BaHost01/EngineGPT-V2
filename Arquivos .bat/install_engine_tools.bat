@echo off
setlocal

REM Definir o caminho base
SET "ENGINE_GPT_HOME=%~dp0"
SET "TOOLS_DIR=%ENGINE_GPT_HOME%\tools"
SET "MIN_GW_URL=https://sourceforge.net/projects/mingw-w64/files/latest/download"
SET "CMAKE_URL=https://cmake.org/files/v3.25/cmake-3.25.2-windows-x86_64.zip"
SET "GIT_URL=https://github.com/git-for-windows/git/releases/download/v2.39.2.windows.1/PortableGit-2.39.2-64-bit.7z"

REM Criar diretório de ferramentas se não existir
if not exist "%TOOLS_DIR%" mkdir "%TOOLS_DIR%"

REM Verificar e baixar MinGW
IF NOT EXIST "%TOOLS_DIR%\MinGW" (
    echo Instalando MinGW...
    powershell -Command "& {Invoke-WebRequest -Uri %MIN_GW_URL% -OutFile '%TOOLS_DIR%\MinGW.zip'}"
    powershell -Command "& {Expand-Archive -Path '%TOOLS_DIR%\MinGW.zip' -DestinationPath '%TOOLS_DIR%'}"
    del "%TOOLS_DIR%\MinGW.zip"
    echo MinGW instalado com sucesso!
) ELSE (
    echo MinGW já está instalado.
)

REM Verificar e baixar CMake
IF NOT EXIST "%TOOLS_DIR%\CMake" (
    echo Instalando CMake...
    powershell -Command "& {Invoke-WebRequest -Uri %CMAKE_URL% -OutFile '%TOOLS_DIR%\CMake.zip'}"
    powershell -Command "& {Expand-Archive -Path '%TOOLS_DIR%\CMake.zip' -DestinationPath '%TOOLS_DIR%'}"
    del "%TOOLS_DIR%\CMake.zip"
    echo CMake instalado com sucesso!
) ELSE (
    echo CMake já está instalado.
)

REM Verificar e baixar Git
IF NOT EXIST "%TOOLS_DIR%\Git" (
    echo Instalando Git...
    powershell -Command "& {Invoke-WebRequest -Uri %GIT_URL% -OutFile '%TOOLS_DIR%\Git.7z'}"
    powershell -Command "& {Expand-Archive -Path '%TOOLS_DIR%\Git.7z' -DestinationPath '%TOOLS_DIR%'}"
    del "%TOOLS_DIR%\Git.7z"
    echo Git instalado com sucesso!
) ELSE (
    echo Git já está instalado.
)

echo Todas as ferramentas foram instaladas e configuradas com sucesso!
pause
endlocal
