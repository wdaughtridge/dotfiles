set fish_greeting
fish_config theme choose ayu\ Mirage
source $HOME/.cargo/env.fish
function lightmode
	touch $HOME/.lightmode
	source $HOME/.config/fish/config.fish
end
function darkmode
	rm $HOME/.lightmode
	source $HOME/.config/fish/config.fish
end
set -x VISUAL nvim
set -x EDITOR nvim
set -x DOTNET_ROOT /usr/local/share/dotnet
set -x GOPATH $HOME/go
set -x GOBIN $GOPATH/bin
set -x PATH $GOBIN $HOME/.local/share/nvim/mason/bin $HOME/.dotnet/tools $HOME/.local/bin /opt/homebrew/bin /opt/homebrew/sbin $PATH
