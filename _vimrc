"{{{ Custom Functions

" Using <leader>=, toggle the width of the current split. If it's set to 999, it
" takes up as much space as possible, without pushing the other ones under 60
" columns. The other option makes sure all splits are equally wide.
function! SplitToggle()
    if(&winwidth == &winminwidth)
        set winwidth=999
    else
        set winwidth=40
        wincmd =
    endif
endfunc

function OpenFileLocation()
    if ( expand("%") != "" )  
        execute "!start explorer /select, %"   
    else  
        execute "!start explorer /select, %:p:h"  
    endif  
endfunction

function! NTFinderP()
    "" Check if NERDTree is open
    if exists("t:NERDTreeBufName")
        let s:ntree = bufwinnr(t:NERDTreeBufName)
    else
        let s:ntree = -1
    endif

    if (s:ntree != -1)
        "" If NERDTree is open, focus it.
        :NERDTreeClose
    else
        "" Open NERDTree in the file path
        :NERDTreeFind
    endif
endfunction

"}}}

"{{{ Base Config
set number
set relativenumber
"remap copy and paste to system copy paste
nnoremap y "+y
vnoremap y "+y
"reset the path when using mkview, the default path will cause problems if
"install vim in c:\ in windows
set viewdir=~/.vim/view
"记录文件状态（包括独立于该文件的键盘映射、代码折叠状态等）：
"autocmd BufWinLeave *.* if expand('%') != '' && &buftype == '' | mkview | endif
"autocmd BufWinEnter *.* if expand('%') != '' && &buftype == '' | silent loadview | endif
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
filetype off
set rtp+=$HOME/.vim/bundle/Vundle.vim
"此处规定插件的安装路径
call vundle#rc('$HOME/.vim/bundle')
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'

"{{{ General
Plugin 'matchit.zip' 
Plugin 'restart.vim'
Plugin 'surround.vim'
Plugin 'Align'
Plugin 'DoxygenToolkit.vim'

"{{{ vim-expand-region 
Plugin 'terryma/vim-expand-region'
Plugin 'kana/vim-textobj-user'
Plugin 'kana/vim-textobj-line'
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

"{{{ctrlp
Plugin 'kien/ctrlp.vim'
let g:ctrlp_regexp = 1
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
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
Plugin 'Shougo/neocomplcache.vim'
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_enable_ignore_case = 1
let g:neocomplcache_enable_auto_select = 1
""关闭顶部的自动预览
set completeopt-=preview
"}}}

" {{{ The NERD Commenter
Plugin 'The-NERD-Commenter'
:nmap <C-K><C-C> <leader>c<space>
:imap <C-K><C-C> <Esc><leader>c<space>i
:nmap <C-_> <leader>c<space>
:imap <C-_> <Esc><leader>c<space>i
"}}}

"{{{ vim-airline
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

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

" {{{ Nerd Tree
Plugin 'The-NERD-tree'
"Plugin 'jistr/vim-nerdtree-tabs'
map <silent> <C-\> :call NTFinderP()<CR>
"}}}

"}}}

"{{{ C#
Plugin 'OrangeT/vim-csharp'
"}}}

"{{{ Go
au FileType go nmap <F5> <Plug>(go-run)
Plugin 'fatih/vim-go'
"}}}

"{{{ Python
autocmd BufRead *.py set tabstop=4
autocmd BufRead *.py nmap <F5> :!

Plugin 'davidhalter/jedi-vim'
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
autocmd FileType python setlocal completeopt-=preview
"}}}

"{{{ Javascript 
Plugin 'pangloss/vim-javascript'
au FileType javascript set foldmethod=syntax
"}}}

call vundle#end()            " required
filetype plugin indent on    " required
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

"{{{ Custom commands

"格式化JSON
:command Json :%!python -m json.tool

"}}}

"{{{ UI

colo desert

"{{{ Color
set background=dark
highlight clear

if exists("syntax_on")
    syntax reset
endif

let g:colors_name = "Monokai-Refined"

hi SignColumn ctermfg=234 ctermbg=231 cterm=NONE guifg=NONE guibg=#373736 gui=NONE
hi Cursor ctermfg=234 ctermbg=231 cterm=NONE guifg=#212121 guibg=#f8f8f0 gui=NONE
hi Visual ctermfg=NONE ctermbg=238 cterm=NONE guifg=NONE guibg=#444444 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#373736 gui=NONE
hi CursorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#373736 gui=NONE
hi ColorColumn ctermfg=NONE ctermbg=59 cterm=NONE guifg=NONE guibg=#373736 gui=NONE
hi LineNr ctermfg=245 ctermbg=59 cterm=NONE guifg=#B3B3B2 guibg=#373736 gui=NONE
hi VertSplit ctermfg=59 ctermbg=59 cterm=NONE guifg=#5f5f5e guibg=#5f5f5e gui=NONE
hi MatchParen ctermfg=197 ctermbg=238 cterm=bold guifg=#f92672 guibg=#444444 gui=bold
hi StatusLine ctermfg=231 ctermbg=59 cterm=bold guifg=#f8f8f2 guibg=#5f5f5e gui=bold
hi StatusLineNC ctermfg=231 ctermbg=59 cterm=NONE guifg=#f8f8f2 guibg=#5f5f5e gui=NONE
"更改选择monibox提示中的颜色
hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#75BAFF guibg=NONE gui=NONE
hi PmenuSel ctermfg=NONE ctermbg=238 cterm=NONE guifg=#f92672 guibg=#222222 gui=NONE
hi IncSearch ctermfg=NONE ctermbg=53 cterm=NONE guifg=NONE guibg=#C14471 gui=NONE
hi Search ctermfg=NONE ctermbg=53 cterm=NONE guifg=NONE guibg=#C14471 gui=NONE
hi Directory ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Folded ctermfg=95 ctermbg=234 cterm=NONE guifg=#75BAFF guibg=#212121 gui=NONE

