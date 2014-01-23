"编码检测
" Multi-encoding setting, MUST BE IN THE BEGINNING OF .vimrc!
if has("multi_byte")
        " When 'fileencodings' starts with 'ucs-bom', don't do this manually
            "set bomb
        set fileencodings=ucs-bom,utf-8,chinese,taiwan,japan,korea,latin1
        " CJK environment detection and corresponding setting
        if v:lang =~ "^zh_CN"
            " Simplified Chinese, on Unix euc-cn, on MS-Windows cp936
            set encoding=chinese
            set encoding=chinese
            if &fileencoding == ''
                set fileencoding=chinese
            endif
        endif
        " Detect UTF-8 locale, and override CJK setting if needed
        if v:lang =~ "utf8$" || v:lang =~ "UTF-8$"
            set encoding=utf-8
        endif
else
    echoerr 'Sorry, this version of (g)Vim was not compiled with "multi_byte"')
endif

"加载插件
filetype off
"call pathogen#runtime_append_all_bundles()
call pathogen#incubate()
call pathogen#helptags()


"设置删除
set backspace=indent,eol,start

"如果设置为compatible，则tab将不会变成空格
"set nocompatible

" With a map leader it's possible to do extra key combinations
" Like <leader>w saves the current file
let mapleader = ","
let g:mapleader = ","

"快速窗口切换
nn <c-h> <c-w>h
nn <c-j> <c-w>j
nn <c-k> <c-w>k
nn <c-l> <c-w>l

"解决菜单乱码
"set encoding=utf-8
"fileencodings需要注意顺序，前面的字符集应该比后面的字符集大
set fileencodings=ucs-bom,utf-8,cp936,gb18030,big5,euc-jp,euc-kr,latin1
set langmenu=zh_CN.utf-8
set imcmdline
source $VIMRUNTIME/delmenu.vim
source $VIMRUNTIME/menu.vim

"解决consle输出乱码
language messages zh_CN.utf-8

"自动检测文件类型并加载相应的设置
filetype plugin indent on

"语法高亮
syntax enable
syntax on

"自动缩进
set autoindent

"设置 Backspace 和 Delete 的灵活程度，backspace=2 则没有任何限制
set backspace=2

"设置在哪些模式下使用鼠标功能，mouse=a 表示所有模式
"set mouse=a

"不自动换行
set nowrap

"设置超过100字符自动换行
"set textwidth=100

"智能对齐方式
set smartindent

"一个tab是4个字符
set tabstop=4

"按一次tab前进4个字符
set softtabstop=4

"用空格代替tab
set expandtab

"缩进的字符个数
set cindent shiftwidth=4
set autoindent shiftwidth=4

"设置自动缩进
set ai!

"设置折叠模式
set foldcolumn=4

"光标遇到折叠，折叠就打开
"set foldopen=all

"移开折叠时自动关闭折叠
"set foldclose=all

"zf zo zc zd zr zm zR zM zn zi zN
"依缩进折叠
"   manual  手工定义折叠
"   indent  更多的缩进表示更高级别的折叠
"   expr    用表达式来定义折叠
"   syntax  用语法高亮来定义折叠
"   diff    对没有更改的文本进行折叠
"   marker  对文中的标志折叠
set foldmethod=indent

"启动时不要自动折叠代码
set foldlevel=100

"显示行号
set number

"打开光标的行列位置显示功能
set ruler

"显示中文引号
set ambiwidth=double

"行高亮
set cursorline

"列高亮，与函数列表有冲突
"set cursorcolumn

"设置命令行的高度
set cmdheight=2

"高亮搜索的关键字
set hlsearch

"搜索忽略大小写
set ignorecase

"设置命令历史行数
set history=100

"启动的时候不显示那个援助索马里儿童的提示
set shortmess=atI

"解决复制时候代码错乱
:set pastetoggle=<F4>

"不要闪烁
"set novisualbell

"显示TAB健
set list
set listchars=tab:>-,trail:-

"高亮字符，让其不受100列限制
:highlight OverLength ctermbg=red ctermfg=white guibg=grey guifg=white
:match OverLength '\%101v.*'

