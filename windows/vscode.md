# vscode安装和配置

## 安装

直接到[官网](https://code.visualstudio.com)下载安装，因为经常更新，软件界面会弹出提示，所以不需要使用命令行工具安装。

## 配置

现在vscode也自带了同步功能，所以完全可以不用自己手动配置了。不过有时候手动配置还是有用的，所以这里还是介绍一下吧。

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
Copy-Item settings.json -Destination "${env:APPDATA}\Code\User"
```
