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
vim.opt.relativenumber = true
vim.opt.tabstop = 2
vim.opt.shiftwidth = 2

-- keybindings
vim.keymap.set('n', '<space>w', '<cmd>write<cr>', {desc = 'Save'})
vim.keymap.set({'n', 'x'}, 'p', '"+p')
-- vim.keymap.set({'n', 'x'}, 'gy', '"+y')
-- vim.keymap.set({'n', 'x'}, 'gp', '"+p')
vim.keymap.set('n', '<c-w> ', ':vsplit<cr>')
vim.keymap.set('n', '<c-t>', ':split<cr>:term<cr>')
vim.keymap.set('n', '<leader>m', ':noh<cr>')

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
  {'alvan/vim-closetag',
    ft = { "html", "xml", "jsx", "tsx", "javascriptreact", "typescriptreact" },
    config = function()
      vim.g.closetag_filetypes = 'html,xhtml,phtml,jsx,tsx'
      vim.g.closetag_emptyTags_caseSensitive = 1
      vim.g.closetag_shortcut = '>'
      vim.g.closetag_close_shortcut = '<leader>>'
    end
  },
  {'omnisharp/omnisharp-vim', ft = {'cs'} },
  {'ledger/vim-ledger', ft = {'journal'} },
  -- {'olimorris/codecompanion.nvim'},

  -- the tpope collection
  {'tpope/vim-markdown'},
  {'tpope/vim-repeat'},
  {'tpope/vim-surround'},

  {
    "neoclide/coc.nvim",
    branch = "release",
    build = ":CocInstall",
    init = function()
      if vim.fn.executable("node") ~= 1 then
        vim.notify("CoC requires Node.js! Install it first.", vim.log.levels.ERROR)
      end
    end,
    config = function()
      vim.g.coc_global_extensions = {
        'coc-json',
        'coc-tsserver',
        'coc-snippets',
        'coc-rust-analyzer',
      }

      -- coc config
      local function coc_tab()
        if vim.fn['coc#pum#visible']() == 1 then
          return vim.api.nvim_eval('coc#pum#next(1)')
        end

        local expandable = vim.fn['coc#expandableOrJumpable']()
        if expandable == 1 then
          return vim.fn['coc#rpc#request']('doKeymap', {'snippets-expand-jump',''})
        end

        local col = vim.fn.col('.') - 1
        if col == 0 or vim.fn.getline('.'):sub(col, col):match('%s') then
          return '<Tab>'
        else
          return vim.fn['coc#refresh']()
        end
      end


      vim.keymap.set('i', '<TAB>', coc_tab, {expr = true, silent = true})
      vim.keymap.set('i', '<S-TAB>', function()
        return vim.fn['coc#pum#visible']() == 1 and vim.fn['coc#pum#prev'](1) or '<C-h>'
      end, {expr = true, noremap = true})
      --
      vim.keymap.set('i', '<CR>', [[coc#pum#visible() ? coc#_select_confirm() : "\<C-g>u\<CR>"]], {
        expr = true,
        noremap = true
      })

      -- Snippet navigation
      vim.g.coc_snippet_next = '<tab>'
    end
  },

  -- lsp
  {'neovim/nvim-lspconfig'},

  -- python
  {'psf/black'},
  {'python-mode/python-mode'},
  {'nvim-lualine/lualine.nvim'},

  -- js
  {'pangloss/vim-javascript'},
  {'MaxMEllon/vim-jsx-pretty'},
  {'prettier/vim-prettier',
    config = function()
      vim.keymap.set('n', '<leader>p', '<cmd>Prettier<cr>', {desc = 'Prettier'})
    end,
    ft = {'astro', 'javascript', 'javascriptreact', 'jsx'}
  },

  -- rust
  {'rust-lang/rust.vim'},

  {'neovim/nvim-lspconfig', ft = {'rust'} },
  {'simrat39/rust-tools.nvim', ft = {'rust'} },
  -- debugging
  {'nvim-lua/plenary.nvim', ft = {'rust'} },
  {'mfussenegger/nvim-dap', ft = {'rust'} },

  -- themes
  {'sainnhe/sonokai'},
  {'tiagovla/tokyodark.nvim'},
  {'folke/tokyonight.nvim'},
})

vim.opt.termguicolors = true
vim.cmd.colorscheme('tokyonight')

require('lualine').setup()

-- Trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- spellcheck
vim.api.nvim_create_autocmd("FileType", {
  pattern = "text",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en"
    vim.opt_local.spellcapcheck = ""
  end
})

-- invisible chars
vim.opt.list = true
vim.opt.listchars = {
  tab = "▷ ",
  nbsp = "␣",
  trail = "•",
  extends = "⟩",
  precedes = "⟨"
}

-- journal shortcuts
vim.api.nvim_create_autocmd("FileType", {
  pattern = "ledger",  -- if 'journal' is a registered filetype
  callback = function(args)
    local bufnr = args.buf
    dt = function()
      vim.api.nvim_buf_set_lines(
        bufnr,
        vim.api.nvim_win_get_cursor(0)[1] - 1,
        vim.api.nvim_win_get_cursor(0)[1],
        false,
        { os.date("%Y/%m/%d %T") }
      )
    end
    vim.keymap.set("n", "<C-e>", dt, { buffer = bufnr })
    vim.keymap.set("i", "<C-e>", dt, { buffer = bufnr })
  end
})
