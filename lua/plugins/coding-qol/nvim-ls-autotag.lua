return {
	"windwp/nvim-ts-autotag",
	ft = { "html", "javascript", "typescriptreact", "javascriptreact", "vue" },
	dependencies = "nvim-treesitter/nvim-treesitter",
	config = function()
		require("nvim-ts-autotag").setup({
			opts = {
				enable_close = true,
				enable_rename = true,
				enable_close_on_slash = true,
			},
			filetypes = { "html", "javascript", "typescriptreact", "javascriptreact", "vue" },
			skip_tags = {
				"area",
				"base",
				"br",
				"col",
				"embed",
				"hr",
				"img",
				"input",
				"link",
				"meta",
				"param",
				"source",
				"track",
				"wbr",
			},
		})
	end,
}
