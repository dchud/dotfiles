syntax on
set nocompatible
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set showmatch
set mat=5
set ruler
set noerrorbells
set incsearch
map ? :set hls!<bar>set hls?<CR>
inoremap <Nul> <C-x><C-o>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

call pathogen#infect()
filetype plugin indent on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:vim_markdown_folding_disabled=1
