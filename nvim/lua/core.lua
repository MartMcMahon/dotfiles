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
vim.keymap.set('n', '<leader>p',
  function()
    vim.lsp.buf.format()
  end,
  { silent = true }
)

vim.keymap.set('i', 'jj', '<esc>', {desc = 'nrml mode'})
vim.keymap.set('t', '<esc>', '<c-\\><c-n>')

-- highlight on yank
vim.api.nvim_create_autocmd("TextYankPost", {
    callback = function()
      vim.highlight.on_yank()
    end,
})
-- clipboard yanking
vim.api.nvim_set_option("clipboard","unnamed")


-- python
-- vim.g.python3_host_prog = vim.fn.exepath('~/.config/nvim/venv/bin/python')
-- vim.api.nvim_create_autocmd("BufWritePre", {
--   pattern = "python",
--   callback = function()
--     vim.cmd.silent.Black()
--   end,
-- })
vim.g.pymode_python = 'python3'
-- vim.g.pymode_indent = 0
-- vim.g.python_host_prog = '/usr/local/bin/python3'
vim.g.python3_host_prog = '/Users/mart/.config/nvim/venv/bin/python'




local bufnr = vim.api.nvim_get_current_buf()

-- Set shorter updatetime for better feedback
vim.opt.updatetime = 300

-- float window
local f = {
  focusable = true,
  style = "minimal",
  border = "rounded",
  source = "if_many"
}
vim.keymap.set('n', '<C-n>', function()
  vim.diagnostic.goto_next({
    float = f
  })
end, { desc = "Next LSP error" })

-- Previous error mapping
vim.keymap.set('n', '<C-p>', function()
  vim.diagnostic.goto_prev({
    float = f
  })
end, { desc = "Previous LSP error" })

vim.keymap.set(
  'n',
  '<leader>e',
  function()
    vim.diagnostic.open_float({
    float = f
  })
  end,
  { desc = "show diagnostic", buffer = bufnr }
)
