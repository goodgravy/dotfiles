set -g fish_user_paths "$HOME/.linuxbrew/opt/mysql-client/bin" $fish_user_paths

set -gx LDFLAGS "-L$HOME/.linuxbrew/opt/mysql-client/lib"
set -gx CPPFLAGS "-I$HOME/.linuxbrew/opt/mysql-client/include"

set -gx PKG_CONFIG_PATH "$HOME/.linuxbrew/opt/mysql-client/lib/pkgconfig"
