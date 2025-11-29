-- ~/.config/nvim/lua/configs/lualine_bubbles.lua
-- Eviline + Bubbles merged config for lualine
-- Author: merged from shadmansaleh & lokesh-krishna

return function()
  -- stylua: ignore
  local colors = {
    bg       = '#202328',
    fg       = '#bbc2cf',
    yellow   = '#ECBE7B',
    cyan     = '#008080',
    darkblue = '#081633',
    green    = '#98be65',
    orange   = '#FF8800',
    violet   = '#5B5294',
    magenta  = '#c678dd',
    blue     = '#51afef',
    red      = '#ec5f67',
    black    = '#080808',
    white    = '#c6c6c6',
    grey     = '#303030',
  }

	local conditions = {
		buffer_not_empty = function()
			return vim.fn.empty(vim.fn.expand("%:t")) ~= 1
		end,
		hide_in_width = function()
			return vim.fn.winwidth(0) > 80
		end,
	}

	local bubbles_theme = {
		normal = {
			a = { fg = colors.black, bg = colors.violet },
			b = { fg = colors.white, bg = colors.grey },
			c = { fg = colors.white },
		},
		insert = { a = { fg = colors.black, bg = colors.blue } },
		visual = { a = { fg = colors.black, bg = colors.cyan } },
		replace = { a = { fg = colors.black, bg = colors.red } },
		inactive = {
			a = { fg = colors.white, bg = colors.black },
			b = { fg = colors.white, bg = colors.black },
			c = { fg = colors.white },
		},
	}

	require("lualine").setup({
		options = {
			theme = bubbles_theme,
			component_separators = "",
			section_separators = { left = "", right = "" },
		},
		sections = {
			-- Left section
			lualine_a = {
				{
					"mode",
					separator = { left = "" },
					right_padding = 2,
					fmt = function(str)
						return " " .. str
					end,
					color = function()
						local mode_color = {
							n = colors.red,
							i = colors.green,
							v = colors.blue,
							[""] = colors.blue,
							V = colors.blue,
							c = colors.magenta,
							no = colors.red,
							s = colors.orange,
							S = colors.orange,
							[""] = colors.orange,
							ic = colors.yellow,
							R = colors.violet,
							Rv = colors.violet,
							cv = colors.red,
							ce = colors.red,
							r = colors.cyan,
							rm = colors.cyan,
							["r?"] = colors.cyan,
							["!"] = colors.red,
							t = colors.red,
						}
						return { fg = mode_color[vim.fn.mode()] }
					end,
				},
			},
			lualine_b = { "branch", "diff" },
			lualine_c = {
				{ "filename", cond = conditions.buffer_not_empty, color = { fg = colors.magenta, gui = "bold" } },
				{ "filesize", cond = conditions.buffer_not_empty },
				"location",
				"progress",
				{
					"diagnostics",
					sources = { "nvim_diagnostic" },
					symbols = { error = " ", warn = " ", info = " ", hint = " " },
					diagnostics_color = {
						error = { fg = colors.red },
						warn = { fg = colors.yellow },
						info = { fg = colors.cyan },
					},
				},
				{
					function()
						local msg = "No Active Lsp"
						local buf_ft = vim.api.nvim_get_option_value("filetype", { buf = 0 })
						local clients = vim.lsp.get_clients()
						if next(clients) == nil then
							return msg
						end
						for _, client in ipairs(clients) do
							local filetypes = client.config.filetypes
							if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then
								return client.name
							end
						end
						return msg
					end,
					icon = " LSP:",
					color = { fg = colors.white, gui = "bold" },
				},
			},
			-- Right section
			lualine_x = {
				{
					"o:encoding",
					fmt = string.upper,
					cond = conditions.hide_in_width,
					color = { fg = colors.green, gui = "bold" },
				},
				{
					"fileformat",
					fmt = string.upper,
					icons_enabled = false,
					color = { fg = colors.green, gui = "bold" },
				},
			},
			lualine_y = { "filetype" },
			lualine_z = {
				{ "location", separator = { right = "" }, left_padding = 2 },
			},
		},
		inactive_sections = {
			lualine_a = { "filename" },
			lualine_b = {},
			lualine_c = {},
			lualine_x = {},
			lualine_y = {},
			lualine_z = { "location" },
		},
		tabline = {},
		extensions = {},
	})
end
