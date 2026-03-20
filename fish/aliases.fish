if command -q bat
    alias cat "bat --paging=never"
end

if command -q eza
    alias l "eza -la --sort modified"
    alias ls "eza"
    alias ll "eza -la"
    alias tree "eza --tree"
else
    alias l "ls -lrtA"
end
