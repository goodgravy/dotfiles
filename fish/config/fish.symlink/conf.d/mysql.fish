switch (uname)
    case Linux
    	set brewhome "$HOME/.linuxbrew"
    case Darwin
    	set brewhome /usr/local
end

set -g fish_user_paths "$brewhome/opt/mysql-client/bin" $fish_user_paths

set -gx LDFLAGS "-L$brewhome/opt/mysql-client/lib"
set -gx CPPFLAGS "-I$brewhome/opt/mysql-client/include"

set -gx PKG_CONFIG_PATH "$brewhome/opt/mysql-client/lib/pkgconfig"
