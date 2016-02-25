" Plugins — via vim-plug
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
"Plug 'alfredodeza/pytest.vim'
"Plug 'benekastah/neomake'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json', { 'for': 'json' }
"Plug 'ervandew/supertab' "tab completion
"Plug 'fs111/pydoc.vim' "pydocs in vim
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'hdima/python-syntax', { 'for': 'python' } "python code highlighting
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
"Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
"Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim' "clean up ui
Plug 'junegunn/gv.vim' "git commit browser
"Plug 'lambdalisue/vim-gista' "for gists
Plug 'matze/vim-move' "move blocks of text
Plug 'mhinz/vim-signify' "show differences
Plug 'morhetz/gruvbox' "color scheme
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }
Plug 'Raimondi/delimitMate' "auto closing of quotes, parenthesis and brackets
Plug 'Shougo/deoplete.nvim' "autocomplete requires neovim
Plug 'tpope/vim-commentary' "autocomment, line: gcc, visual: gc
Plug 'tpope/vim-fugitive' "git wrapper, powerful
Plug 'tpope/vim-surround' "change surrounding. ex: ' to <p>, cs'<p>
Plug 'tpope/vim-vinegar' "directory browser. '-' to view directory and go up directory, 'I' to view hints
call plug#end()


" Basics
" -----------------------------------------------------------------------------
set background=dark
set clipboard+=unnamedplus
set cursorline
set expandtab
set foldmethod=manual
set formatoptions=qrn1
set hidden
set ignorecase
set laststatus=1
set listchars=eol:¬,extends:…,precedes:…,tab:\ \ 
set modelines=0
set mouse=a
set nobackup
set noswapfile
set nowritebackup
set relativenumber
set ruler
set scrolloff=5
set shiftwidth=4
set smartcase
set softtabstop=4
set splitright
set statusline=%f%{fugitive#statusline()}
set synmaxcol=400  " No highlighting beyond 400 columns
set tabstop=4
set undodir=~/.vim/undodir
set undofile
set visualbell
set wildignore+=node_modules
set wildmode=list:longest
set wrap

syntax enable
colorscheme gruvbox

let mapleader = "\<Space>"

" Better indenting for JS inside <script> tags
let g:html_indent_inctags = "html,body,head,tbody,script"
let g:html_indent_script1 = "inc"
let g:html_index_style1 = "inc"

" fix fish shell compat with vim, necessary for vim-signify
set shell=/bin/bash

" Rebinds
" -----------------------------------------------------------------------------
nnoremap ; :
" save & quit
nnoremap <silent><leader>w :w<CR>
nnoremap <silent><leader>W :wa<CR>
nnoremap <silent><leader>q :q<CR>
nnoremap <silent><leader>Q :qa<CR>
" de-highlight
nnoremap <silent> <leader>x :noh<cr>
" reload vim configuration
nnoremap <silent><leader>r :source $MYVIMRC<CR>
" shortcuts for junnegun's plugins
nnoremap <leader>c :Commits<CR>
nnoremap <leader>f :Files<CR>
nnoremap <leader>l :GV<CR>
" toggle minimal-mode
nnoremap <leader>z :Goyo<cr>
nnoremap <leader>g :Gista list<cr>
" run Pytest
" nmap <silent><Leader>t <Esc>:Pytest file verbose<CR>
" nmap <silent><Leader>T <Esc>:Pytest file verbose --pdb<CR>
" move between splits
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
" move to the start|end of a line
noremap H ^
noremap L $
" more sane regex searching
" nnoremap / /\v
" xnoremap / /\v
" make it easier to jump from the beginning and end of a tag.
" nnoremap <tab> %
" vnoremap <tab> %
" break a line at the cursor
" imap <C-c> <CR><Esc>O
" never enter :ex mode
nnoremap Q <nop>

" recognize (and highlight) esoteric filetypes
au BufRead,BufNewFile *.geojson set filetype=javascript
au BufRead,BufNewFile *.glsl set filetype=javascript
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.template set filetype=json

" check syntax on save
"autocmd! BufWritePost * Neomake
"autocmd! BufWritePost init.vim source $MYVIMRC


" Plugin configs
" -----------------------------------------------------------------------------
" vim-move
" change modifier from ALT to CONTROL
let g:move_key_modifier = 'C'
" enable true color support in neovim
let NVIM_TUI_ENABLE_TRUE_COLOR=1
let NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" vim-markdown
" let g:vim_markdown_folding_disabled=1  " Disable folding of Markdown files
" vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_show_count = 0
" vim-gista
let g:gista#github_user = 'bm5w'
" neomake
"let g:neomake_error_sign = {
"    \ 'text': '✖',
"    \ 'texthl': 'ErrorMsg',
"    \ }
" vim-pydoc
let g:pydoc_cmd = "/usr/bin/pydoc"

