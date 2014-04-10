" add vundle to the runtime path
filetype off
if has('win32') || has('win64')
    " Windows vundle
    set rtp+=~/vimfiles/bundle/vundle/
    call vundle#rc('$HOME/vimfiles/bundle/')
else 
    " Normal quickstart instructions
    set rtp+=~/.vim/bundle/vundle/
    call vundle#rc()
endif

Bundle 'gmarik/vundle'

"plugin bundles:
Bundle 'mileszs/ack.vim'
Bundle 'bkad/CamelCaseMotion'
Bundle 'scrooloose/syntastic'
Bundle 'majutsushi/tagbar'
Bundle 'altercation/vim-colors-solarized'
Bundle 'tpope/vim-fugitive'
Bundle 'vim-scripts/ZoomWin'
Bundle 'scrooloose/nerdtree'
Bundle 'tpope/vim-surround'
Bundle 'bling/vim-airline'
Bundle 'ludovicchabant/vim-lawrencium'
Bundle 'bling/vim-bufferline'

" Map j and k to move down/up a single row each time
nmap j gj
nmap k gk

" Make the searching case insensitive, unless upper case characters are
" included
set ignorecase
set smartcase

" Tab settings
set shiftwidth=4
set shiftround
set expandtab
set tabstop=4

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
let g:airline_powerline_fonts = 1

" Make sure the powerline status bar is always displayed
set laststatus=2

" Hide the mode
set noshowmode

" Set the font for gvim in windows
if has("gui_win32")
    set guifont=Powerline_Consolas:h11:cANSI
endif