"设置VIM状态栏
set laststatus=2 "显示状态栏(默认值为1, 无法显示状态栏)
set statusline=
set statusline+=%2*%-3.3n%0*\ " buffer number
set statusline+=%f\ " file name
set statusline+=%h%1*%m%r%w%0* " flag
set statusline+=[
if v:version >= 600
    set statusline+=%{strlen(&ft)?&ft:'none'}, " filetype
        set statusline+=%{&fileencoding}, " encoding
        endif
        set statusline+=%{&fileformat}] " file format
        set statusline+=%= " right align
        "set statusline+=%2*0x%-8B\ " current char
        set statusline+=0x%-8B\ " current char
        set statusline+=%-14.(%l,%c%V%)\ %<%P " offset
        if filereadable(expand("$VIM/vimfiles/plugin/vimbuddy.vim"))
            set statusline+=\ %{VimBuddy()} " vim buddy
            endif
"状态行颜色
highlight StatusLine guifg=SlateBlue guibg=Yellow
highlight StatusLineNC guifg=Gray guibg=White

"设置路径,多个路径用逗号分隔
set path=.,"E:/Web/htdocs",,

"去掉有关vi一致性模式，避免以前版本的一些bug和局限
set nocp

"增强模式中的命令行自动完成操作
set wildmenu
""状态栏显示时间
set laststatus=2
set statusline+=%{strftime(\"%m-%d\ %H:%M\")}
"缺省不产生备份文件
set nobackup

"在输入括号时光标会短暂地跳到与之相匹配的括号处，不影响输入
set showmatch

"正确地处理中文字符的折行和拼接
set formatoptions+=mM

"设定文件浏览器目录为当前目录
set bsdir=buffer

"自动切换当前目录为当前文件所在的目录
set autochdir

"自动重新加载外部修改内容
set autoread

"允许在有未保存的修改时切换缓冲区
set hidden

"选中一段文字并全文搜索这段文字
"vmap <silent> ,/ y/<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>
"vmap <silent> ,? y?<C-R>=escape(@", '\\/.*$^~[]')<CR><CR>

"保存文件的格式顺序
set fileformats=unix,dos

"配色（更多的配色见colors目录和http://www.cs.cmu.edu/~maverick/VimColorSchemeTest/index-c.html）
"colorscheme peacock_light
colorscheme desert

"启动后最大化
au GUIEnter * simalt ~x

"置粘贴模式，这样粘贴过来的程序代码就不会错位了
"set paste

"设置帮助信息
set helplang=cn

"记录上次关闭的文件及状态
if has("autocmd")
au BufReadPost * if line("`\"") > 1 && line("`\"") <= line("$") | exe "normal! g`\"" | endif
" for simplicity, "  au BufReadPost * exe "normal! g`\"", is Okay.
endif

"显示执行命令
set showcmd

" Fast saving
nmap <leader>w :w!<cr>
" Fast Quit
nmap <leader>q :qall<cr>

"设置Tags,F5更新tags
nmap <F5> <Esc>:!ctags -R *<CR>
set tags+=~/.vim/tags/libc.tags
set tags+=~/.vim/tags/susv2.tags
set tags+=~/.vim/tags/glib.tags
set tags+=~/.vim/tags/cpp.tags

"
"
"　　插件设置
"
"
"

"Taglist

"不同时显示多个文件的tag，只显示当前文件的
let Tlist_Show_One_File = 1

"如果taglist窗口是最后一个窗口，则退出vim
let Tlist_Exit_OnlyWindow = 1

"TaskList
"快捷键, td
map <leader>td <Plug>TaskList

"GundoToggle设置,历史记录
map <leader>g :GundoToggle<CR>

"WManager
let g:NERDTree_title="[NERD Tree]"
"let g:winManagerWindowLayout='NERDTree|TagList'
let g:winManagerWindowLayout='TagList'
function! NERDTree_Start()
    exec 'NERDTree'
endfunction
function! NERDTree_IsValid()
    return 1
endfunction

"nmap wm :if IsWinManagerVisible() <BAR> WMToggle<CR> <BAR> else <BAR> WMToggle<CR>:q<CR> endif <CR><CR>

"设置WM快捷键
nmap wm :WMToggle<cr>


"pep8
let g:pep8_map='<leader>8'

"minibuf
let g:miniBufExplorerMoreThanOne=0
"设置minibuffer 用Ctrl-tab循环切换
let g:miniBufExplMapCTabSwitchBufs = 1
"则可以用<C-h,j,k,l>切换到上下左右的窗口中去
let g:miniBufExplMapWindowNavVim = 1
"是用<C-箭头键>切换到上下左右窗口中去
let g:miniBufExplMapWindowNavArrows = 1

"设置补全

"没有使用,设置插件SuperTab
"设置按下<Tab>后默认的补全方式, 默认是<C-P>,

"还有其他的补全方式, 可以看看下面的一些帮助:
":help ins-completion
":help compl-omni

"let g:SuperTabRetainCompletionType=2

"0 - 不记录上次的补全方式
"1 - 记住上次的补全方式,直到用其他的补全命令改变它
"2 - 记住上次的补全方式,直到按ESC退出插入模式为止

"let g:SuperTabDefaultCompletionType="<C-X><C-O>"
"let g:SuperTabDefaultCompletionType = "context"
"let g:SuperTabDefaultCompletionType = "<C-X><C-U>"

highlight Pmenu    guibg=darkgrey  guifg=black
highlight PmenuSel guibg=lightgrey guifg=black

" OmniCppComplete
let OmniCpp_NamespaceSearch = 1
let OmniCpp_GlobalScopeSearch = 1
let OmniCpp_ShowAccess = 1
let OmniCpp_ShowPrototypeInAbbr = 1 " 显示函数参数列表
let OmniCpp_MayCompleteDot = 1   " 输入 .  后自动补全
let OmniCpp_MayCompleteArrow = 1 " 输入 -> 后自动补全
let OmniCpp_MayCompleteScope = 1 " 输入 :: 后自动补全
let OmniCpp_DefaultNamespaces = ["std", "_GLIBCXX_STD"]

" 自动关闭补全窗口
au CursorMovedI,InsertLeave * if pumvisible() == 0|silent! pclose|endif
set completeopt=menuone,menu,longest

"设置ACK
nmap <leader>a <Esc>:Ack!

"使用TAB键自动完成
""This function determines, wether we are on
"the start of the line text(then tab indents)
""or if we want to try auto completion
"function! InsertTabWrapper()
" let col=col('.')-1
"  if !col || getline('.')[col-1] !~ '\k'
"       return "\<TAB>"
"   else
"        return "\<C-N>"
"    endif
"endfunction

"F9单独切换打开nerd_tree（nerd_tree插件）
let g:NERDChristmasTree = 1              "色彩显示
let g:NERDTreeShowHidden = 0             "显示隐藏文件
let g:NERDTreeWinPos = 'left'            "窗口显示位置
let g:NERDTreeHighlightCursorline = 0    "高亮当前行
"nmap <F9>  :NERDTree<CR>
map <leader>n :NERDTreeToggle<CR>
autocmd BufEnter * if expand("%:p:h") !~ '^/tmp' | silent! lcd %:p:h | endif

"F2处理行尾的空格以及文件尾部的多余空行
"Automatically remove trailing spaces when saving a file.

"Remove indenting on empty line
map <F2> :w<CR>:call CleanupBuffer(1)<CR>:noh<CR>
function! CleanupBuffer(keep)
    " Skip binary files
    if (&bin > 0)
        return
    endif
    " Remove spaces and tabs from end of every line, if possible
    silent! %s/\s\+$//ge
    " Save current line number
    let lnum = line(".")
    " number of last line
    let lastline = line("$")
    let n        = lastline
    " while loop
    while (1)
        " content of last line
        let line = getline(n)
        " remove spaces and tab
        if (!empty(line))
            break
        endif
        let n = n - 1
    endwhile
    " Delete all empty lines at the end of file
    let start = n+1+a:keep
    if (start < lastline)
        execute n+1+a:keep . "," . lastline . "d"
    endif
    " after clean spaces and tabs, jump back
    exec "normal " . lnum . "G"
endfunction


"替换ESC键
imap jj <Esc>
