# CMAKE_SOURCE_DIR: 顶层 CMakeLists.txt 所在的目录，即整个CMake项目的根目录。
# CMAKE_BINARY_DIR: CMake生成构建文件的顶层目录，通常是你运行 cmake 命令的目录。
# CMAKE_CURRENT_SOURCE_DIR: 当前处理的源目录，包含了当前 CMakeLists.txt 所在的目录。
# CMAKE_CURRENT_BINARY_DIR: 当前处理的构建目录，对应于 CMAKE_CURRENT_SOURCE_DIR。

# 将指定目录下的所有源文件（不包括子目录中的文件）添加到一个列表中(用file更好)
# aux_source_directory (. SRC_LIST)

# 利用指定的源文件在项目中添加可执行文件 (该命令必须靠前)
# add_executable(<可执行文件名> <源文件列表>)   源文件可以有多个，用空格隔开
add_executable(${TARGET_NAME} ${CMAKE_CURRENT_SOURCE_DIR}/main.cpp)


# 给指定的目标添加头文件搜索路径(只需要一个目录即可，不需要完整的绝对路径,所以用不到${HEADER_LIST})(还有一个叫include_directories，类似于全局变量，一般大工程不用)
# target_include_directories(<target> <INTERFACE|PUBLIC|PRIVATE> <dir1 dir2 ...>)
# target_include_directories(${TARGET_NAME} PUBLIC ${CMAKE_SOURCE_DIR}/inc)
# 加载本文件夹下的所有头文件
include_directories(${CMAKE_CURRENT_SOURCE_DIR})

# 指定可执行文件的输出路径
# CMake 中用于设置目标属性的命令。通过这个命令，你可以为特定目标配置各种属性
# set_target_properties(target_name PROPERTIES property1 value1 property2 value2 ...)
# target_name：指定你要设置属性的目标名称
# PROPERTIES：表示接下来的键值对是要设置的属性
# property：目标的属性名 (RUNTIME_OUTPUT_DIRECTORY 是一个属性名，用于指定可执行文件的输出目录)
# value：属性的值 (${CMAKE_SOURCE_DIR}/bin 是这个属性的值，指定了输出目录的位置)
# set_target_properties(${TARGET_NAME} PROPERTIES RUNTIME_OUTPUT_DIRECTORY ${USER_INSTALL_BIN_DIR}/run_temp)

# 安装二进制文件
install(TARGETS ${TARGET_NAME} DESTINATION ${USER_INSTALL_BIN_DIR})


# 为当前项目添加子目录。子目录当中必须包含一个CMakeLists.txt文件，其中可以不写cmake_minimum_required与project。
# add_subdirectory(<源文件子目录路径>)
add_subdirectory(OPENCV_CUDA)
# 将动态库src_lib与目标进行链接
target_link_libraries(${TARGET_NAME} PUBLIC OPENCV_CUDA_src_lib)
# 安装  动态库
install(TARGETS OPENCV_CUDA_src_lib DESTINATION lib)
