vim.opt.termguicolors = true
return {
  {
    'sainnhe/edge',
    config = function()
      vim.cmd.colorscheme('edge')
    end
  },
  -- {
  --  "folke/tokyonight.nvim",
  --   lazy = true,
  --   ft = { "c", "cpp" },
  --   config = function ()
  --     vim.cmd.colorscheme('tokyonight-night')
  --     vim.g.sonokai_style = 'maia'
  --     vim.g.sonokai_better_performance = 1
  --   end
  -- }
}


-- "folke/tokyonight.nvim",
-- "sainnhe/sonokai"
-- vim.g.sonokai_style = 'maia'
-- vim.g.sonokai_better_performance = 1
