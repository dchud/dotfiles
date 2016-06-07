syntax on
set nocompatible
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set textwidth=80
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

" taglist plugin config http://vim-taglist.sourceforge.net/manual.html
" Ctrl-\ toggles view of taglist
nnoremap <silent> <C-\> :TlistToggle<CR>
" Option-\ jumps to taglist buffer (OSX)
nnoremap <silent> « <C-w>h
" Option-/ jumps back to main buffer (OSX)
noremap <silent> ÷ <C-w>l
let Tlist_Auto_Highlight_Tag = 1
let Tlist_Auto_Open = 0
let TList_Auto_Update = 1
let Tlist_Exit_OnlyWindow = 1
let Tlist_GainFocus_On_ToggleOpen = 1

execute pathogen#infect()
filetype plugin indent on
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:vim_markdown_folding_disabled=1
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0
let g:syntastic_loc_list_height = 5
let g:syntastic_python_pylint_args = "--load-plugins pylint-django"
let g:syntastic_disabled_filetypes=['html']
