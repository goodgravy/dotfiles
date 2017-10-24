nnoremap <leader>b :Buffers<CR>
nnoremap <leader>t :Files<CR>
nnoremap <leader>r :Tags<CR>

let g:fzf_tags_command = 'ctags -f .tags --totals=yes -R .'
