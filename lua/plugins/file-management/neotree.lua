return {
	"nvim-neo-tree/neo-tree.nvim",
	branch = "v3.x",
	dependencies = {
		"nvim-lua/plenary.nvim",
		"nvim-tree/nvim-web-devicons",
		"MunifTanjim/nui.nvim",
	},
	lazy = false,
	priority = 1000,

	config = function()
		-- Detect if running on Windows
		local is_windows = vim.uv.os_uname().sysname == "Windows_NT"

		require("neo-tree").setup({
			filesystem = {
				filtered_items = {
					hide_dotfiles = false,
					hide_gitignored = false,
				},
			},
			close_if_last_window = true,

			event_handlers = {
				{
					event = "file_opened",
					handler = function(file_path)
						-- Only handle external apps on Windows
						if not is_windows then
							return
						end

						local mpv_path = "C:\\mpv\\mpv.exe"
						local imageglass_path = "C:/Program Files/ImageGlass/ImageGlass.exe"

						-- Image files → ImageGlass
						if
							file_path:match("%.png$")
							or file_path:match("%.jpg$")
							or file_path:match("%.jpeg$")
							or file_path:match("%.gif$")
							or file_path:match("%.bmp$")
							or file_path:match("%.webp$")
						then
							vim.fn.jobstart({ imageglass_path, file_path }, { detach = true })
							vim.cmd("bd!")

						-- Video/audio files → MPV
						elseif
							file_path:match("%.mp4$")
							or file_path:match("%.mkv$")
							or file_path:match("%.mov$")
							or file_path:match("%.webm$")
							or file_path:match("%.mp3$")
							or file_path:match("%.wav$")
						then
							local cmd = { mpv_path, "--force-window=immediate", file_path }
							vim.fn.jobstart(cmd, { detach = true })
							vim.cmd("bd!")
						end
					end,
				},
			},
		})
	end,
}
