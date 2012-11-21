" {{{ 文件头
" DesCRiption: vimrc for scottqian
" Last Change: 2012-11-15
" Version:     0.2.3
"}}}
 
"{{{ 基础配置

"忽略搜索时候的大小写
set ic
"重新设置leader key
let mapleader = ","
"不区分大小写
set ignorecase
"不需要高亮
set nohls
"不产生备份文件
set nobackup 
"不产生swp文件
set noswapfile
"不要图像按钮
set go=
"显示滚动条
set go+=r
"总是显示标签。0：不显示；1：多于1个时显示
set showtabline=0
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
set guifont=courier_new:h10
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
"set fileencoding=utf-8
"GVIM支持打开的文件编码
set fileencodings=utf-8,gbk,gb2312,big5,latin1
set termencoding=utf-8
"解决菜单及右键菜单乱码
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim
"解决consle输出乱码
language messages zh_CN.utf-8
"防止特殊符号无法正常显示，如五角星等
set ambiwidth=double
"设置折叠方式
set foldmethod=marker
"多个文件打开时用tab显示,0永远不显示 1两个以上显示 2 永远显示
set showtabline=1
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
highlight Pmenu guifg=#FFFFFF guibg=#333333
"默认全屏
autocmd GUIEnter * simalt ~x
 
"}}}
 
"{{{ 插件配置
 
" {{{ 插件名：Vundle
"     项目地址：https://github.com/gmarik/vundle
"     作用：
"   
"           管理插件安装
"

"required
filetype off
"此处规定Vundle的路径
set rtp+=$HOME/.vim/bundle/vundle
"此处规定插件的安装路径
call vundle#rc('$HOME/.vim/bundle')
" let Vundle manage Vundle
Bundle 'gmarik/vundle'
" required!

"插件列表
Bundle 'The-NERD-Commenter'
Bundle 'vim-scripts/L9'
Bundle 'FuzzyFinder'
Bundle 'matchit.zip' 
Bundle 'utl.vim'
Bundle 'taglist.vim'
Bundle 'restart.vim'
"按下/搜索后按tab补全单词
Bundle 'SearchComplete'
Bundle 'JavaScript-syntax'
"Bundle 'http://github.com/ervandew/supertab'
Bundle 'The-NERD-tree'
Bundle 'Lokaltog/vim-powerline'
Bundle 'ervandew/supertab'
Bundle 'MultipleSearch'
filetype plugin indent on
"}}}
 
" {{{ 插件名：The NERD Commenter 
"     项目地址：http://www.vim.org/scripts/script.php?script_id=1218
"     Vundle安装名称：The-NERD-Commenter
"     作用：
"   
"           用于代码注释，这里使用的绑定快捷键同VS
"
:nmap <C-K><C-C> <leader>c<space>
:imap <C-K><C-C> <Esc><leader>c<space>i
:nmap <C-K><C-U> <leader>c<space>
:imap <C-K><C-U> <Esc><leader>c<space>i
 
"}}}
 
" {{{ 插件名：FuzzyFinder
"     项目地址：http://www.vim.org/scripts/script.php?script_id=1984
"     Vundle安装名称：FuzzyFinder
"     作用：
"   
"           方面查找包括MRUFile在内的各种元素
 
"开启MRU模式，默认禁用
let g:fuf_modesDisable = []
nnoremap <silent><F1> :FufHelp<CR>
imap <silent><F1> <esc>:FufHelp<cr>  
nnoremap <silent><F2> :FufMruFile<CR>
imap <silent><F2> <esc>:FufMruFile<cr>  
nnoremap <silent><F3> :FufMruCmd<CR>
imap <silent><F3> <esc>:FufMruCmd<cr>  
"}}}
 
" {{{ 插件名：Utl
"     项目地址: http://www.vim.org/scripts/script.php?script_id=293
"     Vundle安装名称：Utl.vim
"     作用：
"   
"          快速打开文本中的链接（不仅仅是http://格式的，还包括文件链接等） 
 
nnoremap <silent><F10> :Utl<CR>
 
"}}}
 
" {{{ 插件名：TagList
"     项目地址: http://www.vim.org/scripts/script.php?script_id=273 
"     Vundle安装名称：taglist.vim
"     作用：
"   
"           函数列表显示 

map <silent> <F10> :TlistToggle<cr>
imap <F10> <ESC>:TlistToggle<cr>a
let Tlist_Show_One_File = 1            "不同时显示多个文件的tag，只显示当前文件的
let Tlist_Exit_OnlyWindow = 1          "如果taglist窗口是最后一个窗口，则退出vim
"}}}

" {{{ 插件名：PowerLine
"     Vundle安装名：Lokaltog/vim-powerline
"     作用：
"   
set laststatus=2
set encoding=utf-8
set t_Co=256
"let g:Powerline_symbols = 'fancy'
"}}}

" {{{ 插件名：Nerd Tree
"     Vundle安装名：'The-NERD-tree'
"     作用：
"          树形目录结构
map <F11> :NERDTreeFind<CR>
imap <F11> <ESC>:NERDTreeFind<CR>a
"}}}

"}}}
 
"{{{ 键盘映射

"消除每行结尾有可能出现的^M (文件格式问题)
map <C-m> :%s/\r//g<CR> 

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
nmap <2-leftmouse> *Nvw
imap <2-leftmouse> <esc>*Nvw
"清除搜索高亮
nmap <leader><leader> :nohlsearch<CR>

"资源管理器中打开当前文件
imap <F12> <ESC>:call OpenFileLocation()<CR> 
nmap <F12> :call OpenFileLocation()<CR>
"}}}

"{{{ 自定义函数

function OpenFileLocation()  
    if ( expand("%") != "" )  
        execute "!start explorer /select, %"   
    else  
        execute "!start explorer /select, %:p:h"  
    endif  
endfunction  

"}}}

"{{{ Python 配置

autocmd FileType python set omnifunc=pythoncomplete#Complete

map <F5> <Esc>:!c:\python27\python.exe %<CR>
"}}}
