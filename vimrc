set nocompatible
set encoding=utf-8
set expandtab
set autoindent
set shiftwidth=4
set softtabstop=4
set textwidth=80
set showmatch
set mat=5
set ruler
set noerrorbells
set nospell
set nocp
filetype plugin on
set updatetime=100
" 2023-03-29 note: "enable mouse reporting" in iterm2 -> Terminal prefs
set mouse=a
set cursorline
set scrolloff=10
highlight CursorLine ctermbg=darkgrey
highlight LineNr ctermfg=brown
set incsearch
" '?' to toggle highlighting search hits
map ? :set hls!<bar>set hls?<CR>
" '=' to re-justify all text paragraphs below cursor
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

Plug 'gabrielelana/vim-markdown'

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

Plug 'Yggdroot/indentLine'

Plug 'Glench/Vim-Jinja2-Syntax'

" 20230316 Testing file searching
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'dyng/ctrlsf.vim'

" 20230410 Trying out nim
Plug 'zah/nim.vim'

Plug 'godlygeek/tabular'

" 20231217 playing with rust
" https://github.com/rust-lang/rust.vim
Plug 'rust-lang/rust.vim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()

" see https://github.com/reedes/vim-pencil
augroup pencil
    autocmd!
    autocmd FileType markdown,mkd,md    call pencil#init({'wrap': 'hard', 'autoformat': 0})
augroup END

" let g:vim_markdown_folding_disabled=1
let g:markdown_fenced_languages = ['html', 'python', 'bash=sh']
let g:markdown_syntax_conceal = 0

let g:airline_powerline_fonts = 1
let g:airline_theme='bubblegum'
let g:airline#extensions#tabline#enabled = 1
" https://stackoverflow.com/a/67880654, limit to 7
let g:airline#extensions#tabline#buffer_idx_mode = 1
nmap <leader>1 <Plug>AirlineSelectTab1
nmap <leader>2 <Plug>AirlineSelectTab2
nmap <leader>3 <Plug>AirlineSelectTab3
nmap <leader>4 <Plug>AirlineSelectTab4
nmap <leader>5 <Plug>AirlineSelectTab5
nmap <leader>6 <Plug>AirlineSelectTab6
nmap <leader>7 <Plug>AirlineSelectTab7
nmap <leader>- <Plug>AirlineSelectPrevTab
nmap <leader>+ <Plug>AirlineSelectNextTab

" let g:ale_linters_explicit = 0
" Next several suggested by https://www.rockyourcode.com/lint-your-markdown-files-in-vim/
" 20230531 - explicit to listen to g:ale_linters and stop linting md
let g:ale_linters_explicit = 1
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_save = 1
let g:ale_sign_error = '✘'
let g:ale_sign_warning = '⚠'
highlight ALEErrorSign ctermbg =NONE ctermfg=red
highlight ALEWarningSign ctermbg =NONE ctermfg=yellow

" 20230531 - stop markdown linting!
"    \   'md,Rmd,markdown': ['mdl'],
let g:ale_linters = {
    \   "python": ["ruff"],
    \}
let g:ale_fix_on_save = 1

" remove isort from fixers, trying ruff!
let g:ale_fixers = {
    \   '*': ['trim_whitespace', 'remove_trailing_lines'],
    \   'python': ['black', 'ruff', 'isort'],
    \}
let g:ale_python_flake8_options = '--max-line-length=88 --ignore=W2,W3,W503'

" vim-markdown turns it on by default, how rude
let g:markdown_enable_spell_checking = 0

let g:csv_highlight_column = 'y'

" https://stackoverflow.com/a/6053341
" Use ctrl-[hjkl] to select the active split
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-l> :wincmd l<CR>

let g:rainbow_active = 1

let g:indentLine_char_list = ['|', '¦', '┆', '┊']
map \| :IndentLinesToggle<CR>

" https://github.com/terryma/vim-smooth-scroll#quick-start
noremap <silent> <c-u> :call smooth_scroll#up(&scroll/2, 12, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll/2, 12, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 12, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 12, 4)<CR>

" Jump to tag
nn <M-g> :call JumpToDef()<cr>
ino <M-g> <esc>:call JumpToDef()<cr>i

" Hide tags files https://bolt80.com/gutentags/
let g:gutentags_cache_dir = '~/.tags_cache'

" assumes gutentags, tagbar installed
nnoremap <silent> T :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_show_tag_linenumbers = 1
let g:tagbar_wrap = 1

" ctrlsf options
nmap <C-p> <Plug>CtrlSFPrompt
let g:ctrlsf_auto_close = {
    \ "normal": 1,
    \ "compact": 0,
    \}

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

" 20231227
let g:rustfmt_autosave = 1
