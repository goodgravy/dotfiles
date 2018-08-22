set dotfiles_dir $HOME/.dotfiles
set -x PATH $PATH $dotfiles_dir/bin
for file in $dotfiles_dir/*/*.fish
  source $file
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/james/Downloads/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/james/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/Users/james/Downloads/google-cloud-sdk/path.fish.inc'; end; end

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
