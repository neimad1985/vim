" Use Vim settings, rather than Vi settings (much better !).
" This must be first, because it changes other options as a side effect.
" Usually it is already set but enforce it, just in case.
set nocompatible

" Autosource vimrc on write.
augroup reload_vimrc
    autocmd!
    autocmd BufWritePost *vimrc source $VIM/vimfiles/vimrc | AirlineRefresh
augroup END

" As we autosource vimrc on write and often use '<unique>' when defining
" mappings, we can have warnings each time we save. So we reset the all the
" mappings at start.
mapclear
mapclear!

" TODO voir pour faire un mapclear (et un function clear ?, peut etre pas
" necessaire car on peut declarer les fonctions grace a function! mais c'est
" peut-etre crade, voir aussi pour les noms d'autogroups)

"TODO voir localmapleader et g:mapleader
let mapleader = ","
" set timeoutlen=666


" TODO ne marche pas 
" nnoremap <leader>v edit /home/neimad/customvim/share/vim/vimfiles/vimrc<CR>





"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure NERDCommenter.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Add spaces after comment delimiters by default
let g:NERDSpaceDelims = 1









"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure Airline/the status line.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Do not show mode as we use a custom status line
set noshowmode
set ttimeoutlen=50
" Show status line even when only one file is opened
set laststatus=2
let g:airline_powerline_fonts = 1
" Enable the list of buffers
"let g:airline#extensions#tabline#enabled = 1
" Show only the filename
" let g:airline#extensions#tabline#fnamemod = ':t'







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure easy-tags.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let g:easytags_async = 1
let g:easytags_always_enabled = 1
let g:easytags_resolve_links = 1
" TODO setter l'option g:easytags_file quand j'aurais fini mon script
" d'install auto pour que ça n'aille pas dans ~/.vim/tags mais
" ~/something/tags, something sera sans doute un truc du genre $VIMRUNTIME ou
" autre
" TODO lire la doc des tags






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" Plugins management. """""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" filetype off
" set rtp+=~/.vim/bundle/Vundle.vim
call plug#begin()
" Let Vundle manage itself
" Plugin 'VundleVim/Vundle.vim'
" Colorschemes
Plug 'nanotech/jellybeans.vim'
Plug 'Donearm/Ubaryd'
Plug 'tomasr/molokai'
" Completion
"Plugin 'Valloric/YouCompleteMe'
"Plugin 'davidhalter/jedi-vim'
" Status line
Plug 'vim-airline/vim-airline'
" Highlight
Plug 'haya14busa/incsearch.vim'
" Git integration
Plug 'tpope/vim-fugitive'
" Easy comments
Plug 'scrooloose/nerdcommenter'
" TODO voir ca et si je trouve un truc de match pairs correct
" alvan/vim-closetag
Plug 'xolox/vim-misc'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
" TODO behind
" Plugin 'SirVer/ultisnips'
call plug#end()
" filetype plugin indent on
" Update plugins.
" TODO il faudrait utliser une fonction pour faire  if je suis dans le vimrc,
" je le write avant et c'est pas le cas juste j'update
nnoremap <unique> <leader>u :update<CR>:PlugUpdate<CR>






"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""" Quiting and saving."""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""

" <C-v> is usually used to stop the process and put it to backgroound.
" I never use this feature so map it to update.
nnoremap <C-z> :update<CR>

" TODO la taille de l'aide de vim est fixe, 78 colonnes si je ne me trompe
" pas. Faire en sorte que quand je l'ouvre verticalement elle soit a la bonne
" taille, sauf je commence a bosser avec des buffers en guise de tabcs"










"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Motions.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" TODO there are many other keys to be no-oped, like page up/down, do it later.
" Be a big boy, do not use arrows.
" TODO revoir les modes du noremap pour etre sur de tous les couvrir

" Disable arrows keys for all modes except Command-line as it is convenient to
" move through last searches/commands with the arrows.
" Insert mode below.
inoremap <unique> <DOWN> <NOP>
inoremap <unique> <UP> <NOP>
inoremap <unique> <LEFT> <NOP>
inoremap <unique> <RIGHT> <NOP>
" Normal, Visual, Select, Operator-pending modes below.
noremap <unique> <DOWN> <NOP>
noremap <unique> <UP> <NOP>
noremap <unique> <LEFT> <NOP>
noremap <unique> <RIGHT> <NOP>



" TODO il faudrait unmap 0 aussi quand j'aurais trouve un moyen de faire la
" meme chose, il me semble qu'une commande qui commence par 'g' le fait.
nnoremap <unique> H ^
nnoremap <unique> L $
nnoremap <unique> ^ <NOP>
nnoremap <unique> $ <NOP>


" Have cursor always centered vertically
set scrolloff=100
" 'z.' and 'zz' become no use thanks to the 'scrolloff' option.
nnoremap <unique> z. <NOP>
nnoremap <unique> zz <NOP>







"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
""""""""""""""""""""""""" Escaping.""""""""""""""""""""""""""""""""""""""""""""
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Remap the Escape feature to something faster.
noremap! <unique> <leader><leader> <Esc>
vnoremap <unique> <leader><leader> <Esc>








" Indenting blocks without losing the selection.
" TODO voir si c'est vraiment utile car l'indentation devrait etre geree
" automatiquement par des plugins ou la commande = ou gq ?
vnoremap <unique> < <gv
vnoremap <unique> > >gv

" TODO mettre des unique, silent, expr partout ou cest necessaire pour les
" mappings








"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure appearance : line numbers, color scheme, indentation, etc.
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
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab
set wrap
set colorcolumn=80



" Enable mouse for all modes
set mouse=a

" Encoding
set encoding=utf-8

" Always have a swapfile.
set swapfile

" Open help in a vertical split.
" TODO remove when using 'tabs' (buffers)
nnoremap <unique> <leader>h q:ivertical botright help<Space>




" TODO ne marche pas , pourquoi ? mode visuel plutot que normal peut etre
" connard
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
" I disable wrapscan because I often miss the start/end of the file when
" cycling with n/N. I prefer to go 'gg' or 'G' when I hit the start/end of the
" file.
" TODO le pb avec nowrapscan c'est que si je search dans le mauvais sens j'ai
" un mismatch alors qu'en faisant n ou N derriere il trouve un match car je
" repars dans le sens inverse, voir si je garde ca ou pas
set nowrapscan
nnoremap <unique> <silent> <leader><leader> :nohlsearch<CR>



"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure the command-line
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Improve command line, go to the command window !
set cmdwinheight=25
" TODO voir pourquoi le set history ne marche pas
set history=200
nnoremap : q:i
augroup escape_command_window
    autocmd!
    autocmd CmdwinEnter * nnoremap <buffer> <leader><leader> <C-c><C-c>
augroup END


" Create a todo.
nnoremap <silent> <leader>t O<Esc>0DiTODO<Space><Esc>:call NERDComment('n', 'comment')<CR>A

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copying and pasting.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus
set nopaste
nnoremap <unique> <leader>p :set paste<CR>"+p:set nopaste<CR>
inoremap <unique> <leader>p <C-r>+




"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Miscellaneous.
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set writebackup

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

" TODO ne jamais mapper Esc, ca clash avec les arrow meme si elle sont mappees
" sur nop
" vnoremap <Esc> o<Esc>

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

" TODO remap * en mode normal pour qu'il lance le search mais reste sur le
" mot courant, ensuite je me deplace avec n ou N selon mon besoin, et virer le
" wrapsearch

" TODO voir set wildmode
" TODO comment se deplacer dans le menu de completion donne par <Tab> quand on
" a desactive les fleches ???

" TODO configurer nerdcommenter pour pouvoir utiliser le '.' pour commenter a
" nouveau car ca ne marche pas. Si ca n'est pas possible creuser du cote du
" plugin 'repeat'
" TODO voir l'option 'matchpairs' et tout ce qui va avec notamment le match
" des " et ' qui ne marche pas et les plugins associes

" TODO voir si je peux faire un docker de mon vim install

" TODO voir pour mapper ctrl f et b vers les fonctions de base de H et L (High
" et Low) qui amenent a la ligne tout en haut/bas de l'ecran. Faire une
" fonction qui blink l'ancienne ligne courante et la nouvelle pour se reperer
" plus facilement

" TODO voir ctrl y e u d f et b en mode normal et zb et zt z- z<CR> aussi
" TODO commande interessantes g* et g#

" ffdsoi goifsjdg osigjs dfogijs dfogisjdfgoidsfjg odfsigj sdogij dfogij
" dsfogijdsf gosidjg odfsigj sdfogijsdfogijs fdogijsdf goifsjdgosdfgsdfog sogf
" o g osifgj osdfigj sodfigj sdfogijogij sodijg osdigj odfsigj ods godsjgi
" odsfigj osdfigj sodfigj dsofigj osdijg odsigj  
" odsigj sodfigj sdofigj sdfogij dfsogij dfsoigjsfoigj sofigjdfsoigjsodfigj
" dfsoigj dsfogij sdfogij 
" TODO faire une autocmd qui detecte si j'appuie sur k alors que je viens de
" rentrer dans la command window, pour repasser du mode insert au mode normal
