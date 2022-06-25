project "Serial"
    kind "StaticLib"
    language "C++"
    cppdialect "C++17"
    staticruntime "off"

	targetdir ("bin/" .. outputdir .. "/%{prj.name}")
	objdir ("bin-int/" .. outputdir .. "/%{prj.name}")

    files
    {
        "include/serial/serial.h",
        "include/serial/v8stdint.h",

        "src/serial.cc",

        "src/impl/win.cc",
        "src/impl/unix.cc",
        "src/impl/list_ports/list_ports_linux.cc",
        "src/impl/list_ports/list_ports_osx.cc",
        "src/impl/list_ports/list_ports_win.cc"
    }

	filter "configurations:Debug"
		runtime "Debug"
		symbols "on"

	filter "configurations:Release"
		runtime "Release"
		optimize "on"

	filter "configurations:Dist"
		runtime "Release"
		optimize "on"
        symbols "off"