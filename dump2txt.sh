#!/bin/bash -
#这个脚本被gohttpserver可执行程序调用，在用户点击网页解析按钮时调用进行解析dump为txt
script_dir="$(cd "$(dirname "$0")" && pwd)"

dumpfile=$1
symbolDir=$2
echo "script_dir path: $script_dir"
echo "dumpfile : $1"
echo "symbolDir : $2"

 #将堆栈跟踪信息重定向到文件中
./minidump_stackwalk ${dumpfile} ${symbolDir}