hi Normal ctermfg=231 ctermbg=234 cterm=NONE guifg=#f8f8f2 guibg=#212121 gui=NONE
hi Boolean ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Character ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Comment ctermfg=95 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi Conditional ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi Constant ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Define ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi DiffAdd ctermfg=231 ctermbg=64 cterm=bold guifg=#f8f8f2 guibg=#45820b gui=bold
hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8a0707 guibg=NONE gui=NONE
hi DiffChange ctermfg=231 ctermbg=23 cterm=NONE guifg=#f8f8f2 guibg=#213654 gui=NONE
hi DiffText ctermfg=231 ctermbg=24 cterm=bold guifg=#f8f8f2 guibg=#204a87 gui=bold
hi ErrorMsg ctermfg=231 ctermbg=197 cterm=bold guifg=#f8f8f0 guibg=NONE gui=bold
hi WarningMsg ctermfg=231 ctermbg=197 cterm=bold guifg=#f8f8f0 guibg=#f92672 gui=bold
hi Float ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Function ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi Identifier ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi Keyword ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi Label ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi NonText ctermfg=59 ctermbg=235 cterm=NONE guifg=#3b3a32 guibg=#2c2c2b gui=NONE
hi Number ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi Operator ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi PreProc ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi Special ctermfg=231 ctermbg=NONE cterm=NONE guifg=#f8f8f2 guibg=NONE gui=NONE
hi SpecialKey ctermfg=59 ctermbg=59 cterm=NONE guifg=#3b3a32 guibg=#373736 gui=NONE
hi Statement ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi StorageClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi String ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi Tag ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi Title ctermfg=231 ctermbg=NONE cterm=bold guifg=#f8f8f2 guibg=NONE gui=bold
hi Todo ctermfg=95 ctermbg=NONE cterm=bold guifg=#F92626 guibg=NONE gui=inverse,bold,NONE
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
hi rubyClass ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi rubyFunction ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi rubyInterpolationDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubySymbol ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi rubyConstant ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyStringDelimiter ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyBlockParameter ctermfg=208 ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=NONE
hi rubyInstanceVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyInclude ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi rubyGlobalVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRegexp ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyRegexpDelimiter ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi rubyEscape ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi rubyControl ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi rubyClassVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyOperator ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi rubyException ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi rubyPseudoVariable ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi rubyRailsUserClass ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsARAssociationMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsARMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsRenderMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi rubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi erubyDelimiter ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi erubyComment ctermfg=95 ctermbg=NONE cterm=NONE guifg=#75715e guibg=NONE gui=NONE
hi erubyRailsMethod ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi htmlTag ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi htmlEndTag ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi htmlTagName ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi htmlArg ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi htmlSpecialChar ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi javaScriptFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi javaScriptFuncName ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi javaScriptRailsFunction ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi javaScriptBraces ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi javaScriptValue ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi yamlKey ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi yamlAnchor ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlAlias ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi yamlDocumentHeader ctermfg=186 ctermbg=NONE cterm=NONE guifg=#e6db74 guibg=NONE gui=NONE
hi cssURL ctermfg=208 ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=NONE
hi cssImportant ctermfg=208 ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=NONE
hi cssFunctionName ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssColor ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssPseudoClassId ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssClassName ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssValueLength ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi cssDefinition ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssCommonAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssUIAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssFontAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssTextAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssBoxAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssTableAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssRenderAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssColorAttr ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi cssBraces ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssPseudoClass ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssAttributeSelector ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi cssValueLength ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi scssIdChar ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi scssClassChar ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi scssId ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi scssClass ctermfg=148 ctermbg=NONE cterm=NONE guifg=#a6e22e guibg=NONE gui=NONE
hi scssAmpersand ctermfg=197 ctermbg=NONE cterm=bold guifg=#f92672 guibg=NONE gui=bold
hi scssNestedProperty ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
hi scssVariable ctermfg=208 ctermbg=NONE cterm=NONE guifg=#fd971f guibg=NONE gui=NONE
hi scssVariableValue ctermfg=141 ctermbg=NONE cterm=NONE guifg=#ae81ff guibg=NONE gui=NONE
hi scssColor ctermfg=81 ctermbg=NONE cterm=NONE guifg=#66d9ef guibg=NONE gui=NONE
"}}}

"}}}
