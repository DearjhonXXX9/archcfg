" pip install flake8 autopep8  pygame matplotlib torch pynvim
" yay -S  cppcheck instant-markdown-d stylelint shfmt  python-pip npm

" CocInstall coc-pyright coc-html coc-sh coc-json coc-tsserver coc-snippets coc-clangd coc-go coc-css coc-emmet coc-htmlhint coc-git
" sudo npm -g install instant-markdown-d
" bracey 使用 在plugged目录  npm install --prefix server



set cmdheight=1

set autochdir                 " 自动改变路径
set nocompatible              " be iMproved, required
filetype off                  " required
" 搜索时大小写不敏感
set ignorecase
" vim 自身命令行模式智能补全
set wildmenu

" 忽略插入模式的行间跳跃，为了实现文件间跳转

set clipboard+=unnamedplus
set encoding=UTF-8
call plug#begin('~/.config/nvim/plugged')

"-------------------=== Code/Project navigation ===-------------
Plug 'scrooloose/nerdtree'                " 目录树插件
Plug 'majutsushi/tagbar'                  " 显示类，变量之类的标签插件
"Plug 'liuchengxu/vim-clap', { 'do': ':Clap install-binary' }   " 模糊搜索插件
Plug 'kien/ctrlp.vim'                     " 模糊搜索文件 ctrl p
Plug 'tpope/vim-markdown'                   " markdown
Plug 'instant-markdown/vim-instant-markdown'


"-------------------=== Other ===-------------------------------
Plug 'bling/vim-airline'                  " 底部状态增强/美化插件
Plug 'vim-airline/vim-airline-themes'     " 上面插件的主题
Plug 'Lokaltog/powerline'                 " 状态行插件
Plug 'fisadev/FixedTaskList.vim'          " 任务列表插件 处理标签

Plug 'tpope/vim-surround'                 " 轻松处理成对的符号，括号，方括号等
Plug 'tpope/vim-repeat'                   " 配合上一个插件使用，可以.重复上一个步骤
Plug 'flazz/vim-colorschemes'             " Colorschemes 通过命令:colorscheme {theme}来改变主题
Plug 'tpope/vim-fugitive'
Plug 'turbio/bracey.vim', {'do': 'npm install --prefix server'}
" Plug 'terryma/vim-multiple-cursors'       " vim多光标
"Plug 'glepnir/dashboard-nvim'            " 开始面板 导航   现在不知道怎么设置自启

"-------------------=== Snippets support ===--------------------

Plug 'luochen1990/rainbow'       "彩虹括号s
Plug 'jiangmiao/auto-pairs'      "自动补全括号，引号 <>等
Plug 'Chiel92/vim-autoformat'    "格式化代码
Plug 'AnotherProksY/ez-window'   "窗口管理
Plug 'mattn/emmet-vim'


"-------------------=== Languages support ===-------------------
Plug 'tpope/vim-commentary'               " 注释插件   gc   为快捷键


Plug 'vim-scripts/c.vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}

"-------------------=== Python  ===-----------------------------

Plug 'scrooloose/syntastic'               " 错误检查 语法检测
Plug 'klen/python-mode'                   " Python mode (docs, refactor, lints...)   python模式

"-------------------------------------------------------------------------------------
Plug 'ryanoasis/vim-devicons'             "需要最后加载  目录树图标



call plug#end()

"=====================================================
"" General settings
"=====================================================
syntax enable                               " syntax highlight

set t_Co=256                                " set 256 colors
colorscheme PaperColor                        " set color scheme

set number                                  " show line numbers
set ruler
set ttyfast                                 " terminal acceleration

set tabstop=4                               " 4 whitespaces for tabs visual presentation
set shiftwidth=4                            " shift lines by 4 spaces
set smarttab                                " set tabs for a shifttabs logic
set expandtab                               " expand tabs into spaces
set autoindent                              " indent when moving to the next line while writing code

set cursorline                              " shows line under the cursor's line
set showmatch                               " shows matching part of bracket pairs (), [], {}

set enc=utf-8                               " utf-8 by default

set nobackup                                " no backup files
set nowritebackup                           " only in case you don't want a backup file while editing
set noswapfile                              " no swap files

set backspace=indent,eol,start              " backspace removes all (indents, EOLs, start) What is start?

set scrolloff=10                            " let 10 lines before/after cursor during scroll

set clipboard=unnamed                       " use system clipboard

set exrc                                    " enable usage of additional .vimrc files from working directory
set secure                                  " prohibit .vimrc files to execute shell, create files, etc...





"=====================================================
"" Tabs / Buffers settings
"=====================================================
tab sball
set switchbuf=useopen
set laststatus=2


