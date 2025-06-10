if test $CWD
    cd $CWD
end

set fish_greeting

source $HOME/.cargo/env.fish

fish_config prompt choose minimalist

if test -f $HOME/.lightmode
    fish_config theme choose Snow\ Day
else
    fish_config theme choose ayu\ Mirage
end

function container-so
    docker context create lima-docker --docker "host=unix:///Users/wdaughtridge/.lima/docker/sock/docker.sock"
    docker context use lima-docker
end

function shit
    openssl dgst -sha256 $argv[1]
end

function lg
    lazygit
end

function so
    source $HOME/.config/fish/config.fish
end

function lightmode
    touch $HOME/.lightmode
    so
end

function darkmode
    if test -f $HOME/.lightmode
        rm $HOME/.lightmode
    end
    so
end

set -gx FZF_DEFAULT_OPTS '--layout="reverse" --color=fg:#d0d0d0,fg+:#d0d0d0 --color=hl:#5f87af,hl+:#5fd7ff,info:#afaf87,marker:#87ff00 --color=prompt:#d7005f,spinner:#af5fff,pointer:#af5fff,header:#87afaf --color=border:#262626,label:#aeaeae,query:#d9d9d9 --border="rounded" --border-label="" --preview-window="border-rounded" --prompt="> " --marker=">" --pointer="◆" --separator="=" --scrollbar="|"'

set -x VISUAL hx
set -x EDITOR hx
set -x PATH $HOME/.local/bin /opt/homebrew/bin /opt/homebrew/sbin $PATH

# ASDF configuration code
if test -z $ASDF_DATA_DIR
    set _asdf_shims "$HOME/.asdf/shims"
else
    set _asdf_shims "$ASDF_DATA_DIR/shims"
end

# Do not use fish_add_path (added in Fish 3.2) because it
# potentially changes the order of items in PATH
if not contains $_asdf_shims $PATH
    set -gx --prepend PATH $_asdf_shims
end
set --erase _asdf_shims
