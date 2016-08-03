" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

" TODO voir pour faire un mapclear (et un function clear ?, peut etre pas
" necessaire car on peut declarer les fonctions grace a function! mais c'est
" peut-etre crade, voir aussi pour les noms d'autogroups)

"TODO voir localmapleader et g:mapleader
let mapleader = ","
" set timeoutlen=666


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" Plugins management. """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

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
" TODO voir ca et si je trouve un truc de match pairs correct
" alvan/vim-closetag
call vundle#end()
filetype plugin indent on
" Update plugins.
" TODO il faudrait utliser une fonction pour faire  if je suis dans le vimrc,
" je le write avant et c'est pas le cas juste j'update
nnoremap <unique> <leader>u :PluginUpdate<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure NERDCommenter.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1

" Configure the status line.
set noshowmode
set ttimeoutlen=50
" always have a status line
set laststatus=2
let g:airline_powerline_fonts = 1

nnoremap <unique> <leader><Space> :noh<CR>

" TODO mettre un mapping
" set pastetoggle=

" TODO relire cette doc
set clipboard=unnamed

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Quiting and saving."""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO ne fonctionne pas
" nnoremap <Esc> :q<CR>

" <C-v> is usually used to put the stop the process and put it to backgroound.
" I never use this feature so map it to update.
nnoremap <C-z> :update<CR>

" TODO la taille de l'aide de vim est fixe, 78 colonnes si je ne me trompe
" pas. Faire en sorte que quand je l'ouvre verticalement elle soit a la bonne
" taille, sauf je commence a bosser avec des buffers en guise de tabcs"


" TODO there are many other keys to be no-oped, like page up/down, do it later.
" Be a big boy, do not use arrows.
" TODO revoir les modes du noremap pour etre sur de tous les couvrir
noremap <DOWN> <NOP>
noremap <UP> <NOP>
noremap <LEFT> <NOP>
noremap <RIGHT> <NOP>


" Indenting blocks without losing the selection.
" TODO voir si c'est vraiment utile car l'indentation devrait etre geree
" automatiquement par des plugins ou la commande = ou gq ?
vnoremap < <gv
vnoremap > >gv

nnoremap H ^
nnoremap L $
" TODO mettre des unique, silent, expr partout ou cest necessaire pour les
" mappings

" Autosource vimrc on write.
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END








"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Congifure appearance : line numbers, color scheme, indentation, etc.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set colorscheme and syntax, order of instructions matter !!
" Normally t_Co should be set depending on the capabilities of the terminal,
" we assume that every terminal as 256 colors.
set t_Co=256
syntax enable
set bg=dark
colorscheme ubaryd
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
" Have cursor always centered vertically
set scrolloff=100



" Enable mouse for all modes
set mouse=a

" Encoding
set encoding=utf-8

" Always have a swapfile.
set swapfile

" Open help in a vertical split.
" TODO remove when using 'tabs' (buffers)
nnoremap <unique> <leader><leader> q:ivertical botright help<Space>




nnorema Q gq
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


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set hlsearch
set incsearch
set ignorecase
set smartcase
set wrapscan



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure the command-line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Improve command line, go to the command window !
set cmdwinheight=100
" TODO voir pourquoi le set history ne marche pas
set history=200
nnoremap : q:i
augroup escape_command_window
    autocmd!
    autocmd CmdwinEnter * noremap <Esc> <C-c><C-c>
    autocmd CmdwinLeave * unmap <Esc>
augroup END


" Create a todo.
nnoremap <silent> <leader>t O<Esc>0DiTODO<Space><Esc>:call NERDComment('n', 'comment')<CR>A

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set writebackup
set nopaste
nnoremap <leader>p :set paste<CR>p:set nopaste<CR>
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

vnoremap <Esc> o<Esc>

" TODO mettre en place la navigation par buffer comme si c'etait des tabs, et
" mapper comme pour un navigateur <C-Tab>, <C-S-Tab>, <C-opennew>, <C-edit>,
" <C-w> (voir si ces mappings sont pas deja pris

" TODO plugin highlight du pattern de search courant

" TODO faire un maps sur <Esc> pour quitter le fichier courant, avec un menu
" et des options pour save, cancel ou discard, dans le meme genre que quand on
" ouvre un fichier qui a swap associé

" TODO faire une autocommand qui avertit quand on a pas detecte de filetype
" (ou voir si ca existe)
" TODO la doc de vim donne les goods practice dev de plugin, verif vite fait
" si les plugins que j'utilise les respectent
" TODO voir si je peux modif la couleur des commentaires de ubaryd ou si il
" faut que je fasse mon theme ?
" TODO lire l'aider insert.txt pour connaitre tous les raccourcis utiles pour
" eviter de retourner toujours en mode normal puis insert a nouveau
" TODO faire un macro qui permet de deplacer un block en mode visual line
" TODO utiliser les arrows pour changer de buffer, ca peut etre une bonne idee

" TODO voir si je met en place le autosave des buffer, je pense que oui car
" tout fichier devrait etre sous git et je peux donc recup l'ancienne version
" dans mon depot si je veux, du coup, est-ce que je vire le set backup



" TODO voir pourquoi ca ne marche pas
" autocmd ColorScheme * highlight ExtraWhitespace ctermbg=red             
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/

