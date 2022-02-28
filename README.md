# dotfiles

<!-- ALL-CONTRIBUTORS-BADGE:START - Do not remove or modify this section -->

[![All Contributors](https://img.shields.io/badge/all_contributors-1-orange.svg?style=flat-square)](#contributors-)

<!-- ALL-CONTRIBUTORS-BADGE:END -->

我的 Manjaro Linux 配置文件，部分配置可以直接使用，其他一些配置可能根据系统的不同做修改。

## 使用方法

### 开始使用

项目基于 stow 工具进行配置，需要安装 stow：

```sh
sudo pacman -S stow
```

首先 fork 一份项目，然后将项目克隆到用户家目录下。

```bash
git clone https://github.com/techstay/dotfiles.git ~/.dotfiles
```

然后进入项目，指定要使用的配置文件，stow 会自动为这些配置文件创建链接到合适的位置。

```sh
cd ~/.dotfiles
stow git gradle maven npm ruby ssh anaconda pip
```

### 管理 dotfiles

举例，现在已有`~/.gnupg/gpg.conf`配置文件，要将其纳入 dotfiles 版本控制，则在 dotfiles 中创建`gpg/.gnupg/gpg.conf`文件，执行以下命令即可。该操作会覆盖 dotfiles 中的文件，使用时要注意。

```sh
stow --adopt gpg
```

停止创建链接：

```sh
stow -D gpg
```

## 配置说明

### anaconda

使用清华镜像源。

### fcitx5

中文输入法模块 fcitx5 的配置，个人使用双拼输入法。

需要先安装 fcitx5 模块，然后添加全局环境变量。

```sh
sudo pacman -S fcitx5-im fcitx5-chinese-addons fcitx5-material-color fcitx5-lua

sudo tee -a /etc/environment <<EOF
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
SDL_IM_MODULE=fcitx
EOF
```

然后`stow fcitx5`，注销或重启系统即可生效。如需配置通过 fcitx 的控制面板即可。

### git

一个比较通用的 git 全局配置。

使用前需要配置`git-credential-manager-core`。

```sh
# 安装必要软件
sudo pacman -S --needed gnupg pass
# 安装git credendial manager core
yay git-credential-manager-core-bin
# 创建凭据保存路径
pass init <gpg-key-id>
```

修改个人 git 配置。

```sh
git config --global user.name techstay
git config --global user.email lovery521@gmail.com
git config --global user.signingkey <key-id>
```

### gpg

gpg 的配置文件，遵循<https://github.com/ioerror/duraconf/blob/master/configs/gnupg/gpg.conf>最佳实践。

### gradle

gradle 全局配置文件，去掉了镜像配置，使用下来感觉还是代理更靠谱。

### maven

maven 配置文件，很久没用 maven 了，真要用的话还需要配置`dependencyManagement`，将新版的插件版本号固定住。

### npm

使用 npmmirror 镜像（原淘宝镜像）。

```sh
npm config set registry https://registry.npmmirror.com
```

### pip

使用清华镜像。

```sh
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
```

### proxy

代理设置，如果虚拟机也遵循同一局域网设置的话就可以公用配置了。

### ruby

使用清华镜像。

```sh
gem sources --add https://mirrors.tuna.tsinghua.edu.cn/rubygems/ --remove https://rubygems.org/
bundle config mirror.https://rubygems.org https://mirrors.tuna.tsinghua.edu.cn/rubygems
```

### spacevim

先`stow spacevim`，然后安装 spacevim。

```sh
curl -sLf https://spacevim.org/install.sh | bash
```

### ssh

自动重连防止链接断开的配置。

### zsh

基于 zimfw 管理的 zsh 配置文件，使用 powerlevel10k 主题，如需更改主题的话，运行`p10k configure`。

### nano

安装`nano-syntax-highlighting`：

```sh
sudo pacman -S nano-syntax-highlighting
```

将`nano-syntax-highlighting`添加到系统 nano 配置中：

```sh
echo "include /usr/share/nano-syntax-highlighting/*.nanorc"|sudo tee -a /etc/nanorc
```

## Contributors ✨

Thanks goes to these wonderful people ([emoji key](https://allcontributors.org/docs/en/emoji-key)):

<!-- ALL-CONTRIBUTORS-LIST:START - Do not remove or modify this section -->
<!-- prettier-ignore-start -->
<!-- markdownlint-disable -->
<table>
  <tr>
    <td align="center"><a href="http://techstay.life"><img src="https://avatars.githubusercontent.com/u/7893448?v=4?s=100" width="100px;" alt=""/><br /><sub><b>gulugulu</b></sub></a><br /><a href="#example-techstay" title="Examples">💡</a></td>
  </tr>
</table>

<!-- markdownlint-restore -->
<!-- prettier-ignore-end -->

<!-- ALL-CONTRIBUTORS-LIST:END -->

This project follows the [all-contributors](https://github.com/all-contributors/all-contributors) specification. Contributions of any kind welcome!
