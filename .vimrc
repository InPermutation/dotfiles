if has('win32') || has('win64')
    " Make windows use ~/.vim too, I don't want to use _vimfiles
    set runtimepath^=~/.vim
endif

if has('gui_running')
    colorscheme desert
else
    colorscheme industry
endif

runtime bundle/vim-pathogen/autoload/pathogen.vim

call pathogen#infect()
call pathogen#helptags()

set nocompatible

syntax on

set autoindent smartindent
set shiftwidth=4 softtabstop=4 tabstop=8 expandtab
set hlsearch

set backspace=indent,eol,start

au filetype py setl ff=unix

filetype plugin indent on

set nobackup
set nowritebackup

set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

set ignorecase
set smartcase

au BufRead,BufNewFile *.was set filetype=vb
au BufRead,BufNewFile *.was set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

if executable('ag')
    " The Silver Searcher
    " use ag over grep
    set grepprg=ag\ --nogroup\ --nocolor
endif


