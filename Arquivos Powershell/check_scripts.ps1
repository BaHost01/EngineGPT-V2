# Caminho base da engine
$engineRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Função para verificar se as variáveis de ambiente estão configuradas
function Check-EnvironmentVariables {
    Write-Host "Verificando variáveis de ambiente..."

    if (-not $env:ENGINE_GPT_HOME) {
        Write-Host "ERRO: A variável de ambiente 'ENGINE_GPT_HOME' não está configurada." -ForegroundColor Red
        return $false
    }

    if (-not ($env:PATH -match "MinGW\\bin")) {
        Write-Host "ERRO: Caminho 'MinGW\\bin' não encontrado na variável de ambiente 'PATH'." -ForegroundColor Red
        return $false
    }

    Write-Host "Variáveis de ambiente verificadas com sucesso."
    return $true
}

# Função para verificar se o script de configuração foi executado
function Check-ConfigurationScript {
    Write-Host "Verificando execução do script de configuração..."

    $configFile = "$engineRoot\config\engine_config.json"
    if (-not (Test-Path -Path $configFile)) {
        Write-Host "ERRO: O arquivo de configuração '$configFile' não foi encontrado." -ForegroundColor Red
        return $false
    }

    Write-Host "Script de configuração verificado com sucesso."
    return $true
}

# Função para verificar se o script de compilação foi executado
function Check-BuildScript {
    Write-Host "Verificando execução do script de compilação..."

    $buildDir = "$engineRoot\bin\Release"
    if (-not (Test-Path -Path $buildDir)) {
        Write-Host "ERRO: O diretório de saída de build '$buildDir' não foi encontrado." -ForegroundColor Red
        return $false
    }

    Write-Host "Script de compilação verificado com sucesso."
    return $true
}

# Verificar todos os pré-requisitos
if (Check-EnvironmentVariables -and Check-ConfigurationScript -and Check-BuildScript) {
    Write-Host "Todos os scripts foram executados com sucesso. Pronto para executar comandos no GitHub!" -ForegroundColor Green
    # Aqui você pode adicionar comandos para executar no GitHub, como git add, git commit, etc.
} else {
    Write-Host "Falha na verificação de pré-requisitos. Por favor, execute os scripts necessários antes de continuar." -ForegroundColor Red
    exit 1
}
