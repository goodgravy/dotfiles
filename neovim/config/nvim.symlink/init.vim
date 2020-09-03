" don't bother with vi compatibility
set nocompatible

let mapleader = ','
noremap <C-h> <C-w>h
noremap <C-j> <C-w>j
noremap <C-k> <C-w>k
noremap <C-l> <C-w>l

" jj or jk to exit INSERT mode
inoremap jj <ESC>
inoremap jk <ESC>

" search tweaks
set hlsearch
nmap <leader>hl :let @/ = ""<CR>
hi Search ctermbg=LightYellow
hi Search ctermfg=DarkBlue
set ignorecase
set smartcase

" Customise UI
set background=light
set number

" Set ctags file location
set tags+=.tags

source ~/.config/nvim/plug.vim
source ~/.config/nvim/grep.vim
source ~/.config/nvim/find_files.vim
source ~/.config/nvim/file_tree.vim
source ~/.config/nvim/linting.vim
