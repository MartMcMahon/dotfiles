set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'omnisharp/omnisharp-vim'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'suy/vim-context-commentstring'
Plugin 'scrooloose/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'machakann/vim-highlightedyank'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'posva/vim-vue'
Plugin 'Valloric/YouCompleteMe'
Plugin 'srcery-colors/srcery-vim'

call vundle#end()

syntax on
filetype plugin indent on " load filetype-specific indent files
filetype plugin on

" COLORS {{{
" colorscheme dracula
if (has("termguicolors"))
  set termguicolors
endif
set t_Co=256
set background=dark

" colorscheme srcery

colorscheme spacemacs-theme
" highlight Normal ctermbg=NONE
" highlight nonText ctermbg=NONE
" }}}

" airline {{{
let g:airline_theme='base16_spacemacs'
" }}}

" STATUS LINE {{{
set laststatus=2
" }}}

" TODOS {{{
" }}}

" MISC {{{

" Use the clipboard as the default register
" set clipboard=unnamed "

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
" }}}

" CtrlP {{{

" Ignore files & folders
let g:ctrlp_custom_ignore = 'node_modules\|DS_Store\|git\|dist\|coverage'

" Display hidden files
let g:ctrlp_show_hidden = 1
" }}}

" Git Gutter {{{

" Don't create any key mappings
let g:gitgutter_map_keys = 0
" }}}

" Spaces and Tabs {{{
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" New lines start in better places
set autoindent
set smartindent

" Change number of spaces when indenting
set shiftwidth=2

" number of visual spaces per TAB
set tabstop=2

" number of spaces in tab when editing
set softtabstop=2

" tabs are spaces
set expandtab
" }}}

" UI Config {{{
" set lazyredraw          " redraw only when we need to.
set showcmd             " show command in bottom bar

" Disable mouse
" set mouse-=a

" Turn on line numbers
set number
set relativenumber

" highlight matching [{()}]
set showmatch

" }}}

" Searching {{{
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" turn off search highlight
"Vim will keep highlighted matches from searches until you either run a new one or manually stop highlighting the old search with :nohlsearch. I find myself running this all the time so I've mapped
" nnoremap <leader><space> :nohlsearch<CR>
" nnoremap <esc> :noh<return><esc>
" }}}

" remap esc
imap jj <Esc>

" windows
nmap <c-w><space> :vsplit<CR>
nmap <c-w>-     :split<CR>

" Movement {{{
" Move fast with shift
nmap <c-j> 3j
nmap <c-k> 3k
nmap <c-h> 3h
nmap <c-l> 3l

" Easier split navigation
" nmap gh <C-w>h
" nmap gj <C-w>j
" nmap gk <C-w>k
" nmap gl <C-w>l

" NERDTree {{{
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
" }}}

" Syntastic {{{
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
" }}}

" NERDTree Git Plugin {{{
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
" }}}
"

let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'


" JSBeautify {{{
autocmd FileType javascript noremap <buffer> <C-_> :call JsBeautify()<CR>
" for json
autocmd FileType json noremap <buffer> <C-_> :call JsonBeautify()<CR>
" for jsx
autocmd FileType jsx noremap <buffer> <C-_> :call JsxBeautify()<CR>
" for html
autocmd FileType html noremap <buffer> <C-_> :call HtmlBeautify()<CR>
" for css or scss
autocmd FileType css noremap <buffer> <C-_> :call CSSBeautify()<CR>
" }}}

" map enter to insert a new line
map <CR> i<CR><ESC>l

" map ctrl-backspace to delete previous word in insert mode
imap <C-BS> <C-W>
