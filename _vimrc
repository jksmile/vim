"---------------------------------------------------------------------------------------------- 
"Add by jinkai.xu at 2014-10-01  START
"---------------------------------------------------------------------------------------------- 
set nocompatible              " be iMproved, required
filetype off                  " required
" set the runtime path to include Vundle and initialize
:let $VIM="D:/Tools/vim"
set rtp+=$VIM/vimfiles/bundle/Vundle.vim/
let path='$VIM/vimfiles/bundle'
call vundle#begin(path)

" alternatively, pass a path where Vundle should install plugins
"call vundle#begin('~/some/path/here')

" let Vundle manage Vundle, required
Plugin 'gmarik/Vundle.vim'
Plugin 'mtth/locate.vim'
Plugin 'godlygeek/tabular'

" The following are examples of different formats supported.
" Keep Plugin commands between vundle#begin/end.

" plugin on GitHub repo
Plugin 'tpope/vim-fugitive'
Plugin 'mikelue/vim-maven-plugin'
Plugin 'Lokaltog/vim-powerline'
Plugin 'tpope/vim-surround'
"Plugin 'Raimondi/delimitMate'
"Plugin 'airblade/vim-gitgutter'
"Plugin 'Valloric/YouCompleteMe'

" plugin from http://vim-scripts.org/vim/scripts.html
Plugin 'L9'
Plugin 'taglist.vim'
Plugin 'The-NERD-tree'
Plugin 'Auto-Pairs'
Plugin 'Yggdroot/indentLine'
Plugin 'gregsexton/gitv'
Plugin 'tpope/vim-commentary'
"Plugin 'javacomplete'
"Plugin 'javabean.vim'
"Plugin 'JavaRun'
"Plugin 'java.vim'
"Plugin 'JavaBrowser'
"Plugin 'JavaImp.vim'
"Plugin 'The-NERD-Commenter'
Plugin 'EasyMotion'
"Plugin 'javaimp.vim'
"Plugin 'git.zip'
"Plugin 'javaimports.vim'


" Git plugin not hosted on GitHub
"=====For Example: Plugin 'git://git.wincent.com/command-t.git'

" git repos on your local machine (i.e. when working on your own plugin)
"=====For Example: Plugin 'file:///home/gmarik/path/to/plugin'

" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
"=====For Example: Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
Plugin 'rstacruz/sparkup', {'rtp': 'vim'}

" Avoid a name conflict with L9
"=====For Example: Plugin 'user/L9', {'name': 'newL9'}

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
"
"---------------------------------------------------------------------------------------------- 
"Add by jinkai.xu at 2014-10-01  END
"---------------------------------------------------------------------------------------------- 

source $VIMRUNTIME/vimrc_example.vim
source $VIMRUNTIME/mswin.vim
behave mswin

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





"-------------------------------------------------------------------------
"Auto reload for vim.
"-------------------------------------------------------------------------
"autocmd! bufwritepost _vimrc source % 


