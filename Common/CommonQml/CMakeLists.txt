cmake_minimum_required(VERSION 3.21)
project(CommonQml LANGUAGES CXX)

#根据不同的编译器，手动指定Qt环境
# if(MSVC)
#     if(CMAKE_SIZEOF_VOID_P EQUAL 8)
#         set(Qt6_DIR "F:/Qt/6.8.0/msvc2022_64/lib/cmake/Qt6")
#     endif()

# elseif(CMAKE_SYSTEM_NAME STREQUAL "Android")
#     # 安卓平台，Qt路径应对应安卓版本
#     if(CMAKE_ANDROID_ARCH_ABI STREQUAL "arm64-v8a")
#         set(Qt6_DIR "F:/Qt/6.8.0/android_arm64_v8a/lib/cmake/Qt6")
#     elseif(CMAKE_ANDROID_ARCH_ABI STREQUAL "armeabi-v7a")
#         set(Qt6_DIR "F:/Qt/6.8.0/android_armv7/lib/cmake/Qt6")
#     elseif(CMAKE_ANDROID_ARCH_ABI STREQUAL "x86_64")
#         set(Qt6_DIR "F:/Qt/6.8.0/android_x86_64/lib/cmake/Qt6")
#     elseif(CMAKE_ANDROID_ARCH_ABI STREQUAL "x86")
#         set(Qt6_DIR "F:/Qt/6.8.0/android_x86/lib/cmake/Qt6")

# elseif(CMAKE_CXX_COMPILER_ID STREQUAL "GNU")
#     if(WIN32)
#         # Windows 下的 MinGW
#         set(Qt6_DIR "F:/Qt/6.8.0/mingw_64/lib/cmake/Qt6")
#     else()
#         # Linux gcc
#         set(Qt6_DIR "/opt/Qt/6.8.0/gcc_64/lib/cmake/Qt6")
#     endif()

# elseif(CMAKE_CXX_COMPILER_ID STREQUAL "Clang")
#     set(Qt6_DIR "/opt/Qt/6.8.0/clang_64/lib/cmake/Qt6")

# else()
#     message(FATAL_ERROR  "Unknown compiler, please set Qt6_DIR manually")
# endif()

find_package(Qt6 REQUIRED COMPONENTS Qml Quick Core QuickControls2)
qt6_standard_project_setup(REQUIRES 6.8)

# 主模块声明
qt_add_qml_module(CommonQml
    URI "CommonQml"
    VERSION 1.0
    SHARED
    QML_FILES
        FramelessWindow.qml
    RESOURCES
        img/close.svg
        img/maxmize.svg
        img/minimize.svg
        img/normalize.svg
        QML_FILES BubbleToolTip.qml
        QML_FILES
)


target_link_libraries(CommonQml PRIVATE Qt6::Qml Qt6::Quick Qt6::Core Qt6::QuickControls2)

