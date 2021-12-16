local M = {}
local space_checker = require("ft_norm.check_space")

function	M.format()
	local ts = vim.treesitter
	local parser = ts.get_parser(0, 'c')
	local tstree = parser:parse()[1]
	local query = ts.parse_query('c', [[
		[
		  "if"
		  "return"
		  "while"
		] @keyword
	]])

	for id, node, metadata in query:iter_captures(tstree:root(), 0, 0, 130)
	do
		local type = node:type()
		if type == "if" or type == "return"
		then
			space_checker.check_space(node)
			-- print(vim.inspect(getmetatable(node)))
			-- print(node:next_sibling())
		end
	end
end

return M
