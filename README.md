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

### 本地配置

首先克隆本项目到用户家目录下。

```bash
git clone https://github.com/techstay/dotfiles.git
```

然后进入项目，为想要使用的配置文件添加链接。stow会自动为这些配置文件创建链接到合适的位置。

```sh
cd dotfiles
stow git gradle maven npm ruby ssh vimbasic zsh anaconda
```

### 全局配置

需要使用sudo命令运行`install.sh`脚本，然后根据脚本选择要安装到`/etc/`目录的配置文件。

```sh
sudo install.sh
```

