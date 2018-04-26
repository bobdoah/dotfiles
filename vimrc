"install vim-plug

if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
"plugin bundles:
Plug 'mileszs/ack.vim'
Plug 'bkad/CamelCaseMotion'
Plug 'scrooloose/syntastic'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/ZoomWin'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'ludovicchabant/vim-lawrencium'
Plug 'bling/vim-bufferline'
Plug 'MarcWeber/vim-addon-mw-utils'
Plug 'tomtom/tlib_vim'
Plug 'garbas/vim-snipmate'
Plug 'honza/vim-snippets'
Plug 'tpope/vim-abolish'
Plug 'jlfwong/vim-mercenary'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'rdolgushin/groovy.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'nfvs/vim-perforce'
Plug 'stevearc/vim-arduino'
Plug 'hashivim/vim-terraform'
call plug#end()

" Map leader key to comma:
let mapleader = ","

" Map j and k to move down/up a single row each time
nmap j gj
nmap k gk

" Make the searching case insensitive, unless upper case characters are
" included
set ignorecase
set smartcase

" Make search global by default
set gdefault

" Tab settings
set shiftwidth=4
set shiftround
set expandtab
set softtabstop=4
set tabstop=8

" Enable line numbering
set nu

" Viminfo file settings (saved across sessions)
set viminfo=/10,'10,r/mnt/zip,r/mnt/floppy,f0,h,\"100

" Syntastic settings
let g:syntastic_python_pylint_args=" -f parseable -r n -i y --errors-only"
let g:syntastic_rst_checkers = ['sphinx']
 
" Makefiles have to use tabs
autocmd FileType make set noexpandtab shiftwidth=8

 
" Toggle for paste mode
set pastetoggle=<F5>
set showmode
 
" Toggle function for line numbering 
function! g:ToggleNu()
    if(&rnu == 1)
        let g:prev_relative = 1
        set nornu
    elseif(&nu == 1)
        let g:prev_relative = 0
        set nonu
    elseif exists("g:prev_relative")
        if (g:prev_relative == 1)
            set rnu
        else
            set nu
        endif            
    else
        set nu
    endif    
endfunc    

" Map the line number toggle to a key
nnoremap <silent><F4> :call g:ToggleNu()<CR>

" Toggle function for relative and absolute line numbering
function! g:ToggleNuMode()
    if(&rnu == 1)
        set nu
    else
        set rnu
    endif
endfunc

" Map the numbering mode toggle to a key
nnoremap <silent><F3> :call g:ToggleNuMode()<CR>
 
" Save folds between sessions
au BufWinLeave * silent! mkview
au BufWinEnter * silent! loadview

" Solarized settings
if has('gui_running')
    set background=light
else
    set background=dark
endif

let g:solarized_termtrans = 1
let g:solarized_termcolors = 16
silent! colorscheme solarized

" Tagbar toggle key
nmap <F8> :TagbarToggle<CR>

" Sudo trick for saving when I forget to open as root
cmap w!! w !sudo tee % > /dev/null

" Enable Wildmenu
set wildmode=list:longest,full

" Disable the modeline (often a security risk)
set nomodeline

" Bind a key to let me reselect the text that was just pasted
nnoremap <leader>v V`]

" Bind a key for ack'ing
nnoremap <leader>a :Ack

" Bind a key to P4edit a file.
nnoremap <leader>p :P4edit<CR>

" Not vi compatible mode
set nocompatible

" Use UTF-8 encoding
set encoding=utf-8

" Map some keys for the location list next and previous commands
nnoremap <silent><C-j> :lnext<CR>
nnoremap <silent><C-k> :lprev<cr>

" vim-airline status bar
" use the fancy powerline symbols
"let g:airline_powerline_fonts = 1
set ambiwidth=double
let g:airline_left_sep=''
let g:airline_right_sep=''

" Make sure the powerline status bar is always displayed
set laststatus=2

" Hide the mode
set noshowmode

" Set the font for gvim in windows
if has("gui_win32")
    set guifont=Powerline_Consolas:h11:cANSI
endif

"let g:tmuxline_theme = 'airline_insert'
let g:tmuxline_preset = {
      \'a'    : '#S',
      \'b'    : '#F',
      \'c'    : ['#W', '#P'],
      \'win'  : '#I #W',
      \'cwin' : '#I #W',
      \'x'    : '',
      \'y'    : '%R',
      \'z'    : '#h'}
let g:airline#extensions#tmuxline#enabled = 0
let g:tmuxline_powerline_separators = 0

let g:tmuxline_theme = {
            \ 'a': [15, 33, 'bold'],
            \ 'b': [7, 11, ''],
            \ 'c': [14, '0', ''],
            \ 'bg': [10, '0', ''],
            \ 'x': [10, '0', ''], 
            \ 'y': [7, 11, ''], 
            \ 'z': [15, 33, ''], 
            \ 'cwin': [7, 33, ''], 
            \ 'win': [14, '0', ''], 
            \ 'win.activity': [1, '0', 'none']
            \ }

autocmd FileType ruby set tabstop=8|set shiftwidth=2|set softtabstop=2|set expandtab
autocmd FileType robot set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab
" XML is also using tabs
autocmd FileType xml set noexpandtab tabstop=8 shiftwidth=8 softtabstop=0

" Setup the camel case motion mapping.
silent! call camelcasemotion#CreateMotionMappings('<leader>')

au BufNewFile,BufRead Jenkinsfile setf groovy

let g:terraform_align=1
let g:terraform_fmt_on_save=1
