local M = {}
local checker = require("ft_norm.ft_checker")

function	M.format()
	local ts = vim.treesitter
	local parser = ts.get_parser(0, 'c')
	local tstree = parser:parse()[1]
	local root = tstree:root()

	local node = checker.checkHeader(root)

end

return M
