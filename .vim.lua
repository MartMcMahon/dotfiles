require("nvim-lsp-installer").setup {}
local nvim_lsp = require'lspconfig'
local opts = {
  tools = {
    autoSetHints = false,
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
require('rust-tools.inlay_hints').set_inlay_hints()
