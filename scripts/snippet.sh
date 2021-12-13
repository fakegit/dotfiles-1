#! /bin/bash

# ------------------------------------------------------------------------------
# ArchLinux & Manjaro
# ------------------------------------------------------------------------------

# Manjaro添加国内镜像源
sudo pacman-mirrors -c China
sudo pacman -Syu

# Arch添加国内镜像源
sudo sed -i '1i Server = https://mirrors.tuna.tsinghua.edu.cn/archlinux/$repo/os/$arch' /etc/pacman.d/mirrorlist
sudo pacman -Syu

# 设置pacman彩色输出
sudo sed -i 's/^#Color/Color/g' /etc/pacman.conf

# 配置中文输入法
sudo pacman -S fcitx-sunpinyin fcitx-libpinyin fcitx-rime fcitx-googlepinyin fcitx-cloudpinyin fcitx-table-extra fcitx-table-other fcitx-configtool
sudo pacman -S adobe-source-han-sans-otc-fonts
tee ~/.pam_environment <<EOL
GTK_IM_MODULE=fcitx
QT_IM_MODULE=fcitx
XMODIFIERS=@im=fcitx
EOL

# ------------------------------------------------------------------------------
# OpenSUSE
# ------------------------------------------------------------------------------

# 添加openSUSE Tumbleweed镜像源

# 禁用官方镜像源
sudo zypper mr -da
# 添加 TUNA 镜像源
sudo zypper ar -cfg 'https://mirrors.tuna.tsinghua.edu.cn/opensuse/tumbleweed/repo/oss/' tuna-oss
sudo zypper ar -cfg 'https://mirrors.tuna.tsinghua.edu.cn/opensuse/tumbleweed/repo/non-oss/' tuna-non-oss
# 刷新软件源
sudo zypper ref
sudo zypper update

# ------------------------------------------------------------------------------
# Fedora
# ------------------------------------------------------------------------------

# Fedora镜像源，适用于Fedora 30及更新
sudo cp /etc/yum.repos.d/fedora.repo{,.backup}
sudo cp /etc/yum.repos.d/fedora-updates.repo{,.backup}
sudo cp /etc/yum.repos.d/fedora-modular.repo{,.backup}
sudo cp /etc/yum.repos.d/fedora-updates-modular.repo{,.backup}
sudo tee /etc/yum.repos.d/fedora.repo <<EOL
[fedora]
name=Fedora \$releasever - \$basearch
failovermethod=priority
baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora/releases/\$releasever/Everything/\$basearch/os/
metadata_expire=28d
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False
EOL

sudo tee /etc/yum.repos.d/fedora-updates.repo <<EOL
[updates]
name=Fedora \$releasever - \$basearch - Updates
failovermethod=priority
baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora/updates/\$releasever/Everything/\$basearch/
enabled=1
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False
EOL

sudo tee /etc/yum.repos.d/fedora-modular.repo <<EOL
[fedora-modular]
name=Fedora Modular \$releasever - \$basearch
failovermethod=priority
baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora/releases/\$releasever/Modular/\$basearch/os/
enabled=1
metadata_expire=7d
gpgcheck=1
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False
EOL

sudo tee /etc/yum.repos.d/fedora-updates-modular.repo <<EOL
[updates-modular]
name=Fedora Modular \$releasever - \$basearch - Updates
failovermethod=priority
baseurl=https://mirrors.tuna.tsinghua.edu.cn/fedora/updates/\$releasever/Modular/\$basearch/
enabled=1
gpgcheck=1
metadata_expire=6h
gpgkey=file:///etc/pki/rpm-gpg/RPM-GPG-KEY-fedora-\$releasever-\$basearch
skip_if_unavailable=False
EOL
sudo dnf update

# ------------------------------------------------------------------------------
# Kalilinux
# ------------------------------------------------------------------------------

sudo cp /etc/apt/sources.list{,.backup}
sudo tee /etc/apt/sources.list <<EOL
deb https://mirrors.tuna.tsinghua.edu.cn/kali/ kali-rolling main non-free contrib
deb-src https://mirrors.tuna.tsinghua.edu.cn/kali/ kali-rolling main non-free contrib
EOL

# ------------------------------------------------------------------------------
# Raspbian
# ------------------------------------------------------------------------------

# 配置Raspbian镜像源
sudo cp /etc/apt/sources.list{,.backup}
sudo tee /etc/apt/sources.list <<EOL
deb http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib
deb-src http://mirrors.tuna.tsinghua.edu.cn/raspbian/raspbian/ buster main non-free contrib
EOL

