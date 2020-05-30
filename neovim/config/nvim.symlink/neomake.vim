autocmd! BufWritePost,BufEnter * Neomake

let g:neomake_open_list = 2
let g:neomake_javascript_eslint_maker = { 'exe': 'eslint' }
let g:neomake_javascript_enabled_makers = ['eslint']
