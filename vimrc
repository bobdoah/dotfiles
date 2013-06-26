runtime bundle/vim-pathogen/autoload/pathogen.vim 
call pathogen#infect()

filetype plugin indent on
syntax on

" Syntastic settings
let g:syntastic_python_pylint_args=" -f parseable -r n -i y --errors-only"
