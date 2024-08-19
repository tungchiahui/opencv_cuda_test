# 项目脚本说明

## 1. `setup_vinci_emis.bash`

### 功能

- 设置 `LD_LIBRARY_PATH` 环境变量，指向项目中的 `install/lib` 目录，确保运行时能够找到所需的动态库。
- 提供命令补全功能，使 `vinci_emis` 脚本的参数（如二进制文件名）能够自动补全。

### 如何使用

1. **加载脚本**

   在终端中运行以下命令以设置环境变量和启用命令补全：

   ```bash
   # 请确认该脚本在build文件夹下运行
   cd build
   # 第一次使用时请给予执行权限
   sudo chmod a+x ../script/setup_vinci_emis.bash
   # 执行脚本
   source ../script/setup_vinci_emis.bash

## 2. `vinci_emis`

### 功能

- 验证输入的参数，确保第一个参数为 `run`。
- 查找并运行指定的二进制文件(在install/bin/run_temp中的文件)。
- 确保二进制文件存在且具有执行权限。

### 使用方法

1. **运行二进制文件**

   使用以下命令运行指定的二进制文件：

   ```bash
    # 请确认该脚本在build文件夹下运行
    cd build
    # 第一次使用时请给予执行权限
    sudo chmod a+x ../script/vinci_emis
    # 运行二进制文件
    ../script/vinci_emis run <binary_file_name>



2. **清理build和install文件夹**

   使用以下命令进行清理：

   ```bash
    # 请确认该脚本在build文件夹下运行
    cd build
    # 第一次使用时请给予执行权限
    sudo chmod a+x ../script/vinci_emis
    # 清理build和install文件夹
    ../script/vinci_emis clean