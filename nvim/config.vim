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
set updatetime=100
" 2023-03-29 note: "enable mouse reporting" in iterm2 -> Terminal prefs
set mouse=a
set number
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

" neovim :checkhealth suggestions
let g:python3_host_prog = "/Users/dlchudnov/.pyenv/versions/3.12.3/envs/py312-neovim/bin/python"
let g:loaded_perl_provider = 0
let g:loaded_ruby_provider = 0

" switch between splits
nmap <silent> <c-k> :wincmd k<CR>
nmap <silent> <c-j> :wincmd j<CR>
nmap <silent> <c-h> :wincmd h<CR>
nmap <silent> <c-i> :wincmd i<CR>

" TODO: replace tagbar or use lua
nnoremap <silent> T :TagbarToggle<CR>
let g:tagbar_compact = 1
let g:tagbar_show_tag_linenumbers = 1
let g:tagbar_wrap = 1
" 20240416 add tsx for tagbar
" https://github.com/preservim/tagbar/wiki#typescript
let g:tagbar_type_typescript = {
  \ 'ctagstype': 'typescript',
  \ 'kinds': [
    \ 'c:classes',
    \ 'n:modules',
    \ 'f:functions',
    \ 'v:variables',
    \ 'v:varlambdas',
    \ 'm:members',
    \ 'i:interfaces',
    \ 'e:enums',
  \ ]
\ }

" TODO: same w/gutentags
let g:gutentags_cache_dir = "~/.tags_cache"
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

