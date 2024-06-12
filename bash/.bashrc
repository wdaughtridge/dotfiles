[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export DOTNET_ROOT=/usr/local/share/dotnet

export PATH=/Users/wdaughtridge/go/bin:/opt/homebrew/lib/ruby/gems/3.2.0/bin:/opt/homebrew/opt/ruby/bin:/Users/wdaughtridge/.local/bin/nvim-macos/bin:$HOME/.config/emacs/bin:$PATH

eval "$(/opt/homebrew/bin/brew shellenv)"
eval "$(zoxide init bash)"

source /opt/homebrew/opt/fzf/shell/key-bindings.bash
source /opt/homebrew/opt/fzf/shell/completion.bash
source <(kubectl completion bash)
complete -o default -F __start_kubectl k

source /Users/wdaughtridge/.config/bash/git-prompt.sh
source /Users/wdaughtridge/.config/bash/git-completion.bash

export PS1="\[\033[01;34m\]\w\[\033[00m\]\$(__git_ps1 ' \[\033[01;33m\](%s)\[\033[00m\]')\$ "

__fzf_edit__() {
    file="$(fzf --preview 'bat --color=always {}')"
    if [[ -n $file ]]; then
        nvim -p "$file"
    fi
}

bind -m emacs-standard -x '"\C-t": ~/.local/bin/tmux-terminal-sessionizer'
bind -m vi-command -x '"\C-t": ~/.local/bin/tmux-terminal-sessionizer'
bind -m vi-insert -x '"\C-t": ~/.local/bin/tmux-terminal-sessionizer'

bind -m emacs-standard -x '"\C-f": ~/.local/bin/tmux-sessionizer'
bind -m vi-command -x '"\C-f": ~/.local/bin/tmux-sessionizer'
bind -m vi-insert -x '"\C-f": ~/.local/bin/tmux-sessionizer'

bind -m emacs-standard -x '"\C-k": ~/.local/bin/tmux-kubeit'
bind -m vi-command -x '"\C-k": ~/.local/bin/tmux-kubeit'
bind -m vi-insert -x '"\C-k": ~/.local/bin/tmux-kubeit'

bind -m emacs-standard -x '"\C-e": __fzf_edit__'
bind -m vi-command -x '"\C-e": __fzf_edit__'
bind -m vi-insert -x '"\C-e": __fzf_edit__'

bind -m emacs-standard -x '"\C-p": git pull'
bind -m vi-command -x '"\C-p": git pull'
bind -m vi-insert -x '"\C-p": git pull'

alias ls="ls --color=auto"
alias ll="ls -l"
alias vim=nvim
alias k=kubectl
alias cd=z
alias f=fzf
alias e=__fzf_edit__
alias latestcommit="git log --oneline | head -n 1 | cut -d' ' -f2-"
alias so="source $HOME/.bashrc"

export BAT_THEME="ansi"
export VIRTUAL_ENV_DISABLE_PROMPT="true"

source /Users/wdaughtridge/.devpy/bin/activate

export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"  # This loads nvm
[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"  # This loads nvm bash_completion

if [ -n "$TMUX" ]; then
    SESH="$(tmux display-message -p '#S')"
    HISTFILE="$HOME/.bash_history.$SESH"
    shopt -s histappend
    PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
fi

echo -en "\e]P0222222" #black
echo -en "\e]P8272822" #darkgrey
echo -en "\e]P1aa4450" #darkred
echo -en "\e]P9ff6a6a" #red
echo -en "\e]P2719611" #darkgreen
echo -en "\e]PAb1d631" #green
echo -en "\e]P3ff9800" #brown
echo -en "\e]PB87875f" #yellow
echo -en "\e]P46688aa" #darkblue
echo -en "\e]PC90b0d1" #blue
echo -en "\e]P58f6f8f" #darkmagenta
echo -en "\e]PD8181a6" #magenta
echo -en "\e]P6528b8b" #darkcyan
echo -en "\e]PE87ceeb" #cyan
echo -en "\e]P7d3d3d3" #lightgrey
echo -en "\e]PFc1cdc1" #white
clear #for background artifacting
