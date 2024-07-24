set shell=fish
call plug#begin('~/.vim/plugged')
Plug 'mileszs/ack.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'psf/black'
" Plug 'datwaft/bubbly.nvim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'pappasam/coc-jedi', { 'do': 'yarn install --frozen-lockfile && yarn build', 'branch': 'main' }
Plug 'chrisbra/Colorizer'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'github/copilot.vim'
Plug 'fisadev/FixedTaskList.vim'
Plug 'vim-scripts/fountain.vim'
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
Plug 'junegunn/fzf.vim'
Plug 'ggandor/leap.nvim'
Plug 'scrooloose/nerdtree'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'omnisharp/omnisharp-vim'
Plug 'python-mode/python-mode'
Plug 'vim-python/python-syntax'
Plug 'luochen1990/rainbow'
Plug 'vim-scripts/restore_view.vim'
Plug 'ternjs/tern_for_vim'
Plug 'leafgarland/typescript-vim'
" Plug 'puremourning/vimspector'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'alvan/vim-closetag'
Plug 'arzg/vim-corvine'
Plug 'tpope/vim-commentary'
Plug 'suy/vim-context-commentstring'
Plug 'tpope/vim-endwise'
Plug 'davidyorr/vim-es6-unused-imports'
Plug 'tpope/vim-fugitive'
Plug 'ruanyl/vim-gh-line'
Plug 'machakann/vim-highlightedyank'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'pangloss/vim-javascript'
Plug 'elzr/vim-json'
Plug 'MaxMEllon/vim-jsx-pretty'
Plug 'ledger/vim-ledger'
Plug 'tpope/vim-markdown'
" Plug 'jceb/vim-orgmode'
Plug 'prettier/vim-prettier'
Plug 'tpope/vim-repeat'
Plug 'mhinz/vim-startify'
Plug 'tpope/vim-surround'
Plug 'posva/vim-vue'
" notes
Plug 'vimwiki/vimwiki'

"""" Rust
" Completion framework
Plug 'hrsh7th/nvim-cmp'
" LSP completion source for nvim-cmp
Plug 'hrsh7th/cmp-nvim-lsp'
" Snippet completion source for nvim-cmp
Plug 'hrsh7th/cmp-vsnip'
" Other usefull completion sources
Plug 'hrsh7th/cmp-path'
Plug 'hrsh7th/cmp-buffer'
" To enable more of the features of rust-analyzer, such as inlay hints and more!
Plug 'simrat39/rust-tools.nvim'
" kdarkhan's fork fixes a render issue with inlay-hints
" Plug 'kdarkhan/rust-tools.nvim'
" rust debugging
Plug 'nvim-lua/plenary.nvim'
Plug 'mfussenegger/nvim-dap'
" Snippet engine
Plug 'hrsh7th/vim-vsnip'
" Fuzzy finder
" Optional
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'rust-lang/rust.vim'
Plug 'ron-rs/ron.vim'
Plug 'mhinz/vim-crates'

"" LSP
Plug 'williamboman/nvim-lsp-installer'
Plug 'neovim/nvim-lspconfig'
" Plug 'prabirshrestha/async.vim'
" Plug 'prabirshrestha/vim-lsp'
" Plug 'prabirshrestha/asyncomplete-lsp.vim'

" experimental
Plug 'mbadran/jpythonfold.vim'
Plug 'davidhalter/jedi-vim'
" Plug 'tweekmonster/impsort.vim'
" Plug 'nvim-lua/popup.nvim'
" Plug 'nvim-lua/plenary.nvim'
" Plug 'nvim-telescope/telescope.nvim'
" Plug 'nvim-telescope/telescope-fzy-native.nvim'
Plug 'HallerPatrick/py_lsp.nvim'

Plug 'arcticicestudio/nord-vim'

""""""" lua
Plug 'roxma/nvim-yarp'
Plug 'nvim-lua/completion-nvim'
Plug 'nvim-lua/lsp_extensions.nvim'
Plug 'tbastos/vim-lua'
" Plug 'xolox/vim-lua-ftplugin'
Plug 'xolox/vim-misc'
Plug 'davisdude/vim-love-docs'

"""""""" NCM2
" Plug 'ncm2/ncm2'
" NOTE: you need to install completion sources to get completions. Check
" our wiki page for a list of sources: https://github.com/ncm2/ncm2/wiki
" Plug 'ncm2/ncm2-bufword'        " words in buffer
" Plug 'ncm2/ncm2-path'           " relative path files
" Plug 'ncm2/ncm2-jedi'           " python
" Plug 'ncm2/ncm2-cssomni'        " css
" Plug 'ncm2/ncm2-tern'           " js
" Plug 'svermeulen/ncm2-yoink'    " yoinks
" Plug 'filipekiss/ncm2-look.vim' " an english dictionary

""" Colors
" Plug 'ghifarit53/tokyonight-vim'
" Plug 'NLKNguyen/papercolor-theme'
Plug 'dracula/vim', {'name': 'dracula'}
Plug 'tanvirtin/monokai.nvim'
Plug 'NLKNguyen/papercolor-theme'
Plug 'sainnhe/sonokai'
Plug 'ayu-theme/ayu-vim'

