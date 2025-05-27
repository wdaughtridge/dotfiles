PS1='┬─[\u:\w]-[\t]\n╰─>$ '

if [ -n $CWD ]; then
	cd $CWD
fi

export VISUAL=nvim
export EDITOR=nvim
export PATH=$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
