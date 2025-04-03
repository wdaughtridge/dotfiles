set fish_greeting
fish_config theme choose Old\ School
source $HOME/.cargo/env.fish
alias http3-client $HOME/Developer/quiche/target/release/examples/http3-client
set -x DOTNET_ROOT /opt/homebrew/opt/dotnet/libexec
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x PATH $GOBIN $HOME/.dotnet/tools $HOME/.config/emacs/bin $HOME/.local/bin /opt/homebrew/bin /opt/homebrew/sbin $PATH
