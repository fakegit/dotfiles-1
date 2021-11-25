# Windows Terminal

因为有了官方的图形化配置界面,所以这里的东西也用处不大了,就留着吧.不过这里有点设置经验可供参考.

> 推荐安装更纱黑体,Windows 10商店就有,如果你不喜欢,也可以自己设置其他字体.

然后将配置文件复制到Windows Terminal配置处.

```powershell
Copy-Item 'windowsterminal\settings.json' '~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState'
```

需要同步时,将配置文件备份到项目处。

```powershell
Copy-Item '~\AppData\Local\Packages\Microsoft.WindowsTerminal_8wekyb3d8bbwe\LocalState\settings.json' windowsterminal
```

## 一些配置经验

### 添加Git Bash

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

### 添加远程登录服务器

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
