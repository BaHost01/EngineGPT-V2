# Caminho base da engine
$engineRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Função para definir variáveis de ambiente
function Set-EnvironmentVariables {
    Write-Host "Configurando variáveis de ambiente..."

    # Variável para o caminho da engine
    $env:ENGINE_GPT_HOME = $engineRoot

    # Variáveis de ambiente para ferramentas
    $pathAdditions = "$engineRoot\tools\MinGW\bin;$engineRoot\tools\CMake\bin;$engineRoot\tools\Git\bin"
    $env:PATH += ";$pathAdditions"

    # Persistir variáveis de ambiente para sessões futuras
    [System.Environment]::SetEnvironmentVariable("ENGINE_GPT_HOME", $engineRoot, [System.EnvironmentVariableTarget]::User)
    [System.Environment]::SetEnvironmentVariable("PATH", $env:PATH, [System.EnvironmentVariableTarget]::User)

    Write-Host "Variáveis de ambiente configuradas."
}

# Execução da função para configurar as variáveis de ambiente
Set-EnvironmentVariables

Write-Host "As variáveis de ambiente foram configuradas com sucesso!" -ForegroundColor Green
