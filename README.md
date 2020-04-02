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
stow git gradle maven npm ruby ssh vimbasic zsh anaconda fcitx pip
```

### vscode

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

需要先安装更纱黑体。

```powershell
Copy-Item 'windowsterminal\profiles.json' '~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState'
```

如果只需要Windows Terminal配置文件，可以直接下载并覆盖默认配置文件。

```powershell
Invoke-WebRequest -uri 'https://gitee.com/techstay/dotfiles/raw/master/windowsterminal/profiles.json' |Select-Object -ExpandProperty Content|Set-Content '~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json'
```

备份配置文件。

```powershell
Copy-Item '~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\profiles.json' windowsterminal
```

## 一些配置脚本

脚本文件在scripts下。

### archinstall

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

### ubuntu_vps_config.sh

该脚本用来配置新创建的运行ubuntu 18.04系统的VPS，并假设你使用了root权限以远程SSH方式登录了系统。

使用方法：

```bash

wget https://raw.githubusercontent.com/techstay/myscripts/master/ubuntu_vps_config.sh
bash ubuntu_vps_config.sh
```

### snippet

包含了一些常用的命令，可以作为参考。
