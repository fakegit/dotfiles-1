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

## 其他软件配置文件

### vscode

因为VSCode现在官方内置了同步功能,所以这里的东西其实没啥用了。

导出已安装的扩展列表。

```sh
code --list-extensions > extensions.txt
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
