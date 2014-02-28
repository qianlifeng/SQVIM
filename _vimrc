"{{{ 自定义函数

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
        "" If NERDTree is open, close it.
        :NERDTreeClose
    else
        "" Try to open a :Rtree for the rails project
        if exists(":Rtree")
            "" Open Rtree (using rails plugin, it opens in project dir)
            :Rtree
        else
            "" Open NERDTree in the file path
            :NERDTreeFind
        endif
    endif
endfunction

"}}}

"{{{ 基础配置
"映射y为系统剪切板
nnoremap y "+y
vnoremap y "+y
"重新设置mkview时候的保存路径，在win7上如果安装在C盘的话可能出现保存不了的情况
set viewdir=~/.vim/view
"记录文件状态（包括独立于该文件的键盘映射、代码折叠状态等）：
autocmd BufWinLeave *.* if expand('%') != '' && &buftype == '' | mkview | endif
autocmd BufWinEnter *.* if expand('%') != '' && &buftype == '' | silent loadview | endif
autocmd BufWinEnter _vimrc set foldmethod=marker
"忽略搜索时候的大小写
set ic
"重新设置leader key
let mapleader = ","
"不需要高亮
set nohls
"不产生备份文件
set nobackup 
"不产生swp文件
set noswapfile
"不要图像按钮
set go=
"显示滚动条
set guioptions+=b
"开启行号
set number
"开启自动缩进, 7.3以上版本已自动开启
set autoindent
"缩进宽度为4个字符
set shiftwidth=4
"tab宽度为4个字符
set tabstop=4
"编辑时将所有tab替换为空格
set et
"按一次Backspace就删除4个空格
set smarttab
"配色方案
colo desert
"开启语法高亮, 7.3版本已自动开启
syntax on
"关闭兼容模式
set nocompatible
"以下三行模拟Windows操作，如Ctrl-C复制
source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin
"不生成备份文件，下面这句要写在behave mswin下面，否则还是会生成备份，不知为何～
set nobackup
"GVIM内部编码
set encoding=utf-8
"当前编辑的文件编码
"GVIM支持打开的文件编码
set fileencodings=utf-8,gbk,gb2312,big5,latin1
set termencoding=utf-8
"解决菜单及右键菜单乱码
"source $VIMRUNTIME/delmenu.vim
"source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8
"防止特殊符号无法正常显示，如五角星等
set ambiwidth=double
"设置折叠方式
"set foldmethod=marker
"多个文件打开时用tab显示,0永远不显示 1两个以上显示 2 永远显示
set showtabline=1
"set guitablabel=%{GuiTabLabel()}
set guitablabel=%t
" 搜索时忽略大小写，但在有一个或以上大写字母时仍大小写敏感
set ignorecase
set smartcase
" 搜索到文件两端时不重新搜索
set nowrapscan
" 实时搜索
set incsearch
" 搜索时高亮显示被找到的文本
set hlsearch
"插入状态下禁用方向键
"MRU和acp的时候需要上下选择
"inoremap <up> <nop>
"inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
"当前行对齐线
set cursorcolumn
"设置不自动折行
:set nowrap 
"}}}

"{{{ 插件配置

" {{{ 插件名：Vundle
"     项目地址：https://github.com/gmarik/vundle
"     作用：
"   
"           管理插件安装
"required
filetype off
"此处规定Vundle的路径
set rtp+=$HOME/.vim/bundle/vundle
"此处规定插件的安装路径
call vundle#rc('$HOME/.vim/bundle')
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" required!
"}}}

"插件列表
Bundle 'matchit.zip' 
Bundle 'restart.vim'
Bundle 'mattn/emmet-vim'

"{{{ Python 插件
Bundle 'davidhalter/jedi-vim'
let g:jedi#popup_select_first = 0
let g:jedi#popup_on_dot = 0
"}}}

"{{{ c#自动完成
"Bundle 'tpope/vim-dispatch'
"Bundle 'nosami/Omnisharp'
""move the preview window (code documentation) to the bottom of the screen, so it doesn't move the code!
"set splitbelow
""Set the type lookup function to use the preview window instead of the status line
"let g:OmniSharp_typeLookupInPreview = 1
""don't autoselect first item in omnicomplete, show if only one item (for preview)
"set completeopt=longest,menuone,preview
""Showmatch significantly slows down omnicomplete
""when the first match contains parentheses.
"set noshowmatch
"" Builds can run asynchronously with vim-dispatch installed
"nnoremap <F5> :wa!<cr>:OmniSharpBuildAsync<cr>
"nnoremap gd :OmniSharpGotoDefinition<cr>
""Don't ask to save when changing buffers (i.e. when jumping to a type definition)
"set hidden
"}}}

