set dotfiles_dir $HOME/.dotfiles
set -x PATH $PATH $dotfiles_dir/bin
for file in $dotfiles_dir/*/*.fish
  source $file
end

# The next line updates PATH for the Google Cloud SDK.
if [ -f '/Users/james/Downloads/google-cloud-sdk/path.fish.inc' ]; if type source > /dev/null; source '/Users/james/Downloads/google-cloud-sdk/path.fish.inc'; else; . '/Users/james/Downloads/google-cloud-sdk/path.fish.inc'; end; end

set -x LC_ALL en_US.UTF-8
set -x LANG en_US.UTF-8
set -g fish_user_paths "/usr/local/opt/sqlite/bin" $fish_user_paths
set -g fish_user_paths "/usr/local/opt/mysql-client/bin" $fish_user_paths

# tabtab source for serverless package
# uninstall by removing these lines or running `tabtab uninstall serverless`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/serverless.fish
# tabtab source for sls package
# uninstall by removing these lines or running `tabtab uninstall sls`
[ -f /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish ]; and . /usr/local/lib/node_modules/serverless/node_modules/tabtab/.completions/sls.fish
