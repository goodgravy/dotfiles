autocmd! BufWritePost,BufEnter * Neomake

let g:neomake_open_list = 2
let g:neomake_javascript_eslint_maker = { 'exe': 'eslint' }
let g:neomake_javascript_tslint_maker = {
      \ 'exe': 'tslint',
      \ 'args': ['-t', 'verbose'],
      \ 'errorformat': 'ERROR: (prettier) %f[%l\, %c]: %m'
      \ }
let g:neomake_javascript_enabled_makers = ['tslint']
