#!/opt/homebrew/bin/bash
alias ll='ls -la'
export GOPATH="$HOME/go"
export GOBIN="$GOPATH/bin"
export PATH="$GOBIN:$HOME/.dotnet/tools:/opt/homebrew/opt/swift/bin:$HOME/.local/bin:$HOME/Library/Application Support/Coursier/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$HOME/.config/emacs/bin:$PATH"
PS1="\w\$ "
