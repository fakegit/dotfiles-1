# dotfiles

我的一些配置文件。

## 使用方法

项目基于stow工具进行配置，需要安装stow：

```sh
# Arch
sudo pacman -S stow
# Ubuntu
sudo apt install stow
```

首先克隆本项目到用户家目录下。

```bash
git clone https://github.com/techstay/dotfiles.git
```

然后进入项目，为想要使用的配置文件添加链接。stow会自动为这些配置文件创建链接到合适的位置。

```sh
cd dotfiles
stow git gradle maven npm ruby ssh vimbasic anaconda pip
```

### antigen

如果准备使用antigen来配置zsh,在dotfiles目录里执行以下命令.

```sh
stow antigen
```

然后输入`zsh`并等待antigen配置完成.最后使用`chsh -s /bin/zsh`把终端切换成zsh即可.

## ArchLinux

ArchLinux的安装脚本，详情参考[安装方法](archlinux/README.md)，`c.json`是archinstall安装配置文件，`i.sh`是初步安装后的安装脚本。

## 一些配置脚本

脚本文件在scripts下。

### ubuntu_vps_config.sh

该脚本用来配置新创建的运行ubuntu 18.04系统的VPS，并假设你使用了root权限以远程SSH方式登录了系统。

使用方法：

```bash

wget https://raw.githubusercontent.com/techstay/myscripts/master/ubuntu_vps_config.sh
bash ubuntu_vps_config.sh
```

### snippet

包含了一些常用的配置命令，可以作为参考。
