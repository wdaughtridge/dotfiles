set fish_greeting
fish_config theme choose Base16\ Default\ Dark
source $HOME/.cargo/env.fish
alias http3-client $HOME/Developer/quiche/target/release/examples/http3-client
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x PATH $GOBIN $HOME/.config/emacs/bin $HOME/.local/bin /opt/homebrew/bin /opt/homebrew/sbin $PATH
