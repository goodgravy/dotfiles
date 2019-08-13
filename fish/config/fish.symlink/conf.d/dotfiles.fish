set dotfiles_dir $HOME/.dotfiles
set -x PATH $PATH $dotfiles_dir/bin

for file in $dotfiles_dir/*/*.fish
  source $file
end
