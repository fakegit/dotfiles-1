# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust

### End of Zinit's installer chunk

# 加载 OMZ 框架基础功能
zinit snippet OMZL::cli.zsh
zinit snippet OMZL::clipboard.zsh
zinit snippet OMZL::completion.zsh
zinit snippet OMZL::correction.zsh
zinit snippet OMZL::directories.zsh
zinit snippet OMZL::functions.zsh
zinit snippet OMZL::git.zsh
zinit snippet OMZL::grep.zsh
zinit snippet OMZL::history.zsh
zinit snippet OMZL::key-bindings.zsh
zinit snippet OMZL::spectrum.zsh
zinit snippet OMZL::termsupport.zsh
zinit snippet OMZL::theme-and-appearance.zsh

# 一些常用命令的补全
zinit snippet OMZP::cargo
zinit snippet OMZP::composer 
zinit snippet OMZP::deno
zinit snippet OMZP::docker/_docker
zinit snippet OMZP::dotenv
zinit snippet OMZP::dotnet
zinit snippet OMZP::encode64
zinit snippet OMZP::git
zinit snippet OMZP::git-auto-fetch
zinit snippet OMZP::heroku
zinit snippet OMZP::mvn
zinit snippet OMZP::nmap
zinit snippet OMZP::npm
zinit snippet OMZP::python
zinit snippet OMZP::rust/_rust
zinit snippet OMZP::scala/_scala
zinit snippet OMZP::systemd
zinit snippet OMZP::ufw/_ufw
zinit snippet 'https://github.com/ogham/exa/blob/master/completions/zsh/_exa'

zinit ice svn; zinit snippet OMZ::plugins/bundler
zinit ice svn; zinit snippet OMZ::plugins/docker-compose
zinit ice svn; zinit snippet OMZ::plugins/extract
zinit ice svn; zinit snippet OMZ::plugins/flutter
zinit ice svn; zinit snippet OMZ::plugins/gem
zinit ice svn; zinit snippet OMZ::plugins/sbt
zinit ice svn; zinit snippet OMZ::plugins/gradle
zinit ice svn; zinit snippet OMZ::plugins/pip

zinit ice svn; zinit snippet OMZP::emoji
zinit ice svn; zinit snippet OMZP::golang 


zinit light Aloxaf/fzf-tab

zinit light zsh-users/zsh-autosuggestions
zinit light zsh-users/zsh-completions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

zinit light zdharma-continuum/fast-syntax-highlighting

zinit light skywind3000/z.lua

zinit ice depth=1; zinit light romkatv/powerlevel10k

# fzf-tab 设置
# disable sort when completing `git checkout`
zstyle ':completion:*:git-checkout:*' sort false
# set descriptions format to enable group support
zstyle ':completion:*:descriptions' format '[%d]'
# set list-colors to enable filename colorizing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
# preview directory's content with exa when completing cd
zstyle ':fzf-tab:complete:cd:*' fzf-preview 'exa -1 --color=always $realpath'
# switch group using `,` and `.`
zstyle ':fzf-tab:*' switch-group ',' '.'

# LS_COLORS
# 首先运行以下命令
# $ mkdir /tmp/LS_COLORS && curl -L https://api.github.com/repos/trapd00r/LS_COLORS/tarball/master | tar xzf - --directory=/tmp/LS_COLORS --strip=1
# $ ( cd /tmp/LS_COLORS && sh install.sh )
# 然后反注释以下一行
# . "~/.local/share/lscolors.sh"

autoload -Uz compinit; compinit
zinit cdreplay -q
# Skip the not really helping Ubuntu global compinit
skip_global_compinit=1

export FZF_DEFAULT_COMMAND='fd --type f'

alias el='exa -l'
alias ea='exa -la --icons --header'
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v ~/.config/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
