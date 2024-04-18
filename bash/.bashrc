[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export PATH=/Users/wdaughtridge/go/bin:/opt/homebrew/lib/ruby/gems/3.2.0/bin:/opt/homebrew/opt/ruby/bin:$PATH

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
        nvim -p $file
    fi
}

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

export BAT_THEME="ansi"
