
filetype off

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
Plugin 'mileszs/ack.vim'
Plugin 'dense-analysis/ale'
Plugin 'python/black'
Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'mattn/emmet-vim'
Plugin 'fisadev/FixedTaskList.vim'
Plugin 'fountain.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'scrooloose/nerdtree'
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'omnisharp/omnisharp-vim'
Plugin 'python-mode/python-mode'
Plugin 'luochen1990/rainbow'
Plugin 'tmhedberg/SimpylFold'
Plugin 'colepeters/spacemacs-theme.vim'
Plugin 'srcery-colors/srcery-vim'
Plugin 'majutsushi/tagbar'
Plugin 'ternjs/tern_for_vim'
Plugin 'leafgarland/typescript-vim'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'arzg/vim-corvine'
" Plugin 'maksimr/vim-jsbeautify'
Plugin 'tpope/vim-commentary'
Plugin 'suy/vim-context-commentstring'
Plugin 'tpope/vim-endwise'
Plugin 'nvie/vim-flake8'
Plugin 'tpope/vim-fugitive'
Plugin 'machakann/vim-highlightedyank'
Plugin 'nathanaelkane/vim-indent-guides'
Plugin 'pangloss/vim-javascript'
Plugin 'elzr/vim-json'
Plugin 'mxw/vim-jsx'
Plugin 'ledger/vim-ledger'
Plugin 'prettier/vim-prettier'
" Plugin 'mitsuhiko/vim-python-combined'
Plugin 'Vimjas/vim-python-pep8-indent'
Plugin 'tpope/vim-repeat'
Plugin 'lifepillar/vim-solarized8'
Plugin 'tpope/vim-surround'
Plugin 'posva/vim-vue'
" Plugin 'ycm-core/YouCompleteMe' " this takes a LONG time to install

""" WIP
" this needs to be installed with a feature branch
" considering installing vim-plug for this:
" Plug 'neoclide/coc.nvim', {'branch': 'release'}
" instead manually switch to the branch with git
" then `pin` it there
"""
" Plugin 'neoclide/coc.nvim', {'pinned': 1}
" let g:coc_global_extensions = ['coc-python', 'coc-json']
"""""

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

" move 4 lines at a time
nnoremap <c-k> 4k
nnoremap <c-j> 4j

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

" Open in mixed mode
let g:ctrlp_cmd = 'CtrlPMixed'

" Git Gutter
" Don't create any key mappings
let g:gitgutter_map_keys = 0

" Spaces and Tabs
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" use correct indentation for python-mode
let g:pymode_indent = 0
let python_pep8_indent_hang_closing = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_options_pep8 = {'ignore': ['E501', 'W503']}

" New lines start in better places
" set autoindent
" set smartindent
filetype indent on
" set nofoldenable
set foldmethod=indent
set foldlevel=2
set foldnestmax=2

au BufRead,BufNewFile *.js set foldmethod=manual
"
" Change number of spaces when indenting
set shiftwidth=2
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.js set shiftwidth=2

" number of visual spaces per TAB
set tabstop=2

" number of spaces in tab when editing
set softtabstop=2

" tabs are spaces
set expandtab

" show command in bottom bar
set showcmd

" Turn on line numbers
set number
set relativenumber

" highlight matching [{()}]
set showmatch

" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

" use \m to remove highlight
nmap <leader>m :noh<Enter>

" remap esc
imap jj <Esc>

" windows
nmap <c-w><space> :vsplit<CR>
nmap <c-w>-     :split<CR>

" Easier split navigation
" nmap gh <C-w>h
" nmap gj <C-w>j
" nmap gk <C-w>k
" nmap gl <C-w>l

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
" let g:syntastic_javascript_checkers = ['eslint']

" Typescript & vue
" let g:syntastic_typescript_checkers = ['tslint']
" let g:syntastic_vue_checkers = ['tslint', 'eslint']

" C# / Unity
" let g:syntastic_cs_checkers = ['code_checker']

" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%*

" let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
" let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_mode_map = {
"         \ "mode": "passive",
"         \ "active_filetypes": [],
"         \ "passive_filetypes": [] }
" nmap + :SyntasticCheck<CR>

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
autocmd BufWritePost *.py silent! execute ':Black'
" disable it for specific projects
autocmd BufNewFile,BufRead ~/code/exclaim/**/*.py autocmd! BufWritePost

" JSBeautify
" autocmd FileType javascript noremap <buffer> <C-_> :call JsBeautify()<CR>
" autocmd FileType json noremap <buffer> <C-_> :call JsonBeautify()<CR>
" autocmd FileType jsx noremap <buffer> <C-_> :call JsxBeautify()<CR>
" autocmd FileType html noremap <buffer> <C-_> :call HtmlBeautify()<CR>
" autocmd FileType css noremap <buffer> <C-_> :call CSSBeautify()<CR>

" switched to prettier
" autocmd nnoremap <buffer> <C-_> :call Prettier
nnoremap <C-_> :Prettier<CR>

" auto :TagbarToggle with python
" autocmd FileType python :TagbarToggle
command TT :TagbarToggle
" tagbar with js
let g:tagbar_type_javascript = {
\ 'ctagstype': 'javascript',
\ 'kinds': [
\ 'A:arrays',
\ 'P:properties',
\ 'T:tags',
\ 'O:objects',
\ 'G:generator functions',
\ 'F:functions',
\ 'C:constructors/classes',
\ 'M:methods',
\ 'V:variables',
\ 'I:imports',
\ 'E:exports',
\ 'S:styled components'
\ ]
\ }

" Emmet-vim settings
imap <C-Z> <C-Y>,

" rainbow config
let g:rainbow_active = 1

" clojure-static
let g:clojure_align_multiline_strings=1
let g:clojure_align_subforms=1

" save folds
augroup AutoSaveFolds
  au BufWinLeave,BufLeave,BufWritePost ~/code/datavend/**/* mkview
  au BufWinEnter ~/code/datavend/**/* silent! loadview
augroup end

" jedi-vim
let g:jedi#completions_command = "<Leader>s"

" indent guides
let g:indent_guides_auto_colors = 0
let g:indent_guides_color_change_percent = 30
" let g:indent_guides_guide_size = 1
let g:indent_guides_enable_on_vim_startup = 1
let g:indent_guides_exclude_filetypes = ['help', 'nerdtree']
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven  ctermbg=237

" following are for vim-surround and its insert mode support
" Allow us to use Ctrl-s and Ctrl-q as keybinds
silent !stty -ixon
" Restore default behaviour when leaving Vim.
autocmd VimLeave * silent !stty ixon

" change cursor to line when in insert mode
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"

" stuff for writing
function Writing()
  highlight ColorColumn ctermbg=81
  set cc=80
  set filetype=text
endfunction

autocmd BufRead,BufNewFile ~/writing/* call Writing()
autocmd BufRead,BufNewFile ~/writing/*.fountain set filetype=fountain

" airline word counter
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'fountain', 'help', 'mail', 'markdown', 'org', 'rst', 'tex', 'text']

" ale
let g:ale_linters = {'css': ['eslint'], 'jsx': ['prettier'], 'javascript': ['prettier'], 'python': ['black']}
let b:ale_fixers = {'javascript': ['prettier', 'eslint']}
let g:ale_fix_on_save = 1
