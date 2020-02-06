#! /bin/bash

if [[ $EUID -ne 0 ]]; then
    echo "脚本必须以管理员权限运行！"
    exit 1
fi

read -rp "是否安装docker加速文件(y/N)?" prompt
if [ "$prompt" = 'y' ] || [ "$prompt" = 'Y' ]; then
    cp docker/etc/docker/daemon.json /etc/docker/daemon.json
fi

read -rp "是否安装pacman配置文件(y/N)?" prompt
if [ "$prompt" = 'y' ] || [ "$prompt" = 'Y' ]; then
    cp pacman/etc/pacman.conf /etc/pacman.conf
    sed -i '1i Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
fi

read -rp "是否安装nano配置文件(y/N)?" prompt
if [ "$prompt" = 'y' ] || [ "$prompt" = 'Y' ]; then
    wget https://raw.githubusercontent.com/scopatz/nanorc/master/install.sh -O- | sh
    echo "include $HOME/.nano/*.nanorc" >>/etc/nanorc
fi

read -rp "是否添加全局代理环境变量(localhost:10800)(y/N)?" prompt
if [ "$prompt" = 'y' ] || [ "$prompt" = 'Y' ]; then
    cp proxy/proxy666.sh /etc/profile.d/
fi