Bundle 'terryma/vim-multiple-cursors'
"自动注释工具
Bundle 'DoxygenToolkit.vim'
let g:DoxygenToolkit_authorName="qianlifeng"
let g:doxygen_enhanced_color=1

Bundle "surround.vim"
Bundle 'Align'
Bundle 'honza/vim-snippets'

"{{{ vim-expand-region 
Bundle 'terryma/vim-expand-region'
Bundle 'kana/vim-textobj-user'
Bundle 'kana/vim-textobj-line'
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

Bundle 'groenewege/vim-less'

"{{{ Javascript 
Bundle 'pangloss/vim-javascript'
au FileType javascript set foldmethod=syntax
"}}}

"{{{ EasyGrep 
Bundle 'EasyGrep'
"Only search in current file by default
let g:EasyGrepDefaultUserPattern = '%'
let g:EasyGrepMode = 3
"}}}

"{{{ ctrlp
Bundle 'kien/ctrlp.vim'
"MRU default 
let g:ctrlp_map = '<F2>'
let g:ctrlp_regexp = 1
let g:ctrlp_cmd = 'CtrlPMRU'
let g:ctrlp_custom_ignore = '\.git$\|\.hg$\|\.svn$\|.rvm$'
"let g:ctrlp_working_path_mode=0
let g:ctrlp_match_window_bottom=1
let g:ctrlp_max_height=15
let g:ctrlp_match_window_reversed=0
let g:ctrlp_mruf_max=500
let g:ctrlp_follow_symlinks=1
"}}}

"{{{ Vim-markdown
"注意注释该插件下面的ftpplugin中的markdown折叠功能
Bundle 'plasticboy/vim-markdown'
let g:vim_markdown_folding_disabled=1
"}}}

"{{{ syntastic 语法检查，支持N多语言，真是无敌了
Bundle 'scrooloose/syntastic'
"let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
let g:syntastic_mode_map = { 'mode': 'passive' }
"需要提前安装好各种检查器，比如
"js依赖于jshint: npm install -g jshint
"css依赖于csslint: npm install -g csslint
"}}}

"{{{ vim-numbertoggle 相对行号
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
"非要设置个快捷键，设置一个不常用的
let g:NumberToggleTrigger='<C-F2>'  
"}}}

"{{{ neocomplcache 自动补全
"陆陆续续用了很多自动补全插件，这款还是不错的，速度很快
Bundle 'Shougo/neocomplcache.vim'
"启用了以后会不能选中文字
"Bundle 'Shougo/neosnippet'
"" Plugin key-mappings.
"imap <C-k>     <Plug>(neosnippet_expand_or_jump)
"smap <C-k>     <Plug>(neosnippet_expand_or_jump)
"xmap <C-k>     <Plug>(neosnippet_expand_target)

"自动完成映射为Ctrl+J
imap <C-J> <C-X><C-u>
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
"let g:neocomplcache_enable_auto_close_preview = 0
let g:neocomplcache_force_overwrite_completefunc = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
" Enable heavy omni completion, which require computational power and may stall the vim. 
"if !exists('g:neocomplcache_omni_patterns')
  "let g:neocomplcache_omni_patterns = {}
"endif
"let g:neocomplcache_omni_patterns.cs = '.*'
"}}}

