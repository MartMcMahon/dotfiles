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
  -- lazy.install(lazy.path)

  vim.opt.rtp:prepend(lazy.path)

  require('lazy').setup(plugins, lazy.opts)
  vim.g.plugins_ready = true
end

lazy.setup({
  { import = 'plugins' },
  { import = 'plugins.lsp' },
  {'jiangmiao/auto-pairs'},

--   -- the tpope collection
  {'tpope/vim-markdown'},
  {'tpope/vim-repeat'},
  {'tpope/vim-surround'},

  -- js
  {'pangloss/vim-javascript'},
  {'MaxMEllon/vim-jsx-pretty'},

  { import = 'colors' },

})

--   ---
--   -- List of plugins
--   -- rust
--   {'rust-lang/rust.vim'},
--   {'simrat39/rust-tools.nvim', ft = {'rust'} },
--   -- {'mrcjkb/rustaceanvim', ft = {'rust'} },
--   -- debugging
--   {'nvim-lua/plenary.nvim', ft = {'rust'} },
--   {'mfussenegger/nvim-dap', ft = {'rust'} },
--
--   -- lsp
--   {'neovim/nvim-lspconfig'},
--   {'williamboman/mason.nvim',
--     config = function()
--       require('mason').setup()
--       -- require("mason-lspconfig").setup({
--       --   ensure_installed = {
--       --     "astro",
--       --     "rust_analyzer",
--       --     "tsserver",
--       --   }
--       -- })
--     end
--   },
--
--   -- astro
--   -- lspconfig["astro"].setup({
--   --  capabilities = capabilities,
--   --  on_attach = on_attach,
--   --  filetypes = { "astro" },
--   -- })
--   --
--   {'wuelnerdotexe/vim-astro', ft = { 'astro' },
--     config = function()
--      vim.g.astro_typescript = 'enable'
--    end
--   },
--
--   -- themes
--   {'sainnhe/sonokai'}, --- 2nd choice, prob
--   {'sainnhe/edge'},
--   {'tiagovla/tokyodark.nvim'},
--   {'folke/tokyonight.nvim'},
--   {'vague2k/vague.nvim'},
--   {'thesimonho/kanagawa-paper.nvim'},
--   {'datsfilipe/vesper.nvim'},
--   {'rose-pine/neovim'},
-- })
--
-- ---- LSP
-- local lspconfig = require("lspconfig")
-- lspconfig["astro"].setup({
--   capabilities = capabilities,
--   on_attach = on_attach,
--   filetypes = { "astro" },
-- })
-- lspconfig.rust_analyzer.setup({
--   settings = {
--     ["rust-analyzer"] = {
--       checkOnSave = {
--         command = "clippy"
--       }
--     },
--   },
--   on_attach = format,
-- })
-- -----
--
-- local rt = require("rust-tools")
--   rt.setup({
--     server = {
--       on_attach = function(_, bufnr)
--         -- Hover actions
--         vim.keymap.set("n", "<C-space>", rt.hover_actions.hover_actions, { buffer = bufnr })
--         -- Code action groups
--         vim.keymap.set("n", "<Leader>a", rt.code_action_group.code_action_group, { buffer = bufnr })
--       end,
--     },
--   })
--
--

-- -- Trim trailing whitespace on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = "*",
  callback = function()
    local save_cursor = vim.fn.getpos(".")
    vim.cmd([[%s/\s\+$//e]])
    vim.fn.setpos(".", save_cursor)
  end,
})

-- -- spellcheck
vim.api.nvim_create_autocmd("FileType", {
  pattern = "text",
  callback = function()
    vim.opt_local.spell = true
    vim.opt_local.spelllang = "en"
    vim.opt_local.spellcapcheck = ""
  end
})

-- -- invisible chars
vim.opt.list = true
vim.opt.listchars = {
  tab = "▷ ",
  nbsp = "␣",
  trail = "•",
  extends = "⟩",
  precedes = "⟨"
}
