" Plugins — via vim-plug
" -----------------------------------------------------------------------------
call plug#begin('~/.vim/plugged')
Plug 'altercation/vim-colors-solarized'
Plug 'benekastah/neomake'
Plug 'easymotion/vim-easymotion'
Plug 'elzr/vim-json', { 'for': 'json' }
Plug 'fs111/pydoc.vim' "pydocs in vim
Plug 'hail2u/vim-css3-syntax', { 'for': 'css' }
Plug 'hdima/python-syntax', { 'for': 'python' } "python code highlighting
Plug 'jelera/vim-javascript-syntax', { 'for': 'javascript' }
Plug 'jmcantrell/vim-virtualenv' "virtualenv
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim' "clean up ui
Plug 'junegunn/gv.vim' "git commit browser
Plug 'powerline/powerline', "{'rtp': 'powerline/bindings/vim/'}
Plug 'nvie/vim-flake8' "pep8 check
Plug 'matze/vim-move' "move blocks of text
Plug 'mhinz/vim-signify' "show differences
" Plug 'morhetz/gruvbox' "color scheme
Plug 'othree/html5.vim', { 'for': 'html' }
Plug 'othree/yajs.vim', { 'for': 'javascript' }
Plug 'Raimondi/delimitMate' "auto closing of quotes, parenthesis and brackets
Plug 'scrooloose/syntastic' "syntax check
Plug 'Shougo/deoplete.nvim' "autocomplete requires neovim
Plug 'tmhedberg/SimpylFold' "folding, za
Plug 'tpope/vim-commentary' "autocomment, line: gcc, visual: gc
Plug 'tpope/vim-fugitive' "git wrapper, powerful
Plug 'tpope/vim-surround' "change surrounding. ex: ' to <p>, cs'<p>
Plug 'tpope/vim-vinegar' "directory browser. '-' to view directory and go up directory, 'I' to view hints
" Plug 'Valloric/YouCompleteMe' "autocompletion
Plug 'vim-airline/vim-airline' "powerline alternative
Plug 'vim-airline/vim-airline-themes' "powerline alternative
Plug 'vim-scripts/indentpython.vim' "python indentation

call plug#end()
"Plug 'alfredodeza/pytest.vim'
"Plug 'ervandew/supertab' "tab completion
"Plug 'lambdalisue/vim-gista' "for gists
" Plug 'plasticboy/vim-markdown', { 'for': 'markdown' }


" Basics
" -----------------------------------------------------------------------------
" set clipboard=unnamedplus "linux
set clipboard=unnamed "for osx, so yy and pp work
set cursorline
set expandtab
set foldmethod=indent
set foldlevel=99
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
" colorscheme gruvbox
" let g:solarized_termcolors=256 "shouldn't be necessary for solarized theme
" in iterm
set background=dark
colorscheme solarized

let mapleader = "\<Space>"

" Better indenting for JS inside <script> tags
let g:html_indent_inctags = "html,body,head,tbody,script"
let g:html_indent_script1 = "inc"
let g:html_index_style1 = "inc"

" flake8 in gutter
autocmd BufWritePost *.py call Flake8()
let g:flake8_show_in_gutter=1

" python highlighting
let python_highlight_all=1
syntax on

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
" move between splits
nnoremap <C-K> <C-W><C-K>
nnoremap <C-J> <C-W><C-J>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>
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
" move to the start|end of a line
noremap H ^
noremap L $
" never enter :ex mode
nnoremap Q <nop>

" nnoremap <leader>g :Gista list<cr>

" run Pytest
" nmap <silent><Leader>t <Esc>:Pytest file verbose<CR>
" nmap <silent><Leader>T <Esc>:Pytest file verbose --pdb<CR>

" more sane regex searching
" nnoremap / /\v
" xnoremap / /\v

" make it easier to jump from the beginning and end of a tag.
" nnoremap <tab> %
" vnoremap <tab> %

" break a line at the cursor
" imap <C-c> <CR><Esc>O

" recognize (and highlight) esoteric filetypes
au BufRead,BufNewFile *.geojson set filetype=javascript
au BufRead,BufNewFile *.glsl set filetype=javascript
au BufRead,BufNewFile *.es6 set filetype=javascript
au BufRead,BufNewFile *.template set filetype=json

" check syntax on save
autocmd! BufWritePost * Neomake
autocmd! BufWritePost init.vim source $MYVIMRC

" pep8 indentation
au BufNewFile,BufRead *.py
    \ set tabstop=4
    \ set softtabstop=4
    \ set shiftwidth=4
    \ set textwidth=79
    \ set expandtab
    \ set autoindent
    \ set fileformat=unix

" indentation for for other files
au BufNewFile,BufRead *.js, *.html, *.css
    \ set tabstop=2
    \ set softtabstop=2
    \ set shiftwidth=2

" Plugin configs
" -----------------------------------------------------------------------------
" vim-move
" change modifier from ALT to CONTROL
let g:move_key_modifier = 'C'
" enable true color support in neovim
let NVIM_TUI_ENABLE_TRUE_COLOR=1
let NVIM_TUI_ENABLE_CURSOR_SHAPE=1
" vim-signify
let g:signify_vcs_list = [ 'git' ]
let g:signify_sign_show_count = 0
" neomake
let g:neomake_error_sign = {
    \ 'text': '✖',
    \ 'texthl': 'ErrorMsg',
    \ }
" vim-pydoc
let g:pydoc_cmd = "/usr/bin/pydoc"
" SimpylFold, show docstrings on fold
let g:SimpylFold_docstring_preview=1
" airplane
set laststatus=2    "show airplane always
let g:airline_theme='solarized'
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tabline#enabled = 1    "show buffers
let g:airline#extensions#hunks#enabled = 0
let g:airline#extensions#virtualenv#enabled = 1
let g:airline#extensions#whitespace#enabled = 0
" vim-markdown
" let g:vim_markdown_folding_disabled=1  " Disable folding of Markdown files
" vim-gista
" let g:gista#github_user = 'bm5w'
