local M = {}

-- Safe buffer delete function
function M.safe_bdelete(buf)
	buf = buf or vim.api.nvim_get_current_buf()

	-- Collect all other listed normal buffers
	local listed = {}
	for _, b in ipairs(vim.api.nvim_list_bufs()) do
		if vim.api.nvim_buf_is_loaded(b) and vim.api.nvim_buf_get_option(b, "buftype") == "" and b ~= buf then
			table.insert(listed, b)
		end
	end

	-- Switch to another buffer if exists, else create a new empty one
	if #listed > 0 then
		vim.api.nvim_set_current_buf(listed[1])
	else
		vim.cmd("enew")
	end

	-- Safely delete the old buffer
	vim.api.nvim_buf_delete(buf, { force = false })
end

return M
