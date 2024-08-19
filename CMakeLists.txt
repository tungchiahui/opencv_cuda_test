# 设置CMake最低版本要求为 3.10
# cmake_minimum_required(VERSION <版本号>)
cmake_minimum_required (VERSION 3.10)

# 创建一个名为CMake_demo的项目
# project(<项目名>)
project (demo1)

# 创建一个名为CMake_demo的项目并给予项目版本号
# project(<项目名>)
# project (CMake_demo VERSION 1.0)

# 定义变量来存储目标名称
set(TARGET_NAME ${PROJECT_NAME})

# 用于给变量设置值
# set(<变量名> <变量值>)
# add_compile_options(-std=c++11 -g -Wall)
# set(CMAKE_CXX_FLAGS "${CMAKE_CXX_FLAGS} -std=c++11 -Wall")

# 用于给变量设置值
# set(<变量名> <变量值>)
# 设置C++标准，一般用11或14,在C++中可以通过输出__cplusplus的值查看对应表得知当前编译器所用的标准
set(CMAKE_CXX_STANDARD 14)
# 设置C标准
set(CMAKE_C_STANDARD 11)

# 用于给变量设置值
# set(<变量名> <变量值>)
# 如果设置为True，则通过CMAKE_CXX_STANDARD设置的C++标准是必需的，如果编译器不支持该标准则会输出错误提示信息。
# 如果不设置或者设置为False，则CMAKE_CXX_STANDARD设置的C++标准不是必需的，如果编译器不支持对应的标准，则会使用上一个版本的标准进行编译。
# 确保 C++ 标准是必需的
set(CMAKE_CXX_STANDARD_REQUIRED True)
# 确保 C 标准是必需的
set(CMAKE_C_STANDARD_REQUIRED True)


# 用于给变量设置值
# set(<变量名> <变量值>)
# 生成compile_commands.json文件(供Clangd使用)
set(CMAKE_EXPORT_COMPILE_COMMANDS ON)

# 用于给变量设置值
# set(<变量名> <变量值>)
set(CMAKE_BUILD_TYPE Debug)

# 设置install路径
set(CMAKE_INSTALL_PREFIX ${CMAKE_SOURCE_DIR}/install)

# 设置include安装路径
set(USER_INSTALL_INCLUDE_DIR ${CMAKE_INSTALL_PREFIX}/include)
# 设置bin安装路径
set(USER_INSTALL_BIN_DIR ${CMAKE_INSTALL_PREFIX}/bin)
# 设置lib安装路径
set(USER_INSTALL_LIB_DIR ${CMAKE_INSTALL_PREFIX}/lib)

# 设置日志保存路径
# PROJECT_SOURCE_DIR：工程的根目录(调用project的CMakeLists.txt文件所在的目录)
# CMAKE_SOURCE_DIR：工程的根目录(顶层CMakeLists.txt文件所在的目录)
set(LOG_DIR ${CMAKE_SOURCE_DIR}/log)
file(MAKE_DIRECTORY ${LOG_DIR})           # 创建日志保存目录（若不存在)

# 为当前项目添加子目录。子目录当中必须包含一个CMakeLists.txt文件，其中可以不写cmake_minimum_required与project。
# add_subdirectory(<源文件子目录路径>)
add_subdirectory(src)