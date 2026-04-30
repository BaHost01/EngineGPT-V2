# Caminho base da engine
$engineRoot = Split-Path -Parent $MyInvocation.MyCommand.Definition

# Diretório de build
$buildDir = "$engineRoot\build"

# Função para configurar o ambiente de build
function Configure-BuildEnvironment {
    Write-Host "Configurando o ambiente de build..."

    if (-not (Test-Path -Path $buildDir)) {
        New-Item -ItemType Directory -Path $buildDir | Out-Null
        Write-Host "Diretório de build criado: $buildDir"
    } else {
        Write-Host "Diretório de build já existe: $buildDir"
    }

    Write-Host "Ambiente de build configurado."
}

# Função para gerar arquivos de build com CMake
function Generate-BuildFiles {
    Write-Host "Gerando arquivos de build com CMake..."

    Push-Location $buildDir
    cmake .. -G "MinGW Makefiles" -DCMAKE_BUILD_TYPE=Release
    Pop-Location

    Write-Host "Arquivos de build gerados."
}

# Função para compilar o código
function Compile-Code {
    Write-Host "Compilando o código..."

    Push-Location $buildDir
    cmake --build . --config Release
    Pop-Location

    Write-Host "Código compilado."
}

# Função para organizar a saída de build
function Organize-BuildOutput {
    Write-Host "Organizando a saída de build..."

    $outputDir = "$engineRoot\bin\Release"
    if (-not (Test-Path -Path $outputDir)) {
        New-Item -ItemType Directory -Path $outputDir | Out-Null
        Write-Host "Diretório de saída criado: $outputDir"
    }

    Get-ChildItem "$buildDir\*.exe" | ForEach-Object {
        Copy-Item $_.FullName -Destination $outputDir
        Write-Host "Binário copiado: $($_.Name)"
    }

    Write-Host "Saída de build organizada."
}

# Execução das funções de build
Configure-BuildEnvironment
Generate-BuildFiles
Compile-Code
Organize-BuildOutput

Write-Host "Build concluído com sucesso!" -ForegroundColor Green
