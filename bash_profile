#!/bin/bash
# @location $HOME/.bash_profile

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Brew shell environment
source <(brew shellenv)

# Bash completions
[[ -r "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh" ]] && . "$HOMEBREW_PREFIX/etc/profile.d/bash_completion.sh"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
. <(asdf completion bash)

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# K8s
source <(kubectl completion bash)
complete -o default -F __start_kubectl k

# Cargo
source "$HOME/.cargo/env"
