cmake_minimum_required(VERSION 3.16)

project(SerialportTools VERSION 1.0.0 LANGUAGES CXX)

set(CMAKE_CXX_STANDARD 17)
set(CMAKE_CXX_STANDARD_REQUIRED on)

find_package(Qt6 REQUIRED COMPONENTS Quick Gui Core Qml QuickControls2)

qt_standard_project_setup(REQUIRES 6.5)

qt_add_executable(SerialportTools
    src/main.cpp
)

#自动 管理资源 并保存在 qrc:/${URI} 路径下
qt_add_qml_module(SerialportTools
    URI SerialportTools
    QML_FILES
        qml/main.qml

    RESOURCES
        resources/img/serialport.svg
)


target_link_libraries(SerialportTools PUBLIC Qt6::Gui Qt6::Quick Qt6::Core Qt6::QuickControls2 CommonQml)
