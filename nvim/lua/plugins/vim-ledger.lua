return {
  'ledger/vim-ledger',
  ft = {'journal', 'ledger'},
  config = function()
    -- journal shortcuts
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "ledger",
      callback = function(args)
        local bufnr = args.buf
        dt = function()
          vim.api.nvim_buf_set_lines(
            bufnr,
            vim.api.nvim_win_get_cursor(0)[1] - 1,
            vim.api.nvim_win_get_cursor(0)[1],
            false,
            { os.date("%Y/%m/%d %T") }
          )
        end
        vim.keymap.set("n", "<C-e>", dt, { buffer = bufnr })
        vim.keymap.set("i", "<C-e>", dt, { buffer = bufnr })
      end
    })
  end,
}
