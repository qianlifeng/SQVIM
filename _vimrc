"{{{ 自定义函数

function OpenFileLocation()  
    if ( expand("%") != "" )  
        execute "!start explorer /select, %"   
    else  
        execute "!start explorer /select, %:p:h"  
    endif  
endfunction  

"
" 修改标签页的标题
" set up tab labels with tab number, buffer name, number of windows
"
function GuiTabLabel()
  let label = ''
  let bufnrlist = tabpagebuflist(v:lnum)
  " Add '+' if one of the buffers in the tab page is modified
  for bufnr in bufnrlist
    if getbufvar(bufnr, "&modified")
      let label = '+'
      break
    endif
  endfor
  " Append the tab number
  let label .= v:lnum.': '
  " Append the buffer name
  let name = bufname(bufnrlist[tabpagewinnr(v:lnum) - 1])
  if name == ''
    " give a name to no-name documents
    if &buftype=='quickfix'
      let name = '[Quickfix List]'
    else
      let name = '[No Name]'
    endif
  else
    " get only the file name
    let name = fnamemodify(name,":t")
  endif
  let label .= name
  " Append the number of windows in the tab page
  let wincount = tabpagewinnr(v:lnum, '$')
  return label . '  [' . wincount . ']'
endfunction
"}}}

"{{{ 基础配置
"记录文件状态（包括独立于该文件的键盘映射、代码折叠状态等）：
autocmd BufWinLeave *.* if expand('%') != '' && &buftype == '' | mkview | endif
autocmd BufWinEnter *.* if expand('%') != '' && &buftype == '' | silent loadview | endif
"重新设置mkview时候的保存路径，在win7上如果安装在C盘的话可能出现保存不了的情况
set viewdir=~/.vim/view
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
highlight Pmenu guifg=#FFFFFF guibg=#333333
"默认全屏
autocmd GUIEnter * simalt ~x
"插入状态下禁用方向键
"MRU和acp的时候需要上下选择
"inoremap <up> <nop>
"inoremap <down> <nop>
inoremap <left> <nop>
inoremap <right> <nop>
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
"FuzzyFinder依赖于L9
Bundle 'FuzzyFinder'
Bundle 'matchit.zip' 
Bundle 'taglist.vim'
Bundle 'restart.vim'
"按下/搜索后按tab补全单词
Bundle 'JavaScript-syntax'
Bundle 'The-NERD-tree'
Bundle 'Lokaltog/vim-powerline'
"Bundle 'ervandew/supertab'
Bundle 'MultipleSearch'
"注意注释该插件下面的ftpplugin中的markdown折叠功能
Bundle 'plasticboy/vim-markdown'
"python 语法检查工具。检查结果使用:cl命令在quickfix窗口下查看
"包含在了python-mode下
"Bundle 'pyflakes.vim'
"自动注释工具
Bundle 'DoxygenToolkit.vim'
"vb 代码高亮
Bundle 'vbnet.vim'
"自动弹出补全对话框，有个bug需要修复一下：http://hi.baidu.com/_bigbug/item/c490dffedf7f4ce91b111faa
Bundle 'AutoComplPop'
Bundle 'surround.vim'
Bundle 'huxiao/vim-bookmark'
"相对行号
Bundle 'jeffkreeftmeijer/vim-numbertoggle'
Bundle 'qianlifeng/vim-easymotion'
Bundle 'qianlifeng/vbo'
Bundle 'Align'
Bundle 'klen/python-mode'
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

"{{{ 插件名字：vbnet.vim 
autocmd BufNewFile,BufRead *.vb set ft=vbnet
"}}}

"{{{ 插件名字：vim-bookmark
"书签保存位置
let g:vbookmark_bookmarkSaveFile = $HOME . '/.vimbookmark'
"}}}

"{{{ 插件名字：EasyMotion
let g:EasyMotion_do_mapping = 0
nmap <leader><leader> :call EasyMotion#WB(0,0)<CR>
"}}}

"{{{ 插件名字：vbo

"代理设置
"是否启用代理设置，1表示启用，0表示不启用
let g:vbo_sina_weibo_proxy_enable = 1 
"HTTP代理地址，如果是url的形式则不需要协议方式直接写域名就行，例如：www.baidu.com
let g:vbo_sina_weibo_proxy_http_host = '10.182.45.231'
"HTTP代理端口
let g:vbo_sina_weibo_proxy_http_port = 80
"HTTPS代理地址
let g:vbo_sina_weibo_proxy_https_host = '10.182.45.231'
"HTTPS代理端口
let g:vbo_sina_weibo_proxy_https_port = 80

"}}}


let g:pymode_lint_checker = "pyflakes"

"
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

"自动完成映射为Ctrl+J
imap <C-J> <C-X><C-O>

"Ctrl+Tab
imap <C-Tab> <ESC>gt
nmap <C-Tab> gt

"复制当前文件路径
nmap <F4> :let @+ = expand("%:p")<CR>

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

map <F5> <Esc>:!c:\python27\python.exe %<CR>
"}}}
