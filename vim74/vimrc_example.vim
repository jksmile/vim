" An example for a vimrc file.
"
" Maintainer:	Bram Moolenaar <Bram@vim.org>
" Last change:	2011 Apr 15
"
" To use it, copy it to
"     for Unix and OS/2:  ~/.vimrc
"	      for Amiga:  s:.vimrc
"  for MS-DOS and Win32:  $VIM\_vimrc
"	    for OpenVMS:  sys$login:.vimrc

" When started as "evim", evim.vim will already have done these settings.
if v:progname =~? "evim"
  finish
endif

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif
set history=50		" keep 50 lines of command line history
set ruler		" show the cursor position all the time
set showcmd		" display incomplete commands
set incsearch		" do incremental searching

" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" In many terminal emulators the mouse works just fine, thus enable it.
if has('mouse')
  set mouse=a
endif

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 78 characters.
  autocmd FileType text setlocal textwidth=78

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  " Also don't do it when the mark is in the first line, that is the default
  " position when opening a file.
  autocmd BufReadPost *
    \ if line("'\"") > 1 && line("'\"") <= line("$") |
    \   exe "normal! g`\"" |
    \ endif

  augroup END

else

  set autoindent		" always set autoindenting on

endif " has("autocmd")

" Convenient command to see the difference between the current buffer and the
" file it was loaded from, thus the changes you made.
" Only define it when not defined already.
if !exists(":DiffOrig")
  command DiffOrig vert new | set bt=nofile | r ++edit # | 0d_ | diffthis
		  \ | wincmd p | diffthis
endif



"------------------------------------------------------------------------
"The following was added by jinkai.xu.
"------------------------------------------------------------------------


"-----------------------
"Basic setting for vim.
"-----------------------
color desert
set nu
set nobackup
set paste
set clipboard+=unnamed
set guioptions-=T
set showcmd

"-----------------------
"About file setting.
"-----------------------
set fileencoding=utf-8
syntax on
"filetype plugin on
filetype indent on
filetype plugin indent on


"-----------------------
"About search.
"-----------------------
set hlsearch                 " 开启高亮显示结果
set nowrapscan               " 搜索到文件两端时不重新搜索
set incsearch                " 开启实时搜索功能



"-----------------------
"About Taglist.
"-----------------------
let Tlist_Ctags_Cmd = '$VIM\ctags\ctags.exe'
let Tlist_Exit_OnlyWindow = 1
let Tlist_Auto_Open = 0
let Tlist_Use_Right_Window = 1
let Tlist_GainFocus_On_ToggleOpen = 1

"-----------------------
"About NERDTree.
"-----------------------
autocmd vimenter * NERDTree
"map  :silent! NERDTreeToggle
"let NERDTreeShowBookmarks=1
"let NERDChristmasTree=1
let NERDTreeWinPos='left'
"let loaded_nerd_tree= 1   "1 means close this function.
"let NERDTreeShowLineNumbers=1

"-----------------------
"About javacomplete.
"-----------------------
"setlocal omnifunc=javacomplete#Complete
"autocmd Filetype java set omnifunc=javacomplete#Complete
"autocmd Filetype java set completefunc=javacomplete#CompleteParamsInf
"inoremap <buffer> <C-X><C-U> <C-X><C-U><C-P>
"autocmd Filetype java,javascript,jsp inoremap <buffer>  .  .<C-X><C-O><C-P>

"-----------------------
"About Tabular.
"-----------------------
let g:tabular_loaded = 1


"-----------------------
"About Powerline.
"-----------------------
let g:Powerline_symobols = 'fancy'
set t_Co=256



