[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

export PATH="/opt/homebrew/bin:/Users/wdaughtridge/go/bin:/opt/homebrew/lib/ruby/gems/3.2.0/bin:/opt/homebrew/opt/ruby/bin:/Users/wdaughtridge/.local/bin/nvim-macos/bin:$HOME/.config/emacs/bin:$PATH"

export BAT_THEME="ansi"

eval "$(/opt/homebrew/bin/brew shellenv)"

source /opt/homebrew/opt/fzf/shell/key-bindings.bash
source /opt/homebrew/opt/fzf/shell/completion.bash

source <(kubectl completion bash)
complete -o default -F __start_kubectl k

source /Users/wdaughtridge/.config/bash/git-prompt.sh
source /Users/wdaughtridge/.config/bash/git-completion.bash

if [ -n "$TMUX" ]; then
    SESH="$(tmux display-message -p '#S')"
    HISTFILE="$HOME/.bash_history.$SESH"
    shopt -s histappend
    PROMPT_COMMAND="history -a;$PROMPT_COMMAND"
fi
