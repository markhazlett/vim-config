"""""""""""""""""""""""""""""
" Maintainer: Mark Hazlett
" 
" Version: 1.0
"
" How_To_Install_Nix:
"   1. Ensure that your vim is compiled with ruby support.
"       - To do this run vim --verision and ensure +ruby is located somewhere
"       in the output.
"   2. Run the following command:
"       "Sudo apt-get install exuberant-ctags"
"   3. Checkout the git repo into your home directory
"       "git clone https://git@github.com/markhazlett/vim-config.git"
"   4. Move the vim-config folder to .vim
"       WARNING - This will overrite all of your current vim configurations.
"       So please back it up prior to.
"       "mv vim-config .vim"
"   5. Move the .vimrc into your home folder
"       "cd .vim"
"       "mv .vimrc ~/.vimrc"
"
" Sections:
"   -> Initializers
"   -> General
"   -> Colors/Fonts
"   -> File Completions
"   -> Omnicomplete
"   -> Tab Navigation
"   -> Status Line
"   -> File Navigation
"   -> Command-T
"   -> Zend
"   -> Taglist
"   -> Tagbar
"   -> Exuberant CTags
"   -> NERDTree
"   -> JSLint
"
" Plugins:
"   -> Command-T
"       Command-T plug-in provides an extremely fast, intuitive mechanism for
"       opening files.
"       url - http://github.com/wincent/Command-T
"       info -> :help command-t   
"   -> Tagbar
"       Displays information about 
"       url - http://majutsushi.github.com/tagbar/ 
"       info -> :help tagbar
"       git - git clone git://github.com/majutsushi/tagbar
"   -> Taglist
"       Taglist is like tagbar but provides a little more description for PHP
"       files.
"       url - https://github.com/vim-scripts/taglist.vim
"   -> NERDTree
"       Displays a tree starting from the directory in which you started vim.
"       url - https://github.com/scrooloose/nerdtree
"   -> PhpComplete
"       Provides PHP context aware completion using omni complete.
"       url - https://github.com/shawncplus/phpcomplete.vim
"   -> Supertab
"       Provides tab completion for any of the completion types.
"       url - http://www.vim.org/scripts/script.php?script_id=182
"   -> Exuberant CTags
"       Provides syntax completion after tags have been generated.
"       url - sudo apt-get install exuberant-ctags
"   -> Pathogen
"       Easy package management for VIM
"       url - https://github.com/tpope/vim-pathogen
"
" Revisions:
"   -> 1.0 - Initial Revision
"
"""""""""""""""""""""""""""""

""""""""""""""""""""""""""""""
" => Initializers
""""""""""""""""""""""""""""""
call pathogen#infect()
call pathogen#helptags()

""""""""""""""""""""""""""""""
" => General
""""""""""""""""""""""""""""""
" When vimrc is edited, reload it
autocmd! bufwritepost vimrc source ~/.vim_runtime/vimrc

" Line Numbers
set nu

" Mouse
set mouse=a

" Fast saving
nmap <leader>w :w!<cr>

" Set Wildmenu on
set wildmenu

set sessionoptions=blank,buffers,curdir,folds,globals,help,localoptions,resize,tabpages,winsize,winpos
set directory=~/.vim/tmp
set ic
set hlsearch
set wrap
set incsearch
set magic

" Sets the default tab completion t omnicomplete
let g:SuperTabDefaultCompletionType = "<C-X><C-O>"

""""""""""""""""""""""""""""""
" => Colors/Fonts
""""""""""""""""""""""""""""""
syntax on
filetype plugin indent on
colorscheme wombat

" If in diff mode use colorscheme of desert
if &diff
    colorscheme desert
endif

""""""""""""""""""""""""""""""
" => File Completions
""""""""""""""""""""""""""""""
" Set omni menu to use PHP style when in a PHP file
au FileType php set omnifunc=phpcomplete#CompletePHP
" set Omni menu to use CSS stule when in a CSS file
autocmd FileType css set omnifunc=csscomplete#CompleteCSS

""""""""""""""""""""""""""""""
" => OmniComplete
""""""""""""""""""""""""""""""
" remove the Scratch Preview after you use it
autocmd InsertLeave * if pumvisible() == 0|pclose|endif

""""""""""""""""""""""""""""""
" => Tab Navigation
""""""""""""""""""""""""""""""
map <silent> <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <silent> <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>
map <silent> <C-left> :tabp<CR>
map <silent> <C-right> :tabn<CR>istockphoto.com

""""""""""""""""""""""""""""""
" => Statusline
""""""""""""""""""""""""""""""
set statusline=%F%m%r%h%w\ [%L][%{&ff}]%y[%p%%][%04l,%04v]
"              | | | | |  |   |      |  |     |    |
"              | | | | |  |   |      |  |     |    + current
"              | | | | |  |   |      |  |     |       column
"              | | | | |  |   |      |  |     +-- current line
"              | | | | |  |   |      |  +-- current % into file
"              | | | | |  |   |      +-- current syntax in
"              | | | | |  |   |          square brackets
"              | | | | |  |   +-- current fileformat
"              | | | | |  +-- number of lines
"              | | | | +-- preview flag in square brackets
"              | | | +-- help flag in square brackets
"              | | +-- readonly flag in square brackets
"              | +-- rodified flag in square brackets
"              +-- full path to file in the buffer

set laststatus=2

if version >= 700
    au InsertEnter * hi CursorLine guibg=#2d2d2d ctermbg=236
    au InsertLeave * hi CursorLine guibg=#2d2d2d ctermbg=17
endif

setlocal ts=4
set sw=4
set expandtab
set scrolloff=3
set showcmd

""""""""""""""""""""""""""""""
" => File Navigation
""""""""""""""""""""""""""""""

" CTRL + Home/End to jump to start/end of document
nnoremap <silent> <C-Home> gg
nnoremap <silent> <C-End> G<End>
inoremap <silent> <C-Home> <Esc>ggi
inoremap <silent> <C-End> <Esc>G<End>i

""""""""""""""""""""""""""""""
" => Command-T
""""""""""""""""""""""""""""""
" Mapped to <leader>t
let g:CommandTMaxHeight = 15
set wildignore+=*.o,*.obj,.git,*.pyc

""""""""""""""""""""""""""""""
" => Zend
""""""""""""""""""""""""""""""
if has("autocmd")
    autocmd BufEnter *.phtml set syn=php
endif
syn on

""""""""""""""""""""""""""""""
" => Taglist
""""""""""""""""""""""""""""""
let Tlist_Ctags_Cmd = "/usr/bin/ctags"
let Tlist_WinWidth = 50
map <leader>q :TlistToggle<cr>

""""""""""""""""""""""""""""""
" => Tagbar
""""""""""""""""""""""""""""""
map <leader>b :TagbarToggle<cr>

""""""""""""""""""""""""""""""
" => Exuberant CTags
""""""""""""""""""""""""""""""
map <F8> :!/usr/bin/ctags -R --c++-kinds=+p --fields=+iaS --extra=+q .<CR>
map <C-\> :tab split<CR>:exec("tag ".expand("<cword>"))<CR>
map <A-]> :vsp <CR>:exec("tag ".expand("<cword>"))<CR>

""""""""""""""""""""""""""""""
" => NERDTree
""""""""""""""""""""""""""""""
map <leader>n :NERDTreeToggle<CR>

""""""""""""""""""""""""""""""
" => JSLint
""""""""""""""""""""""""""""""
map <leader>js :JSLintToggle<CR>
