#!/bin/bash

if [ -f "/Users/wdaughtridge/.bashrc" ]; then
    . "/Users/wdaughtridge/.bashrc"
fi

# Bash completions
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
. <(asdf completion bash)

# NVM
export NVM_DIR="$([ -z "${XDG_CONFIG_HOME-}" ] && printf %s "${HOME}/.nvm" || printf %s "${XDG_CONFIG_HOME}/nvm")"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# K8s
source <(kubectl completion bash)
alias k=kubectl
complete -o default -F __start_kubectl k

# Cargo
. "$HOME/.cargo/env"
