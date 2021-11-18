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

antigen bundle zsh-users/zsh-completions
antigen bundle zsh-users/zsh-autosuggestions
antigen bundle zdharma-continuum/fast-syntax-highlighting

antigen theme romkatv/powerlevel10k
antigen apply

# your code here

alias el='exa -l'
alias ea='exa -la'
alias lzd='docker run --rm -it -v /var/run/docker.sock:/var/run/docker.sock -v ~/.config/lazydocker:/.config/jesseduffield/lazydocker lazyteam/lazydocker'
