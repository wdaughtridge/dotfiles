# Theme
fish_config theme choose Seaweed
# Go
set -gx GOPATH /Users/wdaughtridge/go
set -gx GOBIN $GOPATH/bin
# Deno 🦕
set -gx DENO_INSTALL ~/.deno
# Path
set -gx PATH ~/.local/share/nvim/mason/bin $DENO_INSTALL/bin /opt/homebrew/opt/llvm/bin ~/.dotnet/tools /opt/homebrew/bin /opt/homebrew/sbin $GOBIN $PATH
# Fzf
fzf --fish | source
# Switch to repository
function switch_to_repo
    set selected (find ~/Developer -mindepth 1 -maxdepth 1 -type d | fzf || return 1)
    cd $selected
    commandline -f repaint
end
# Switch kubeconfig
if test -d ~/.kube
    function switch_kubeconfig
        set selected (find ~/.kube -name "*.yaml" -mindepth 1 -maxdepth 1 | fzf || return 1)
        set -gx KUBECONFIG $selected
        commandline -f repaint
    end
    bind \ck switch_kubeconfig
end
# Abbreviations
abbr -a k kubectl
abbr -a erase_kubeconfig set -e KUBECONFIG
# Key bindings
bind \cf switch_to_repo
bind \ct ~/.local/bin/tmux-terminal-sessionizer
# Bat 🦇
set -x BAT_THEME "Visual Studio Dark+"
