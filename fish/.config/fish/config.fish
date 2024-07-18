# Go
set -gx GOPATH /Users/wdaughtridge/go
set -gx GOBIN $GOPATH/bin

# Python
set -gx VIRTUAL_ENV_DISABLE_PROMPT "YES"
source ~/.devpy/bin/activate.fish

# PATH
set -gx PATH ~/.config/emacs/bin ~/.dotnet/tools /opt/homebrew/lib/ruby/gems/3.2.0/bin /opt/homebrew/opt/ruby/bin /opt/homebrew/bin /opt/homebrew/sbin $GOBIN $PATH

fzf --fish | source

function switch_to_repo
    set selected (find ~/repos -mindepth 1 -maxdepth 1 -type d | fzf)
    cd $selected
    commandline -f repaint
end

# Abbreviations
abbr -a vim nvim
abbr -a k kubectl
abbr -a ta tmux a
abbr -a cl clear

# Key bindings
bind \cf switch_to_repo

function fish_prompt
    set_color blue
    echo (basename (pwd))(set_color cyan) '>' (set_color normal)
end
