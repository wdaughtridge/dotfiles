#!/bin/bash
# @location $HOME/.bash_profile

if [ -f "$HOME/.bashrc" ]; then
    source "$HOME/.bashrc"
fi

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"
. <(asdf completion bash)

# Cargo
source "$HOME/.cargo/env"
