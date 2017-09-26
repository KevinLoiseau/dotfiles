set nocompatible              " be iMproved, required
filetype off                   " required!

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

" let Vundle manage Vundle
" required!
Plugin 'tpope/vim-fugitive'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'epmatsw/ag.vim'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/syntastic'
Plugin 'airblade/vim-gitgutter'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-endwise'
Plugin 'majutsushi/tagbar'
Plugin 'kennethzfeng/vim-raml'
Plugin 'tyrannicaltoucan/vim-quantum'

call vundle#end()

filetype plugin indent on

set t_Co=256


let mapleader = "\<Space>"
syntax on

set background=dark
colorscheme quantum

"set number
"set relativenumber
set nocompatible
set autoindent
set listchars=tab:\.\ ,trail:-
set list
set wildmenu
set wildmode=list:longest,list:full
set laststatus=2
set ruler
set cursorline
set expandtab
set tabstop=2
set shiftwidth=2
set softtabstop=2
set colorcolumn=80
set scrolloff=2
set nowrap
set mouse=a
set showmatch
set ignorecase
set incsearch
set hlsearch
set vb                     "visual bells, no sound !
set clipboard=unnamed
set backspace=2            " allow backspacing over everything in insert mode
set virtualedit=onemore
set history=1000
set whichwrap+=>,l
set whichwrap+=<,h
set shortmess+=I           " oh shut up start message
set nobackup
set noswapfile
set maxmempattern=99999 " some plugins are heavy :(

" after 220 chars, no mouse ... fix that
set ttymouse=sgr

" nerdtree plugin
"autocmd vimenter * if !argc() | NERDTree | endif
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
map <F2> :NERDTreeToggle<CR>
let NERDTreeChDirMode=2
"let NERDTreeDirArrows=0

" make ctrl-p never relative to the current file, this drives me crazy
let g:ctrlp_working_path_mode = 0
let g:ctrlp_max_height = 30
let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
nnoremap <Leader>o :CtrlP<CR>

" map git commands
map <leader>gb :Gblame<cr>
map <leader>gl :!clear && git log -p %<cr>
map <leader>gd :!clear && git diff %<cr>

" git tab maps
map <leader>tc :tabnew<cr>
map <leader>tq :tabclose<cr>
map <C-v> :vsplit<CR>
map <C-b> :split<CR>

nnoremap <Leader>w :w<CR>
nnoremap <Leader>q :q<CR>

nnoremap ; :
inoremap <F1> <ESC>
nnoremap <F1> <ESC>
vnoremap <F1> <ESC>

map <leader>a :Ag!<space>

" needed for git gutter, without this, background is black ...
let g:gitgutter_override_sign_column_highlight = 0

" http://stackoverflow.com/questions/6427650/vim-in-tmux-background-color-changes-when-paging
set t_ut=

nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:airline_left_sep = ''
let g:airline_right_sep = ''
let g:airline_section_b = '' " git diff + branch ... too long
let g:airline_section_y = '' " file type, I don't care

" so, editign a ruby file, syntax hilighting is slow
" and scrolling is really a pain in the ass
" http://stackoverflow.com/questions/16902317/vim-slow-with-ruby-syntax-highlighting
set re=1

nmap <F3> :TagbarToggle<CR>
