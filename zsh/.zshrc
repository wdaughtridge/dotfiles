# bindkey -v
set -o ignoreeof

export PATH=/Users/wdaughtridge/go/bin:/opt/homebrew/lib/ruby/gems/3.2.0/bin:/opt/homebrew/opt/ruby/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"

alias l='ls -AGlF'
alias ls='ls -G'
alias linux_1='ssh corp\\wdaughtridge@172.28.98.53'
alias linux_2='ssh corp\\wdaughtridge@172.28.98.147'
alias vim='nvim'
alias gl='git log --oneline'
alias t='tmux'

autoload -U colors && colors

precmd () {
    print -rP "%{$fg[cyan]%}[%D{%a, %d %b %Y, %H:%M:%S}]%{$reset_color%} %{$fg[green]%}%n%{$reset_color%}" # %{$fg[magenta]%}%m%{$reset_color%}"

    PS1="%~ $ "
}

autoload -Uz compinit && compinit
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Za-z}'
[[ $commands[kubectl] ]] && source <(kubectl completion zsh) # add autocomplete permanently to your zsh shell

# history setup
setopt APPEND_HISTORY
setopt SHARE_HISTORY
HISTFILE=$HOME/.zhistory
SAVEHIST=1000
HISTSIZE=999
setopt HIST_EXPIRE_DUPS_FIRST
setopt EXTENDED_HISTORY

# autocompletion using arrow keys (based on history)
bindkey '\e[A' history-search-backward
bindkey '\e[B' history-search-forward

# GENERAL

# (bonus: Disable sound errors in Zsh)

# never beep
setopt NO_BEEP

bindkey -e
bindkey '5C' forward-word
bindkey '5D' backward-word
