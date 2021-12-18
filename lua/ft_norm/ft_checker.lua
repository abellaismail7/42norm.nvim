local M = {}
local Fixer = require("ft_norm.ft_fixer")

-- if node is null then the file is empty
-- comments show be in one line with 80 col
--
function M.checkHeader(rootNode)
	local node = rootNode:child(0)

	if node == nil then
		return
	end

	while node ~= nil and  node:type() == 'comment' do
		local srow, scol, erow, ecol  = node:range()
		local i = 0

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
end

return M
