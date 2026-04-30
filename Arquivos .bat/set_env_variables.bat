@echo off

REM Definir o caminho da engine como variável de ambiente
SET "ENGINE_GPT_HOME=%~dp0"

REM Adicionar ferramentas ao PATH
SET "PATH=%PATH%;%ENGINE_GPT_HOME%\tools\MinGW\bin;%ENGINE_GPT_HOME%\tools\CMake\bin;%ENGINE_GPT_HOME%\tools\Git\bin"

REM Persistir as variáveis de ambiente para sessões futuras
setx ENGINE_GPT_HOME "%ENGINE_GPT_HOME%"
setx PATH "%PATH%"

echo Variáveis de ambiente configuradas com sucesso!
pause