nnoremap <silent> [p :bprevious<CR>
nnoremap <silent> ]p :bnext<CR>
nmap <silent> <leader>q :SyntasticCheck # <CR> :bp <BAR> bd #<CR>


" ======================================================
"" Search settings
"=====================================================
set incsearch                               " incremental search
set hlsearch                                " highlight search results

"=====================================================
"" AirLine settings
"=====================================================
let g:airline_theme='fairyfloss'
let g:airline#extensions#tabline#enabled=1
let g:airline#extensions#tabline#formatter='unique_tail'
let g:airline_powerline_fonts=1

"=====================================================
"" TagBar settings
"=====================================================
let g:tagbar_autofocus=0
let g:tagbar_width=27
nmap <F12> :TagbarToggle<CR>

"autocmd BufEnter *.py :call tagbar#autoopen(0)

"=====================================================
"" NERDTree settings
"=====================================================
let NERDTreeIgnore=['\.pyc$', '\.pyo$', '__pycache__$']     " Ignore files in NERDTree
let NERDTreeWinSize=20
nnoremap <C-f> :NERDTreeToggle<CR>

" Start NERDTree, unless a file or session is specified, eg. vim -S session_file.vim.
autocmd StdinReadPre * let s:std_in=1
autocmd VimEnter * if argc() == 0 && !exists('s:std_in') && v:this_session == '' | NERDTree | endif





" 如果 NERDTree 是唯一选项卡中剩余的唯一窗口，则退出 Vim。
autocmd BufEnter * if tabpagenr('$') == 1 && winnr('$') == 1 && exists('b:NERDTree') && b:NERDTree.isTabTree() | quit | endif



" nerdtree跟随打开的文件自动跳转目录
" Check if NERDTree is open or active
function! IsNERDTreeOpen()
    return exists("t:NERDTreeBufName") && (bufwinnr(t:NERDTreeBufName) != -1)
endfunction
" Call NERDTreeFind iff NERDTree is active, current window contains a modifiable
" file, and we're not in vimdiff
function! SyncTree()
    if &modifiable && IsNERDTreeOpen() && strlen(expand('%')) > 0 && !&diff
        NERDTreeFind
        wincmd p
    endif
endfunction
" Highlight currently open buffer in NERDTree
autocmd BufEnter * call SyncTree()

function! ToggleNerdTree()
    set eventignore=BufEnter
    NERDTreeToggle
    set eventignore=
endfunction

autocmd vimenter * NERDTree ~/Documents/coding

"=====================================================
"" Python settings
"=====================================================

" python executables for different plugins
let g:pymode_python='python3'
let g:syntastic_python_python_exec='python3'

" rope
let g:pymode_rope=0
let g:pymode_rope_completion=0
let g:pymode_rope_complete_on_dot=0
let g:pymode_rope_auto_project=0
let g:pymode_rope_enable_autoimport=0
let g:pymode_rope_autoimport_generate=0
let g:pymode_rope_guess_project=0

" documentation
let g:pymode_doc=1
let g:pymode_doc_bind='K'

" lints
let g:pymode_lint=0

" virtualenv
let g:pymode_virtualenv=1

" breakpoints
let g:pymode_breakpoint=1
let g:pymode_breakpoint_key='<leader>b'

" syntax highlight
let g:pymode_syntax=1
let g:pymode_syntax_slow_sync=1
let g:pymode_syntax_all=1
let g:pymode_syntax_print_as_function=g:pymode_syntax_all
let g:pymode_syntax_highlight_async_await=g:pymode_syntax_all
let g:pymode_syntax_highlight_equal_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_stars_operator=g:pymode_syntax_all
let g:pymode_syntax_highlight_self=g:pymode_syntax_all
let g:pymode_syntax_indent_errors=g:pymode_syntax_all
let g:pymode_syntax_string_formatting=g:pymode_syntax_all
let g:pymode_syntax_space_errors=g:pymode_syntax_all
let g:pymode_syntax_string_format=g:pymode_syntax_all
let g:pymode_syntax_string_templates=g:pymode_syntax_all
let g:pymode_syntax_doctests=g:pymode_syntax_all
let g:pymode_syntax_builtin_objs=g:pymode_syntax_all
let g:pymode_syntax_builtin_types=g:pymode_syntax_all
let g:pymode_syntax_highlight_exceptions=g:pymode_syntax_all
let g:pymode_syntax_docstrings=g:pymode_syntax_all
" highlight 'long' lines (>= 80 symbols) in python files
augroup vimrc_autocmds
    autocmd!
    autocmd FileType python,rst,c,cpp highlight Excess ctermbg=DarkGrey guibg=Black
    autocmd FileType python,rst,c,cpp match Excess /\%81v.*/
    autocmd FileType python,rst,c,cpp set nowrap
    autocmd FileType python,rst,c,cpp set colorcolumn=80
