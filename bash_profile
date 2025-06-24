#!/usr/bin/env bash
# @location $HOME/.bash_profile

# Load bashrc
if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Bash completion
[[ -r /opt/homebrew/etc/profile.d/bash_completion.sh ]] && source /opt/homebrew/etc/profile.d/bash_completion.sh

# NVM
function so_nvm() {
    [ -s "$NVM_DIR/nvm.sh" ] && source "$NVM_DIR/nvm.sh"
}

# Cargo
function so_cargo() {
    source "$HOME/.cargo/env"
}
