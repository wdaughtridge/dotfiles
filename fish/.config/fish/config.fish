# Go
set -gx GOPATH /Users/wdaughtridge/go
set -gx GOBIN $GOPATH/bin

# Python
set -gx VIRTUAL_ENV_DISABLE_PROMPT "YES"
source /Users/wdaughtridge/.devpy/bin/activate.fish

# PATH
set -gx PATH /opt/homebrew/lib/ruby/gems/3.2.0/bin /opt/homebrew/opt/ruby/bin /opt/homebrew/bin /opt/homebrew/sbin $GOBIN $PATH

# Abbreviations
abbr -a vim nvim
abbr -a k kubectl
abbr -a ta tmux a
abbr -a cl clear

fzf --fish | source

# Key bindings
bind \ct ~/.local/bin/tmux-terminal-sessionizer
bind \cf ~/.local/bin/tmux-sessionizer
bind \ck ~/.local/bin/tmux-kubeit

function fish_prompt
    set_color blue
    echo (basename (pwd))(set_color cyan) '>' (set_color normal)
end
