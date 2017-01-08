" Vim configuration

set nocompatible              " be iMproved, required
filetype off                  " required

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.
" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'majutsushi/tagbar'
Plugin 'morhetz/gruvbox'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'terryma/vim-smooth-scroll'
" Optional:
 Plugin 'GoYchen/vim-snippets'
" Plugin 'honza/vim-snippets'
" Plugin 'vim-scripts/cscope.vim'
"Plugin 'junegunn/seoul256.vim'
"" plugin from http://vim-scripts.org/vim/scripts.html
"Plugin 'L9'
"" Git plugin not hosted on GitHub
"Plugin 'git://git.wincent.com/command-t.git'
"" git repos on your local machine (i.e. when working on your own plugin)
"Plugin 'file:///home/gmarik/path/to/plugin'
"" The sparkup vim script is in a subdirectory of this repo called vim.
"" Pass the path to set the runtimepath properly.
"Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
"" Install L9 and avoid a Naming conflict if you've already installed a
"" different version somewhere else.
"Plugin 'ascenator/L9', {'name': 'newL9'}

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required
" To ignore plugin indent changes, instead use:
"filetype plugin on
"
" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

" NERD tree
let NERDChristmasTree=0
let NERDTreeWinSize=35
let NERDTreeChDirMode=2
let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
let NERDTreeShowBookmarks=1
let NERDTreeWinPos="left"
nmap <F3> :NERDTreeToggle<cr>

" Tagbar
let g:tagbar_width=35
let g:tagbar_autofocus=1
nmap <F4> :TagbarToggle<CR>
" Automatically open a NERDTree if no files where specified
" autocmd vimenter * if !argc() | NERDTree | endif
" Close vim if the only window left open is a NERDTree
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif

" ctrap
set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif " MacOSX/Linux
let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'

if executable('ag')
  " Use Ag over Grep
  set grepprg=ag\ --nogroup\ --nocolor
  " Use ag in CtrlP for listing files.
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
  " Ag is fast enough that CtrlP doesn't need to cache
  let g:ctrlp_use_caching = 0
  let g:ctrlp_working_path_mode = 'ra'
endif

map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <C-n> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

" cscope
nnoremap <leader>fa :call cscope#findInteractive(expand('<cword>'))<CR>
nnoremap <leader>l :call ToggleLocationList()<CR>
" s: Find this C symbol
nnoremap  <leader>fs :call cscope#find('s', expand('<cword>'))<CR>
" g: Find this definition
nnoremap  <leader>fg :call cscope#find('g', expand('<cword>'))<CR>
" d: Find functions called by this function
nnoremap  <leader>fd :call cscope#find('d', expand('<cword>'))<CR>
" c: Find functions calling this function
nnoremap  <leader>fc :call cscope#find('c', expand('<cword>'))<CR>
" t: Find this text string
"nnoremap  <leader>ft :call cscope#find('t', expand('<cword>'))<CR>
"" e: Find this egrep pattern
"nnoremap  <leader>fe :call cscope#find('e', expand('<cword>'))<CR>
" f: Find this file
nnoremap  <leader>ff :call cscope#find('f', expand('<cword>'))<CR>
" i: Find files #including this file
nnoremap  <leader>fi :call cscope#find('i', expand('<cword>'))<CR>

""""""""""""""" general settings  """""""""""""""
set showcmd
set completeopt=preview,menu 
set nocompatible
set magic                   " open regular operation
set clipboard+=unnamed 
set nobackup
set autowrite
set noeb " no error beeze
set confirm " show promt 
set history=1000 "hitory record
set noswapfile
set gdefault
set viminfo+=!
set iskeyword+=_,$,@,%,#,-
set linespace=0
set whichwrap+=<,>,h,l

" GUI status, tools, menu bar
""syntax
set syntax=on

let g:gruvbox_contrast_dark='hard'
colorscheme gruvbox "ron
let NVIM_TUI_ENABLE_TRUE_COLOR=1
set cursorline              " emphasize current line
set statusline+=%{fugitive#statusline()} "  Git Hotness
set statusline+=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}   "状态行显示的内容  
set relativenumber
set number " line number
set laststatus=2 " Always display the status line

" fold and unfold
set foldenable      " 允许折叠  
"set foldmethod=manual   " 手动折叠 
set foldmethod=indent 
set foldcolumn=0
set foldlevel=3 

" indent
set autoindent
set cindent
set smartindent
set backspace=2


" search and replace
set ignorecase smartcase
set hlsearch
set incsearch

"tab
set tabstop=4
set softtabstop=4
set shiftwidth=4
set noexpandtab
set smarttab

"split 
set splitbelow
set splitright
" autocmd and file type
autocmd BufNewFile,BufRead *.md set filetype=markdown "Markdown to HTML
filetype on
filetype plugin on
filetype indent on
au BufRead,BufNewFile *  setfiletype txt

