# windows

我的windows环境配置。

其实我电脑本来不支持Win11，所以我本来没打算更新的。但是我准备手动升级Win10到21H2的时候发现更新不了，一怒之下干脆把系统重装成Win11算了。所以就有了本篇文章，记录了我重装系统的一点经验心得，也希望我下次不会再重装的这么麻烦。

## 重装系统之前

### 系统备份

在重装系统之前，首先要做的就是将重要的数据和文件做好备份。

- OneDrive，保存一些重要的文件。
- 个人文件夹（文档、图片、桌面等），推荐直接移动到C盘以外的位置，重装以后直接设置回来即可，大部分游戏存档保存在文档中，也会跟着保留下来。
- 一些重要的软件，可能放到C盘中，最好留意一下，重装完在一个一个下载回来o(╥﹏╥)o
- 浏览器数据，例如打开的标签页等。现在的浏览器都有同步功能，在重装之前务必确定你的所有数据都完成同步，并牢记浏览器的账号数据
- 密码，我用lastpass管理浏览器的密码，看了会keepass，结果让我产生了购买lastpass的冲动-_-||
- 其他暂时想不起来的东西，以后再补充

### 启动盘设置

我直接买了个128G的U盘专门用来做启动盘，使用[Ventory](https://www.ventoy.net/cn/index.html)作为启动盘工具，可以直接将ISO文件启动，并且同时支持Windows和Linux系统，推荐使用。有了它，再也不用频繁刻录启动盘，非常方便。

### 重装系统

重装系统的时候，如果你不确定C盘有没有你要的文件，也也没有C盘清空强迫症的话，在重装系统的时候完全可以不格式化系统。这样做的好处就是旧系统文件会放到`Windows.old`文件夹中，如果将来想起来有什么重要文件的话，可以在去找回来。如果确定旧系统没用了，可以用磁盘清理彻底删除，切记不要直接手动删除哦！

## 新系统的配置

### 激活系统

下载镜像和安装系统时候选择商业专业版，批量授权方便激活，使用起来和消费者专业版没有区别。打开管理员权限的终端，输入以下命令即可。

```sh
# or kms.ddns.net
slmgr /skms kms.03k.org
slmgr /ato
```

### 代理

因为很多软件都要从Github等地方下载，所以最好有个代理，不然体验贼差。如果仅仅是要从Github下载文件的话，可以使用下面两个网站：

- [GitHub 文件加速 (hunsh.workers.dev)](https://shrill-pond-3e81.hunsh.workers.dev/)
- [GitHub Proxy 代理加速 - 镜像站 (ghproxy.com)](https://mirror.ghproxy.com/)

后面不再重复，自行解决下载问题。

### scoop包管理器

试过了Chocolatey和scoop，最后我还是选择了scoop，因为scoop比较干净，所有程序都安装在了主目录的scoop文件夹中，管理非常方便，也没有管理员权限的烦恼。很多开发工具也可以很方便的用scoop来安装。

```sh
Set-ExecutionPolicy RemoteSigned -scope CurrentUser
iwr -useb get.scoop.sh | iex

scoop config proxy localhost:60000
scoop bucket add extras
scoop bucket add java
scoop bucket add nerd-fonts
scoop install sudo aria2 curl git adb

scoop install openjdk17 python anaconda3
scoop install powertoys

scoop install pandoc ImageMagick screentogif everything keepass obs-studio rufus winscp ffmpeg 

# or use winget package manager
winget install Microsoft.PowerToys --source winget
```

### 安装SSH

现在Windows自带了SSH工具，可以直接安装。当然实际用起来感觉还得配合Git自带的SSH来使用。

```sh
# Install the OpenSSH Client
Add-WindowsCapability -Online -Name OpenSSH.Client~~~~0.0.1.0

# Install the OpenSSH Server
Add-WindowsCapability -Online -Name OpenSSH.Server~~~~0.0.1.0
```

### 安装Hyper-V和WSL

这是Win10一来非常好用的开发工具，为啥我一直没用呢，因为我用的安卓模拟器和Hyper-V有冲突，所以一直没有用。不过既然重装了系统，那么就直接一步到位吧。

```sh
Enable-WindowsOptionalFeature -Online -All -FeatureName "Microsoft-Hyper-V", "Microsoft-Windows-Subsystem-Linux", "HypervisorPlatform", "VirtualMachinePlatform"

wsl --install
```

然后安装商店里面的WSL发行版即可，如果要安装ArchLinux，参考[ArchLinux WSL安装](archwsl.md)。

### 安装Docker

以前都是在虚拟机里面用Docker曲线救国，现在终于可以直接安装Windows版的Docker啦！去[安装页面](https://hub.docker.com/editions/community/docker-ce-desktop-windows)下载Docker桌面版，安装即可。

然后在Docker桌面版的代理设置中将HTTP和HTTPS代理都设置成`http://localhost:60000/`（你的代理设置）。

如果要启用kubernetes，需要在设置中将DNS服务器改为`8.8.8.8`。

### 安装Powershell

自带的Powershell版本不够新，为了时髦肯定要安装最新版的Powershell。微软商店也可以安装，但是商店版的Powershell有权限问题，所以最好还是直接安装。

```sh
winget install --id Microsoft.Powershell --source winget
```

如果winget下载速度慢，也可以考虑直接去[Powershell 发行页](https://github.com/PowerShell/PowerShell/releases)下载。

### 安装常用软件

然后是一些常用桌面软件的安装。

- [I'm QQ - 每一天，乐在沟通](https://im.qq.com/index)
- [微信 Windows 版 (qq.com)](https://pc.weixin.qq.com/)
- [360 Total Security | 下载免费防毒软件](https://www.360totalsecurity.com/zh-cn/360zip/)，360压缩国际版，干净整洁
- [个人版5.0 (huorong.cn)](https://www.huorong.cn/person5.html)，火绒杀毒软件
- [搜狗输入法](https://pinyin.sogou.com)
- [Steam](https://store.steampowered.com)
- [Bluestack国际版](https://www.bluestacks.com)，支持HyperV的安卓模拟器，注意浏览器挂代理，否则可能重定向到国内
- [potplayer](https://potplayer.daum.net/)，功能强大的免费视频播放器

### 安装不常用软件

这是一些我不太常用的软件，但是感觉很有用，所以列出来，以后留着。

- [keepass](https://keepass.info/)，开源免费的密码管理器，支持多平台，就是感觉配置起来有点麻烦
- [PaintTool SAI](https://sai.yufan.me)，一个知名的绘图软件，这是国内作者的汉化和学习版网站
- [Resolve](http://www.blackmagicdesign.com/products/davinciresolve/)，一个视频剪辑软件，有免费版
- [discord](https://discord.com)
- [telegram](https://desktop.telegram.org)，汉化补丁链接`https://t.me/setlanguage/classic-zh-cn`

还有一些大型软件安装起来可能比较麻烦，所以另外列出来。

- [Office安装](Microsoft-Office.md)
- [Mathematica安装](Mathematica.md)
- [Adobe系列软件安装](adobe.md)
- [Visual Studio安装](visual-studio.md)

## 美化配置

感觉现在折腾Windows外观的人真的变少了，记得当年Win7时候各种主题和图标包满天飞，虽然经常搞得要重装系统但是觉得很快乐。

### 字体安装

- [自由字体](https://ziyouziti.com/index-index-all.html)，感觉挺全的字体，全部可商用
- [站酷字体](https://www.zcool.com.cn/special/zcoolfonts/)，几款可商用的字体
- [更纱黑体](https://www.microsoft.com/zh-cn/p/%E6%9B%B4%E7%BA%B1%E9%BB%91%E4%BD%93/9mw0m424ncz7#activetab=pivot:overviewtab)，微软商店直接下载

一些编程字体，使用scoop安装：

```sh
scoop install Mononoki-NF-Mono victor-mono CodeNewRoman-NF LiberationMono-NF

# 思源宋体
scoop install Source-Han-Serif-J Source-Han-Serif-SC Source-Han-Serif-TC
# 思源黑体
scoop install Source-Han-Sans-SC Source-Han-Sans-J Source-Han-Sans-TC
```

## 软件配置

### vscode

[配置方法](vscode.md)

### Windows Terminal

[Windows Terminal](wt.md)
