#! /bin/bash

#                    _                __  __             _
#     /\            | |       ___    |  \/  |           (_)
#    /  \   _ __ ___| |__    ( _ )   | \  / | __ _ _ __  _  __ _ _ __ ___
#   / /\ \ | '__/ __| '_ \   / _ \/\ | |\/| |/ _` | '_ \| |/ _` | '__/ _ \
#  / ____ \| | | (__| | | | | (_>  < | |  | | (_| | | | | | (_| | | | (_) |
# /_/    \_\_|  \___|_| |_|  \___/\/ |_|  |_|\__,_|_| |_| |\__,_|_|  \___/
#                                                      _/ |
#                                                     |__/

# 添加Manjaro镜像源
sudo pacman-mirrors -c China
sudo pacman -Syu

# 添加Arch镜像源
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

#                          _____ _    _  _____ ______
#                         / ____| |  | |/ ____|  ____|
#   ___  _ __   ___ _ __ | (___ | |  | | (___ | |__
#  / _ \| '_ \ / _ \ '_ \ \___ \| |  | |\___ \|  __|
# | (_) | |_) |  __/ | | |____) | |__| |____) | |____
#  \___/| .__/ \___|_| |_|_____/ \____/|_____/|______|
#       | |
#       |_|

# 添加openSUSE Tumbleweed镜像源
sudo zypper addrepo -f http://mirrors.aliyun.com/opensuse/tumbleweed/repo/oss/ oss
sudo zypper addrepo -f http://mirrors.aliyun.com/opensuse/tumbleweed/repo/non-oss/ nonoss
sudo zypper addrepo -f http://mirrors.aliyun.com/packman/openSUSE_Tumbleweed Packman
sudo zypper update

#   __         _
#  / _|       | |
# | |_ ___  __| | ___  _ __ __ _
# |  _/ _ \/ _` |/ _ \| '__/ _` |
# | ||  __/ (_| | (_) | | | (_| |
# |_| \___|\__,_|\___/|_|  \__,_|
#

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

#   _         _ _   _ _
#  | |       | (_) | (_)
#  | | ____ _| |_  | |_ _ __  _   ___  __
#  | |/ / _` | | | | | | '_ \| | | \ \/ /
#  |   < (_| | | | | | | | | | |_| |>  <
#  |_|\_\__,_|_|_| |_|_|_| |_|\__,_/_/\_\

sudo cp /etc/apt/sources.list{,.backup}
sudo tee /etc/apt/sources.list <<EOL
deb https://mirrors.tuna.tsinghua.edu.cn/kali/ kali-rolling main non-free contrib
deb-src https://mirrors.tuna.tsinghua.edu.cn/kali/ kali-rolling main non-free contrib
EOL

#                      _     _
#                     | |   (_)
#  _ __ __ _ ___ _ __ | |__  _  __ _ _ __
# | '__/ _` / __| '_ \| '_ \| |/ _` | '_ \
# | | | (_| \__ \ |_) | |_) | | (_| | | | |
# |_|  \__,_|___/ .__/|_.__/|_|\__,_|_| |_|
#               | |
#               |_|

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

#                  _        _
#                 | |      (_)
#   ___ ___  _ __ | |_ __ _ _ _ __   ___ _ __
#  / __/ _ \| '_ \| __/ _` | | '_ \ / _ \ '__|
# | (_| (_) | | | | || (_| | | | | |  __/ |
#  \___\___/|_| |_|\__\__,_|_|_| |_|\___|_|
#

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
sudo usermod -w 10000-75535 -v 10000-75535 $(whoami)

# 设置docker镜像源
sudo tee /etc/docker/daemon.json <<EOL
{
    "registry-mirrors": [
        "https://68vapi3g.mirror.aliyuncs.com",
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

#            _
#           (_)
#  _ __ ___  _ ___  ___
# | '_ ` _ \| / __|/ __|
# | | | | | | \__ \ (__
# |_| |_| |_|_|___/\___|
#

# 设置时区
sudo sed -i 's/^# zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen
sudo sed -i 's/^#zh_CN.UTF-8 UTF-8/zh_CN.UTF-8 UTF-8/g' /etc/locale.gen
sudo locale-gen
sudo localectl set-locale LANG=zh_CN.UTF-8
echo 'LANG=zh_CN.UTF-8' | sudo tee /etc/locale.conf
sudo timedatectl set-timezone Asia/Shanghai
sudo timedatectl set-ntp 1

# 设置用户sudo无需密码
sudo mkdir -p /etc/sudoers.d/
echo "$USER ALL=(ALL) NOPASSWD: ALL" | sudo tee "/etc/sudoers.d/$USER"

# 下载Meslo Nerds字体
mkdir -p ~/.fonts
cd ~/.fonts || exit
wget https://github.com/ryanoasis/nerd-fonts/releases/download/v2.1.0/Meslo.zip
unzip Meslo.zip
rm Meslo.zip
fc-cache -f

# 配置ohmyzsh
cd || exit
curl -L git.io/antigen >.antigen.zsh
wget https://raw.githubusercontent.com/techstay/dotfiles/master/zsh/.zshrc
wget https://raw.githubusercontent.com/techstay/dotfiles/master/zsh/.p10k.zsh

#                                  _
#                                 (_)
#   ___ _ __   __ _  ___ _____   ___ _ __ ___
#  / __| '_ \ / _` |/ __/ _ \ \ / / | '_ ` _ \
#  \__ \ |_) | (_| | (_|  __/\ V /| | | | | | |
#  |___/ .__/ \__,_|\___\___| \_/ |_|_| |_| |_|
#      | |
#      |_|

curl -sLf https://spacevim.org/install.sh | bash

#   _ __   __ _ _ __   ___
#  | '_ \ / _` | '_ \ / _ \
#  | | | | (_| | | | | (_) |
#  |_| |_|\__,_|_| |_|\___/

install_path=/usr/share/nano-syntax-highlighting

sudo git clone https://github.com/scopatz/nanorc.git $install_path
# 如果是Arch不需要克隆项目，直接安装包即可
sudo pacman -S nano-syntax-highlighting

echo "include $install_path/*.nanorc" | sudo tee -a /etc/nanorc
