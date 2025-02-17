# Path
export PATH="$HOME/.local/bin:/opt/homebrew/bin:/opt/homebrew/sbin:$PATH"

# Set up some color variables
RED="\[\033[0;31m\]"
GREEN="\[\033[0;32m\]"
YELLOW="\[\033[0;33m\]"
BLUE="\[\033[0;34m\]"
MAGENTA="\[\033[0;35m\]"
CYAN="\[\033[0;36m\]"
WHITE="\[\033[0;37m\]"
RESET="\[\033[0m\]"

alias ll='ls -l'

# Construct the prompt
PS1="${GREEN}\w${RESET}\$ "

# FZF
eval "$(fzf --bash)"

# Bat 🦇
export BAT_THEME="Visual Studio Dark+"
