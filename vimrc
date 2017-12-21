" add vundle to the runtime path
filetype off
if has('win32') || has('win64')
    " Windows vundle
    set rtp+=~/vimfiles/bundle/Vundle.vim
    call vundle#begin('$HOME/vimfiles/bundle/')
else 
    " Normal quickstart instructions
    set rtp+=~/.vim/bundle/Vundle.vim
    call vundle#begin()
endif

Plugin 'VundleVim/Vundle.vim'

"plugin bundles:
Plugin 'mileszs/ack.vim'
Plugin 'bkad/CamelCaseMotion'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'altercation/vim-colors-solarized'
Plugin 'tpope/vim-fugitive'
Plugin 'vim-scripts/ZoomWin'
Plugin 'scrooloose/nerdtree'
Plugin 'tpope/vim-surround'
Plugin 'ludovicchabant/vim-lawrencium'
Plugin 'bling/vim-bufferline'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'tpope/vim-abolish'
Plugin 'jlfwong/vim-mercenary'
Plugin 'edkolev/tmuxline.vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Bundle 'rdolgushin/groovy.vim'
Plugin 'tmux-plugins/vim-tmux-focus-events'
Plugin 'tmux-plugins/vim-tmux'

call vundle#end()

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

" Enabled filetype detection and indentation on type-basis
filetype plugin indent on

" Enabled syntax highlighing if the terminal supports more than two colours
if has('syntax') && (&t_Co > 2)
   syntax on
endif

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
colorscheme solarized

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

let hnas_plugins = expand("~/work/misc/tools/vim/load_plugins.vim")
if filereadable(hnas_plugins)
    silent! execute 'source'.hnas_plugins
    let g:checkintool_post_check_in_comment="yes"
    let g:checkintool_bk_pre_commit_check_allow_gui="yes"
    let g:checkintool_confirm_discards="yes"
endif

" Setup the camel case motion mapping.
call camelcasemotion#CreateMotionMappings('<leader>')
