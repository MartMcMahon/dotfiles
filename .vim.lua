require("nvim-lsp-installer").setup {}
local nvim_lsp = require'lspconfig'
local opts = {
  tools = {
    -- autoSetHints = false,
    inlay_hints = {
      auto = true,
      parameter_hints_prefix = "<-",
      other_hints_prefix  = "=>",
      highlight = "Comment",
    },
  },
  -- debugging stuff
	dap = {
		adapter = {
			type = "executable",
			command = "lldb-vscode",
			name = "rt_lldb",
		},
	},
}
require('rust-tools').setup(opts)
-- require('rust-tools.inlay_hints').set_inlay_hints()
-- require('rust-tools').inlay_hints.set()
