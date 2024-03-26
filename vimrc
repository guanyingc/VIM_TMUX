"--------------------------------------------------------------------------------
"     File Name           :     .vimrc
"     Created By          :     Chen Guanying (guanying2018@gmail.com)
"     Creation Date       :     [2017-01-07 17:39]
"     Last Modified       :     [2024-03-26 09:24]
"     Description         :      
"--------------------------------------------------------------------------------
" Vim configuration
set nocompatible            

" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
    Plugin 'VundleVim/Vundle.vim' " Plugin Manager
    Bundle 'altercation/vim-colors-solarized'
    Plugin 'tpope/vim-fugitive' " For Git
    Plugin 'morhetz/gruvbox' " 
    Plugin 'ctrlpvim/ctrlp.vim' " For Navigation / Code Searching between files
    Plugin 'scrooloose/nerdtree'
    Plugin 'majutsushi/tagbar'
    Plugin 'terryma/vim-smooth-scroll'
    Plugin 'MarcWeber/vim-addon-mw-utils' " For Vim-snippet
    Plugin 'tomtom/tlib_vim'
    Plugin 'garbas/vim-snipmate'
    Plugin 'GoYchen/vim-snippets'
    Plugin 'jiangmiao/auto-pairs' " For Bracket Completion
    Plugin 'tpope/vim-unimpaired' " For Handy Shortcut
    Plugin 'shanzi/autoHEADER'
    Plugin 'godlygeek/tabular'
    Plugin 'plasticboy/vim-markdown'
    Plugin 'webdevel/tabulous'
call vundle#end()            " required
filetype plugin indent on    " required
" :PluginList  :PluginInstall :PluginSearch foo  :PluginClean

"""""" Plugin Configuration"""""""
  " Fugitive.vim
    set diffopt+=vertical
    autocmd BufReadPost fugitive://* set bufhidden=delete
    " If doing a diff. Upon writing changes to file, automatically update the
    " differences
    autocmd BufWritePost * if &diff == 1 | diffupdate | endif
    autocmd User fugitive 
      \ if fugitive#buffer().type() =~# '^\%(tree\|blob\)$' |
      \   nnoremap <buffer> .. :edit %:h<CR> |
      \ endif

  " autoHEADER
    let g:autoHEADER_auto_enable=0
    let g:autoHEADER_default_author='Chen Guanying (guanying2018@gmail.com)'
  
  " NERD tree
    let NERDChristmasTree=0
    let NERDTreeWinSize=35
    let NERDTreeChDirMode=2
    let NERDTreeIgnore=['\~$', '\.pyc$', '\.swp$']
    let NERDTreeShowBookmarks=1
    let NERDTreeWinPos="left"
    set encoding=utf-8
    nmap ,d :NERDTreeToggle<cr>
  
  " Tagbar
    let g:tagbar_width=35
    let g:tagbar_autofocus=1
    nmap ,e :TagbarToggle<CR>
    autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTreeType") && b:NERDTreeType == "primary") | q | endif
  
  " ctrlp
    set wildignore+=*/tmp/*,*.so,*.swp,*.zip,*.png,*.jpg,*.jpeg,*.gif,*/logdir/*,*/Datasets/*,*/results/* " MacOSX/Linux*/datasets/*
    let g:ctrlp_custom_ignore = '\v[\/]\.(git|hg|svn)$'
    let g:ctrlp_user_command = ['.git/', 'git --git-dir=%s/.git ls-files -oc --exclude-standard']
    nmap ,r :CtrlPClearAllCaches<cr>
    if executable('ag')
      " Use Ag over Grep
      set grepprg=ag\ --nogroup\ --nocolor
      " Use ag in CtrlP for listing files.
      let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
      " Ag is fast enough that CtrlP doesn't need to cache
      let g:ctrlp_use_caching = 0
      let g:ctrlp_working_path_mode = 'ra'
    endif
    map ,t :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
    map ,v :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
  
  " Smooth scoll
    noremap <silent> <c-u> :call smooth_scroll#up(&scroll, 0, 2)<CR>
    noremap <silent> <c-d> :call smooth_scroll#down(&scroll, 0, 2)<CR>
    noremap <silent> <c-b> :call smooth_scroll#up(&scroll*2, 0, 4)<CR>
    noremap <silent> <c-f> :call smooth_scroll#down(&scroll*2, 0, 4)<CR>

    " snipMate
    let g:snipMate = { 'snippet_version' : 1  }
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
  set wildmode=longest,list " Tab autocompletion
  " GUI status, tools, menu bar
  syntax on " syntax
  let g:tex_flavor = "latex"
  let g:gruvbox_termcolors=256
  let g:gruvbox_contrast_dark="hard"
  set background=dark    " Setting dark mode
  let g:gruvbox_italic=0
  colorscheme gruvbox
    "let g:solarized_termcolors=16 "theme: solarized options
    "set t_Co=16  " For Ubuntu
    "set background=dark
    "let g:solarized_visibility = "high"
    "let g:solarized_contrast = "high"
    "colorscheme solarized
  "" GUI status
    set cursorline              " emphasize current line
    set statusline+=%{fugitive#statusline()} "  Git Hotness
    set statusline+=%F%m%r%h%w\ [FORMAT=%{&ff}]\ [TYPE=%Y]\ [POS=%l,%v][%p%%]\ %{strftime(\"%d/%m/%y\ -\ %H:%M\")}
    set relativenumber
    set number " line number
    set laststatus=2 " Always display the status line
    set foldenable      " fold and unfold
    set foldmethod=manual   " 
    "set foldmethod=indent 
    set foldcolumn=0
    set foldlevel=3 
    set autoindent " indent
    set cindent
    set smartindent
    set backspace=2
	set ignorecase smartcase " search and replace
	set hlsearch
	set incsearch
    set tabstop=4 "tab
    set softtabstop=4
    set shiftwidth=4
    set expandtab
    set smarttab
	set splitbelow "split 
	set splitright
    hi clear texItalStyle
    hi clear texBoldStyle
  " autocmd and file type
  let vim_markdown_folding_disabled = 1
  autocmd BufNewFile,BufRead *.md set filetype=markdown "Markdown to HTML
  autocmd BufNewFile,BufRead *.md setlocal spell
  autocmd BufNewFile,BufRead *.tex setlocal spell
  autocmd BufNewFile,BufRead GITCOMMIT setlocal spell
  autocmd BufRead,BufNewFile *  setfiletype txt
  set spelllang+=cjk
  "autocmd BufNewFile,BufRead *.txt setlocal spell

""""""""""""""" Customed Mapping mapping """""""""""""""""""
  " Window command
    map <C-h> <C-w>h
    map <C-j> <C-w>j
    map <C-k> <C-w>k
    map <C-l> <C-w>l
  " Space and enter
  map <Space> i<Space><ESC>
  map <Enter> o<ESC>
  " Insert mode  
  noremap! <C-F> <ESC> li
  noremap! <C-c> <ESC>
  "
  nnoremap ,g :Ggrep <cword> <CR>
  map ,m :w<CR>:make<CR><ESC>

"""""""""" Function""""""""""""""""
  " Update modified time Header 
  map ,h :call TitleDet()<cr>'s
  function! TitleDet()
    exe "1,7s/\\(Last Modified\\s\\+:\\s\\+\\)\\[[^\\]]\\+\\]/\\1[" . strftime("%Y-%m-%d %H:%M") . "]/" 
  endfunction

  "Show number in tabline
  set tabline=%!MyTabLine()  " custom tab pages line
  function! MyTabLine()
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
