"
"                       __   _(_)_ __ ___  _ __ ___
"                       \ \ / / | '_ ` _ \| '__/ __|
"                        \ V /| | | | | | | | | (__
"                       (_)_/ |_|_| |_| |_|_|  \___|
"
"                             ^__^
"                          o  (oo)\_______
"                             (__)\       )\/\
"                                 ||----w |
"                                 ||     ||

" genernal settings
syntax enable
syntax on
set encoding=utf-8
set fileencoding=utf-8
set fileencodings=ucs-bom,utf-8,gbk,cp936,latin-1
set fileformat=unix
set fileformats=unix,dos,mac
set t_Co=256
set cul
set shortmess=atI
autocmd InsertEnter * se cul
set ruler
set showcmd
set scrolloff=3
set laststatus=2
set autoindent
set smartindent
set cindent
set cinoptions=g0,:0,N-s,(0
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set smarttab
set foldenable
set number
set history=1000
set hlsearch
set incsearch
set langmenu=zh_CN.UTF-8
set helplang=cn
set cmdheight=2
set autoread
set completeopt=preview,menu
set autowrite
set magic
set guioptions-=T
set guioptions-=m
set nocompatible
set noeb
set confirm
set nobackup
set noswapfile
set ignorecase
set linespace=0
set wildmenu
set backspace=2
set whichwrap+=<,>,h,l
set mouse-=a
set selection=exclusive
set selectmode=mouse,key
set report=0
set fillchars=vert:\ ,stl:\ ,stlnc:\
set showmatch
set matchtime=1
set scrolloff=3
set completeopt=longest,menu
set iskeyword+=.
set termencoding=utf-8
set encoding=utf8
set fileencodings=utf8,ucs-bom,gbk,cp936,gb2312,gb18030
filetype on
filetype plugin on
filetype indent on

" 关于右键粘贴和自动缩进冲突的问题解决
"set paste    " 右键粘贴不乱格式(开启后自动缩进会失效)
"set nopaste    " 开启自动缩进的话右键粘贴会乱格式
"set pastetoggle=<F11>	" F11切换paste和nopaste
" 下面是自动切换 OH YEAH
autocmd InsertEnter * se paste
autocmd InsertLeave * se nopaste


if has("autocmd")
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif
endif
" eggcache vim
nnoremap ; :
:command W w
:command WQ wq
:command Wq wq
:command Q q
:command Qa qa
:command QA qa

" Vundle
set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'L9'
Plugin 'chxuan/change-colorscheme'
Plugin 'jiangmiao/auto-pairs'
Plugin 'scrooloose/nerdcommenter'
Plugin 'scrooloose/nerdtree'
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'Valloric/MatchTagAlways'
Plugin 'Lokaltog/vim-powerline'
Plugin 'Valloric/YouCompleteMe'
Plugin 'docunext/closetag.vim'
Plugin 'godlygeek/tabular'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-endwise'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'majutsushi/tagbar'
Plugin 'octol/vim-cpp-enhanced-highlight'
"Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'vim-scripts/a.vim'
Plugin 'vim-scripts/DoxygenToolkit.vim'
Plugin 'vim-scripts/SQLComplete.vim'
Plugin 'vim-scripts/txt.vim'
Plugin 'ryanoasis/vim-devicons'
Plugin 'gorodinskiy/vim-coloresque'
Plugin 'will133/vim-dirdiff'
Plugin 'haya14busa/incsearch.vim'
Plugin 'mhinz/vim-startify'
Plugin 'scrooloose/syntastic'
Plugin 'cSyntaxAfter'
Plugin 'std_c.zip'
Plugin 'mattn/emmet-vim'
Plugin 'Yggdroot/indentLine'
Plugin 'Align'


call vundle#end()
filetype plugin indent on

" load vim default plugin
runtime macros/matchit.vim

" change-colorscheme
map <F10> :NextColorScheme<CR>
imap <F10> <ESC> :NextColorScheme<CR>
map <F9> :PreviousColorScheme<CR>
imap <F9> <ESC> :PreviousColorScheme<CR>

" nerdtree
map <F3> :NERDTreeToggle<CR>
imap <F3> <ESC> :NERDTreeToggle<CR>
"autocmd vimenter * if !argc() | NERDTree | endif
"autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" YCM
let g:ycm_confirm_extra_conf = 0 "打开vim时不再询问是否加载ycm_extra_conf.py配置
let g:ycm_error_symbol = '>>'
let g:ycm_warning_symbol = '>*'
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_complete_in_comments = 1
let g:ycm_complete_in_strings = 1
let g:ycm_collect_identifiers_from_tag_files = 1 "使用ctags生成的tags文件
let g:ycm_global_ycm_extra_conf = "/home/ming/.ycm_extra_conf.py"
set pumheight=10 "右边的数字是补全菜单的高度，自己定义"
"let g:ycm_cache_omnifunc = 0
let mapleader = ","
nnoremap <leader>u :YcmCompleter GoToDeclaration<CR>
nnoremap <leader>i :YcmCompleter GoToDefinition<CR>
nnoremap <leader>o :YcmCompleter GoToInclude<CR>
nmap <F5> :YcmDiags<CR>

" 自动补全配置 ------------------------------------------------
set completeopt=longest,menu	"让Vim的补全菜单行为与一般IDE一致(参考VimTip1228)
autocmd InsertLeave * if pumvisible() == 0|pclose|endif	"离开插入模式后自动关闭预览窗口
inoremap <expr> <CR>       pumvisible() ? "\<C-y>" : "\<CR>"	"回车即选中当前项
"上下左右键的行为 会显示其他信息
inoremap <expr> <Down>     pumvisible() ? "\<C-n>" : "\<Down>"
inoremap <expr> <Up>       pumvisible() ? "\<C-p>" : "\<Up>"
inoremap <expr> <PageDown> pumvisible() ? "\<PageDown>\<C-p>\<C-n>" : "\<PageDown>"
inoremap <expr> <PageUp>   pumvisible() ? "\<PageUp>\<C-p>\<C-n>" : "\<PageUp>"

"youcompleteme  默认tab  s-tab 和自动补全冲突
"let g:ycm_key_list_select_completion=['<c-n>']
let g:ycm_key_list_select_completion = ['<Down>']
"let g:ycm_key_list_previous_completion=['<c-p>']
let g:ycm_key_list_previous_completion = ['<Up>']
let g:ycm_confirm_extra_conf=0 "关闭加载.ycm_extra_conf.py提示

let g:ycm_collect_identifiers_from_tags_files=1	" 开启 YCM 基于标签引擎
let g:ycm_min_num_of_chars_for_completion=2	" 从第2个键入字符就开始罗列匹配项
let g:ycm_cache_omnifunc=0	" 禁止缓存匹配项,每次都重新生成匹配项
let g:ycm_seed_identifiers_with_syntax=1	" 语法关键字补全
nnoremap <F5> :YcmForceCompileAndDiagnostics<CR>	"force recomile with syntastic
"nnoremap <leader>lo :lopen<CR>	"open locationlist
"nnoremap <leader>lc :lclose<CR>	"close locationlist
inoremap <leader><leader> <C-x><C-o>
"在注释输入中也能补全
let g:ycm_complete_in_comments = 1
"在字符串输入中也能补全
let g:ycm_complete_in_strings = 1
"注释和字符串中的文字也会被收入补全
let g:ycm_collect_identifiers_from_comments_and_strings = 0
let g:ycm_collect_identifiers_from_tags_files = 1
"let g:ycm_semantic_triggers = {}
" Ycm 触发语义补全引擎的字符列表
"let g:ycm_semantic_triggers.c = ['->', '.','re![_a-zA-z0-9]']
"let g:ycm_semantic_triggers.cpp = ['->', '.', '::','re![_a-zA-Z0-9]']
"let g:ycm_semantic_triggers.python = ['.', 're![_a-zA-Z0-9]']
"let g:ycm_semantic_triggers.objcpp = ['->', '.', '::','re![_a-zA-Z0-9]']
"let g:ycm_semantic_triggers.objc = ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s', 're!\[.*\]\s']
"let g:ycm_semantic_triggers.lua = ['.', ':', 're![_a-zA-Z0-9]']
"let g:ycm_semantic_triggers.erlang = [':', 're![_a-zA-Z0-9]']
"let g:ycm_semantic_triggers.perl = ['->', 're![_a-zA-Z0-9]']
let g:ycm_semantic_triggers =  {
  \   'c' : ['->', '.','re![_a-zA-z0-9]'],
  \   'objc' : ['->', '.', 're!\[[_a-zA-Z]+\w*\s', 're!^\s*[^\W\d]\w*\s',
  \             're!\[.*\]\s'],
  \   'ocaml' : ['.', '#'],
  \   'cpp,objcpp' : ['->', '.', '::','re![_a-zA-Z0-9]'],
  \   'perl' : ['->'],
  \   'php' : ['->', '::'],
  \   'cs,java,javascript,typescript,d,python,perl6,scala,vb,elixir,go' : ['.'],
  \   'ruby' : ['.', '::'],
  \   'lua' : ['.', ':'],
  \   'erlang' : [':'],
  \ }
let g:ycm_semantic_triggers.c = ['->', '.', ' ', '(', '[', '&',']']

nnoremap <leader>jd :YcmCompleter GoToDefinitionElseDeclaration<CR> " 跳转到定义处

" --------------------------------------------

" a.vim 插件配置
" 用于切换C/C++头文件
" :A     ---切换头文件并独占整个窗口
" :AV    ---切换头文件并垂直分割窗口
" :AS    ---切换头文件并水平分割窗口
" 自动插入头文件宏定义


" Align 插件配置
" 一个对齐的插件，用来——排版与对齐代码，功能强大，不过用到的机会不多

" emmet-vim（前身为Zen coding） 插件配置
" HTML/CSS代码快速编写神器，详细帮助见 :h emmet.txt

" indentLine 插件配置
" 用于显示对齐线，与 indent_guides 在显示方式上不同，根据自己喜好选择了
" 在终端上会有屏幕刷新的问题，这个问题能解决有更好了
" 开启/关闭对齐线
nmap <leader>il :IndentLinesToggle<CR>
" 设置Gvim的对齐线样式
let g:indentLine_char = "┊"
let g:indentLine_first_char = "┊"
" 设置终端对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
let g:indentLine_color_term = 239
" 设置 GUI 对齐线颜色，如果不喜欢可以将其注释掉采用默认颜色
" let g:indentLine_color_gui = '#A4E57E'

" vim-javacompleteex（也就是 javacomplete 增强版）插件配置

" nerdcommenter 插件配置
" 我主要用于C/C++代码注释(其它的也行)
" 以下为插件默认快捷键，其中的说明是以C/C++为例的，其它语言类似
" <Leader>ci 以每行一个 /* */ 注释选中行(选中区域所在行)，再输入则取消注释
" <Leader>cm 以一个 /* */ 注释选中行(选中区域所在行)，再输入则称重复注释
" <Leader>cc 以每行一个 /* */ 注释选中行或区域，再输入则称重复注释
" <Leader>cu 取消选中区域(行)的注释，选中区域(行)内至少有一个 /* */
" <Leader>ca 在/*...*/与//这两种注释方式中切换（其它语言可能不一样了）
" <Leader>cA 行尾注释
let NERDSpaceDelims = 1   "在左注释符之后，右注释符之前留有空格
" 启用 // 注释风格
let c_cpp_comments = 0

" std_c 插件配置
" 用于增强C语法高亮

" cSyntaxAfter
" 高亮括号与运算符等
au! BufRead,BufNewFile,BufEnter *.{c,cpp,h,java,javascript} call CSyntaxAfter()

" ctags
set tags+=/usr/include/tags
set tags+=~/.vim/systags
set tags+=~/.vim/x86_64-linux-gnu-systags

" a.vim: .h -> .cpp or .cpp -> .h
nnoremap <silent> <F2> :A<CR>

" tagbar
let g:tagbar_ctags_bin = '/usr/bin/ctags'
let g:tagbar_width = 30
map <F4> :TagbarToggle<CR>
imap <F4> <ESC> :TagbarToggle<CR>

" colorscheme
set background=dark
let g:solarized_termcolors=256
colorscheme solarized
"colorscheme monokai

" cpp_class_scope_highlight
let g:cpp_class_scope_highlight = 1
let g:cpp_experimental_template_highlight = 1
let c_no_curly_error = 1


" ctrlp
let g:ctrlp_map = '<c-f>'
let g:ctrlp_cmd = ':CtrlP'
let g:ctrlp_working_path_mode = '0'
set wildignore+=*/tmp/*,*.so,*.swp,*.zip     " MacOSX/Linux

" incsearch.vim
map /  <Plug>(incsearch-forward)
map ?  <Plug>(incsearch-backward)
map g/ <Plug>(incsearch-stay)

" 当文件在外部被修改，自动更新该文件
set autoread

" 常规模式下输入 cS 清除行尾空格
nmap cS :%s/\s\+$//g<CR>:noh<CR>

" 常规模式下输入 cM 清除行尾 ^M 符号
nmap cM :%s/\r$//g<CR>:noh<CR>

" --------------- new files template begin ---------------------
function! s:insertGates(var)
	let h_or_hpp = a:var
	let gatename = substitute(toupper(expand("%:t")), "\\.", "_", "g")
	execute "normal! i#ifndef __" . gatename . h_or_hpp[3] . "__"
	execute "normal! o#define __" . gatename . h_or_hpp[3] . "__"
"    if h_or_hpp == "H"
"        execute "normal! o#ifdef __cplusplus"
"        execute "normal! oextern \"C\" {"
"        execute "normal! o#endif // __cplusplus"
"    endif
	execute "normal! o"
	execute "normal! o"
"    if h_or_hpp == "H"
"        execute "normal! o#ifdef __cplusplus"
"        execute "normal! o}"
"        execute "normal! o#endif // __cplusplus"
"    endif
	execute "normal! Go#endif // __" . gatename . h_or_hpp[3] . "__"
	execute "normal! o"
"    if h_or_hpp == "H"
"        execute "normal! kkk"
"    endif
    execute "normal! kkk"
endfunction
autocmd BufNewFile *.{h,H} call s:insertGates("H")
autocmd BufNewFile *.{hpp,HPP} call s:insertGates("HPP")
autocmd BufNewFile *{demo,Demo,test,Test,example,Example}*.c 0r ~/.vim/templates/c.c
autocmd BufNewFile *{demo,Demo,test,Test,example,Example}*.{cpp,cxx,cc} 0r ~/.vim/templates/cpp.cpp
autocmd BufNewFile *.sh 0r ~/.vim/templates/sh.sh
autocmd BufNewFile *.py 0r ~/.vim/templates/py.py
autocmd BufNewFile *.php 0r ~/.vim/templates/php.php
autocmd BufNewFile *.{htm,html} 0r ~/.vim/templates/html.html
autocmd BufNewFile *.lua 0r ~/.vim/templates/lua.lua
autocmd BufNewFile *.vertex.glsl 0r ~/.vim/templates/vertex.glsl
autocmd BufNewFile *.frag.glsl 0r ~/.vim/templates/fragment.glsl
autocmd BufNewFile *.fragment.glsl 0r ~/.vim/templates/fragment.glsl
" ----------------new files template end -----------------------

set writebackup        "保存文件前建立备份，保存成功后删除该备份
set nobackup           "设置无备份文件
set noswapfile         "设置无临时文件
"set vb t_vb=           "关闭提示音

