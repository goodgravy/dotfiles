switch (uname)
    case Linux
        eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    case Darwin
        eval (/usr/local/bin/brew shellenv)
end
