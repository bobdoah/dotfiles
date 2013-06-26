runtime bundle/vim-pathogen/autoload/pathogen.vim 
call pathogen#infect()

filetype plugin indent on
if has('syntax') && (&t_Co > 2)
   syntax on
endif

" Syntastic settings
let g:syntastic_python_pylint_args=" -f parseable -r n -i y --errors-only"
