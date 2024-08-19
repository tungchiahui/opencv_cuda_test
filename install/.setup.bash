# 获取当前脚本所在目录的绝对路径
SCRIPT_ABS_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# 使用相对路径设置 LD_LIBRARY_PATH
export LD_LIBRARY_PATH="${SCRIPT_ABS_DIR}/lib:$LD_LIBRARY_PATH"

# 输出 LD_LIBRARY_PATH 以验证设置
# echo "LD_LIBRARY_PATH is set to: $LD_LIBRARY_PATH"