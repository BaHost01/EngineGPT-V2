@echo off

REM Diretórios e arquivos de configuração
SET "ENGINE_CONFIG_DIR=%ENGINE_GPT_HOME%\config"
SET "ENGINE_CONFIG_FILE=%ENGINE_CONFIG_DIR%\engine_config.json"

REM Criar diretórios necessários
if not exist "%ENGINE_CONFIG_DIR%" mkdir "%ENGINE_CONFIG_DIR%"

REM Gerar um arquivo de configuração básico
echo { > "%ENGINE_CONFIG_FILE%"
echo   "engine_version": "1.0", >> "%ENGINE_CONFIG_FILE%"
echo   "settings": { >> "%ENGINE_CONFIG_FILE%"
echo       "resolution": "1920x1080", >> "%ENGINE_CONFIG_FILE%"
echo       "fullscreen": true >> "%ENGINE_CONFIG_FILE%"
echo   } >> "%ENGINE_CONFIG_FILE%"
echo } >> "%ENGINE_CONFIG_FILE%"

echo Configuração da engine concluída!
pause
