"{{{ 自定义函数

function OpenFileLocation()  
    if ( expand("%") != "" )  
        execute "!start explorer /select, %"   
    else  
        execute "!start explorer /select, %:p:h"  
    endif  
endfunction

"}}}

"{{{ 基础配置
"记录文件状态（包括独立于该文件的键盘映射、代码折叠状态等）：
autocmd BufWinLeave *.* if expand('%') != '' && &buftype == '' | mkview | endif
autocmd BufWinEnter *.* if expand('%') != '' && &buftype == '' | silent loadview | endif
"映射y为系统剪切板
nnoremap y "+y
vnoremap y "+y
"重新设置mkview时候的保存路径，在win7上如果安装在C盘的话可能出现保存不了的情况
set viewdir=~/.vim/view
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
"字体设置
set guifont=Bitstream_Vera_Sans_Mono:h10:cANSI
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
"更改选择pane中的颜色
highlight Pmenu guifg=#FFFFFF guibg=#111111
"默认全屏
autocmd GUIEnter * simalt ~x
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
Bundle 'JavaScript-syntax'
"Bundle 'terryma/vim-multiple-cursors'
"自动注释工具
Bundle 'DoxygenToolkit.vim'
Bundle 'surround.vim'
Bundle 'Align'
"python-mode拖慢启动速度
"Bundle 'klen/python-mode'
Bundle 'terryma/vim-expand-region'
Bundle 'AutoClose'
Bundle 'kchmck/vim-coffee-script'

"{{{ ctrlp
Bundle 'kien/ctrlp.vim'
"MRU default 
let g:ctrlp_map = '<leader><leader>'
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

"{{{ color molokai
"Bundle 'tomasr/molokai'
"color molokai
"}}}

"{{{ Vim-markdown
"注意注释该插件下面的ftpplugin中的markdown折叠功能
"Bundle 'plasticboy/vim-markdown'
"let g:vim_markdown_folding_disabled=1
"}}}

"{{{ Gundo 查看文件编辑历史
Bundle 'sjl/gundo.vim'
nnoremap <leader>h :GundoToggle<CR>    
"}}}

"{{{ syntastic 语法检查，支持N多语言，真是无敌了
Bundle 'scrooloose/syntastic'
let g:syntastic_auto_loc_list=1
let g:syntastic_disabled_filetypes=['html']
let g:syntastic_enable_signs=1
"需要提前安装好各种检查器，比如
"js依赖于jshint: npm install -g jshint
"css依赖于csslint: npm install -g csslint
"}}}

"{{{ vim-numbertoggle 相对行号
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
"非要设置个快捷键，设置一个不常用的
"let g:NumberToggleTrigger='<C-F2>'  
"}}}

"{{{ neocomplcache 自动补全
"陆陆续续用了很多自动补全插件，这款还是不错的，速度很快
"启用了以后会不能选中文字
"Bundle 'Shougo/neosnippet'
Bundle 'Shougo/neocomplcache.vim'
"自动完成映射为Ctrl+J
imap <C-J> <C-X><C-u>
" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
let g:neocomplcache_force_overwrite_completefunc = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete
autocmd FileType xml setlocal omnifunc=xmlcomplete#CompleteTags
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
 
" {{{ FuzzyFinder
Bundle 'vim-scripts/L9'
"FuzzyFinder依赖于L9
Bundle 'FuzzyFinder'
"开启MRU模式，默认禁用
let g:fuf_modesDisable = []
nnoremap <silent><F1> :FufHelp<CR>
imap <silent><F1> <esc>:FufHelp<cr>  
nnoremap <silent><F2> :FufMruFile<CR>
imap <silent><F2> <esc>:FufMruFile<cr>  
nnoremap <silent><F3> :FufMruCmd<CR>
imap <silent><F3> <esc>:FufMruCmd<cr>  
"}}}
 
" {{{ TagList 函数列表显示 
Bundle 'taglist.vim'
map <silent> <F10> :TlistToggle<cr>
imap <F10> <ESC>:TlistToggle<cr>a
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"}}}

" {{{ PowerLine
Bundle 'Lokaltog/vim-powerline'
set laststatus=2
set encoding=utf-8
set t_Co=256
"let g:Powerline_symbols = 'fancy'
"}}}

" {{{ Nerd Tree  树形目录结构
Bundle 'The-NERD-tree'
map <F11> :NERDTreeFind<CR>
imap <F11> <ESC>:NERDTreeFind<CR>a
"}}}

"{{{ vbnet.vim 
Bundle 'vbnet.vim'
autocmd BufNewFile,BufRead *.vb set ft=vbnet
"}}}

"{{{ EasyMotion
Bundle 'qianlifeng/vim-easymotion'
let g:EasyMotion_do_mapping = 0
"}}}

"{{{ coffee script
"默认竖着显示
"有个问题需要解决：注释 ftpplugin\coffee.vim 中的第89行
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
nmap <CR> "+yiw

"文件类型
nmap <leader>1 :set filetype=xml<cr>

"设置折叠方式为语法折叠同时开启所有折叠
map <leader>fs :set fdm=syntax<cr>zM

"列出搜索结果
nmap <leader>f :g//<left>
"映射搜索快捷键
nmap <C-f> gg//g<left><left>
imap <C-f> <esc>gg//g<left><left>

"双击鼠标左键高亮所有选择的单词
nmap <2-leftmouse> *N
imap <2-leftmouse> <esc>*N

"资源管理器中打开当前文件
imap <F12> <ESC>:call OpenFileLocation()<CR> 
nmap <F12> :call OpenFileLocation()<CR>

"当前行下移一行
"插入模式下如果启用，则tab键会触发这个功能，原因不详
"imap <C-n> <ESC>O
nmap <C-n> O<ESC>

"格式化全文
imap <C-K><C-D> <ESC>gg=G
nmap <C-K><C-D> gg=G


"Ctrl+Tab
imap <C-Tab> <ESC>gt
nmap <C-Tab> gt

"复制当前文件路径
nmap <F4> :let @+ = expand("%:p")<CR>

nmap <F6> :!p4 edit %<Enter>
imap <F6> <ESC>:!p4 edit %<Enter>
"******************************split setting*********************************

" Quick vertical split
nnoremap <leader>w <C-w>v

" Switch splits with <C-h> & <C-l>
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k

" Set the minimal split width
set winwidth=40
set winminwidth=40

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

nnoremap <leader>= :call SplitToggle()<cr>

"******************************************************************************

"}}}

"{{{ Python 配置

autocmd FileType python set omnifunc=pythoncomplete#Complete
"map <F5> <Esc>:!c:\python27\python.exe %<CR>
"}}}

"{{{ C# 配置
au FileType cs set foldmethod=marker 
au FileType cs set foldmarker={,} 
au FileType cs set foldtext=substitute(getline(v:foldstart),'{.*','{...}',) 
au FileType cs set foldlevelstart=2 
"}}}
