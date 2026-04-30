# Caminho base da engine
$engineRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Função para configurar variáveis de ambiente
function Set-EnvironmentVariables {
    Write-Host "Configurando variáveis de ambiente..."

    # Variável para o caminho da engine
    $env:ENGINE_GPT_HOME = $engineRoot

    # Variáveis de ambiente para ferramentas
    $env:PATH += ";$engineRoot\tools\MinGW\bin"
    $env:PATH += ";$engineRoot\tools\CMake\bin"
    $env:PATH += ";$engineRoot\tools\Git\bin"

    Write-Host "Variáveis de ambiente configuradas."
}

# Função para verificar dependências
function Check-Dependencies {
    Write-Host "Verificando dependências..."

    $dependencies = @("cmake", "git", "g++")
    foreach ($dependency in $dependencies) {
        if (-not (Get-Command $dependency -ErrorAction SilentlyContinue)) {
            Write-Host "$dependency não encontrado! Por favor, instale-o antes de continuar." -ForegroundColor Red
            exit 1
        }
    }

    Write-Host "Todas as dependências foram verificadas."
}

# Função para criar diretórios necessários
function Create-Directories {
    Write-Host "Criando diretórios necessários..."

    $dirs = @("$engineRoot\build", "$engineRoot\bin", "$engineRoot\logs")
    foreach ($dir in $dirs) {
        if (-not (Test-Path -Path $dir)) {
            New-Item -ItemType Directory -Path $dir
            Write-Host "Diretório criado: $dir"
        } else {
            Write-Host "Diretório já existe: $dir"
        }
    }

    Write-Host "Diretórios criados."
}

# Função para gerar arquivos de configuração padrão
function Generate-ConfigFiles {
    Write-Host "Gerando arquivos de configuração padrão..."

    $configFile = "$engineRoot\config\engine_config.json"
    if (-not (Test-Path -Path $configFile)) {
        $configContent = @"
{
    "graphics": {
        "resolution": "1920x1080",
        "fullscreen": false
    },
    "audio": {
        "volume": 75
    },
    "input": {
        "mouse_sensitivity": 1.0,
        "invert_y_axis": false
    }
}
"@
        New-Item -ItemType File -Path $configFile -Force | Out-Null
        Set-Content -Path $configFile -Value $configContent
        Write-Host "Arquivo de configuração criado: $configFile"
    } else {
        Write-Host "Arquivo de configuração já existe: $configFile"
    }

    Write-Host "Arquivos de configuração gerados."
}

# Execução das funções de configuração
Set-EnvironmentVariables
Check-Dependencies
Create-Directories
Generate-ConfigFiles

Write-Host "Configuração concluída com sucesso!" -ForegroundColor Green