sudo cp /etc/apt/sources.list.d/raspi.list{,.backup}
sudo tee /etc/apt/sources.list.d/raspi.list <<EOL
deb http://mirrors.tuna.tsinghua.edu.cn/raspberrypi/ buster main ui
EOL

# ------------------------------------------------------------------------------
# container
# ------------------------------------------------------------------------------

# 设置Podman镜像源
sudo cp /etc/containers/registries.conf{,.bak}
sudo tee /etc/containers/registries.conf <<EOF
unqualified-search-registries = ["docker.io"]

[[registry]]
prefix = "docker.io"
location = "68vapi3g.mirror.aliyuncs.com"
EOF

# 配置podman
sudo touch /etc/sub{uid,gid}
sudo usermod -w 10000-75535 -v 10000-75535 "$(whoami)"

# 设置docker镜像源
sudo tee /etc/docker/daemon.json <<EOL
{
    "registry-mirrors": [
        "https://dockerhub.azk8s.cn"
    ]
}
EOL

# 常用docker镜像命令
docker run --name some-postgres \
    -e POSTGRES_PASSWORD=12345678 \
    --rm -p 5432:5432 postgres

docker run --name some-mysql \
    -e MYSQL_ROOT_PASSWORD=12345678 \
    --rm -p 3306:3306 mysql

docker run --name some-nginx --rm --network host nginx

# ------------------------------------------------------------------------------
# misc
# ------------------------------------------------------------------------------

# 设置区域和语言

# locale-gen不是每个系统都有
sudo sed -i 's/^# \?zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen
sudo locale-gen

# 设置全局语言
sudo localectl set-locale LANG=zh_CN.UTF-8
echo 'LANG=zh_CN.UTF-8' | sudo tee /etc/locale.conf
# 设置用户语言
echo 'LANG=zh_CN.UTF-8' | tee ~/.config/locale.conf
# 设置时间
sudo timedatectl set-timezone Asia/Shanghai
sudo timedatectl set-ntp 1
# 如果需要，可以使用国家授时中心的服务
sudo ntpdate ntp.ntsc.ac.cn

# 设置当前用户sudo无需密码
echo "$(whoami) ALL=(ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/$(whoami)"

# 下载Meslo Nerds字体
mkdir -p ~/.fonts
cd ~/.fonts || exit
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip
rm Meslo.zip
fc-cache -f

# 用zim配置终端
cd || exit
wget https://raw.githubusercontent.com/techstay/dotfiles/master/zim/.zshrc
wget https://raw.githubusercontent.com/techstay/dotfiles/master/zim/.p10k.zsh
wget https://raw.githubusercontent.com/techstay/dotfiles/master/zim/.zlogin
wget https://raw.githubusercontent.com/techstay/dotfiles/master/zim/.zimrc
wget https://raw.githubusercontent.com/techstay/dotfiles/master/zim/.zshenv

# 将用户默认shell改为zsh
chsh -s /bin/zsh

# ------------------------------------------------------------------------------
# spacevim
# ------------------------------------------------------------------------------

curl -sLf https://spacevim.org/install.sh | bash

# ------------------------------------------------------------------------------
# nano
# ------------------------------------------------------------------------------

install_path=/usr/share/nano-syntax-highlighting
sudo git clone https://github.com/scopatz/nanorc.git $install_path
# 如果是Arch不需要克隆项目，直接安装包即可
sudo pacman -S nano-syntax-highlighting

# 备份原配置文件，然后替换
sudo cp /etc/nanorc{,.bak}
echo "include $install_path/*.nanorc" | sudo tee /etc/nanorc

# ------------------------------------------------------------------------------
# python
# ------------------------------------------------------------------------------

# 设置清华或者阿里镜像源
pip config set global.index-url https://pypi.tuna.tsinghua.edu.cn/simple
pip config set global.index-url https://mirrors.aliyun.com/pypi/simple

# ------------------------------------------------------------------------------
# nodejs
# ------------------------------------------------------------------------------

# npm
npm set registry https://registry.npm.taobao.org/

# ------------------------------------------------------------------------------
# ruby
# ------------------------------------------------------------------------------

# 设置ruby中国镜像源
gem sources --add https://gems.ruby-china.com/ --remove https://rubygems.org/
bundle config mirror.https://rubygems.org https://gems.ruby-china.com

# ------------------------------------------------------------------------------
# golang
# ------------------------------------------------------------------------------

# goproxy
export GOPROXY=https://mirrors.aliyun.com/goproxy/

# ------------------------------------------------------------------------------
# dart & flutter
# ------------------------------------------------------------------------------

export PUB_HOSTED_URL="https://mirrors.tuna.tsinghua.edu.cn/dart-pub"
export FLUTTER_STORAGE_BASE_URL="https://mirrors.tuna.tsinghua.edu.cn/flutter"
