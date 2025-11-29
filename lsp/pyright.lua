---@type vim.lsp.Config
return {
	cmd = { "pyright-langserver", "--stdio" },
	filetypes = { "python" },
	root_dir = vim.loop.cwd(),
	settings = {
		python = {
			analysis = {
				typeCheckingMode = "basic", -- off | basic | strict
			},
		},
	},
}
