# dotfiles

我的一些配置文件。

## 使用方法

项目基于stow工具进行配置，首先安装stow：

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

### vscode

因为VSCode现在官方内置了同步功能,所以这里的东西可以说是再也没用了,仅仅留作纪念.

导出已安装的扩展列表。

```sh
code --list-extension > extensions.txt
```

从扩展列表安装扩展。

```sh
cat extensions.txt | grep -v '^#' | xargs -L1 code --install-extension
```

复制配置文件。

```sh
# Windows
Copy-Item settings.json -Destination "${env:APPDATA}\Code\User"
# Linux
cp settings.json "$HOME/.config/Code - OSS/User"
```

### Windows Terminal

因为有了官方的图形化配置界面,所以这里的东西也用处不大了,就留着吧.不过这里有点设置经验可供参考.

> 推荐安装更纱黑体,Windows 10商店就有,如果你不喜欢,也可以自己设置.

然后将配置文件复制到Windows Terminal配置处.

```powershell
Copy-Item 'windowsterminal\settings.json' '~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState'
```

需要同步时,将配置文件备份到项目处。

```powershell
Copy-Item '~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json' windowsterminal
```

#### 一些配置经验

假如你想在Windows Terminal中添加Git Bash的话,可以在配置文件相应位置添加类似这样的代码段,这是假定你使用安装程序在`Program Files`文件夹中安装的Git.

```json
{
    "guid": "{cbcc2468-c750-459a-964f-d893042386a1}",
    "hidden": false,
    "name": "Git Bash",
    "commandline": "\"%PROGRAMFILES%\\git\\usr\\bin\\bash.exe\" -i -l",
    "startingDirectory": "%USERPROFILE%",
    "icon": "%PROGRAMFILES%\\Git\\mingw64\\share\\git\\git-for-windows.ico"
}
```

假如你是通过scoop安装的Git,那么需要修改配置文件的相应路径.

```json
{
    "commandline": "\"%USERPROFILE%\\scoop\\apps\\git\\current\\bin\\bash.exe\" -i -l",
    "guid": "{f2db9a16-ad00-49df-914a-8d71b94454d4}",
    "name": "Git Bash",
    "startingDirectory": "%USERPROFILE%",
    "icon": "%USERPROFILE%\\scoop\\apps\\git\\current\\mingw64\\share\\git\\git-for-windows.ico"
}
```

还有,如果你想新建一个快速打开远程SSH的配置,首先需要在`~/.ssh/config`中新建类似这样的配置.然后通过`copy-ssh-id`命令复制并配置好免密码远程登录SSH服务器.

```txt
Host *
    ServerAliveInterval 20
    ServerAliveCountMax 10

Host arch
    Hostname 192.168.229.129
    User techstay
```

然后插入类似下面的片段,即可实现快速登录远程SSH服务器功能.

```json
{
    "commandline": "ssh arch",
    "guid": "{1e014656-8b46-4a79-aeaf-106f0b989e2d}",
    "name": "arch"
}
```

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

## 垃圾桶

没用而且过时了但是舍不得删的东西就放到这里.

### <del>archinstall

因为ArchLinux官方出了个archinstall库,极大简化了安装过程.所以我自己写的蹩脚脚本可以完全删除了.如果你想要快速创建一个Arch虚拟机做Linux开发用,可以参考我的另一个项目[arin](https://github.com/techstay/arin),很容易就创建一个虚拟机,配合dotfiles项目可以很快完成新环境的配置工作.

Arch Linux虚拟机安装脚本，使用前请务必阅读本部分，同时最好先阅读脚本代码之后再执行。

- 脚本仅支持在虚拟机中以EFI方式安装，虚拟机默认一般使用BIOS方式引导，请手动修改虚拟机以便脚本正常运行。
- 该脚本会清除磁盘上所有空间并重新分区，请在使用前确认磁盘文件是否需要。
- 脚本默认设置的root密码与用户密码相同。

使用方法：

```bash
# 下载脚本文件
wget https://gitee.com/techstay/myscripts/raw/master/archinstall/install.sh

# 自动完成所有配置，密码需要输入两次
bash install.sh yourusername yourpasswd yourpasswd

# 无参数脚本，只完成一部分安装工作，剩下的请手动下载编辑运行configure.sh
bash install.sh

wget https://gitee.com/techstay/myscripts/raw/master/archinstall/configure.sh

cp configure.sh /mnt/opt/
arch-chroot /mnt /opt/configure.sh yourusrname yourpasswd yourpasswd
```

**`install.sh`脚本会下载并运行`configure.sh`，如果希望在运行之前进行设置，请调用无参的`install.sh`，并手动下载编辑运行`configure.sh`。**
