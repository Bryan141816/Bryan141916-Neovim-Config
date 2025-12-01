return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	config = function()
		require("noice").setup({
			lsp = {
				override = {
					["vim.lsp.util.convert_input_to_markdown_lines"] = true,
					["vim.lsp.util.stylize_markdown"] = true,
					["cmp.entry.get_documentation"] = true,
				},
			},

			-- ⭐ This makes all messages go to notifications
			notify = {
				enabled = true,
				view = "notify",
			},

			messages = {
				enabled = true,
				view = "notify", -- show all default nvim messages as notifications
			},

			-- (Optional) Remove the command-line messages clutter
			cmdline = {
				view = "cmdline_popup",
			},

			presets = {
				lsp_doc_border = true,
			},
		})
	end,
}
