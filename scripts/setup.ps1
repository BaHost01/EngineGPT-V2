# EngineGPT-V2 Setup Script for Windows

Write-Host "Starting EngineGPT-V2 Setup..." -ForegroundColor Cyan

# Check for CMake
if (!(Get-Command cmake -ErrorAction SilentlyContinue)) {
    Write-Host "CMake not found. Please install CMake and add it to your PATH." -ForegroundColor Red
    exit 1
}

# Configure and Build
Write-Host "Configuring project..." -ForegroundColor Green
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release

Write-Host "Building project..." -ForegroundColor Green
cmake --build build --config Release

Write-Host "Setup complete! Executable is in build/Release/EngineGPT-V2.exe (or build/EngineGPT-V2.exe)" -ForegroundColor Cyan
