vim.opt.termguicolors = true
return {
  {
    'sainnhe/edge',
    config = function()
      vim.cmd.colorscheme('edge')
    end
  },
}

-- { 'tokyonight-night' },
-- { 'sonokai' }
-- vim.g.sonokai_style = 'maia'
-- vim.g.sonokai_better_performance = 1
