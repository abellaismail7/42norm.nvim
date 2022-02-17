local Utils = require("ft_norm.utils")

local M = {}

function M.fix(root, pos)
	local lines = {}
	local precs = {}
	local curnode = root:child(0)

	while curnode ~= nil do
		print(curnode:type())
		if curnode:type() == "declaration"
			then
			vim.list_extend(lines, Utils.getlines(curnode));
			table.insert(precs, curnode);
		end
	 	curnode = curnode:next_named_sibling()
	end
	print(vim.inspect(lines))

	for i = #precs, 1, -1 do
		Utils.deleteNode(precs[i])
	end

	lines = vim.tbl_filter(function (item)
		return item ~= ""
	end, lines)

	vim.api.nvim_buf_set_lines(0, pos, pos, 1, lines);
	Utils.checkLine(pos+ #lines)
	return pos + #lines
end

return M
