#!/opt/homebrew/bin/bash
alias ll='ls -la'
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"
PS1="\w\$ "
