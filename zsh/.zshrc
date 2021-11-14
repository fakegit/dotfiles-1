source ~/.zplug/init.zsh

# 使用zsh-users插件
zplug "zsh-users/zsh-history-substring-search"
zplug "zsh-users/zsh-syntax-highlighting", defer:2
zplug "zsh-users/zsh-autosuggestions"
zplug "zsh-users/zsh-completions"

# 第三方插件
zplug "changyuheng/fz", defer:1
zplug "skywind3000/z.lua"

# 使用ohmyzsh插件
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/aliases", from:oh-my-zsh
zplug "plugins/archlinux", from:oh-my-zsh
zplug "plugins/autopep8", from:oh-my-zsh
zplug "plugins/bundler", from:oh-my-zsh
zplug "plugins/cargo", from:oh-my-zsh
zplug "plugins/command-not-found", from:oh-my-zsh
zplug "plugins/common-aliases", from:oh-my-zsh
zplug "plugins/composer", from:oh-my-zsh
zplug "plugins/deno", from:oh-my-zsh
zplug "plugins/docker", from:oh-my-zsh
zplug "plugins/docker-compose", from:oh-my-zsh
zplug "plugins/dotenv", from:oh-my-zsh
zplug "plugins/dotnet", from:oh-my-zsh
zplug "plugins/emacs", from:oh-my-zsh
zplug "plugins/emoji", from:oh-my-zsh
zplug "plugins/emoji-clock", from:oh-my-zsh
zplug "plugins/encode64", from:oh-my-zsh
zplug "plugins/flutter", from:oh-my-zsh
zplug "plugins/gem", from:oh-my-zsh
zplug "plugins/git", from:oh-my-zsh
zplug "plugins/git-auto-fetch", from:oh-my-zsh
zplug "plugins/golang", from:oh-my-zsh
zplug "plugins/gradle", from:oh-my-zsh
zplug "plugins/heroku", from:oh-my-zsh
zplug "plugins/mvn", from:oh-my-zsh
zplug "plugins/nmap", from:oh-my-zsh
zplug "plugins/npm", from:oh-my-zsh
zplug "plugins/pip", from:oh-my-zsh
zplug "plugins/python", from:oh-my-zsh
zplug "plugins/ruby", from:oh-my-zsh
zplug "plugins/rust", from:oh-my-zsh
zplug "plugins/sbt", from:oh-my-zsh
zplug "plugins/scala", from:oh-my-zsh
zplug "plugins/spring", from:oh-my-zsh
zplug "plugins/sudo", from:oh-my-zsh
zplug "plugins/systemd", from:oh-my-zsh
zplug "plugins/thefuck", from:oh-my-zsh
zplug "plugins/tig", from:oh-my-zsh
zplug "plugins/ufw", from:oh-my-zsh

# 管理我自己
zplug 'zplug/zplug', hook-build:'zplug --self-manage'

# 设置主题
zplug romkatv/powerlevel10k, as:theme, depth:1

if ! zplug check --verbose; then
    printf "Install? [y/N]: "
    if read -q; then
        echo
        zplug install
    fi
fi

zplug load --verbose

export GOPROXY=https://mirrors.aliyun.com/goproxy/
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v ~/.config/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
