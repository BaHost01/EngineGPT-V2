#!/bin/bash
# EngineGPT-V2 Setup Script for Linux

echo "Starting EngineGPT-V2 Setup..."

# Function to check for a command
check_cmd() {
    command -v "$1" >/dev/null 2>&1
}

# Install dependencies (Debian/Ubuntu)
if check_cmd apt-get; then
    echo "Detected Debian/Ubuntu based system. Installing dependencies..."
    sudo apt-get update
    sudo apt-get install -y build-essential cmake git libwayland-dev libxkbcommon-dev xorg-dev libopenal-dev
elif check_cmd dnf; then
    echo "Detected Fedora based system. Installing dependencies..."
    sudo dnf install -y gcc-c++ cmake git libX11-devel libXrandr-devel libXinerama-devel libXcursor-devel libXi-devel openal-soft-devel
else
    echo "Could not detect package manager. Please ensure you have C++ compiler, CMake, Git, and OpenGL/GLFW dependencies installed."
fi

# Configure and Build
echo "Configuring project..."
rm -rf build
cmake -S . -B build -DCMAKE_BUILD_TYPE=Release

echo "Building project..."
cmake --build build --config Release

echo "Setup complete! Executable is in build/EngineGPT-V2"
