#!/bin/bash

if [ $# -ne 1 ];then
    echo "usage: sh gdb.sh xxx.elf"
    exit 1
fi

PWD=`pwd`

if [ ! -f ~/.gdbinit ];then
    touch ~/.gdbinit
    echo "add-auto-load-safe-path $PWD" > ~/.gdbinit
else
    cat ~/.gdbinit | grep "add-auto-load-safe-path $PWD" >/dev/null 2>&1
    if [ $? -ne 0 ];then
        echo "add-auto-load-safe-path $PWD" > ~/.gdbinit
    fi
fi

ps -a | grep "st-util" | grep -v grep >/dev/null 2>&1
if [ $? -ne 0 ];then
    st-util &
    sleep 1
fi


arm-none-eabi-gdb $1 

pid=$(ps a | grep "st-util" | grep -v grep | awk '{print $1}')
if [ $? -eq 0 ];then
    echo kill st-util PID $pid 2>/dev/null
    kill $pid
fi


