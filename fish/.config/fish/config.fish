set -gx GOPATH /Users/wdaughtridge/go
set -gx GOBIN $GOPATH/bin
set -gx PATH /opt/homebrew/lib/ruby/gems/3.2.0/bin /opt/homebrew/opt/ruby/bin /opt/homebrew/bin /opt/homebrew/sbin $GOBIN $PATH

# Python
set -gx VIRTUAL_ENV_DISABLE_PROMPT "YES"
source /Users/wdaughtridge/.devpy/bin/activate.fish

abbr -a vim nvim
abbr -a gs git status --short
abbr -a l ll

fzf --fish | source

bind \ct ~/.local/bin/tmux-terminal-sessionizer
bind \cf ~/.local/bin/tmux-sessionizer
bind \ck ~/.local/bin/tmux-kubeit

if status is-interactive
    # Commands to run in interactive sessions can go here
end
