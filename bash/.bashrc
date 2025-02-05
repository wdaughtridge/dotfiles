# Path
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# FZF
eval "$(fzf --bash)"

# Switch to repository
switch-to-repo() {
  selected=$(find ~/Developer -mindepth 1 -maxdepth 1 -type d | fzf || return 1)
  cd "$selected"
}

# Switch kubeconfig
if [ -d ~/.kube ]; then
  switch-kubeconfig() {
    selected=$(find ~/.kube -name "*.yaml" -mindepth 1 -maxdepth 1 | fzf || return 1)
    export KUBECONFIG="$selected"
  }
  bind -x '"\ck": switch_kubeconfig' # Note the different bind syntax
fi

# Key bindings
bind -m emacs-standard -x '"\C-f": switch-to-repo'
bind -m emacs-standard -x '"\C-t": ~/.local/bin/tmux-terminal-sessionizer'

# Bat 🦇
export BAT_THEME="Visual Studio Dark+"
