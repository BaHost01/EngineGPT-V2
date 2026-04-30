#pragma once
#include <string>

namespace Engine {
    class Platform {
    public:
        static void Init();
        static void Shutdown();
        static std::string GetPlatformName();
        
        // Termux Specific
        static void Vibrate(int duration_ms);
        static void ShowToast(const std::string& message);
    };
}
