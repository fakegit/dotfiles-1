# ArchLinux WSL安装

## 下载和安装

可以直接通过scoop安装，不过貌似安装脚本有问题，会出现错误，不过不影响后续使用。

```sh
scoop install archwsl
```

如果不喜欢看到错误，也可以直接[下载安装文件](https://github.com/yuk7/ArchWSL/releases/)来进行安装。需要同时下载appx和cer文件，安装的时候先安装证书，并将证书安装到“信任的人”位置，然后就可以安装appx程序了。

安装完成之后按照提示操作，稍等片刻就可以使用了。

## 初始配置

### 设置root密码

```sh
passwd
```

### 设置默认用户

```sh
echo "%wheel ALL=(ALL) NOPASSWD: ALL" > /etc/sudoers.d/wheel
useradd -m -G wheel -s /bin/bash {username}
passwd {username}

# 在wsl终端外面操作
Arch.exe config --default-user {username}
```

操作完成之后，再次进入wsl终端时应该就会以设置的用户进入了。

### 初始化钥匙环

可能会出现一长串无效的提示，不影响使用，忽略即可。

```sh
sudo pacman-key --init
sudo pacman-key --populate
```

设置完成后就可以正常使用pacman了。

### 添加pacman镜像源

直接使用nano等文本编辑器打开`/etc/pacman.d/mirrorlist`文件，找到China的镜像，全部取消注释。

或者也可以直接用下面的命令将阿里云镜像添加到镜像列表最前面。

```sh
sudo sed -i '1i Server = https://mirrors.aliyun.com/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
```
