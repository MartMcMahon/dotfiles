return {
  'nvim-tree/nvim-tree.lua',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  keys = {
    -- { '<leader>e', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle File Explorer' },
    { '<c-l>', '<cmd>NvimTreeToggle<cr>', desc = 'Toggle Viewer' },
    { '<c-f>', '<cmd>NvimTreeFindFile<cr>', desc = 'Find File' },
  },
  config = function()
    require('nvim-tree').setup({
      view = {
        width = 35,
      },
    })
  end,
}

