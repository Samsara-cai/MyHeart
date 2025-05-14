cmake_minimum_required(VERSION 3.16)

project(Connections VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED on)

find_package(Qt6 REQUIRED COMPONENTS Quick Gui Core Qml QuickControls2)

qt_standard_project_setup(REQUIRES 6.8)


if(WIN32)
    set(APP_ICON_RC "${CMAKE_CURRENT_SOURCE_DIR}/resources/app.rc")
endif()

qt_add_executable(Connections
    ${APP_ICON_RC}
    src/main.cpp
)

qt_add_resources(Connections app.qrc
                FILES
                    resources/img/app.ico
)



#自动 管理资源 并保存在 qrc:qt/qml/${URI} 路径下(从6.5版本起)
qt_add_qml_module(Connections
    URI Connections
    QML_FILES
        qml/main.qml
    SOURCES
        src/WindowsEventFilter.h
        src/WindowsEventFilter.cpp
)


target_link_libraries(Connections PRIVATE Qt6::Gui Qt6::Quick Qt6::Core Qt6::QuickControls2 CommonQml)


message(STATUS "CMAKE_BINARY_DIR = ${CMAKE_BINARY_DIR}")
message(STATUS "CMAKE_CURRENT_BINARY_DIR = ${CMAKE_CURRENT_BINARY_DIR}")


#添加拷贝命令，自动拷贝需要的库文件（项目的Cmake构建系统中生成的）到本应用程序的build生成路径下
add_custom_command(TARGET Connections POST_BUILD
    COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${CMAKE_BINARY_DIR}/Common/CommonQml/CommonQml${CMAKE_SHARED_LIBRARY_SUFFIX}"
            "${CMAKE_CURRENT_BINARY_DIR}/CommonQml${CMAKE_SHARED_LIBRARY_SUFFIX}"

    COMMAND ${CMAKE_COMMAND} -E copy_if_different
            "${CMAKE_BINARY_DIR}/Common/CommonQml/CommonQmlplugin${CMAKE_SHARED_LIBRARY_SUFFIX}"
            "${CMAKE_CURRENT_BINARY_DIR}/CommonQml/CommonQmlplugin${CMAKE_SHARED_LIBRARY_SUFFIX}"

    DEPENDS CommonQml
)
