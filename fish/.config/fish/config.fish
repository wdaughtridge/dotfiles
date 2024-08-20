# Go
set -gx GOPATH /Users/wdaughtridge/go
set -gx GOBIN $GOPATH/bin

if test -f ~/.devpy/bin/activate.fish
    # Python
    set -gx VIRTUAL_ENV_DISABLE_PROMPT "YES"
    source ~/.devpy/bin/activate.fish
end

# PATH
set -gx PATH ~/.config/emacs/bin ~/.dotnet/tools /opt/homebrew/lib/ruby/gems/3.2.0/bin /opt/homebrew/opt/ruby/bin /opt/homebrew/bin /opt/homebrew/sbin $GOBIN $PATH

fzf --fish | source

function switch_to_repo
    set selected (find ~/repos -mindepth 1 -maxdepth 1 -type d | fzf || return 1)
    cd $selected
    commandline -f repaint
end

function switch_kubeconfig
    set selected (find ~/.kube -name "*.yaml" -mindepth 1 -maxdepth 1 | fzf || return 1)
    set -gx KUBECONFIG $selected
    commandline -f repaint
end

function toggle_fg_proc
    fg 2&> /dev/null
end

# Abbreviations
abbr -a vim nvim
abbr -a k kubectl
abbr -a ta tmux a
abbr -a cl clear
abbr -a erase_kubeconfig set -e KUBECONFIG

# Key bindings
bind \cf switch_to_repo
bind \ck switch_kubeconfig
bind \cz toggle_fg_proc
bind \ct ~/.local/bin/tmux-terminal-sessionizer

function fish_prompt
    if set -q KUBECONFIG
        set kube_prompt "@" (string replace ".yaml" "" (path basename $KUBECONFIG))
    else
        set -e kube_prompt
    end

    set_color green
    echo (path basename (pwd))(set_color cyan) $kube_prompt '>' (set_color normal)
end
