switch (uname)
    case Linux
        eval (/home/linuxbrew/.linuxbrew/bin/brew shellenv)
    case Darwin
        switch (arch)
            case i386
                eval (/usr/local/bin/brew shellenv)
            case arm64
                eval (/opt/homebrew/bin/brew shellenv)
        end
end
