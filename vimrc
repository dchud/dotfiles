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
set updatetime=100
set mouse=a
set cursorline
highlight CursorLine ctermbg=darkgrey
set incsearch
" highlight search hits
map ? :set hls!<bar>set hls?<CR>
" re-justify all text paragraphs below
map = gqG
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

Plug 'luochen1990/rainbow'

Plug 'terryma/vim-smooth-scroll'

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
" Next several suggested by https://www.rockyourcode.com/lint-your-markdown-files-in-vim/
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error                  = '✘'
let g:ale_sign_warning                = '⚠'
highlight ALEErrorSign ctermbg        =NONE ctermfg=red
highlight ALEWarningSign ctermbg      =NONE ctermfg=yellow
let g:ale_linters = {
    \   'md,markdown': ['mdl'],
    \}
let g:ale_fix_on_save = 1

let g:ale_fixers = {
    \   '*': ['trim_whitespace', 'remove_trailing_lines'],
    \   'python': ['black', 'isort']
    \}
let g:ale_python_flake8_options = '--max-line-length=88 --ignore=W2,W3'

let g:csv_highlight_column = 'y'

" assumes gutentags, tagbar installed
nnoremap <silent> T :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_show_tag_linenumbers = 1
let g:tagbar_wrap = 1

" https://stackoverflow.com/a/6053341
" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

" Hide tags files https://bolt80.com/gutentags/
let g:gutentags_cache_dir = '~/.tags_cache'

let g:rainbow_active = 1

" https://github.com/terryma/vim-smooth-scroll#quick-start
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 12, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 12, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 12, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 12, 4)<CR>

" https://www.reddit.com/r/vim/comments/d77t6j/guide_how_to_setup_ctags_with_gutentags_properly/
let g:gutentags_ctags_exclude = [
      \ '*.git', '*.svg', '*.hg',
      \ '*/tests/*',
      \ 'build',
      \ 'dist',
      \ '*sites/*/files/*',
      \ 'bin',
      \ 'node_modules',
      \ 'bower_components',
      \ 'cache',
      \ 'compiled',
      \ 'docs',
      \ 'example',
      \ 'bundle',
      \ 'vendor',
      \ '*.md',
      \ '*-lock.json',
      \ '*.lock',
      \ '*bundle*.js',
      \ '*build*.js',
      \ '.*rc*',
      \ '*.json',
      \ '*.min.*',
      \ '*.map',
      \ '*.bak',
      \ '*.zip',
      \ '*.pyc',
      \ '*.class',
      \ '*.sln',
      \ '*.Master',
      \ '*.csproj',
      \ '*.tmp',
      \ '*.csproj.user',
      \ '*.cache',
      \ '*.pdb',
      \ 'tags*',
      \ 'cscope.*',
      \ '*.css',
      \ '*.less',
      \ '*.scss',
      \ '*.exe', '*.dll',
      \ '*.mp3', '*.ogg', '*.flac',
      \ '*.swp', '*.swo',
      \ '*.bmp', '*.gif', '*.ico', '*.jpg', '*.png',
      \ '*.rar', '*.zip', '*.tar', '*.tar.gz', '*.tar.xz', '*.tar.bz2',
      \ '*.pdf', '*.doc', '*.docx', '*.ppt', '*.pptx',
      \ ]
