# EngineGPT-V2

EngineGPT-V2 is a modern, lightweight, and efficient game engine designed for high-performance 2D and 3D game development. It is built with C++17 and leverages industry-standard libraries for rendering, physics, audio, and UI.

## Features

- **Cross-Platform**: Full support for Windows and Linux.
- **Rendering**: OpenGL & GLFW for fast and efficient rendering.
- **Physics**: 2D physics with Box2D and 3D physics with Bullet Physics.
- **Audio**: OpenAL-Soft for high-quality spatial audio.
- **UI**: Dear ImGui for flexible and dynamic developer tools and in-game interfaces.
- **Testing**: Integrated unit testing with Google Test.
- **Modern Build System**: CMake-based with automatic dependency management via `FetchContent`.

## Getting Started

### Prerequisites

- **Windows**: [CMake](https://cmake.org/download/), [Git](https://git-scm.com/downloads), and a C++ compiler (like MinGW-w64 or Visual Studio).
- **Linux**: CMake, Git, GCC/Clang, and development headers for X11/Wayland and OpenAL.

### Installation & Build

#### Windows (PowerShell)
```powershell
.\scripts\setup.ps1
```

#### Linux (Bash)
```bash
chmod +x scripts/setup.sh
./scripts/setup.sh
```

## Project Structure

- `src/`: Engine source files (.cpp)
- `include/`: Engine header files (.h, .hpp)
- `assets/`: Game assets (textures, sounds, models)
- `scripts/`: Platform-specific automation scripts
- `tests/`: Unit tests
- `docs/`: Documentation

## Continuous Integration

GitHub Actions are configured to automatically build and test the engine on every push to the `main` branch, ensuring cross-platform compatibility and code quality.

## License

See `LICENSE` file for details.
