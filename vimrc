" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

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
Plugin 'airblade/vim-gitgutter'
" Easy comments
Plugin 'scrooloose/nerdcommenter'
call vundle#end()
filetype plugin indent on

" Autosource vimrc on write.
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC nested source $MYVIMRC
augroup END

let mapleader = ","
"TODO voir localmapleader et g:mapleader
" set timeoutlen=666

" Update plugins.
nnoremap <leader>u :w<CR>:PluginUpdate<CR>

" Create a todo.
" TODO revoir ce truc avec la commande :startinsert
nnoremap <silent> <leader>t :execute "normal! OTODO "<CR>a
"nnoremap <leader>T <Plug>NerdCommenterComme

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

"nnoremap <Esc> :nohighlight<CR>

" TODO mettre en place la navigation par buffer comme si c'etait des tabs, et
" mapper comme pour un navigateur <C-Tab>, <C-S-Tab>, <C-opennew>, <C-edit>,
" <C-w> (voir si ces mappings sont pas deja pris

" TODO un truc qui me stresse c'est d'avoir un plugin qui m'ecrase un keymap,
" ya moyen d'avoir un warning par vim a ce niveau ?

" TODO plugin highlight du pattern de search courant

" Be centered
augroup be_centered
    autocmd!
    "autocmd CursorMoved * execute "normal! zz" | redraw | echo virtcol('.')
    "autocmd CursorMoved * echo wincol() | execute "normal! zz" | echo wincol()
    "autocmd CursorMovedI * let beforezz=getcurpos()[4] | execute "normal! zz" | redraw | echo beforezz getcurpos()[4]
augroup END

" Set colorscheme and syntax
colorscheme ubaryd
" has to be before syntax enable
set bg=dark
syntax enable

" Enable mouse for all modes
set mouse=a

" Encoding
set encoding=utf-8

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
nnoremap : q:i
"set history=200

" TODO find a mean to highlight the current search term with a different color
" TODO customize the airline status to remove undesired information, and get
" to know what the 'trailing' information is.
