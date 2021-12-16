local M = {}
local api = vim.api

function	M.check_space(node)
	local nextNode = node:next_sibling(0)
	local row, col, _ = node:end_()
	local nrow, ncol, _ = nextNode:start()

	if col + 1 ~= ncol
		then
			api.nvim_buf_set_text(0, row, col, row, ncol, {" "})
		end
end

return M