""""""""""""""" mapping """""""""""""""""""
map <C-1> 1gt
map <C-2> 2gt
map <C-3> 3gt

" window command
map <C-h> <C-w>h
map <C-j> <C-w>j
map <C-k> <C-w>k
map <C-l> <C-w>l

map <Space> i<Space><ESC>
map <Enter> o<ESC>

noremap! <C-F> <ESC> li
" F2 save
noremap <F2> <Esc>:w<CR>
inoremap <F2> <Esc>:w<CR>a

" auto complete
:inoremap ( ()<ESC>i
:inoremap ) <c-r>=ClosePair(')')<CR>
":inoremap { {}<ESC>i
:inoremap } <c-r>=ClosePair('}')<CR>

:inoremap [ []<ESC>i
:inoremap ] <c-r>=ClosePair(']')<CR>
":inoremap " ""<ESC>i
":inoremap ' ''<ESC>i
noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>


function! ClosePair(char)
	if getline('.')[col('.') - 1] == a:char
		return "\<Right>"
	else
		return a:char
	endif
endfunction


"""""""""""" Show number in tabline""""""""""""""'
set tabline=%!MyTabLine()  " custom tab pages line
function MyTabLine()
        let s = '' " complete tabline goes here
        " loop through each tab page
        for t in range(tabpagenr('$'))
                " set highlight
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " set the tab page number (for mouse clicks)
                let s .= '%' . (t + 1) . 'T'
                let s .= ' '
                " set page number string
                let s .= t + 1 . ' '
                " get buffer names and statuses
                let n = ''      "temp string for buffer names while we loop and check buftype
                let m = 0       " &modified counter
                let bc = len(tabpagebuflist(t + 1))     "counter to avoid last ' '
                " loop through each buffer in a tab
                for b in tabpagebuflist(t + 1)
                        " buffer types: quickfix gets a [Q], help gets [H]{base fname}
                        " others get 1dir/2dir/3dir/fname shortened to 1/2/3/fname
                        if getbufvar( b, "&buftype" ) == 'help'
                                let n .= '[H]' . fnamemodify( bufname(b), ':t:s/.txt$//' )
                        elseif getbufvar( b, "&buftype" ) == 'quickfix'
                                let n .= '[Q]'
                        else
                                let n .= pathshorten(bufname(b))
                        endif
                        " check and ++ tab's &modified count
                        if getbufvar( b, "&modified" )
                                let m += 1
                        endif
                        " no final ' ' added...formatting looks better done later
                        if bc > 1
                                let n .= ' '
                        endif
                        let bc -= 1
                endfor
                " add modified label [n+] where n pages in tab are modified
                if m > 0
                        let s .= '[' . m . '+]'
                endif
                " select the highlighting for the buffer names
                " my default highlighting only underlines the active tab
                " buffer names.
                if t + 1 == tabpagenr()
                        let s .= '%#TabLineSel#'
                else
                        let s .= '%#TabLine#'
                endif
                " add buffer names
                if n == ''
                        let s.= '[New]'
                else
                        let s .= n
                endif
                " switch to no underlining and add final space to buffer list
                let s .= ' '
        endfor
        " after the last tab fill with TabLineFill and reset tab page nr
        let s .= '%#TabLineFill#%T'
        " right-align the label to close the current tab page
        if tabpagenr('$') > 1
                let s .= '%=%#TabLineFill#%999Xclose'
        endif
        return s
endfunction


""""""""""""" Copyright setting"""""""""""
map <F5> :call TitleDet()<cr>'s
function AddTitle()
    call append(0,"/*=============================================================================")
    "call append(1,"# Copyright (c) 2017 Chen Guanying. All Rights Reserved")
    call append(1,"# Author: Chen Guanying - GoYchen@foxmail.com")
    call append(2,"# Last modified: ".strftime("%Y-%m-%d %H:%M"))
    call append(3,"# Filename: ".expand("%:t"))
    call append(4,"# Description: ")
    call append(5,"=============================================================================*/")
    echohl WarningMsg | echo "Successful in adding the copyright." | echohl None
endf
"Upate time
function UpdateTitle()
    normal m'
    execute '/# *Last modified:/s@:.*$@\=strftime(":\t%Y-%m-%d %H:%M")@'
    normal ''
    normal mk
    execute '/# *Filename:/s@:.*$@\=":\t\t".expand("%:t")@'
    execute "noh"
    normal 'k
    echohl WarningMsg | echo "Successful in updating the copy right." | echohl None
endfunction
function TitleDet()
    let n=1
    "默认为添加
    while n < 10
        let line = getline(n)
        if line =~ '^\#\s*\S*Last\smodified:\S*.*$'
            call UpdateTitle()
            return
        endif
        let n = n + 1
    endwhile
    call AddTitle()
endfunction
