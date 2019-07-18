set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

command Sup :echo "ayo"

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
" needs a good eslint config
" Plugin 'w0rp/ale'
Plugin 'python/black'
Plugin 'itchyny/calendar.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'fisadev/FixedTaskList.vim'
" Plugin 'morhetz/gruvbox'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'omnisharp/omnisharp-vim'
Plugin 'python-mode/python-mode'
Plugin 'luochen1990/rainbow'
Plugin 'tmhedberg/SimpylFold'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'srcery-colors/srcery-vim'
Plugin 'scrooloose/syntastic'
Plugin 'majutsushi/tagbar'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-commentary'
Plugin 'suy/vim-context-commentstring'
Plugin 'tpope/vim-fugitive'
Plugin 'machakann/vim-highlightedyank'
" Plugin 'ivanov/vim-ipython'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx'
Plugin 'ledger/vim-ledger'
" Plugin 'mitsuhiko/vim-python-combined'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'tpope/vim-repeat'
Plugin 'lifepillar/vim-solarized8'
Plugin 'tpope/vim-surround'
Plugin 'posva/vim-vue'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

syntax on
filetype plugin indent on " load filetype-specific indent files
filetype plugin on

set background=dark
" colorscheme dracula
" if (has("termguicolors"))
"   set termguicolors
" endif
" colorscheme spacemacs-theme
let g:airline_theme='deus'

set laststatus=2
set clipboard=unnamed
set mouse=a

" Configure backspacing to work 'normally'
set backspace=indent,eol,start

" Delay after typing stops before checking again (used by gitgutter).
" Can cause issues under 1000ms
set updatetime=250

" Trying to escape escape delays
set noesckeys
set timeout timeoutlen=1000 ttimeoutlen=100

" Exclude node_modules dir from :vimgrep searches
set path=**
set wildignore+=*/node_modules/*

" CtrlP
" Ignore files & folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist\|coverage'

" Display hidden files
let g:ctrlp_show_hidden = 1

" Git Gutter {{{
" Don't create any key mappings
let g:gitgutter_map_keys = 0

" Spaces and Tabs {{{
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" use correct indentation for python-mode
let g:pymode_indent = 0
" New lines start in better places
" set autoindent
" set smartindent
filetype indent on
let g:pymode_options_colorcolumn = 0

" Change number of spaces when indenting
set shiftwidth=2
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4

" number of visual spaces per TAB
set tabstop=2

" number of spaces in tab when editing
set softtabstop=2

" tabs are spaces
set expandtab

" set lazyredraw          " redraw only when we need to.
set showcmd             " show command in bottom bar

" Turn on line numbers
set number
set relativenumber

" highlight matching [{()}]
set showmatch

" Searching {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" remap esc
imap jj <Esc>

" windows
nmap <c-w><space> :vsplit<CR>
nmap <c-w>-     :split<CR>

" Movement
" Move fast with ctrl
nmap <c-j> 3j
nmap <c-k> 3k
nmap <c-h> 3h
nmap <c-l> 3l

" Easier split navigation
nmap gh <C-w>h
nmap gj <C-w>j
nmap gk <C-w>k
nmap gl <C-w>l

" NERDTree
" Automatically delete the buffer of the file you just deleted with NerdTree:
let NERDTreeAutoDeleteBuffer = 1

" Toggle visibility of hidden files using i and I
let NERDTreeShowHidden=1

" Don't open NERDTree by default
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeIgnore = ['__pycache__', '\.pyc$']

" Close tree once file is selected
let NERDTreeQuitOnOpen = 1

" Toggle Nerd Tree with control + b
nnoremap <c-b> :NERDTreeToggle<CR>

" Syntastic
" Set up for JS tools
let g:syntastic_javascript_checkers = ['eslint']

" Typescript & vue
let g:syntastic_typescript_checkers = ['tslint']
let g:syntastic_vue_checkers = ['tslint', 'eslint']

" C# / Unity
let g:syntastic_cs_checkers = ['code_checker']

" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_mode_map = {
        \ "mode": "passive",
        \ "active_filetypes": [],
        \ "passive_filetypes": [] }
nmap + :SyntasticCheck<CR>

" NERDTree Git Plugin
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "♦",
  \ "Staged"    : "♯",
  \ "Untracked" : "♠",
  \ "Renamed"   : "♣",
  \ "Unmerged"  : "♪",
  \ "Deleted"   : "-",
  \ "Dirty"     : "☼",
  \ "Clean"     : "♫",
  \ 'Ignored'   : 'I',
  \ "Unknown"   : "?"
  \ }

" Don't show YCM's preview window
set completeopt-=preview
let g:ycm_add_preview_to_completeopt = 0
let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'

" shoving this here because formatting
" autocmd BufWritePost *.py execute ':Black'
autocmd FileType *.py nnoremap <C-_> :Black<CR>

" JSBeautify {{{
autocmd FileType javascript noremap <buffer> <C-_> :call JsBeautify()<CR>
autocmd FileType json noremap <buffer> <C-_> :call JsonBeautify()<CR>
autocmd FileType jsx noremap <buffer> <C-_> :call JsxBeautify()<CR>
autocmd FileType html noremap <buffer> <C-_> :call HtmlBeautify()<CR>
autocmd FileType css noremap <buffer> <C-_> :call CSSBeautify()<CR>

" auto :TagbarToggle with python
autocmd FileType python :TagbarToggle
command TT :TagbarToggle

" map enter to insert a new line
map <CR> i<CR><ESC>l

" map ctrl-backspace to delete previous word in insert mode
" imap <C-BS> <C-W>

" Emmet-vim settings
imap <C-Z> <C-Y>,

" rainbow config
let g:rainbow_active = 1

"clojure-static
let g:clojure_align_multiline_strings=1
let g:clojure_align_subforms=1

" save folds
augroup AutoSaveFolds
  autocmd!
  " view files are about 500 bytes
  " bufleave but not bufwinleave captures closing 2nd tab
  " nested is needed by bufwrite* (if triggered via other autocmd)
  autocmd BufWinLeave,BufLeave,BufWritePost ?* nested silent! mkview!
  autocmd BufWinEnter ?* silent! loadview
augroup end

" jedi-vim
let g:jedi#completions_command = "<Leader>s"
