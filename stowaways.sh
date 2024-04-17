for dir in $(find . -type d -mindepth 1 -maxdepth 1 | tr -d "./"); do stow "$dir" -t /Users/wdaughtridge/; done
