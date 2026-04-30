#include "core/Platform.h"
#include <iostream>
#include <cstdlib>

#ifdef __ANDROID__
#include <sstream>
#endif

namespace Engine {
    void Platform::Init() {
        std::cout << "Initializing Engine on " << GetPlatformName() << std::endl;
    }

    void Platform::Shutdown() {
        std::cout << "Shutting down Engine..." << std::endl;
    }

    std::string Platform::GetPlatformName() {
#if defined(_WIN32)
        return "Windows";
#elif defined(__ANDROID__)
        return "Termux (Android)";
#elif defined(__linux__)
        return "Linux";
#else
        return "Unknown";
#endif
    }

    void Platform::Vibrate(int duration_ms) {
#ifdef __ANDROID__
        std::stringstream ss;
        ss << "termux-vibrate -d " << duration_ms;
        system(ss.str().c_str());
#else
        std::cout << "[Platform] Vibrate simulated: " << duration_ms << "ms" << std::endl;
#endif
    }

    void Platform::ShowToast(const std::string& message) {
#ifdef __ANDROID__
        std::stringstream ss;
        ss << "termux-toast \"" << message << "\"";
        system(ss.str().c_str());
#else
        std::cout << "[Platform] Toast: " << message << std::endl;
#endif
    }
}
