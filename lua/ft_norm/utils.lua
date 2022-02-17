local M = {}
local api = vim.api

function M.replaceWith(row, start, end_, with)
	api.nvim_buf_set_text(0, row, start, end_, row, {with})
end

function M.getlines(node)
	local s_row,_, e_row = node:range()
	return api.nvim_buf_get_lines(0, s_row, e_row, 1);
end

function M.deleteNode(node)
	local s_row,_, e_row = node:range()
	return api.nvim_buf_set_lines(0, s_row, e_row, 1, {});
end

function M.checkLine(pos)
	local line = api.nvim_buf_get_lines(0, pos, pos + 1, 1)
	if #line == 0 then
		return
	end
	line = line[1]
	local end_ = 0;
	if (string.match(line, "^%s+$")) then end_ = 1 end
	api.nvim_buf_set_lines(0, pos, pos + end_, 1, {""});

end

return M
