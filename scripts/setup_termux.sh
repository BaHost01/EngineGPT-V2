#!/bin/bash
# EngineGPT-V2 Setup Script for Termux (Android)

echo "Starting EngineGPT-V2 Setup for Termux..."

# 1. Update and Upgrade
pkg update && pkg upgrade -y

# 2. Install Core Build Tools
pkg install -y \
    build-essential \
    cmake \
    git \
    ninja \
    pkg-config \
    clang

# 3. Install Graphics & Audio Dependencies for Termux:X11
# Note: we use x11-repo for many graphics libs
pkg install -y x11-repo
pkg install -y \
    libx11 \
    libxrandr \
    libxinerama \
    libxcursor \
    libxi \
    libglvnd-dev \
    mesa-dev \
    openal-soft \
    termux-api

echo "Installing Termux:X11 (if not present)..."
pkg install -y termux-x11-nightly || echo "Please ensure you have the termux-x11 repository enabled."

# 4. Configure and Build
echo "Configuring project for Termux..."
# We use Ninja for faster builds on mobile
cmake -S . -B build -G Ninja \
    -DCMAKE_BUILD_TYPE=Release \
    -DTERMUX_BUILD=ON

echo "Building project..."
cmake --build build

echo "------------------------------------------------"
echo "Setup complete!"
echo "To run on Termux:X11:"
echo "1. Start the Termux:X11 App"
echo "2. In Termux, run: export DISPLAY=:0"
echo "3. Run the engine: ./build/EngineGPT-V2"
echo "------------------------------------------------"
