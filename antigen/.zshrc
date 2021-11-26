# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.antigen.zsh

antigen use oh-my-zsh

antigen bundle bundler
antigen bundle cargo
antigen bundle composer
antigen bundle deno
antigen bundle docker
antigen bundle docker-compose
antigen bundle dotenv
antigen bundle dotnet
antigen bundle emoji
antigen bundle encode64
antigen bundle extract
antigen bundle flutter
antigen bundle gem
antigen bundle git
antigen bundle git-auto-fetch
antigen bundle golang
antigen bundle gradle
antigen bundle heroku
antigen bundle mvn
antigen bundle nmap
antigen bundle npm
antigen bundle pip
antigen bundle python
antigen bundle rust
antigen bundle sbt
antigen bundle scala
antigen bundle systemd
antigen bundle ufw

antigen bundle skywind3000/z.lua

antigen bundle Aloxaf/fzf-tab
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

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
ZSH_AUTOSUGGEST_BUFFER_MAX_SIZE=20

antigen bundle zdharma-continuum/fast-syntax-highlighting

antigen theme romkatv/powerlevel10k
antigen apply

# your code here
export FZF_DEFAULT_COMMAND='fd --type f'
alias el='exa -l --icons'
alias ea='exa -la --icons --header'
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v ~/.config/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker'

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh
