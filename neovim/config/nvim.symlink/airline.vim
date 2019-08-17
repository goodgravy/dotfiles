let g:airline_powerline_fonts=1
let g:airline_extensions = []
let g:airline_section_y = ''

if airline#util#winwidth() > 79
  let g:airline_section_z = airline#section#create(['windowswap', 'obsession', '%3p%%', '%3v'])
else
  let g:airline_section_z = airline#section#create(['%3p%%', ':%3v'])
endif
