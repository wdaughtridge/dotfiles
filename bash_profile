#!/bin/bash
# @location $HOME/.bash_profile

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# Bash completion
[[ -r "/opt/homebrew/etc/profile.d/bash_completion.sh" ]] && . "/opt/homebrew/etc/profile.d/bash_completion.sh"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# Cargo
source "$HOME/.cargo/env"
