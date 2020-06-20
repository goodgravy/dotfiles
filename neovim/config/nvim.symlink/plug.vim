" Specify a directory for plugins
call plug#begin(stdpath('data') . '/plugged')

" Consistent key navigation between vim and tmux panes
Plug 'christoomey/vim-tmux-navigator'

" Better full-text searching interface
Plug 'mileszs/ack.vim'

" Fuzzy find by file-name
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'

" File tree sidebar
Plug 'preservim/nerdtree'

" Asynchronous linter
Plug 'dense-analysis/ale'

" Initialize plugin system
call plug#end()