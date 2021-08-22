""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                            basic config                              "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 保存.vimrc文件时自动重启加载，即让此文件立即生效
autocmd BufWritePost $MYVIMRC source $MYVIMRC
" 关闭兼容模式
set nocompatible
" 设置鼠标功能为普通模式
set mouse=n
" 共享剪贴板  
set clipboard+=unnamedplus 
" 设置编码
set fileencodings=utf-8,ucs-bom,gb18030,gbk,gb2312,cp936
set termencoding=utf-8
set encoding=utf-8
" 语法高亮
syntax on
" 显示行号
set number
" 自动保存
set autowrite
" 在处理未保存或只读文件的时候，弹出确认
 set confirm
" 高亮显示所有搜索到的内容.后面用map映射快捷键来方便关闭当前搜索的高亮.
"set hlsearch
" 搜索到最后匹配的位置后,再次搜索不回到第一个匹配处
set nowrapscan
" 高亮显示括号匹配
set showmatch
" 设置Tab长度为4空格
set tabstop=4
" 设置自动缩进长度为4空格
set shiftwidth=2
" 不要用空格代替制表符
set noexpandtab
" 显示空格和tab键
set listchars=tab:>-,trail:-
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                             custom config                                          "
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" 打开文件类型检测,并载入文件类型插件,为特定文件类型载入相关缩进文
filetype plugin indent on
" 新建.c,.h,.sh,.java文件，自动插入文件头 
autocmd BufNewFile *.cpp,*.[ch],*.sh,*.java exec ":call SetTitle()" 
" 定义函数SetTitle，自动插入文件头 
func SetTitle() 
    "如果文件类型为.sh文件 
    if &filetype == 'sh' 
        call setline(1,"\############################") 
        call append(line("."), "\# File Name: ".expand("%")) 
        call append(line(".")+1, "\# Author: wanglin.chen") 
        call append(line(".")+2, "\# mail: 834958972@qq.com") 
        call append(line(".")+3, "\# Created Time: ".strftime("%c"))
        call append(line(".")+4, "\############################") 
        call append(line(".")+5, "\#!/bin/bash") 
        call append(line(".")+6, "") 
    else 
        call setline(1, "/******************************") 
        call append(line("."), "    > File Name: ".expand("%")) 
        call append(line(".")+1, "    > Author:wanglin.chen") 
        call append(line(".")+2, "    > Mail: 834958972@qq.com ") 
        call append(line(".")+3, "    > Created Time: ".strftime("%c")) 
        call append(line(".")+4, " *****************************/") 
        call append(line(".")+5, "")
    endif

    "新建文件后，自动定位到文件末尾
    autocmd BufNewFile * normal G
endfunc 
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                              vim-plug                                 "               
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin('~/.vim/plugged')
	Plug 'bling/vim-bufferline'
	Plug 'vim-airline/vim-airline'
	Plug 'majutsushi/tagbar'
	Plug 'Shougo/vimfiler.vim'
	Plug 'wesleyche/srcexpl'
	Plug 'ryanoasis/vim-devicons'
	Plug 'Yggdroot/LeaderF'
	Plug 'liuchengxu/vim-which-key'
	Plug 'jiangmiao/auto-pairs'
	Plug 'tpope/vim-commentary'
	Plug 'dense-analysis/ale'
	Plug 'tpope/vim-fugitive'
	Plug 'mhinz/vim-startify'
	Plug 'Yggdroot/indentLine'
	Plug 'sbdchd/neoformat'
	Plug 'justinmk/vim-sneak'
call plug#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"                          plug config                                  "
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

