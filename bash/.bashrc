[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export DOTNET_ROOT=/usr/local/share/dotnet

export PATH="/Users/wdaughtridge/go/bin:/opt/homebrew/lib/ruby/gems/3.2.0/bin:/opt/homebrew/opt/ruby/bin:/Users/wdaughtridge/.local/bin/nvim-macos/bin:$HOME/.config/emacs/bin:$PATH"

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
alias lcommit="git log --oneline | head -n 1 | cut -d' ' -f2-"
alias so="source $HOME/.bashrc"
alias ta="tmux a"

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

. "$HOME/.cargo/env"
