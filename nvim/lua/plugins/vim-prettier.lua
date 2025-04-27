return {
  'prettier/vim-prettier',
  ft = {'astro', 'javascript', 'javascriptreact', 'jsx', 'typescript', 'typescriptreact'},
  config = function()
    vim.keymap.set('n', '<leader>p', '<cmd>Prettier<cr>', {desc = 'Prettier'})
  end
}
