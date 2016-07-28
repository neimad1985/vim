" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" I put the mapleader defin
let mapleader = ","
"TODO voir localmapleader et g:mapleader
" set timeoutlen=666


" Plugins management.
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Let Vundle manage itself
Plugin 'VundleVim/Vundle.vim'
" Colorschemes
Plugin 'nanotech/jellybeans.vim'
Plugin 'Donearm/Ubaryd'
Plugin 'tomasr/molokai'
" Completion
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'
" Status line
Plugin 'vim-airline/vim-airline'
" Highlight
Plugin 'haya14busa/incsearch.vim'
" Git integration
Plugin 'tpope/vim-fugitive'
" Easy comments
Plugin 'scrooloose/nerdcommenter'
call vundle#end()
filetype plugin indent on
" Update plugins.
" TODO il faudrait utliser une fonction pour faire  if je suis dans le vimrc,
" je le write avant et c'est pas le cas juste j'update
nnoremap <unique> <leader>u :PluginUpdate<CR>

" Configure NERDCommenter.
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

nnoremap <unique> <leader><Space> :noh<CR>




" Autosource vimrc on write.
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END








" Set colorscheme and syntax, order of instructions matter !!
syntax enable
set bg=dark
colorscheme ubaryd

" Enable mouse for all modes
set mouse=a

" Encoding
set encoding=utf-8

" Always have a swapfile.
set swapfile

" Open in a vertical split
" TODO remove when using 'tabs' (buffers)
nnoremap <unique> <leader><leader> q:ivertical botright help<Space>


" Be centered
"augroup be_centered
"    autocmd!
"    autocmd CursorMoved * execute "normal! zz" | redraw | echo virtcol('.')
"    autocmd CursorMoved * echo wincol() | execute "normal! zz" | echo wincol()
"    autocmd CursorMovedI * let beforezz=getcurpos()[4] | execute "normal! zz" | redraw | echo beforezz getcurpos()[4]
"augroup END

" Status line config
set noshowmode
set ttimeoutlen=50
" always have a status line
set laststatus=2
let g:airline_powerline_fonts = 1

nnoremap Q gq
nnoremap gQ <NOP>

" Allow backspacing over everything in insert mode.
set backspace=indent,eol,start

" Keep a backup file.
set backup
" keep 50 lines of command line history
set history=50
"show the cursor position all the time
set ruler
" display incomplete commands
set showcmd
set ignorecase
set smartcase

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>

" When editing a file, always jump to the last known cursor position.
" Don't do it when the position is invalid or when inside an event handler
" (happens when dropping a file on gvim).
" TODO comment savoir si ce nom de groupe n'existe pas deja, car c'est risque,
" vu que je fais autocmd! au debut, je peux potentiellement virer des autocmds
" sans le savoir
augroup RestoreCursor
    autocmd!
    autocmd BufReadPost *
\       if line("'\"") >= 1 && line("'\"") <= line("$") |
\           exe "normal! g`\"" |
\       endif
augroup END


set list
set listchars=tab:>.,trail:.,eol:-,nbsp:%,extends:~,precedes:~

set relativenumber
set number
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wrap

set colorcolumn=80

set hlsearch
set incsearch
set wrapscan



" Improve command line, go to the command window !
" TODO voir si je ne fais pas une fonction qui recupere la taille de la
" fenetre actuelle et qui set cmdwinheight au vol pour que ca prenne tout
" l'ecran
set cmdwinheight=25
" TODO voir pourquoi le set history ne marche pas
set history=200
nnoremap : q:i
nnoremap / q/i
nnoremap ? q?i


" Create a todo.
nnoremap <silent> <leader>t O<Esc>0DiTODO<Space><Esc>:call NERDComment('n', 'comment')<CR>A

" TODO find a mean to highlight the current search term with a different color
" TODO customize the airline status to remove undesired information, and get
" to know what the 'trailing' information is.
" TODO voir un peu ce que c'est <silent> et <expr> pour map, chercher du cote
" de <unique>

" TODO resoudre le bug qui fait que je ne peux pas remappe <Esc> a cause des
" arrows keys, la solution etant ptet d'arreter d'etre un n00b et de remap les 
" arrows sur <nop>


"TODO quand j'aurai resolu le bug du remap du <Esc> mettre en place les map
"suivants (ne pas les mettre ici mais dans leur section, exemple le premier
"appartient a la section de la commande line window: 

"augroup escape_command_window
"    autocmd!
"    autocmd CmdwinEnter * nnoremap <Esc> Go<CR>
"    autocmd CmdwinLeave * nunmap <Esc>
"augroup END

"vnoremap <Esc> o<Esc>

" TODO mettre en place la navigation par buffer comme si c'etait des tabs, et
" mapper comme pour un navigateur <C-Tab>, <C-S-Tab>, <C-opennew>, <C-edit>,
" <C-w> (voir si ces mappings sont pas deja pris

" TODO plugin highlight du pattern de search courant

" TODO faire un maps sur <Esc> pour quitter le fichier courant, avec un menu
" et des options pour save, cancel ou discard, dans le meme genre que quand on
" ouvre un fichier qui a swap associé

" TODO configurer nerdcommenter
"
" TODO faire une autocommand qui avertit quand on a pas detecte de filetype
" (ou voir si ca existe)
" TODO la doc de vim donne les goods practice dev de plugin, verif vite fait
" si les plugins que j'utilise les respectent
" TODO voir si je peux modif la couleur des commentaires de ubaryd ou si il
" faut que je fasse mon theme ?
