# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block, everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

source ~/.antigen.zsh
#source /usr/share/zsh-antigen/antigen.zsh
antigen use oh-my-zsh

function _z() { _zlua "$@"; }

antigen bundle skywind3000/z.lua
antigen bundle changyuheng/fz
antigen bundle command-not-found
antigen bundle git
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle autopep8
antigen bundle cargo
antigen bundle docker
antigen bundle dotnet
antigen bundle emoji
antigen bundle git-auto-fetch
antigen bundle gradle
antigen bundle npm
antigen bundle python
antigen bundle ruby
antigen bundle sudo
antigen bundle thefuck
antigen bundle ufw
antigen bundle vscode
antigen bundle archlinux
antigen bundle systemd

antigen theme romkatv/powerlevel10k
antigen apply

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v ~/.config/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
