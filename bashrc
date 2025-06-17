#!/bin/bash

PS1='┬[\[\e[38;5;177m\]\u\[\e[0m\]:\[\e[38;5;39m\]\w\[\e[0m\]]-[\[\e[38;5;43m\]\t\[\e[0m\]]\n╰─>\\$ '

if [ -n "$CWD" ]; then
	cd $CWD
fi

shat() {
	openssl dgst -sha256 $1
}

alias so='source $HOME/.bashrc'
alias ls='ls -G'
alias ll='ls -Gl'
alias k=kubectl

export FZF_DEFAULT_OPTS='--layout="reverse" \
	--color=fg:#d0d0d0,fg+:#d0d0d0 \
	--color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00 \
	--color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf \
	--color=border:#262626,label:#aeaeae,query:#d9d9d9 \
	--border="rounded" \
	--border-label="" \
	--preview-window="border-rounded" \
	--prompt="> " \
	--marker=">" \
	--pointer="◆" \
	--separator="=" \
	--scrollbar="|"'
export VISUAL=hx
export EDITOR=hx
export PATH=$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
