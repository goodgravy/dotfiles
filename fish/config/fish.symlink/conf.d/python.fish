set -g fish_user_paths "$HOME/.local/bin" $fish_user_paths
set -g fish_user_paths /opt/homebrew/opt/python/libexec/bin $fish_user_paths
pyenv init - | source
