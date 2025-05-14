cmake_minimum_required(VERSION 3.21)
project(LeetCode LANGUAGES CXX)

# 动态库编译选项
add_definitions(-DBUILD_LEETCODE_DLL)  # 定义导出宏

# 添加头文件目录
include_directories(include)

# 生成动态库
add_library(LeetCode SHARED
    src/LeetCodeAlgorithm.cpp
    include/Arrays.h
    include/Define.h
)
