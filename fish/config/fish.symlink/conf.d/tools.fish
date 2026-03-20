# fzf key bindings (Ctrl-R for history, Ctrl-T for files, Alt-C for cd)
command -q fzf; and fzf --fish | source

# zoxide (smarter cd — use `z` instead of `cd`)
command -q zoxide; and zoxide init fish | source

# starship prompt
command -q starship; and starship init fish | source
