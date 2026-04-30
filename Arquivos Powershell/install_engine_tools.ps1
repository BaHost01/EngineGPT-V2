# Caminho base para downloads
$downloadPath = "$env:USERPROFILE\Downloads\EngineTools"

# Criação da pasta para downloads
if (!(Test-Path -Path $downloadPath)) {
    New-Item -ItemType Directory -Path $downloadPath
}

# Função para baixar arquivos
function Download-File($url, $destination) {
    Write-Host "Baixando $url..."
    Invoke-WebRequest -Uri $url -OutFile $destination
}

# Função para extrair arquivos zip
function Extract-Zip($zipFile, $destination) {
    Write-Host "Extraindo $zipFile..."
    Expand-Archive -LiteralPath $zipFile -DestinationPath $destination -Force
}

# Função para instalação de ferramentas usando o pacote Chocolately
function Install-ChocoPackage($packageName) {
    Write-Host "Instalando $packageName com Chocolatey..."
    choco install $packageName -y
}

# Instalação do Chocolatey (gerenciador de pacotes para Windows)
if (!(Get-Command choco -ErrorAction SilentlyContinue)) {
    Write-Host "Instalando Chocolatey..."
    Set-ExecutionPolicy Bypass -Scope Process -Force
    [System.Net.ServicePointManager]::SecurityProtocol = [System.Net.ServicePointManager]::SecurityProtocol -bor 3072
    Invoke-Expression ((New-Object System.Net.WebClient).DownloadString('https://chocolatey.org/install.ps1'))
}

# Instalar MinGW (ou GCC) usando Chocolatey
Install-ChocoPackage "mingw"

# Instalar CMake usando Chocolatey
Install-ChocoPackage "cmake"

# Instalar Git usando Chocolatey
Install-ChocoPackage "git"

# Baixar e instalar GLFW
$glfwUrl = "https://github.com/glfw/glfw/releases/download/3.3.8/glfw-3.3.8.bin.WIN64.zip"
$glfwZip = "$downloadPath\glfw-3.3.8.zip"
Download-File $glfwUrl $glfwZip
Extract-Zip $glfwZip "$downloadPath\GLFW"

# Baixar e instalar GLEW
$glewUrl = "https://sourceforge.net/projects/glew/files/glew/2.2.0/glew-2.2.0-win32.zip"
$glewZip = "$downloadPath\glew-2.2.0.zip"
Download-File $glewUrl $glewZip
Extract-Zip $glewZip "$downloadPath\GLEW"

# Baixar e instalar Box2D
$box2dUrl = "https://github.com/erincatto/box2d/archive/refs/tags/v2.4.1.zip"
$box2dZip = "$downloadPath\box2d-2.4.1.zip"
Download-File $box2dUrl $box2dZip
Extract-Zip $box2dZip "$downloadPath\Box2D"

# Baixar e instalar Bullet Physics
$bulletUrl = "https://github.com/bulletphysics/bullet3/archive/refs/tags/3.24.zip"
$bulletZip = "$downloadPath\bullet-3.24.zip"
Download-File $bulletUrl $bulletZip
Extract-Zip $bulletZip "$downloadPath\BulletPhysics"

# Baixar e instalar Dear ImGui
$imguiUrl = "https://github.com/ocornut/imgui/archive/refs/tags/v1.89.4.zip"
$imguiZip = "$downloadPath\imgui-1.89.4.zip"
Download-File $imguiUrl $imguiZip
Extract-Zip $imguiZip "$downloadPath\ImGui"

# Baixar e instalar OpenAL
$openalUrl = "https://openal-soft.org/openal-binaries/openal-soft-1.23.0-bin.zip"
$openalZip = "$downloadPath\openal-soft-1.23.0.zip"
Download-File $openalUrl $openalZip
Extract-Zip $openalZip "$downloadPath\OpenAL"

# Baixar e instalar Google Test
$gtestUrl = "https://github.com/google/googletest/archive/refs/tags/v1.13.0.zip"
$gtestZip = "$downloadPath\googletest-1.13.0.zip"
Download-File $gtestUrl $gtestZip
Extract-Zip $gtestZip "$downloadPath\GoogleTest"

# Informações sobre o caminho de instalação
Write-Host "Ferramentas baixadas e instaladas em: $downloadPath"
Write-Host "Instalação concluída com sucesso!"
Write-Host "Instalado Em Dowload Coloque na pasta EngineGPT"

