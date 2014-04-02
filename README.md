SQVIM
===  
VIM配置文件  
使用Vundle管理插件，Vundle安装方法：http://www.cnblogs.com/qiangji/archive/2011/07/31/Vundle.html  
因为默认配置了每个文件关闭的时候都mkview，所以一段时间后可能产生大量的view文件，从而拖慢启动速度，需要记得清理。  

###2014-04-02
* 启用Ack插件，替换默认Ctrl+F为Ack搜索

###2014-02-28
* 启用Syntastic插件，但是关闭其自动检查的功能（有点拖慢速度）

###2014-01-04
* 去除不经常使用的设置

###2013-08-03
* 更换color
* 增加半透明设置

###2013-07-21
* 增加插件EasyGrep

###2013-06-04
* 添加横向滚动条，不自动折行

###2013-04-25
* 禁用pymode插件，这货严重影响启动速度

###2013-03-05
* 默认开启set cursorcolum

###2013-01-15
* 使用python-mode插件替换pyflask

###2013-01-13
* solve terminal encoding issue in entire english environment.

###2013-01-10
* 删除了一些不常用的插件，如Utl。删除了一些总是有问题的插件如XPTemplate和supertab,利用AutoComplPop也能工作的很好

###2013-01-06
* 重置了XPTemplate的快捷键，如果将其设置为tab键的话，多多少少会出现一些问题。所以还是保持默认的ctrl+\
* 更改easymotion的快捷键为f

###2013-01-06
* 修改了easymotion的快捷键`<leader><leader`
* 添加自己写的微博插件vbo

###2013-01-05
* 增加vim-mark插件
* 修改鼠标双击不自动选中单词
* 增加easymotion插件
* 增加numbertoggle插件
* 插入模式下禁止方向键
* 增加分割窗口的一些快捷键，例如左右移动切换buffer

###2013-01-04
* 增加复制当前文件路径到剪切板的快捷键：<leader>c
* 增加vb代码高亮
* 增加AutoComplPop插件（推荐）
* 增加surround插件
* 修复XPTemplate与supertab和AutoComplPop冲突的问题

###2012-12-22
* 修改mkview时候保存的位置，防止在win7下权限不够的问题

###2012-12-21
* 去除sinpMate插件，有冲突（插入模式下不可以复制，回退也有问题），使用XPTemplate替代
* 增加Ctrl+Tab 切换tab映射

###2012-12-12
* 增加sinpMate插件
* 增加DoxygenToolkit插件
* 增加进入和退出buf时，自动保存加载上次文件状态（包括语法着色信息，折叠信息等）

###2012-12-11
* 增加格式化全文的快捷键 Ctrl-K,Ctrl-D （仿Visual Studio）

###2012-12-10
* 增加pyflakes插件（python语法检查）
* 增加vim-ipython插件（配合supertab实现python自动完成）

###2012-12-09
* 增加mardown自动预览功能

###2012-12-07
* 增加markdown语法支持

###2012-12-05
* 增加[当前行下移]快捷键：ctrl + n

###2012-11-21
* 鼠标左键双击选中当前单词

###2012-11-15
* 修改Nerd Tree配置
* 修改Tag List插件快捷键为F10
* 修改Nerd Tree插件快捷键为F11

###2012-11-09
* 增加资源管理器打开当前文件功能 F12
* 增加清楚搜索高亮快捷键
* 修复鼠标双击选中单词的一个bug

###2012-11-08
* 增加鼠标左键双击高亮所有当前选中的关键字
* 修改vundle插件的默认安装位置  

###2012-11-07
* 增加supertab插件
* 增加powerline插件
* 设置NERDTreeFind快捷键为 [Leader] t。 使用此快捷键可以快速打开当前文件的位置
* 增加Ctrl+F搜索的映射快捷键
