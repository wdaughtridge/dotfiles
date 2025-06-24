#!/usr/bin/env bash
# @location $HOME/.bashrc

PS1='┬[\[\e[38;5;177m\]\u\[\e[0m\]:\[\e[38;5;39m\]\w\[\e[0m\]]-[\[\e[38;5;43m\]\t\[\e[0m\]]\n╰─>\\$ '

if [ -n "$CWD" ]; then
	cd "$CWD"
fi

alias so="source $HOME/.bashrc"
alias ls="ls -G"
alias ll="ls -Gl"
alias k=kubectl

export VISUAL=vim
export EDITOR=vim
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/go/bin:$PATH"

# asdf
export PATH="${ASDF_DATA_DIR:-$HOME/.asdf}/shims:$PATH"

# NVM
export NVM_DIR="$HOME/.nvm"
