return {
	"brenton-leighton/multiple-cursors.nvim",
	version = "*", -- Use the latest tagged version
	opts = {
		highlight_word = false,
		pre_hook = function()
			require("nvim-autopairs").disable()
		end,
		post_hook = function()
			require("nvim-autopairs").enable()
		end,
	}, -- This causes the plugin setup function to be called
	keys = {
		{ "<C-A-j>", "<Cmd>MultipleCursorsAddDown<CR>", mode = { "n", "x" }, desc = "Add cursor and move down" },
		{ "<C-A-k>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "x" }, desc = "Add cursor and move up" },

		{ "<C-A-Up>", "<Cmd>MultipleCursorsAddUp<CR>", mode = { "n", "i", "x" }, desc = "Add cursor and move up" },
		{
			"<C-A-Down>",
			"<Cmd>MultipleCursorsAddDown<CR>",
			mode = { "n", "i", "x" },
			desc = "Add cursor and move down",
		},

		{
			"<C-A-LeftMouse>",
			"<Cmd>MultipleCursorsMouseAddDelete<CR>",
			mode = { "n", "i" },
			desc = "Add or remove cursor",
		},

		{
			"<Leader>C",
			"<Cmd>MultipleCursorsAddVisualArea<CR>",
			mode = { "x" },
			desc = "Add cursors to the lines of the visual area",
		},

		{ "<Leader>a", "<Cmd>MultipleCursorsAddMatches<CR>", mode = { "n", "x" }, desc = "Add cursors to cword" },
		{
			"<Leader>A",
			"<Cmd>MultipleCursorsAddMatchesV<CR>",
			mode = { "n", "x" },
			desc = "Add cursors to cword in previous area",
		},

		{
			"<Leader>d",
			"<Cmd>MultipleCursorsAddJumpNextMatch<CR>",
			mode = { "n", "x" },
			desc = "Add cursor and jump to next cword",
		},
		{ "<Leader>D", "<Cmd>MultipleCursorsJumpNextMatch<CR>", mode = { "n", "x" }, desc = "Jump to next cword" },

		{ "<Leader>l", "<Cmd>MultipleCursorsLock<CR>", mode = { "n", "x" }, desc = "Lock virtual cursors" },
	},
}
