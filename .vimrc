set nocompatible
filetype off

let $PATH = $PATH . ':' . expand("~/.local/bin")

call plug#begin('~/.vim/plugged')

Plug 'jlanzarotta/bufexplorer'
Plug 'Shougo/vimproc.vim'
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-surround'
Plug 'neomake/neomake'
Plug 'scrooloose/nerdtree'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-unimpaired'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'nanotech/jellybeans.vim'
Plug 'terryma/vim-multiple-cursors'
Plug 'tpope/vim-fugitive'
Plug 'vim-airline/vim-airline'
Plug 'tpope/vim-dispatch'
Plug 'majutsushi/tagbar'
Plug 'godlygeek/tabular'
Plug 'othree/html5.vim'
Plug 'digitaltoad/vim-jade'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go'
Plug 'jimenezrick/vimerl'
Plug 'rust-lang/rust.vim'
Plug 'facebook/vim-flow'
Plug '2072/PHP-Indenting-for-VIm'
Plug 'shawncplus/phpcomplete.vim'
" Plug 'joonty/vdebug'
Plug 'tpope/vim-ragtag'
Plug 'eagletmt/ghcmod-vim'
Plug 'neovimhaskell/haskell-vim'

Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'pangloss/vim-javascript'
Plug 'moll/vim-node'
Plug 'mattn/emmet-vim'

Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'

Plug 'Valloric/MatchTagAlways'

Plug 'nathanaelkane/vim-indent-guides'
Plug 'plasticboy/vim-markdown'

Plug 'tpope/vim-haml'
Plug 'tpope/vim-git'

Plug 'vim-ruby/vim-ruby'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-bundler'

Plug 'tpope/vim-endwise'
Plug 'Shougo/vimshell.vim'

Plug 'guns/vim-clojure-static'
Plug 'tpope/vim-leiningen'
Plug 'tpope/vim-classpath'
Plug 'tpope/vim-fireplace'
Plug 'venantius/vim-eastwood'

Plug 'vim-scripts/paredit.vim'
Plug 'wlangstroth/vim-racket'

Plug 'stephpy/vim-yaml'

Plug 'chrisbra/csv.vim'
Plug 'ekalinin/Dockerfile.vim'

call plug#end()

let mapleader=","

" Sets how many lines of history VIM has to remember
set history=500

" Configure backspace so it acts as it should act
set backspace=eol,start,indent

" enhanced command completion
set wildmenu

set visualbell

if has('mouse')
  set mouse=a
endif

" Don't redraw while executing macros (good performance config)
set lazyredraw

set cursorline
set hidden
set nofoldenable
set clipboard=unnamed
set nowrap
set number
set hlsearch
set ignorecase
set smartcase

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set autoindent
set expandtab
set softtabstop=2
set shiftwidth=2

set background=dark
set t_Co=256
colorscheme jellybeans

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 0
let g:syntastic_auto_loc_list = 0
let g:syntastic_check_on_open = 0
let g:syntastic_aggregate_errors = 1

let g:syntastic_check_on_wq = 0

let g:jsx_ext_required = 0

" let g:slime_target = "tmux"

let g:vim_json_syntax_conceal = 0

let g:easytags_async = 1

" Automatically removing all trailing whitespace
autocmd BufWritePre * :%s/\s\+$//e

let g:buffergator_viewport_split_policy = "B"
let g:buffergator_sort_regime = "mru"

let g:vim_markdown_folding_disabled = 1

let g:neomake_javascript_enabled_makers = ['eslint', 'flow']
let g:neomake_ruby_enabled_makers = ['rubocop']
let g:neomake_json_enabled_makers = ['jsonlint']
let g:neomake_css_enabled_makers = ['stylelint']
let g:neomake_scss_stylelint_maker = {
      \ 'errorformat':
      \ '%+P%f,' .
      \ '%*\s%l:%c  %t  %m,' .
      \ '%-Q'
\ }
let g:neomake_scss_enabled_makers = ['stylelint']
let g:neomake_html_enabled_makers = ['tidy']
let g:neomake_haml_enabled_makers = ['hamllint']
let g:neomake_jade_enabled_makers = ['jadelint']
let g:neomake_elang_enabled_makers = ['erlc']
let g:neomake_haskell_enabled_makers = ['ghc-mod']
let g:neomake_go_enabled_makers = ['golint']
let g:neomake_php_enabled_makers = ['php']
" let g:neomake__enabled_makers = ['']

nmap <F8> :TagbarToggle<CR>

" Toggle paste mode
nmap <silent> <F4> :set invpaste<CR>:set paste?<CR>
imap <silent> <F4> <ESC>:set invpaste<CR>:set paste?<CR>

" format the entire file
nnoremap <leader>fef :normal! gg=G``<CR>

" set text wrapping toggles
nmap <silent> <leader>tw :set invwrap<CR>:set wrap?<CR>

" find merge conflict markers
nmap <silent> <leader>fc <ESC>/\v^[<=>]{7}( .*\|$)<CR>

" upper/lower word
nmap <leader>u mQviwU`Q
nmap <leader>l mQviwu`Q

nmap <C-\> :NERDTreeFind<CR>
nmap <silent> <leader><leader> :NERDTreeToggle<CR>

let NERDTreeIgnore = ['\.pyc$', '\.retry$']

let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']

nmap <silent> // :nohlsearch<CR>
noremap ,hl :set hlsearch! hlsearch?<CR>

" Allows you to enter sudo pass and save the file
" " when you forgot to open your file with sudo
cmap w!! %!sudo tee > /dev/null %

" Allow to copy/paste between VIM instances
" "copy the current visual selection to ~/.vbuf
vmap <Leader>y :w! ~/.vbuf<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! ~/.vbuf<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r ~/.vbuf<CR>

" Map ctrl-movement keys to window switching
map <C-k> <C-w><Up>
map <C-j> <C-w><Down>
map <C-l> <C-w><Right>
map <C-h> <C-w><Left>
nnoremap <silent> <bs> <C-w><Left>

let g:bufExplorerDisableDefaultKeyMapping=1
let g:bufExplorerShowRelativePath=1
nnoremap <leader>b :BufExplorer<CR>

au BufRead,BufNewFile {Vagrantfile,Gemfile,Capfile} set ft=ruby

autocmd Filetype php setlocal ts=4 sw=4 autoindent
autocmd! BufWritePost,BufEnter * Neomake
