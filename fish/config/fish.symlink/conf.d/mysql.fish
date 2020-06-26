set -g fish_user_paths "/home/linuxbrew/.linuxbrew/opt/mysql-client/bin" $fish_user_paths

set -gx LDFLAGS "-L/home/linuxbrew/.linuxbrew/opt/mysql-client/lib"
set -gx CPPFLAGS "-I/home/linuxbrew/.linuxbrew/opt/mysql-client/include"

set -gx PKG_CONFIG_PATH "/home/linuxbrew/.linuxbrew/opt/mysql-client/lib/pkgconfig"
