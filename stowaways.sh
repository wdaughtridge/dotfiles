for dir in $(find . -not -path "*/.*" -type d -mindepth 1 -maxdepth 1 | tr -d "./"); do stow "$dir" -t /Users/wdaughtridge/; done
