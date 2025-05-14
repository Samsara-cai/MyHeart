#ifndef DEFINE_H
#define DEFINE_H

// 动态库导出宏（跨平台兼容）
#ifdef _WIN32
#ifdef BUILD_LEETCODE_DLL
#define LEETCODE_API __declspec(dllexport)  // Windows 导出
#else
#define LEETCODE_API __declspec(dllimport)  // Windows 导入
#endif
#else
#define LEETCODE_API       // Linux/macOS 默认为可见性
#endif

#endif // DEFINE_H
