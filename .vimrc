set nocompatible
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
" Plugin 'maralla/completor.vim'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'omnisharp/omnisharp-vim'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'scrooloose/syntastic'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-fugitive'
Plugin 'machakann/vim-highlightedyank'
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'severin-lemaignan/vim-minimap'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'posva/vim-vue'
Plugin 'Valloric/YouCompleteMe'

call vundle#end()

syntax on
filetype plugin indent on " load filetype-specific indent files

" COLORS {{{
" colorscheme dracula
if (has("termguicolors"))
  set termguicolors
endif
set background=dark

colorscheme spacemacs-theme
" highlight Normal ctermbg=NONE
" highlight nonText ctermbg=NONE
set t_Co=256
" }}}

" STATUS LINE {{{
set laststatus=2
" }}}

" TODOS {{{
" }}}

" MISC {{{

" Use the clipboard as the default register
set clipboard=unnamed "

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
nmap <c-w><Bar> :vsplit<CR>
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

" 'grab' line and move it up/down
nmap gj ddjP<Esc>
nmap gk ddkP<Esc>

" highlight last inserted text
" nnoremap gV `[v`]
" }}}

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
nmap + :SyntasticCheck<CR>
" }}}

" Completor {{{
" Use TAB to complete when typing words, else inserts TABs as usual.  Uses
" " dictionary, source files, and completor to find matching words to
" complete.

" Note: usual completion is on <C-n> but more trouble to press all the time.
" Never type the same word twice and maybe learn a new spellings!
" Use the Linux dictionary when spelling is in doubt.
" function! Tab_Or_Complete() abort
"   " If completor is already open the `tab` cycles through suggested completions.
"   if pumvisible()
"     return "\<C-N>"
"   " If completor is not open and we are in the middle of typing a word then
"   " `tab` opens completor menu.
"   elseif col('.')>1 && strpart( getline('.'), col('.')-2, 3 ) =~ '^\w'
"     return "\<C-R>=completor#do('complete')\<CR>"
"   else
"     " If we aren't typing a word and we press `tab` simply do the normal `tab`
"     " action.
"     return "\<Tab>"
"   endif
" endfunction

" " Use `tab` key to select completions. Default is arrow keys.
" inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
" inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" " Use tab to trigger auto completion. Default suggests completions as you type.
" let g:completor_auto_trigger = 0
" inoremap <expr> <Tab> Tab_Or_Complete()
" }}}

" NERDTree Git Plugin {{{
let g:NERDTreeIndicatorMapCustom = {
  \ "Modified"  : "♪",
  \ "Staged"    : "♦",
  \ "Untracked" : "♯",
  \ "Renamed"   : "N",
  \ "Unmerged"  : "═",
  \ "Deleted"   : "R",
  \ "Dirty"     : "°",
  \ "Clean"     : "♫",
  \ 'Ignored'   : 'I',
  \ "Unknown"   : "?"
  \ }
" }}}
"



let g:ycm_server_keep_logfiles = 1
let g:ycm_server_log_level = 'debug'
