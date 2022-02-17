local M = {}
local checker = require("ft_norm.ft_checker")
local global_var_checker = require("ft_norm.checkers.globals")

--[[
-------------------------
|						|
|   42 HEADER			|
|						|
|   PRPROC INCLUDE   	|
|						|
|   GLOBAL VARIABLES 	|
|						|
-------------------------
]]--

function	M.format()
	local ts = vim.treesitter
	local parser = ts.get_parser(0, 'c')
	local tstree = parser:parse()[1]
	local root = tstree:root()

	local pos = checker.checkHeader(root)
	pos = checker.check_includes(root, pos)

	global_var_checker.fix(root, pos)

end

return M
