if empty(glob('~/.vim/autoload/plug.vim'))
  silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
    \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
endif

call plug#begin('~/.vim/bundle')
"plugin bundles:
Plug 'mileszs/ack.vim'
Plug 'bkad/CamelCaseMotion'
"Plug 'vim-syntastic/syntastic'
Plug 'dense-analysis/ale'
Plug 'majutsushi/tagbar'
Plug 'altercation/vim-colors-solarized'
Plug 'tpope/vim-fugitive'
Plug 'vim-scripts/ZoomWin'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-surround'
Plug 'bling/vim-bufferline'
Plug 'tpope/vim-abolish'
Plug 'edkolev/tmuxline.vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'modille/groovy.vim'
Plug 'tmux-plugins/vim-tmux-focus-events'
Plug 'tmux-plugins/vim-tmux'
Plug 'stevearc/vim-arduino'
Plug 'hashivim/vim-terraform'
Plug 'juliosueiras/vim-terraform-completion'
Plug 'tpope/vim-cucumber'
Plug 'tpope/vim-repeat'
" post install (yarn install | npm install) then load plugin only for editing
" supported files
Plug 'prettier/vim-prettier', {
  \ 'do': 'npm install',
  \ 'branch': 'release/1.x',
  \ 'for': [
    \ 'javascript',
    \ 'typescript',
    \ 'css',
    \ 'less',
    \ 'scss',
    \ 'json',
    \ 'graphql',
    \ 'markdown',
    \ 'vue',
    \ 'lua',
    \ 'yaml',
    \ 'php',
    \ 'python',
    \ 'ruby',
    \ 'html',
    \ 'swift' ] }

Plug 'posva/vim-vue'
Plug 'pangloss/vim-javascript'
Plug 'vim-scripts/restore_view.vim'
Plug 'vim-scripts/delview'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'tpope/vim-commentary'
Plug 'editorconfig/editorconfig-vim'
Plug 'aklt/plantuml-syntax'
Plug 'weirongxu/plantuml-previewer.vim'
Plug 'tyru/open-browser.vim'
Plug 'ryanoasis/vim-devicons'
Plug 'iamcco/markdown-preview.nvim', { 'do': { -> mkdp#util#install() }, 'for': ['markdown', 'vim-plug']}
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
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
"let g:syntastic_python_pylint_args=" -f parseable -r n --errors-only"
"let g:syntastic_rst_checkers = ['sphinx']
"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_html_tidy_exec = 'tidy5'
"let g:syntastic_mode_map = {
"	\ "mode": "active",
"	\ "passive_filetypes": ["java"] }
" (Optional) Enable terraform plan to be include in filter
"let g:syntastic_terraform_tffilter_plan = 0

 
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

" Bind some keys for Fugitive shortcuts
nnoremap <leader>gs :Gstatus<CR>
nnoremap <leader>gp :Gpush<CR>

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
" XML uses spaces
autocmd FileType xml set tabstop=4|set shiftwidth=4|set softtabstop=4|set expandtab
" Gherkin/Cucumber files use two space
autocmd FileType cucumber set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab
" Shell scripts using two space
autocmd FileType sh set tabstop=2|set shiftwidth=2|set softtabstop=2|set expandtab

" Setup the camel case motion mapping.
silent! call camelcasemotion#CreateMotionMappings('<leader>')

au BufNewFile,BufRead Jenkinsfile setf groovy

let g:terraform_align=1
let g:terraform_fmt_on_save=1



" Run NERDTree if vim is opened with nothing
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists("s:std_in") | NERDTree | endif

" Run NERDTree if vim is opened with a directory
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | endif

nmap <silent> <leader>m :NERDTreeToggle<CR>
nmap <silent> <leader>y :NERDTreeFind<CR>

" (Optional)Remove Info(Preview) window
set completeopt-=preview

" (Optional)Hide Info(Preview) window after completions
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
autocmd InsertLeave * if pumvisible() == 0|pclose|endif


" (Optional) Default: 0, enable(1)/disable(0) plugin's keymapping
let g:terraform_completion_keys = 1

" (Optional) Default: 1, enable(1)/disable(0) terraform module registry completion
let g:terraform_registry_module_completion = 0

" Enable omnicompletion
filetype plugin on
set omnifunc=syntaxcomplete#Complete

" Ctrl-Space for completions. Heck Yeah!
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>

autocmd FileType python set omnifunc=python3complete#Complete

let g:prettier#config#config_precedence = 'file-override'
let g:vue_disable_pre_processors=1
autocmd FileType vue syntax sync fromstart

set viewoptions=cursor,folds,slash,unix
let g:skipview_files = ['*\.vim']

nmap <silent> <leader>r :CtrlPBuffer<cr>
let g:ctrlp_map='<leader>t'
let g:ctrlp_dotfiles=1
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_root_markers = ['pom.xml', '.p4rc', '.p4ignore']

" CtrlP ignore patterns
let g:ctrlp_custom_ignore = {
            \ 'dir': '\.git$\|node_modules$\|\.hg$\|\.svn$',
            \ 'file': '\.exe$\|\.so$'
            \ }

" search the nearest ancestor that contains .git, .hg, .svn
let g:ctrlp_working_path_mode = 2

let g:prettier#autoformat = 1

if executable('ag')
    let g:ackprg = 'ag --vimgrep'
endif

" Don't enforce editor config on fugitive, scp or git commit messages
let g:EditorConfig_exclude_patterns = ['fugitive://.*', 'scp://.*']
au FileType gitcommit let b:EditorConfig_disable = 1

" Show hidden files in NERDTree (.gitlab-ci.yml is hidden)
let NERDTreeShowHidden=1

" Don't smash the NERDTree buffer
"autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
" and make it work fine with vim-plug
"let g:plug_window = 'noautocmd vertical topleft new'

" Ignore things
set wildignore+=*.o,*.obj,*.git,*.git/*,*.class,*node_modules*,*.swp,*.swo,*target*,*.pyc,*.svn,*.hg,*.DS_Store,*.min.*
let g:NERDTreeRespectWildIgnore = 1
