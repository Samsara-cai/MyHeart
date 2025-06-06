## Vcpkg简介

vcpkg 是由微软开发的一款开源的c/c++包管理工具。用于简化开源库在Windows、Linux和MacOs上的获取和安装过程。它可以

- 自动下载和构建c/c++库
- 解决依赖关系
- 支持跨平台，支持多种编译器，MSVC 、MinGW、GCC等
- 可以与CMake、MsBuild等构建系统集成
- 方便的管理库版本和配置

解决c/c++项目依赖配置繁琐的痛点。在熟练掌握CMake的前提下，可以非常高效的配置项目依赖。

#### 安装和使用

1. windows下安装：

```bash
git clone https://github.com/microsoft/vcpkg //下载源码
cd vcpkg                                     //切换到源码根目录
.\bootstrap-vcpkg.bat					   //执行启动脚本
```

2. Linux/MacOs下安装

``` bash
git clone https://github.com/microsoft/vcpkg
cd vcpkg
./bootstrap-vcpkg.sh
```

3. 基本使用

```bash
#可用库搜索库(包括尚未安装但是可从vcpkg仓库获取的库)
vcpkg search fmt
#查看本地已安装的库
vcpkg list
#搜索拥有与子字符串 (<file-substr>) 匹配的一个或多个特定文件的已安装包
vcpkg owns zlib.h
#安装库 vcpkg install <库名>[features...]:<平台配置三元组>
vcpkg install fmt:x64-windwos-static
#添加依赖：将你的项目所需要第三方库添加到你的项目下的vcpkg.json中
vcpkg add port fmt
#添加依赖，并指定依赖库的 features (不同的功能) 
vcpkg add port vtk[core]
```

4. vcpkg的目录介绍

   │
   ├── 📄 vcpkg.exe          # vcpkg 主程序 (执行命令入口)
   ├── 📄 .vcpkg-root        # 标记文件 (标识这是vcpkg根目录)
   │
   ├── 📁 scripts/           # vcpkg核心脚本
   │   └── 📁 buildsystems/
   │       └── 📄 vcpkg.cmake   # CMake工具链文件 (最重要的集成文件)
   │
   ├── 📁 ports/             # 库定义目录 (每个库一个子目录)
   │   ├── 📁 zlib/          # Zlib库定义
   │   │   ├── 📄 vcpkg.json     # 库元数据 (名称/版本/依赖)
   │   │   └── 📄 portfile.cmake # 构建脚本 (下载/编译/安装逻辑)
   │   │
   │   ├── 📁 boost/         # Boost库定义
   │   └── 📁 ...            # 其他库
   │
   ├── 📁 triplets/          # 平台配置定义
   │   ├── 📄 x64-windows.cmake     # 64位Windows动态链接配置
   │   ├── 📄 x86-windows-static.cmake  # 32位Windows静态链接
   │   └── 📄 x64-linux.cmake       # 64位Linux配置

   │
   ├── 📁 installed/         # 已安装库的主目录 (按平台分组)
   │   └── 📁 x64-windows/      # 64位Windows安装库
   │       ├── 📁 bin/          # 可执行文件和动态库 (.exe/.dll)
   │       ├── 📁 include/       # 头文件目录 (.h/.hpp)
   │       ├── 📁 lib/           # 静态库和导入库 (.lib/.a)
   │       └── 📁 share/         # 配置文件
   │           └── 📁 zlib/      
   │               └── 📄 zlib-config.cmake  # CMake配置文件
   │
   ├── 📁 buildtrees/        # 构建中间文件
   │   └── 📁 zlib/          # Zlib的构建目录
   │       ├── 📁 src/            # 解压后的源代码
   │       ├── 📄 .build-x64-windows-out.log  # 构建输出日志
   │       └── 📄 .build-x64-windows-err.log  # 构建错误日志
   │
   ├── 📁 downloads/         # 下载缓存
   │   ├── 📄 zlib1211.tar.gz     # 源代码压缩包缓存
   │   └── 📁 tools/           # 构建工具 (cmake, ninja等)
   │
   ├── 📁 packages/          # 临时安装目录 (在最终安装前暂存)
   │   └── 📁 zlib_x64-windows/   # zlib临时安装
   │
   └── 📁 versions/          # 库版本信息
       └── 📄 baseline.json     # 各库的默认版本基准

