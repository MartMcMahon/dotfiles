call plug#begin('~/.vim/plugged')
" {{{
Plug 'mileszs/ack.vim'
Plug 'dense-analysis/ale'
Plug 'python/black'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'chrisbra/Colorizer'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'fisadev/FixedTaskList.vim'
Plug 'vim-scripts/fountain.vim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'omnisharp/omnisharp-vim'
" cloned python-mode because of a breaking bug
" having to do with version 3 I think?
Plug 'martmcmahon/python-mode'
Plug 'luochen1990/rainbow'
Plug 'colepeters/spacemacs-theme.vim'
Plug 'srcery-colors/srcery-vim'
Plug 'majutsushi/tagbar'
Plug 'ternjs/tern_for_vim'
Plug 'leafgarland/typescript-vim'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arzg/vim-corvine'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'ledger/vim-ledger'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-repeat'
Plug 'lifepillar/vim-solarized8'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'

call plug#end()
" }}}

set background=dark
" let g:airline_theme='deus'

" background of popup menu
" Pmenu – normal item
" PmenuSel – selected item
" PmenuSbar – scrollbar
" PmenuThumb – thumb of the scrollbar
highlight Pmenu ctermbg=cyan
highlight PmenuSel ctermfg=white

" move 4 lines at a time
nnoremap <c-k> 4k
nnoremap <c-j> 4j
let g:colorizer_auto_filetype='css,scss,html'


set laststatus=2
set clipboard=unnamed
set mouse=a

" Configure backspacing to work 'normally'
set backspace=indent,eol,start

" Delay after typing stops before checking again (used by gitgutter).
" Can cause issues under 1000ms
set updatetime=250

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

" use correct indentation for python-mode {{{
let g:pymode_python = 'python3'
let g:pymode_indent = 0
let python_pep8_indent_hang_closing = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_options_pep8 = {'ignore': ['E501', 'F841', 'W503']}
let g:pymode_rope = 0
" }}}

filetype indent on
set foldmethod=marker
set foldlevel=2
set foldnestmax=2

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

" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%*

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

" shoving this here because formatting
autocmd BufWritePost *.py silent! execute ':Black'

" disable it for specific projects
autocmd BufNewFile,BufRead ~/code/exclaim/**/*.py autocmd! BufWritePost

" prettier
nnoremap <C-_> :Prettier<CR>

" auto :TagbarToggle with python
" autocmd FileType python :TagbarToggle
command TT :TagbarToggle

" rainbow config
let g:rainbow_active = 1

" clojure-static
let g:clojure_align_multiline_strings=1
let g:clojure_align_subforms=1

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

" change cursor to line when in insert mode {{{
let &t_SI = "\<Esc>]50;CursorShape=1\x7"
let &t_SR = "\<Esc>]50;CursorShape=2\x7"
let &t_EI = "\<Esc>]50;CursorShape=0\x7"
" }}}

" stuff for writing {{{
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
" }}}

"" kite options
set completeopt+=menuone
set completeopt-=preview
set completeopt+=noinsert
let g:kite_tab_complete = 1
let g:kite_log=1

""" coc config {{{
" don't use on python files. We got Kite for that
autocmd BufNew,BufEnter *.py execute "silent! CocDisable"
autocmd BufLeave *.py execute "silent! CocEnable"

" TextEdit might fail if hidden is not set.
set hidden

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300

" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <TAB>
     \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" coc-tsserver, coc-python are the examples of servers that support it.
nmap <silent> <TAB> <Plug>(coc-range-select)
xmap <silent> <TAB> <Plug>(coc-range-select)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" }}}

" ale configuration
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
let g:ale_sign_error = '❌'
let g:ale_sign_warning = '⚠️'
