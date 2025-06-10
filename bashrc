PS1='┬─[\u:\w]-[\t]\n╰─>$ '

if [ -n $CWD ]; then
	cd $CWD
fi

export VISUAL=hx
export EDITOR=hx
export PATH=$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH
