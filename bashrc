#!/bin/bash

PS1='┬[\[\e[38;5;177m\]\u\[\e[0m\]:\[\e[38;5;39m\]\w\[\e[0m\]]-[\[\e[38;5;43m\]\t\[\e[0m\]]\n╰─>\\$ '

if [ -n "$CWD" ]; then
	cd $CWD
fi

shit() {
	openssl dgst -sha256 $1
}

alias so='source $HOME/.bashrc'
alias ls='ls -G'
alias ll='ls -Gl'

export FZF_DEFAULT_OPTS='--layout="reverse" --color=fg:#d0d0d0,fg+:#d0d0d0 --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00 --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf --color=border:#262626,label:#aeaeae,query:#d9d9d9 --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> " --marker=">" --pointer="◆" --separator="=" --scrollbar="|"'
export VISUAL=hx
export EDITOR=hx
export PATH=$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH

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
