export ZSH=$HOME/.oh-my-zsh

# Sets the theme for ZSH
ZSH_THEME="avit"

# Uncomment the following line to display red dots whilst waiting for completion.
COMPLETION_WAITING_DOTS="true"

plugins=(
  git
  docker
  github
  tmux
  osx
  brew
  kubectl
  zsh-nvm
  zsh-autosuggestions
)

# Starup ZSH
source $ZSH/oh-my-zsh.sh

alias ls='ls -al --color=auto'

alias grep='grep --color=auto'
alias fgrep='fgrep --color=auto'
alias egrep='egrep --color=auto'

alias gs="git status"
alias gt="git tag -a"
alias ga="git add ."
alias gc="git commit -ms"
alias gp="git push"
alias gti="git"
alias gd="git diff HEAD"
alias gpom="git push origin master && git push origin --tags"
alias lg="git log --oneline --graph --color"

# LastPass Commands
alias lpc="lpass ls | fzf | grep -E -o \"(\d{5,})\" | xargs -I {} lpass show {} | grep Password | awk '{ print \$2 }' | pbcopy"
alias lps="lpass ls | fzf | grep -E -o \"(\d{5,})\" | xargs -I {} lpass show {}"

# Useful Commands
alias flushdns="killall -HUP mDNSResponder"                         # Resets local DNS Cache
alias format="python -mjson.tool"                                   # Formats STDIN to pretty JSON
alias awsdockerlogin="aws ecr get-login --no-include-email | bash"  # Logs in to AWS COntainer Registry
alias buildkey="make ergodox_infinity:teevans MASTER=right"         # Builds the Ergodox Infinity Firmware
alias flash="sudo dfu-util -D ergodox_infinity_teevans.bin -S mk20dx256vlh7" # Flashes the Ergodox Infinity Keyboard
alias config='/usr/bin/git  --git-dir=$HOME/.cfg/ --work-tree=$HOME' # Config uses git in the config directory
alias mox='tmuxinator'
alias edit='tmuxinator start edit .'
alias psq='psql "postgresql://postgres:postgres@127.0.0.1:5432/postgres?sslmode=disable"'
alias bm='cd $(cat ~/.config/bookmarks | fzf)'

# Kubectl Shortcuts
alias kpf='kubectl port-forward'
alias kgp='watch kubectl get pods'
alias k='kubectl'

# Gnome control center
alias cc='env XDG_CURRENT_DESKTOP=GNOME gnome-control-center'

# GRPC Curl
alias gpc="grpcurl"

export TERM=xterm-256color


# Go Setup
export GOPATH=$HOME/go
export GOROOT=/usr/local/go
export PATH=$PATH:$GOROOT/bin:$GOPATH/bin
export PATH=/Library/PostgreSQL/10/bin:$PATH
export PATH=/usr/local/go:$PATH
export PATH=$HOME/.config/polybar/scripts:$PATH
export PATH=$HOME/.local/bin:$PATH
export PATH=$HOME/.config/composer/vendor/bin:$PATH
export EDITOR=vim
export PATH="$HOME/Library/Python/2.7/bin:$HOME/.yarn/bin:$HOME/.config/yarn/global/node_modules/.bin:$PATH"

export startpg="docker run --name postgres -p 5432:5432 -e POSTGRES_PASSWORD=postgres -d postgres"

# FZF Setup 
[ -z "$ZSH_NAME" ] && [ -f ~/.fzf.bash ] && source ~/.fzf.bash
export FZF_DEFAULT_COMMAND='rg --files --no-ignore-vcs --hidden'
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

# Disable the control S nonsense
stty -ixon

# ZSH-Autocomplete Color Change
ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE='fg=5'

export KEYTIMEOUT=1


# Add autocomplete for Helm
if [ $commands[helm] ]; then
  source <(helm completion zsh)
fi

xset r rate 150 60
