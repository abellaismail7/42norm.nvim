local M = {}
local Fixer = require("ft_norm.ft_fixer")
local Utils = require("ft_norm.utils")

-- if node is null then the file is empty
-- comments show be in one line with 80 col
--
function M.checkHeader(rootNode)
	local node = rootNode:child(0)

	if node == nil then
		return
	end

	local i = 0
	while node ~= nil and  node:type() == 'comment' do
		local srow, scol, erow, ecol  = node:range()

	 	if  srow == erow and scol == 0 and ecol == 80 then
	 		i = i + 1;
	 	else
	 		break
	 	end

	 	node = node:next_named_sibling()
	 end

	 if i < 11 then
		Fixer.FixHeader(rootNode)
	 end
	 return 12
end

function M.check_includes(root, pos)
	local lines = {}
	local precs = {}

	local query = vim.treesitter.parse_query('c', [[(preproc_include) @preproc]])
	for _, curnode in query:iter_captures(root, 0, root:start(), root:end_()) do
		vim.list_extend(lines, Utils.getlines(curnode));
		table.insert(precs, curnode);
	end

	for i = #precs, 1, -1 do
		Utils.deleteNode(precs[i])
	end

	lines = vim.tbl_filter(function (item)
		return item ~= ""
	end, lines)

	vim.api.nvim_buf_set_lines(0, pos, pos, 1, lines);
	Utils.checkLine(pos+ #lines)
	return pos + #lines + 1
end

return M
