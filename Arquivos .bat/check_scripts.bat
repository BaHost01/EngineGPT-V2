@echo off

REM Verificar se a variável de ambiente ENGINE_GPT_HOME está definida
if not defined ENGINE_GPT_HOME (
    echo ERRO: A variável de ambiente ENGINE_GPT_HOME não está configurada.
    exit /b 1
)

REM Verificar se o diretório MinGW está no PATH
echo %PATH% | findstr /C:"MinGW\bin" >nul
if errorlevel 1 (
    echo ERRO: Caminho MinGW\bin não encontrado na variável de ambiente PATH.
    exit /b 1
)

REM Verificar se o arquivo de configuração existe
if not exist "%ENGINE_GPT_HOME%\config\engine_config.json" (
    echo ERRO: Arquivo de configuração não encontrado.
    exit /b 1
)

REM Verificar se o diretório de build existe
if not exist "%ENGINE_GPT_HOME%\bin\Release" (
    echo ERRO: Diretório de compilação não encontrado.
    exit /b 1
)

echo Todos os scripts foram executados com sucesso!
pause
