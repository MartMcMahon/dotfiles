-- I had help convertig my old .vimrc to this from:
-- https://vonheikemen.github.io/devlog/tools/build-your-first-lua-config-for-neovim/ 
-- global
vim.g.mapleader = ' '

-- options
vim.opt.expandtab = true
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.mouse = 'a'
vim.opt.number = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- keybindings
vim.keymap.set('n', '<space>w', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set({'n', 'x'}, 'p', '"+p')
-- vim.keymap.set({'n', 'x'}, 'gy', '"+y')
-- vim.keymap.set({'n', 'x'}, 'gp', '"+p')

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
        vim.highlight.on_yank()
    end,
})
-- clipboard yanking
vim.api.nvim_set_option("clipboard","unnamed") 

-- plugins
local lazy = {}
function lazy.install(path)
  if not vim.loop.fs_stat(path) then
    print('Installing lazy.nvim...')
    vim.fn.system({
      'git',
      'clone',
      '--filter=blob:none',
      'https://github.com/folke/lazy.nvim.git',
      '--branch=stable', -- latest stable release
      path,
    })
  end
end

function lazy.setup(plugins)
  if vim.g.plugins_ready then
    return
  end

lazy.path = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
lazy.opts = {}

  -- You can "comment out" the line below after lazy.nvim is installed
  lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.setup({
  ---
  -- List of plugins
  ---
  {'jiangmiao/auto-pairs'},
  {'omnisharp/omnisharp-vim'},
  {'ledger/vim-ledger'},
  {'tpope/vim-markdown'},

  -- lsp
  {'neovim/nvim-lspconfig'},

  -- python
  {'psf/black'},
  {'python-mode/python-mode'},
  {'neoclide/coc.nvim'},
  {'nvim-lualine/lualine.nvim'},
  {'folke/tokyonight.nvim'},

  -- js
  {'pangloss/vim-javascript'},
  {'MaxMEllon/vim-jsx-pretty'},

  -- rust
  {'rust-lang/rust.vim'},
  {'prettier/vim-prettier'},
  {'tpope/vim-repeat'},
  {'tpope/vim-surround'},
})

vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')

require('lualine').setup()
