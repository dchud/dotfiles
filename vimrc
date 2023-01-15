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
set updatetime=100
map ? :set hls!<bar>set hls?<CR>
inoremap <Nul> <C-x><C-o>

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete

" Manage plugins w/plug
call plug#begin()
" The default plugin directory will be as follows:
"   - Vim (Linux/macOS): '~/.vim/plugged'
"   - Vim (Windows): '~/vimfiles/plugged'
"   - Neovim (Linux/macOS/Windows): stdpath('data') . '/plugged'
" You can specify a custom plugin directory by passing it as the argument
"   - e.g. `call plug#begin('~/.vim/plugged')`
"   - Avoid using standard Vim directory names like 'plugin'

Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

Plug 'airblade/vim-gitgutter'

Plug 'dense-analysis/ale'

Plug 'chrisbra/csv.vim'

Plug 'preservim/vim-pencil'
" This is an archived repo, but it still works to stop wrap in markdown code
" blocks and tables
Plug 'mattly/vim-markdown-enhancements'

Plug 'iamcco/markdown-preview.nvim', { 'do': 'cd app && yarn install' }

" Need to make this work with vim-pencil to autoformat tables, disable for now
" Plug 'dhruvasagar/vim-table-mode'

Plug 'ludovicchabant/vim-gutentags'
Plug 'preservim/tagbar'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" see https://github.com/reedes/vim-pencil
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,md    call pencil#init({'wrap': 'hard', 'autoformat': 1})
augroup END

" let g:vim_markdown_folding_disabled=1
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0

let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'

" let g:ale_linters_explicit = 0
let g:ale_linters = {
    \   '*': ['trim_whitespace']
    \}
let g:ale_fixers = {
    \   '*': ['trim_whitespace'],
    \   'python': ['black', 'isort']
    \}
let g:ale_fix_on_save = 1
let g:ale_python_flake8_options = '--max-line-length=88 --ignore=W2,W3'

let g:csv_highlight_column = 'y'

" assumes gutentags, tagbar installed
nnoremap <silent> T :TagbarToggle<CR>

" https://stackoverflow.com/a/6053341
" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

