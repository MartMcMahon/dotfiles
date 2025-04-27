return {'alvan/vim-closetag',
  ft = { 'astro', 'html', 'xml', 'jsx', 'tsx', 'javascriptreact', 'typescriptreact' },
  config = function()
    vim.g.closetag_filetypes = 'html,xhtml,phtml,jsx,tsx'
    vim.g.closetag_emptyTags_caseSensitive = 1
    vim.g.closetag_shortcut = '>'
    vim.g.closetag_close_shortcut = '<leader>>'
  end
}
