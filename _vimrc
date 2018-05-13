"{{{ Base Config
set number
set relativenumber
"remap copy and paste to system copy paste
nnoremap y "+y
vnoremap y "+y
"reset the path when using mkview, the default path will cause problems if
"install vim in c:\ in windows
set viewdir=~/.vim/view
autocmd BufWinEnter _vimrc set foldmethod=marker
"remap leader key
let mapleader = ","
set nohls
set go=
set guioptions+=b
set shiftwidth=4
set tabstop=4
"replace all tab to space
set et
set smarttab
set nocompatible
"enable ctrl c to copy
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
set nobackup
set noswapfile
set encoding=utf-8
set fileencodings=utf-8,gbk,gb2312,big5,latin1
set termencoding=utf-8
language messages zh_CN.utf-8
set ambiwidth=double
"show tabs
"0 never show tabs;1 show tabs when  > 1 tab; 2 always show tabs
set showtabline=1
set guitablabel=%{GuiTabLabel()}
set ignorecase
set smartcase
set nowrapscan
set incsearch
set hlsearch
"disble left and right in insert mode
inoremap <left> <nop>
inoremap <right> <nop>
set cursorcolumn
set nowrap
"}}}

"{{{ Plugins
call plug#begin('~/.vim/plugged')

Plug 'vim-scripts/matchit.zip'
Plug 'vim-scripts/restart.vim'
Plug 'vim-scripts/surround.vim'
Plug 'vim-scripts/Align'
Plug 'vim-scripts/DoxygenToolkit.vim'
Plug 'mhinz/vim-startify'
Plug 'joshdick/onedark.vim'
Plug 'Shougo/vimproc.vim'
Plug 'posva/vim-vue', {'for':'vue'}
Plug 'junegunn/goyo.vim'
Plug 'justinmk/vim-sneak'
Plug 'w0rp/ale'

"{{{ vimfiler
Plug 'Shougo/vimfiler.vim'
nmap <F2> :VimFilerBufferDir -explorer<CR>
"}}}

"{{{ incsearch
Plug 'haya14busa/incsearch.vim'
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
"}}}

"{{{ vim-expand-region
Plug 'terryma/vim-expand-region'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-line'
map <space> <Plug>(expand_region_expand)
let g:expand_region_text_objects = {
            \ 'iw'  :0,
            \ 'iW'  :0,
            \ 'i"'  :0,
            \ 'i''' :0,
            \ 'i>'  :0,
            \ 'i]'  :1,
            \ 'ib'  :1,
            \ 'iB'  :1,
            \ 'il'  :0,
            \ }
"}}}

"{{{ syntastic
"Plugin 'scrooloose/syntastic'
"set statusline+=%#warningmsg#
"set statusline+=%{SyntasticStatuslineFlag()}
"set statusline+=%*

"let g:syntastic_always_populate_loc_list = 1
"let g:syntastic_auto_loc_list = 1
"let g:syntastic_check_on_open = 1
"let g:syntastic_check_on_wq = 0
"let g:syntastic_disabled_filetypes=['html']
"let g:syntastic_enable_signs=1
"let g:syntastic_mode_map = { 'mode': 'active', 'active_filetypes': ['python'], 'passive_filetypes': ['js'] }
"let g:syntastic_python_checkers = ['pyflakes']

"syntastic relies on checkers, like
"python=>pyflaks pip install pyflakes
"js=>jshint: npm install -g jshint
"css=>csslint: npm install -g csslint
"}}}

"{{{ neocomplcache
Plug 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_auto_select = 1
""关闭顶部的自动预览
set completeopt-=preview
"}}}

" {{{ The NERD Commenter
Plug 'vim-scripts/The-NERD-Commenter'
:nmap <C-K><C-C> <leader>c<space>
:imap <C-K><C-C> <Esc><leader>c<space>i
:nmap <C-_> <leader>c<space>
:imap <C-_> <Esc><leader>c<space>i
"}}}

"{{{ vim-airline
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'

if !exists('g:airline_symbols')
    let g:airline_symbols = {}
endif
let g:airline_left_sep = '⮀'
let g:airline_left_alt_sep = '⮁'
let g:airline_right_sep = '⮂'
let g:airline_right_alt_sep = '⮃'
let g:airline_symbols.branch = '⭠'
let g:airline_symbols.readonly = '⭤'
let g:airline_symbols.linenr = '⭡'
let g:airline_symbols.paste = 'Þ'
let g:airline_symbols.whitespace = 'Ξ'
set guifont=Consolas\ for\ Powerline\ FixedD:h12
set t_Co=256
set laststatus=2
"}}}

"{{{unite.vim
Plug 'Shougo/neomru.vim'
Plug 'Shougo/unite.vim'
let g:unite_source_rec_async_command = ['ag', '--follow',  '--nocolor', '--nogroup', '--hidden', '-g', '']

if executable('pt')
    let g:unite_source_grep_command = 'pt'
    let g:unite_source_grep_default_opts = '--nogroup --nocolor -S --column'
    let g:unite_source_grep_recursive_opt = ''
    let g:unite_source_rec_async_command = ['pt', '--nogroup', '--nocolor', '-S', '-g', '.']
endif

nnoremap <C-P> :UniteWithProjectDir -no-split -buffer-name=search -start-insert buffer neomru/file file_rec/async:!<cr>
autocmd FileType unite imap <buffer> <ESC> <Plug>(unite_exit)
"}}}

call plug#end()

"Must called after plugin end
call vimfiler#custom#profile('default', 'context', {
      \ 'explorer' : 1,
      \ 'winwidth' : 50,
      \ 'winminwidth' : 30,
      \ 'toggle' : 1,
      \ 'auto_expand': 1,
      \ 'direction' : 'rightbelow',
      \ 'parent': 1,
      \ 'status' : 1,
      \ 'safe' : 0,
      \ 'split' : 1,
      \ 'hidden': 1,
      \ 'no_quit' : 1,
      \ 'force_hide' : 0,
      \ })
"}}}

    "{{{ Keyboard Mapping

imap <C-J> <C-x><C-o>
nmap <leader>1 :set filetype=xml<cr>
nmap <C-f> gg//g<left><left>

"clear ^M in every line (file format issues)
map <C-m> :%s/\r//g<CR>

"highlight current word while doble clicking
nmap <2-leftmouse> *N
imap <2-leftmouse> <esc>*N

nmap <Leader>o :call OpenFileLocation()<CR>

nmap <C-K><C-D> gg=G

"Ctrl+Tab
imap <C-Tab> <ESC>gt
nmap <C-Tab> gt

nmap <F4> :let @+ = expand("%:p")<CR>

nmap <Tab> <C-w>w

" Switch splits with <C-h> & <C-l>
noremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Set the minimal split width
set winwidth=40
set winminwidth=40
nnoremap <leader>= :call SplitToggle()<cr>

" In the quickfix window, <CR> is used to jump to the error under the cursor, so undefine the mapping there.
autocmd BufReadPost quickfix nnoremap <buffer> <CR> <CR>
autocmd BufReadPost quickfix nnoremap <buffer> <ESC> :q<CR>

"}}}

"{{{ Color
syntax on
colorscheme onedark
"}}}

