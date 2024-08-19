#!/bin/bash

_vinci_emis() {
    local cur prev opts run_temp_dir

    cur="${COMP_WORDS[COMP_CWORD]}"
    prev="${COMP_WORDS[COMP_CWORD-1]}"

    # 定义二进制文件的目录
    run_temp_dir="${SCRIPT_DIR}../install/bin/run_temp"

    if [ "$prev" == "run" ]; then
        if [ -d "$run_temp_dir" ]; then
            # 补全 run_temp 目录中的文件名
            local files
            files=$(ls "$run_temp_dir" 2>/dev/null)
            COMPREPLY=($(compgen -W "${files}" -- "$cur"))
        fi
    else
        # 仅补全命令（如 run 和 clean）
        opts="run clean"
        COMPREPLY=($(compgen -W "${opts}" -- "$cur"))
    fi
}

# 获取当前脚本所在目录的绝对路径
SCRIPT_ABS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 使用相对路径设置 CMAKE_LIBRARY_PATH
export CMAKE_LIBRARY_PATH="${SCRIPT_ABS_DIR}/../install/lib:$CMAKE_LIBRARY_PATH"

# 输出 CMAKE_LIBRARY_PATH 以验证设置
# echo "CMAKE_LIBRARY_PATH is set to: $CMAKE_LIBRARY_PATH"

complete -F _vinci_emis ../script/vinci_emis