5. 与CMake的集成

   项目目录

   ```c++
   //├── CMakeLists.txt         项目主 CMake 配置
   //├── vcpkg.json             项目依赖声明
   //├── CMakePresets.json      CMake 预设配置（可选）
   //├── src/
   //│   └── main.cpp           应用程序源代码
   ```

   main.cpp

   ```c++
   #include <fmt/core.h>
   int main()
   {
       fmt::print("Hello World!\n");
       return 0;
   }
   ```

   CMakeLists.txt

   ```cmake
   cmake_minimum_required(VERSION 3.10)
   
   project(HelloWorld)
   
   find_package(fmt CONFIG REQUIRED)
   
   add_executable(HelloWorld src/main.cpp)
   
   target_link_libraries(HelloWorld PRIVATE fmt::fmt)
   ```

   vcpkg.json

   ```json
   {
     "dependencies": [
   	{
   		"name":"fmt",
   		"version>=":"11.0.2"
   	}
     ]
   }
   ```

   CMakePreset.json

   ```json
   {
     "version": 2,
     "configurePresets": [
       {
         "name": "vcpkg",                               //供CMake查找的配置名称
         "binaryDir": "${sourceDir}/build",
   	  "generator": "Ninja",
         "cacheVariables": {
           "CMAKE_TOOLCHAIN_FILE": "$env{VCPKG_ROOT}/scripts/buildsystems/vcpkg.cmake", 
   		"VCPKG_TARGET_TRIPLET": "x64-windows",      //vcpkg的目标平台三元组
   		"CMAKE_GENERATOR_PLATFORM": "x64",          //项目生成的平台
   		"CMAKE_C_COMPILER": "cl.exe",               //指定c编译器
           "CMAKE_CXX_COMPILER": "cl.exe"               //指定c++编译器
         }
       }
     ]
   }
   ```

   项目构建

   ```bash
   #构建
   cmake --preset=vcpkg
   #编译
   cmake --build build
   ```

   主要的两个变量：CMAKE_TOOLCHAIN_FILE 和 VCPKG_TARGET_TRIPLET，同时项目的构建工具要和VCPKG_TARGET_TRIPLET对应的三元组保持一致。

6. 依赖的版本管理（重要）

   BaseLine: 规定了项目中的所有通过vcpkg引入的依赖的一个起点。（基线对应的依赖库的版本可以在versions文件夹中找到）

   version>=: 规定了指定依赖库的最小版本。

   Overrides: 强制指定依赖库对应的版本

   ```json
   // 依赖库的版本管理只有在清单模式下才能实现。
   //	在经典模式下，使用 vcpkg 作为命令行接口在vcpkg 安装目录中安装依赖项。 通常，位于中 %VCPKG_ROOT%/installed，其中 %VCPKG_ROOT% 是 vcpkg 的 
   //  安装目录。
   
   // 在清单模式下，在新建项目文件夹，在名为 vcpkg.json的清单文件中声明项目的直接依赖项。此模式下，会根据清单文件生成项目自己的vcpkg_installed目
   // 录，用于安装依赖项，这与经典模式不同，经典模式的所有包都安装在公共 %VCPKG_ROOT%/installed 目录中。 因此，每个项目都可以有自己的清单和自己的一
   // 组不与其他项目的依赖项冲突的依赖项。
   
   {
     "dependencies": [
       {
           "name": "fmt",
           "version>=": "10.1.1"
       },
       "zlib"
     ],
     "builtin-baseline": "3426db05b996481ca31e95fff3734cf23e0f51bc", 
     "overrides": [
       { 
           "name": "zlib", 
           "version": "1.2.8"
       }
     ]
   }
   ```

   查找某个基线下 某个依赖库的版本

   ```bash
   git show 2815578f4a3486cec24c9b07d17e18e03bbaf667:versions/baseline.json | egrep -A 3 -e '"zlib"|"fmt"|"curl"'
   
   # 2815578f4a3486cec24c9b07d17e18e03bbaf667 对应vcpkg仓库的git提交记录的 hash
   # -e '"zlib"|"fmt"|"curl"' -e 指定正则表达式
   # -A 3 匹配到符合条件的行后，还会显示接下来3行
   ```

   



## Pagmo2 简介

Pagmo2 是一个强大的 C++ 库，专为并行计算和大规模优化问题设计。它由欧洲航天局 (ESA) 开发，提供了一套丰富的优化算法和并行计算框架，特别适合解决科学计算和工程优化中的复杂问题。

#### 从vcpkg安装

```bash
# vcpkg安装的版本比从源码安装的会滞后
vcpkg install pagmo2:x64-windows-static
```

