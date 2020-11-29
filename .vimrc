call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'psf/black', { 'tag': '19.10b0' }
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
Plug 'ternjs/tern_for_vim'
Plug 'leafgarland/typescript-vim'
Plug 'neovim/nvim-lspconfig'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'arzg/vim-corvine'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'tyrannicaltoucan/vim-deep-space'
Plug 'tpope/vim-endwise'
Plug 'tpope/vim-fugitive'
Plug 'machakann/vim-highlightedyank'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'mxw/vim-jsx'
Plug 'ledger/vim-ledger'
Plug 'prabirshrestha/vim-lsp'
Plug 'nixon/vim-vmath'
Plug 'jceb/vim-orgmode'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'

" experimental
Plug 'mbadran/jpythonfold.vim'
Plug 'davidhalter/jedi-vim'
Plug 'tweekmonster/impsort.vim'

Plug 'jceb/vim-orgmode'

""""""" lua
Plug 'roxma/nvim-yarp'
Plug 'nvim-lua/completion-nvim'
Plug 'tbastos/vim-lua'
Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-misc'
Plug 'davisdude/vim-love-docs'


Plug 'alvan/vim-closetag'

"""""""" NCM2
Plug 'ncm2/ncm2'
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
Plug 'ncm2/ncm2-bufword'        " words in buffer
Plug 'ncm2/ncm2-path'           " relative path files
Plug 'ncm2/ncm2-jedi'           " python
Plug 'ncm2/ncm2-cssomni'        " css
Plug 'ncm2/ncm2-tern'           " js
" Plug 'svermeulen/ncm2-yoink'    " yoinks
" Plug 'filipekiss/ncm2-look.vim' " an english dictionary
" could be handy if I get into writing

call plug#end()

set background=dark
set termguicolors
colorscheme deep-space
let g:deepspace_italics=1
" let g:airline_theme='deep_space'
let g:airline_theme='deus'

" comments in italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic

" background of popup menu
" Pmenu – normal item
" PmenuSel – selected item
" PmenuSbar – scrollbar
" PmenuThumb – thumb of the scrollbar
highlight Pmenu ctermbg=cyan
highlight PmenuSel ctermfg=white

let g:colorizer_auto_filetype='css,scss,html'

" remap window scrolling
nnoremap <c-k> <c-y>
nnoremap <c-j> <c-e>

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

""""""""" python settings """""""""" {{{
" use correct indentation for python-mode
let g:pymode_python = 'python3'
let g:pymode_indent = 0
let python_pep8_indent_hang_closing = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_options_pep8 = {'ignore': ['E501', 'F841', 'W503']}
let g:pymode_rope = 0

" don't use coc on python files.
" autocmd BufNew,BufEnter *.py execute "silent! CocDisable"
" autocmd BufLeave *.py execute "silent! CocEnable"

" Change number of spaces when indenting
set shiftwidth=2
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.js set shiftwidth=2

" black formatting
autocmd BufWritePre *.py silent! execute ':Black'

" impsort experinment
autocmd BufWritePre *.py ImpSort!

filetype indent on
" set foldmethod=marker
set foldlevel=2
set foldnestmax=2

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

" NERDTree
" Automatically delete the buffer of the file you just deleted with NerdTree:
let NERDTreeAutoDeleteBuffer = 1

" Toggle visibility of hidden files using i and I
let NERDTreeShowHidden=1

" Don't open NERDTree by default
let g:nerdtree_tabs_open_on_gui_startup=0
let g:nerdtree_tabs_open_on_console_startup=0
let NERDTreeIgnore = ['__pycache__', '\.pyc$', 'node_modules']

" Close tree once file is selected
let NERDTreeQuitOnOpen = 1

" Toggle Nerd Tree with control + b
nnoremap <c-b> :NERDTreeToggle<CR>

" Recommended settings
set statusline+=%#warningmsg#
set statusline+=%*

" prettier
nnoremap <C-_> :Prettier<CR>

" auto :TagbarToggle with python
" autocmd FileType python :TagbarToggle
command! TT :TagbarToggle

" rainbow config
let g:rainbow_active = 1

" clojure-static
let g:clojure_align_multiline_strings=1
let g:clojure_align_subforms=1

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
function! Writing()
  highlight ColorColumn ctermbg=81
  set cc=80
  set filetype=text
endfunction

autocmd BufRead,BufNewFile ~/writing/* call Writing()
autocmd BufRead,BufNewFile ~/writing/*.fountain set filetype=fountain
" airline word counter
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'fountain', 'help', 'mail', 'markdown', 'org', 'rst', 'tex', 'text']

" TextEdit might fail if hidden is not set.
set hidden

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300

" """"""" autocomplete settings """""""
" enable ncm2 for all buffers
autocmd BufEnter * call ncm2#enable_for_buffer()
" IMPORTANT: :help Ncm2PopupOpen for more information
set completeopt=menuone,noselect,longest
inoremap <expr><TAB> pumvisible() ? "\<lt>Down>" : "<TAB>"
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

" inoremap <expr> <C-n> pumvisible() ? '<C-n>' :
"   \ '<C-n><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'
" inoremap <expr> <M-,> pumvisible() ? '<C-n>' :
"   \ '<C-x><C-o><C-n><C-p><C-r>=pumvisible() ? "\<lt>Down>" : ""<CR>'

""""""""''"" coc config """"""""""
" " Symbol renaming.
" nmap <leader>rn <Plug>(coc-rename)

" Use <TAB> for selections ranges.
" NOTE: Requires 'textDocument/selectionRange' support from the language server.
" nmap <silent> <TAB> <Plug>(coc-range-select)
" xmap <silent> <TAB> <Plug>(coc-range-select)

" Add (Neo)Vim's native statusline support.
" NOTE: Please see `:h coc-status` for integrations with external plugins that
" provide custom statusline: lightline.vim, vim-airline.
" set statusline^=%{coc#status()}%{get(b:,'coc_current_function','')}

" ale configuration
nmap <silent> [c <Plug>(ale_previous_wrap)
nmap <silent> ]c <Plug>(ale_next_wrap)
let g:ale_sign_error = '💢'
let g:ale_sign_warning = '🔸'
" 🔸
" 🔴
" 🈲
" ❕
" 💢
" ⚠️'
" ❌

" vmath
vmap <expr>  ++  VMATH_YankAndAnalyse()
nmap         ++  vip++

" leave terminal mode
tnoremap <Leader>n <C-\><C-n>


" closetag config
let g:closetag_filenames = '*.html,*.js,*.ts'
