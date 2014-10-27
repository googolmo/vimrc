set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'


" custom plugins
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-scripts/YankRing.vim'
Plugin 'altercation/vim-colors-solarized'
Plugin 'austintaylor/vim-indentobject'
Plugin 'christoomey/vim-tmux-navigator'
Plugin 'davidhalter/jedi-vim'
Plugin 'bling/vim-airline'
Plugin 'mustache/vim-mustache-handlebars'
" Plugin 'pangloss/vim-javascript'
Plugin 'godlygeek/tabular'
Plugin 'plasticboy/vim-markdown'
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'tfnico/vim-gradle'
Plugin 'vim-scripts/groovy.vim'
Plugin 'tpope/vim-pastie'
Plugin 'scrooloose/syntastic'
Plugin 'slim-template/vim-slim'
Plugin 'vim-ruby/vim-ruby'
Plugin 'vim-scripts/greplace.vim'
Plugin 'vim-scripts/matchit.zip'
Plugin 'msanders/snipmate.vim'
Plugin 'vim-scripts/indent-motion'
Plugin 'vim-scripts/OmniCppComplete'
" Plugin 'vim-scripts/pep8'
Plugin 'tpope/vim-cucumber'
Plugin 'ervandew/supertab'
Plugin 'nvie/vim-flake8'


" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set autoindent
set autoread                                                 " reload files
set backspace=2                                              " Fix broken
set backupcopy=yes                                           " see :help
set clipboard=unnamed                                        " yank and paste
set directory-=.                                             " don't store
set encoding=utf-8
set expandtab                                                " expand tabs to
set ignorecase                                               "
set incsearch                                                " search as you
set laststatus=2                                             " always show
set list                                                     " show trailing
set listchars=tab:▸\ ,trail:▫
set number                                                   " show line
set ruler                                                    " show where you
set scrolloff=3                                              " show context
set shiftwidth=2                                             " normal mode
set showcmd
set smartcase                                                " case-sensitive
set softtabstop=2                                            " insert mode tab
set tabstop=8                                                " actual tabs
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a
set wildmode=longest,list,full
set cursorline
set incsearch   " incremental search
set nobackup    " no *~ backup files
" set copyindent    " copy the previous indentation on autoindenting
set ignorecase    " ignore case when searching
set smartcase   " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab    " insert tabs on the start of a line according to context
set expandtab        "replace <TAB> with spaces
set tabstop=4
set softtabstop=4
set shiftwidth=4


set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

syntax on   " syntax highlight
set hlsearch    " search highlighting

set background=dark
colorscheme solarized

filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins

" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Enable basic mouse behavior such as resizing buffers.
set mouse=a
if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif

au FileType Makefile set noexpandtab
" C/C++ specific settings
autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30
"Restore cursor to file position in previous editing session
set viminfo='10,\"100,:20,%,n~/.viminfo
au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" open the error console
map <leader>cc :botright cope<CR> 
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

" --- move around splits {
" move to and maximize the below split 
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split 
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split 
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split  
nmap <c-l> <c-w>l<c-w><bar>

" jedi-vim
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = "<leader>d"
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"

" --- yankring
let g:yankring_history_dir = '~/.vim/'

" vim-mustache-handlebars
let g:mustache_operators = 0

" Enable omni completion. (Ctrl-X Ctrl-O)
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType java set omnifunc=javacomplete#Complete

" fdoc is yaml
autocmd BufRead,BufNewFile *.fdoc set filetype=yaml
" md is markdown
autocmd BufRead,BufNewFile *.md set filetype=markdown
autocmd BufRead,BufNewFile *.md set spell


" Add the virtualenv's site-packages to vim path
if has('python')
py << EOF
import os.path
import sys
import vim
if 'VIRTUAL_ENV' in os.environ:
    project_base_dir = os.environ['VIRTUAL_ENV']
    sys.path.insert(0, project_base_dir)
    activate_this = os.path.join(project_base_dir,'bin/activate_this.py')
    execfile(activate_this, dict(__file__=activate_this))
EOF
endif

" Load up virtualenv's vimrc if it exists
if filereadable($VIRTUAL_ENV . '/.vimrc')
    source $VIRTUAL_ENV/.vimrc
endif
