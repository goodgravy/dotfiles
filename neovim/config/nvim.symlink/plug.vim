" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" Consistent key navigation between vim and tmux panes
Plug 'christoomey/vim-tmux-navigator'

" Initialize plugin system
call plug#end()
