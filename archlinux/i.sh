#! /bin/bash

# -------------------------------
# 软件开发相关
# -------------------------------
sudo pacman -S --noconfirm --needed jdk-openjdk openjdk-doc openjdk-src gradle groovy scala kotlin maven \
    python ruby nodejs ghc typescript autopep8 npm python-pip ruby-bundler \
    dotnet-sdk lua

# -------------------------------
# 终端相关
# -------------------------------
sudo pacman -S --noconfirm --needed zsh zsh-doc \
    zshdb

# -------------------------------
# 容器相关
# -------------------------------
sudo pacman -S --noconfirm --needed docker

# 设置docker镜像源
sudo tee /etc/docker/daemon.json <<EOL
{
    "registry-mirrors": [
        "https://68vapi3g.mirror.aliyuncs.com",
        "https://dockerhub.azk8s.cn"
    ]
}
EOL

# -------------------------------
# 其他软件包
# -------------------------------
sudo pacman -S --noconfirm --needed neofetch cowsay sl man-db shellcheck curl wget vim nano \
    neovim powerline-vim stow shfmt thefuck ufw nmap fd fzf exa subversion man bat