""" svelte
Plug 'othree/html5.vim'
Plug 'evanleck/vim-svelte', {'branch': 'main'}

" wgsl
Plug 'DingDean/wgsl.vim'

" godot
Plug 'habamax/vim-godot'

" C
Plug 'vim-scripts/c.vim'

call plug#end()

" tags
autocmd BufRead *.rs :setlocal tags=./rusty-tags.vi;/
autocmd BufWritePost *.rs :silent! exec "!rusty-tags vi --quiet --start-dir=" . expand('%:p:h') . "&" | redraw!

set background=dark
" set termguicolors
" set t_Co=256   " This is may or may not needed.
" colorscheme tokyonight
" colorscheme dracula
" colorscheme monokai
" colorscheme papercolor
colorscheme sonokai
" let g:airline_theme='tokyonight'
" let g:PaperColor_Theme_Options = {
"   \   'theme': {
"   \     'default.dark': {
"   \       'transparent_background': 1,
"   \       'allow_bold': 1,
"   \       'allow_italic': 1,
"   \     },
"   \   },
"   \   'language': {
"   \     'python': {
"   \       'highlight_builtins': 1
"   \     }
"   \   }
"   \ }

" save folds
" augroup remember_folds
"   autocmd!
"   autocmd BufWinLeave *.* silent! mkview
"   autocmd BufWinEnter *.* silent! loadview
" augroup END

" comments in italics
let &t_ZH="\e[3m"
let &t_ZR="\e[23m"
highlight Comment cterm=italic gui=italic

" background of popup menu
" Pmenu – normal item
" PmenuSel – selected item
" PmenuSbar – scrollbar
" PmenuThumb – thumb of the scrollbar
" highlight Pmenu ctermbg=cyan
highlight PmenuSel ctermfg=white

let g:colorizer_auto_filetype='css,scss,html'

" allows switching buffers with unsaved changes
set hidden

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
" set updatetime=400

" Exclude node_modules dir from :vimgrep searches
set path=**
set wildignore+=*/node_modules/*

" Git Gutter
" Don't create any key mappings
let g:gitgutter_map_keys = 0

" Spaces and Tabs
" Remove trailing whitespace on save
autocmd BufWritePre * %s/\s\+$//e

" ctrl-p opens fzf buffers
nnoremap <c-p> :Buffers<cr>

" diplay japanese characters
set fileencodings=ucs-bom,utf8,prc

" ctrl-p uses Ag
" let g:ctrlp_user_command = 'ag %s -i --nocolor --nogroup --hidden
"       \ --ignore .git
"       \ --ignore .svn
"       \ --ignore .hg
"       \ --ignore .DS_Store
"       \ --ignore "**/*.pyc"'
"       \ -g ""'

""""""""" python settings """""""""" {{{
" use correct indentation for python-mode
let g:pymode_python = 'python3'
let g:pymode_indent = 0
let python_pep8_indent_hang_closing = 0
let g:pymode_options_colorcolumn = 0
let g:pymode_lint_options_pep8 = {'ignore': ['E402', 'E501', 'F841', 'W503']}
let g:pymode_lint_options_mccabe = {'ignore': ['C901']}
let g:pymode_rope = 0
let g:python_highlight_all = 1
autocmd FileType python set omnifunc=syntaxcomplete#Complete

let g:python_host_prog = expand("/usr/local/bin/python3")
let g:python3_host_prog = expand("/usr/local/bin/python3")

" Change number of spaces when indenting
set shiftwidth=2
au BufRead,BufNewFile *.py,*pyw set shiftwidth=4
au BufRead,BufNewFile *.js set shiftwidth=2

" black formatting
autocmd BufWritePre *.py silent! execute ':Black'

" impsort experinment
" autocmd BufWritePre *.py ImpSort!

syntax enable
syntax on        " for vimwiki
filetype plugin indent on
filetype plugin on
filetype indent on
set nocompatible " for vimwiki

" preview window at bottom
" set splitbelow
" set foldmethod=marker
set foldlevel=2
set foldnestmax=2
set tabstop=2
" number of spaces in tab when editing
set softtabstop=2
set expandtab
set showcmd
" Turn on line numbers
set number
set relativenumber
" highlight matching [{()}]
set showmatch
" Searching
set incsearch           " search as characters are entered
set hlsearch            " highlight matches
" local .vimrc
set exrc

map <Space> <Leader>
" use <leader>m to remove highlight
nmap <leader>m :noh<CR>

" remap esc
imap jj <Esc>

" windows
nmap <c-w><space> :vsplit<CR>
nmap <c-w>-     :split<CR>

" term
nmap <c-t> :vsplit<CR>:term<CR>

" increment
nmap <c-x> <c-a>

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

" stuff for writing
function! Writing()
  highlight ColorColumn ctermbg=81
  set cc=80
  set filetype=text
endfunction

autocmd BufRead,BufNewFile ~/writing/* call Writing()
autocmd BufRead,BufNewFile ~/writing/*.fountain set filetype=fountain
" airline word counter
let g:airline#extensions#wordcount#enabled = 1
let g:airline#extensions#wordcount#filetypes = ['asciidoc', 'fountain', 'help', 'md', 'mail', 'markdown', 'org', 'rst', 'tex', 'text']

" " Having longer updatetime (default is 4000 ms = 4 s) leads to noticeable
" " delays and poor user experience.
set updatetime=300

" """"""" autocomplete settings """""""
function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <silent><expr> <TAB>
  \ coc#pum#visible() ? coc#pum#next(1):
  \ coc#expandableOrJumpable() ?
  \ "\<C-r>=coc#rpc#request('doKeymap', ['snippets-expand-jump',''])\<CR>" :
	\ <SID>check_back_space() ? "\<TAB>" :
	\ coc#refresh()
inoremap <expr><S-TAB> coc#pum#visible() ? coc#pum#prev(1) : "\<C-h>"
inoremap <expr> <cr> coc#pum#visible() ? coc#_select_confirm() : "\<CR>"
let g:coc_snippet_next = '<tab>'


" leave terminal mode
tnoremap <Leader>n <C-\><C-n>

" closetag config
let g:closetag_filenames = '*.html,*.js,*.jsx,*.ts,*.tsx'

" check for unused node imports
autocmd BufWinEnter *.js execute "ES6ImportsHighlight"
autocmd BufWritePost *.js execute "ES6ImportsHighlight"
let g:es6_imports_excludes = ['React']

" rust config
let g:rustfmt_autosave = 1
" As-you-type autocomplete
let g:ale_completion_enabled = 1
autocmd BufRead Cargo.toml call crates#toggle()
luafile /Users/mart/.vim.lua

" ledger commands
au BufRead,BufNewFile *.journal nmap <c-m> 12<c-a>


" Set completeopt to have a better completion experience
" :help completeopt
" menuone: popup even when there's only one match
" noinsert: Do not insert text until a selection is made
" noselect: Do not select, force user to select one from the menu
" set completeopt=menuone,noinsert,noselect

" Avoid showing extra messages when using completion
" set shortmess+=c

" Configure LSP through rust-tools.nvim plugin.
" rust-tools will configure and enable certain LSP features for us.
" See https://github.com/simrat39/rust-tools.nvim#configuration


" Setup Completion
" See https://github.com/hrsh7th/nvim-cmp#basic-configuration
" lua <<EOF
" local cmp = require'cmp'
" cmp.setup({
"   -- Enable LSP snippets
"   snippet = {
"     expand = function(args)
"         vim.fn["vsnip#anonymous"](args.body)
"     end,
"   },
"   mapping = {
"     ['<C-p>'] = cmp.mapping.select_prev_item(),
"     ['<C-n>'] = cmp.mapping.select_next_item(),
"     -- Add tab support
"     ['<S-Tab>'] = cmp.mapping.select_prev_item(),
"     ['<Tab>'] = cmp.mapping.select_next_item(),
"     ['<C-d>'] = cmp.mapping.scroll_docs(-4),
"     ['<C-f>'] = cmp.mapping.scroll_docs(4),
"     ['<C-Space>'] = cmp.mapping.complete(),
"     ['<C-e>'] = cmp.mapping.close(),
"     ['<CR>'] = cmp.mapping.confirm({
"       behavior = cmp.ConfirmBehavior.Insert,
"       select = true,
"     })
"   },

"   -- Installed sources
"   sources = {
"     { name = 'nvim_lsp' },
"     { name = 'vsnip' },
"     { name = 'path' },
"     { name = 'buffer' },
"   },
" })
" EOF


" typescript lsp
" https://thoughtbot.com/blog/modern-typescript-and-react-development-in-vim
let g:coc_global_extensions = [
  \ 'coc-tsserver'
  \ ]
if isdirectory('./node_modules') && isdirectory('./node_modules/prettier')
  let g:coc_global_extensions += ['coc-prettier']
endif
if isdirectory('./node_modules') && isdirectory('./node_modules/eslint')
  let g:coc_global_extensions += ['coc-eslint']
endif
" tooltip
nnoremap <silent> K :call CocAction('doHover')<CR>

autocmd CursorHold * silent call CocActionAsync('highlight')

" restore view recommended settings
set viewoptions=cursor,folds,slash,unix
let g:skipview_files = ['*\.vim']

" build commands
autocmd FileType rust nnoremap <c-c> :Crun<CR>
autocmd FileType c nnoremap <c-c> :w <CR>:!gcc % <CR> :!./a.out <CR>
autocmd FileType c nnoremap <f1> :w <CR>:!gcc % <CR>
autocmd FileType c nnoremap <f2> :w <CR>:!gcc % <CR> :!./a.out <CR>
autocmd FileType c nnoremap <f3> :w <CR>:!make <CR>

" clang-format
function! Formatonsave()
  let l:formatdiff = 1
  pyf ~/.vim/clang-format.py
endfunction
autocmd BufWritePre *.h,*.c,*.cc,*.cpp call Formatonsave()

" journal shortcuts
au BufRead,BufNewFile *.journal nmap <c-e> ii <c-r>=strftime("%Y/%m/%d %T")<CR>
au BufRead,BufNewFile *.journal nmap <c-l> io <c-r>=strftime("%Y/%m/%d %T")<CR>

" invisible chars
set list
set listchars=tab:▷\ ,nbsp:␣,trail:•,extends:⟩,precedes:⟨
