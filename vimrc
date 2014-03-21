"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>General
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set nocompatible

"	Sets how many lines of history VIM has to remember
set history=100

"	Enable filetype plugin
filetype plugin on
filetype indent on

"	Set to auto read when a file is changed from the outside
set autoread

"	With a map leader it's possible to do extra key combinations
"	like <leader>w saves the current file
"	confuse!
let mapleader=","
let g:mapleader=","

"mapleader is mapping to "," above ,so ,w equals to :w!
nmap <leader>w :w!<cr>
nmap <leader>f :find<cr>

"Fast editing of the _vimrc(windows platform) .vimrc(in unix/linux)
map <leader>e :e! /root/.vimrc<cr>
"Fast editing the new html file
map <leader>r :e! E:\swj\web\html example\<cr>

"When vimrc is edited,reload it
autocmd! bufwritepost vimrc source /root/.vimrc 

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=>colors and fonts
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"enable syntax hl
syntax enable

" Set font according to system
"if MySys() =="windows"
"		set gfn=Bitstream\ Vera\ Sans\ Mono:h10
"elseif MySys() == "linux"
"		set gfn=Monospace\ 10
"		set shell=/bin/bash
"endif

if has("gui_running")
		set guioptions-=T
		set t_Co=256
		set background=dark
		colorscheme peaksea
		set nonu
else
		colorscheme desert
		set background=dark
		set nonu
endif

"Default file types
set ffs=unix,dos,mac

""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"=> VIM user interface
""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"Set 7 lines to the cursors -when moving vertical.so stands for scroloff
"把光标始终固定在屏幕大概约中间的位置，上下至少留七行，这样翻页的时候不会混乱
set so=7

set wildmenu  "Turn on Wild menu

set ruler  "Always show current position

set cmdheight=2	"The commandbar height

"设置后编辑结束时隐藏缓冲区，否则卸载
set hidden "Change buffer -without saving

"Set backspace config
set backspace=eol,start,indent
set whichwrap+=<,>,h,l

set ignorecase "Ignore case when searching

"Done here next day go on haa~
let g:pydiction_location='C:\Program Files\Vim\vimfiles\ftplugin\pydiction\complete-dict'
set lines=25 columns=80
set tabstop=4
set nu
set nobackup
"source $VIMRUNTIME/vimrc_example.vim
"source $VIMRUNTIME/mswin.vim
"map <F12> <Esc>:!c:\python27\python.exe %<CR>
"map <F5> <ESC>:!c:\python32\python.exe %<CR>
"behave mswin

"taglist and ctags 
let Tlist_Ctags_Cmd='/usr/bin/ctags'
let Tlist_Show_One_File=1
let Tlist_Exit_OnlyWindow=1

"C/C++ coding 
"set sm
set cin
"
set diffexpr=MyDiff()
function MyDiff()
  let opt = '-a --binary '
  if &diffopt =~ 'icase' | let opt = opt . '-i ' | endif
  if &diffopt =~ 'iwhite' | let opt = opt . '-b ' | endif
  let arg1 = v:fname_in
  if arg1 =~ ' ' | let arg1 = '"' . arg1 . '"' | endif
  let arg2 = v:fname_new
  if arg2 =~ ' ' | let arg2 = '"' . arg2 . '"' | endif
  let arg3 = v:fname_out
  if arg3 =~ ' ' | let arg3 = '"' . arg3 . '"' | endif
  let eq = ''
  if $VIMRUNTIME =~ ' '
    if &sh =~ '\<cmd'
      let cmd = '""' . $VIMRUNTIME . '\diff"'
      let eq = '"'
    else
      let cmd = substitute($VIMRUNTIME, ' ', '" ', '') . '\diff"'
    endif
  else
    let cmd = $VIMRUNTIME . '\diff'
  endif
  silent execute '!' . cmd . ' ' . opt . arg1 . ' ' . arg2 . ' > ' . arg3 . eq
endfunction
