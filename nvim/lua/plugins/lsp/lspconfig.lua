return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    local lspconfig = require('lspconfig')
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    local keymap = vim.keymap
    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      opts.desc = "Show LSP references"
      keymap.set('n', 'gr', '<cmd>Telescope lsp_references<cr>', opts)

    end

    local capabilities = cmp_nvim_lsp.default_capabilities()

    lspconfig['html'].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig['ts_ls'].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    lspconfig['lua_ls'].setup({
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

    -- lspconfig['rust_analyzer'].setup({ })

  end
}
