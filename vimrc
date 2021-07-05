" set compatible
set noshowmatch
set nosm

" set the runtime path to include Vundle and initialize
"
call plug#begin("~/.vim/plugged")

Plug 'junegunn/vim-easy-align'
Plug 'vim-scripts/YankRing.vim'
Plug 'davidhalter/jedi-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ekalinin/dockerfile.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

call plug#end()

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
" set number                                                   " show line
set ruler                                                    " show where you
set scrolloff=3                                              " show context
set shiftwidth=4                                             " normal mode
set showcmd
set smartcase                                                " case-sensitive
set softtabstop=4                                            " insert mode tab
set tabstop=4                                                " actual tabs
set wildignore=log/**,node_modules/**,target/**,tmp/**,*.rbc
set wildmenu                                                 " show a
set wildmode=longest,list,full
set cursorline
set nobackup    " no *~ backup files
set copyindent    " copy the previous indentation on autoindenting
set ignorecase    " ignore case when searching
set smartcase   " ignore case if search pattern is all lowercase,case-sensitive otherwise
set smarttab    " insert tabs on the start of a line according to context
" set expandtab        "replace <TAB> with spaces


set listchars=tab:›\ ,trail:•,extends:#,nbsp:.

syntax on   " syntax highlight
set hlsearch    " search highlighting
 "
 "set background=dark
 "" colorscheme dracula
 "" colorscheme solarized
 "
filetype on           " Enable filetype detection
filetype indent on    " Enable filetype-specific indenting
filetype plugin on    " Enable filetype-specific plugins
 "
 "" auto reload vimrc when editing it
autocmd! bufwritepost .vimrc source ~/.vimrc

" Enable basic mouse behavior such as resizing buffers.
" set mouse=a
if exists('$TMUX')  " Support resizing in tmux
    set ttymouse=xterm2
endif

autocmd FileType * setlocal formatoptions-=c formatoptions-=r formatoptions-=o
au FileType Makefile set noexpandtab
" C/C++ specific settings
" autocmd FileType c,cpp,cc  set cindent comments=sr:/*,mb:*,el:*/,:// cino=>s,e0,n0,f0,{0,}0,^-1s,:0,=s,g0,h1s,p2,t0,+2,(2,)20,*30
"Restore cursor to file position in previous editing session
" set viminfo='10,\"100,:20,%,n~/.viminfo
" au BufReadPost * if line("'\"") > 0|if line("'\"") <= line("$")|exe("norm '\"")|else|exe "norm $"|endif|endif

"replace the current word in all opened buffers
map <leader>r :call Replace()<CR>

" open the error console
map <leader>cc :botright cope<CR> 
" move to next error
map <leader>] :cn<CR>
" move to the prev error
map <leader>[ :cp<CR>

vnoremap <C-c> "*y

" --- move around splits {
" move to and maximize the below split 
map <C-J> <C-W>j<C-W>_
" move to and maximize the above split 
map <C-K> <C-W>k<C-W>_
" move to and maximize the left split 
nmap <c-h> <c-w>h<c-w><bar>
" move to and maximize the right split  
nmap <c-l> <c-w>l<c-w><bar>

vmap <C-x> :!pbcopy<CR>
vmap <C-c> :w !pbcopy<CR><CR>

" jedi-vim
let g:jedi#auto_initialization = 0
let g:jedi#auto_vim_configuration = 0
let g:jedi#use_tabs_not_buffers = 1
let g:jedi#popup_on_dot = 0
let g:jedi#goto_command = "<leader>d"
let g:jedi#goto_assignments_command = "<leader>g"
let g:jedi#goto_definitions_command = ""
let g:jedi#documentation_command = "K"
let g:jedi#usages_command = "<leader>n"
let g:jedi#completions_command = "<C-Space>"
let g:jedi#rename_command = "<leader>r"
let g:jedi#show_call_signatures = "1"

" --- yankring
let g:yankring_history_dir = '~/.vim/'

" airline
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#tabline#left_sep = ' '
let g:airline#extensions#tabline#left_alt_sep = '|'
let g:airline#extensions#tabline#formatter = 'default'

 
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
