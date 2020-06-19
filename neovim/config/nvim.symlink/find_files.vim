nnoremap <leader>b :Buffers<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>t :Tags<CR>

let g:fzf_tags_command = 'ctags -f .tags --totals=yes -R .'
