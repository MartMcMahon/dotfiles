return {
  'rust-lang/rust.vim',
  ft = {'rs'},
  config = function()
    vim.g.rustfmt_autosave = 1
  end,
  name = "rust-lang"
}