augroup END

" code folding
let g:pymode_folding=0

" pep8 indents
let g:pymode_indent=1

" code running
let g:pymode_run=1
let g:pymode_run_bind='<F5>'

" syntastic
let g:syntastic_always_populate_loc_list=1
let g:syntastic_auto_loc_list=1
let g:syntastic_enable_signs=1
let g:syntastic_check_on_wq=0
let g:syntastic_aggregate_errors=1
let g:syntastic_loc_list_height=6
let g:syntastic_error_symbol='X'
let g:syntastic_style_error_symbol='X'
let g:syntastic_warning_symbol='x'
let g:syntastic_style_warning_symbol='x'


" ===================================================
" autoformat
"=====================================================
"F3自动格式化代码并保存
noremap <F3> :Autoformat<CR>:w<CR>
let g:autoformat_verbosemode=1
"let g:formatter_yapf_style = 'pep8'

"export PATH="/home/jack/.local/bin:$PATH"
"export PATH="$PATH:/home/jack/.local/bin"
" ====================================================
" rainbow 彩虹括号
" =====================================================
"rainbow
let g:rainbow_active = 1
let g:rainbow_conf = {
            \   'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick'],
            \   'ctermfgs': ['lightblue', 'lightyellow', 'lightcyan', 'lightmagenta'],
            \   'operators': '_,_',
            \   'parentheses': ['start=/(/ end=/)/ fold', 'start=/\[/ end=/\]/ fold', 'start=/{/ end=/}/ fold'],
            \   'separately': {
                \       '*': {},
                \       'tex': {
                    \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/'],
                    \       },
                    \       'lisp': {
                        \           'guifgs': ['royalblue3', 'darkorange3', 'seagreen3', 'firebrick', 'darkorchid3'],
                        \       },
                        \       'vim': {
                            \           'parentheses': ['start=/(/ end=/)/', 'start=/\[/ end=/\]/', 'start=/{/ end=/}/ fold', 'start=/(/ end=/)/ containedin=vimFuncBody', 'start=/\[/ end=/\]/ containedin=vimFuncBody', 'start=/{/ end=/}/ fold containedin=vimFuncBody'],
                            \       },
                            \       'html': {
                                \           'parentheses': ['start=/\v\<((area|base|br|col|embed|hr|img|input|keygen|link|menuitem|meta|param|source|track|wbr)[ >])@!\z([-_:a-zA-Z0-9]+)(\s+[-_:a-zA-Z0-9]+(\=("[^"]*"|'."'".'[^'."'".']*'."'".'|[^ '."'".'"><=`]*))?)*\>/ end=#</\z1># fold'],
                                \       },
                                \       'css': 0,
                                \   }
                                \}
"================================================================================
"   Markdown preview
"  ==============================================================================
"Uncomment to override defaults:
"let g:instant_markdown_slow = 1
"let g:instant_markdown_autostart = 1
"let g:instant_markdown_open_to_the_world = 1
"let g:instant_markdown_allow_unsafe_content = 1
"let g:instant_markdown_allow_external_content = 0
"let g:instant_markdown_mathjax = 1
"let g:instant_markdown_mermaid = 1
"let g:instant_markdown_logfile = '/tmp/instant_markdown.log'
"let g:instant_markdown_autoscroll = 0
"let g:instant_markdown_port = 8888
"let g:instant_markdown_python = 1


let g:AutoPairs = {'(':')', '[':']', '{':'}',"'":"'",'"':'"', '<' : '>'}





"-------------------------------------------------------------------------
" ez-window 插件
"-------------------------------------------------------------------------




" Change default 'Window Resize' mode mapping:
let g:resize_start_key = '<C-x>'  " or any key you want

" Change 'Open Terminal' mapping:
let g:ez_terminal_key = '<C-y>'   " or any key you want


" use <tab> for trigger completion and navigate to the next complete item
function! s:check_back_space() abort
    let col = col('.') - 1
    return !col || getline('.')[col - 1]  =~ '\s'
endfunction

inoremap <silent><expr> <Tab>
            \ pumvisible() ? "\<C-n>" :
            \ <SID>check_back_space() ? "\<Tab>" :
            \ coc#refresh()

"================================================================================
"   vim-devicons
"  ==============================================================================


" adding the flags to NERDTree
let g:webdevicons_enable_nerdtree = 0


nnoremap <silent> <F10> :Bracey<CR>