"{{{ rainbow_parentheses 括号显示增强
Bundle 'kien/rainbow_parentheses.vim'
let g:rbpt_colorpairs = [
            \ ['brown',       'RoyalBlue3'],
            \ ['Darkblue',    'SeaGreen3'],
            \ ['darkgray',    'DarkOrchid3'],
            \ ['darkgreen',   'firebrick3'],
            \ ['darkcyan',    'RoyalBlue3'],
            \ ['darkred',     'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['brown',       'firebrick3'],
            \ ['gray',        'RoyalBlue3'],
            \ ['black',       'SeaGreen3'],
            \ ['darkmagenta', 'DarkOrchid3'],
            \ ['Darkblue',    'firebrick3'],
            \ ['darkgreen',   'RoyalBlue3'],
            \ ['darkcyan',    'SeaGreen3'],
            \ ['darkred',     'DarkOrchid3'],
            \ ['red',         'firebrick3'],
            \ ]
let g:rbpt_max = 16
let g:rbpt_loadcmd_toggle = 0
au VimEnter * RainbowParenthesesToggle
au Syntax   * RainbowParenthesesLoadRound
au Syntax   * RainbowParenthesesLoadSquare
au Syntax   * RainbowParenthesesLoadBraces
"}}}

" {{{ The NERD Commenter 用于代码注释
" 这里使用的绑定快捷键同VS
Bundle 'The-NERD-Commenter'
:nmap <C-K><C-C> <leader>c<space>
:imap <C-K><C-C> <Esc><leader>c<space>i
:nmap <C-K><C-U> <leader>c<space>
:imap <C-K><C-U> <Esc><leader>c<space>i

"}}}

" {{{ Tagbar 函数列表显示 
Bundle 'majutsushi/tagbar'
"js support:
"   1. git clone --recursive https://github.com/mozilla/doctorjs.github
"   2. add tool/jsctags.bat to path (need to change some variables inside it)
nmap <silent><F10> :TagbarToggle<CR>
"}}}

" {{{ PowerLine
Bundle 'Lokaltog/vim-powerline'
Bundle 'eugeneching/consolas-powerline-vim'
"字体设置,先到到tool下安装consolas字体
set guifont=Consolas\ for\ Powerline\ FixedD:h11
set laststatus=2
set encoding=utf-8
set t_Co=256
let g:Powerline_symbols = 'fancy'
"}}}

" {{{ Nerd Tree  树形目录结构
Bundle 'The-NERD-tree'
map <silent> <F11> :call NTFinderP()<CR>
"}}}

"{{{ vbnet.vim 
Bundle 'vbnet.vim'
autocmd BufNewFile,BufRead *.vb set ft=vbnet
"}}}

"{{{ EasyMotion
Bundle 'qianlifeng/vim-easymotion'
let g:EasyMotion_leader_key = '<Leader>' 
nmap <leader><leader> <leader>f
"}}}

"{{{ coffee script
"默认竖着显示
"有个问题需要解决：注释 ftpplugin\coffee.vim 中的第89行
Bundle 'kchmck/vim-coffee-script'
let coffee_compile_vert = 1
au BufReadPost *.coffee silent CoffeeCompile watch vert
au BufNewFile,BufReadPost *.coffee setl foldmethod=indent nofoldenable
"}}}

filetype plugin indent on
"}}}

"{{{ 键盘映射

"消除每行结尾有可能出现的^M (文件格式问题)
map <C-m> :%s/\r//g<CR> 

"回车复制当前单词到剪切板
"conflict inside quickfix window
"nmap <CR> "+yiw

"文件类型
nmap <leader>1 :set filetype=xml<cr>

"映射搜索快捷键
nmap <C-f> gg//g<left><left>
imap <C-f> <esc>gg//g<left><left>

"双击鼠标左键高亮所有选择的单词
nmap <2-leftmouse> *N
imap <2-leftmouse> <esc>*N

"资源管理器中打开当前文件
imap <F12> <ESC>:call OpenFileLocation()<CR> 
nmap <F12> :call OpenFileLocation()<CR>

"格式化全文
imap <C-K><C-D> <ESC>gg=G
nmap <C-K><C-D> gg=G

"Ctrl+Tab
imap <C-Tab> <ESC>gt
nmap <C-Tab> gt

"复制当前文件路径
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

"******************************************************************************

"}}}

"{{{ C# 配置
au FileType cs set foldmethod=marker 
au FileType cs set foldmarker={,} 
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',) 
au FileType cs set foldlevelstart=2 
"}}}

"{{{ UI

"自动透明
au GUIEnter * call libcallnr("vimtweak.dll", "SetAlpha", 238)
"自动最大化
au GUIEnter * call libcallnr("vimtweak.dll", "EnableMaximize", 1)

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

:command! HgLog cd %:p:h | !thgw.exe --nofork log %:p & exit
