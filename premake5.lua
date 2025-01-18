require "cmake" -- necessary to use premake's cmake extension

workspace "RcCar"
    configurations { "Debug", "Release" }

project "RcCar"
    kind "Makefile"
    language "C++"
    targetdir "bin/%{cfg.buildcfg}"

    files { "**.h", "**.cpp" }

    cppdialect "C++11"

    targetname "RcCar.elf"

    -- This is required for the build to succeed with the ARM GNU toolchain on Windows
    linkoptions { "--specs=nosys.specs" }

    filter "configurations:Debug"
        defines { "DEBUG" }
        symbols "On"

    filter "configurations:Release"
        defines { "NDEBUG" }
        optimize "On"
