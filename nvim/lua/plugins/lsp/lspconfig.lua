return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    -- local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show LSP references"
      keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)

    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    vim.lsp.config('html', {
      capabilities = capabilities,
      on_attach = on_attach
    })

    vim.lsp.config('ts_ls', {
      capabilities = capabilities,
      on_attach = on_attach
    })

    vim.lsp.config('lua_ls', {
      capabilities = capabilities,
      on_attach = on_attach,
      settings = {
        Lua = {
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true
            }
          }
        }
      }
    })

    vim.lsp.config('pylsp', {
      settings = {
        pylsp = {
          plugins = {
            black = {
              enabled = true,
              -- line_length = 88
            },
            -- autopep8 = { enabled = false },
            yapf = { enabled = false }
          }
        }
      }
    })

    vim.lsp.config('clangd', {
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- lspconfig.godot_lsp.setup({
    --   cmd = { "godot", "--headless", "--lsp-port", "6008" },
    --   filetypes = { "gdscript" }
    -- })

-- Auto-format on save
vim.api.nvim_create_autocmd("BufWritePre", {
  pattern ={ "*.py" },
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

vim.api.nvim_create_autocmd("BufWritePre", {
  pattern = { "*.c", "*.h", "*.cpp", "*.cc", "*.hpp"},
  callback = function()
    vim.lsp.buf.format({ async = false })
  end,
})

  end
}
