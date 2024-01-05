set nocompatible

syntax on

set autoindent smartindent
set shiftwidth=4 softtabstop=4 tabstop=8 expandtab
set hlsearch

set backspace=indent,eol,start

au filetype py setl ff=unix

filetype plugin indent on

set noswapfile
set nobackup
set nowritebackup

set cursorline

set list
set listchars=tab:>-,trail:.,extends:#,nbsp:.

set ignorecase
set smartcase

au BufRead,BufNewFile *.was set filetype=vb
au BufRead,BufNewFile *.was set tabstop=8 softtabstop=8 shiftwidth=8 noexpandtab

if executable('rg')
    " RipGrep preferred
    " per https://vi.stackexchange.com/a/7235
    set grepprg=rg\ -S\ --vimgrep
    set grepformat^=%f:%l:%c:%m
elseif executable('ag')
    " The Silver Searcher also preferred
    " https://blog.kiprosh.com/integrating-the-silver-searcher-with-vims-grepprg/
    set grepprg=ag\ --nogroup\ --nocolor\ --vimgrep\ $*
    set grepformat^=%f:%l:%c:%m
else
    " at least search recursively by default >:T
    set grepprg=grep\ -nr\ \$\*\ \.
endif

