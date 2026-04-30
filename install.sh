#!/bin/bash
# EngineGPT-V2 Unified Remote Installer
# Usage: curl -sSL <URL_TO_THIS_SCRIPT> | bash

set -e

echo "--- EngineGPT-V2 Installer ---"

# Detect Environment
if [ -d "/data/data/com.termux/files/usr" ]; then
    ENV="Termux"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    ENV="Linux"
elif [[ "$OSTYPE" == "msys" ]] || [[ "$OSTYPE" == "cygwin" ]]; then
    ENV="Windows"
else
    ENV="Unknown"
fi

echo "Detected Environment: $ENV"

if [ "$ENV" == "Windows" ]; then
    echo "This script is for Bash environments. For Windows, please use PowerShell:"
    echo "powershell -Command \"iwr -useb <URL_TO_SETUP_PS1> | iex\""
    exit 1
fi

# Clone the repository if not already in it
if [ ! -d ".git" ]; then
    echo "Cloning EngineGPT-V2 repository..."
    pkg install git -y || sudo apt-get install git -y
    git clone https://github.com/BaHost01/EngineGPT-V2.git
    cd EngineGPT-V2
fi

# Delegate to platform scripts
if [ "$ENV" == "Termux" ]; then
    chmod +x scripts/setup_termux.sh
    ./scripts/setup_termux.sh
else
    chmod +x scripts/setup.sh
    ./scripts/setup.sh
fi

echo "--- Installation Finished ---"
