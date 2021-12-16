local M = {}

function M.format()
	ts = vim.treesitter
	parser = ts.get_parser(0, 'c')
	tstree = parser:parse()[1]
	query = ts.parse_query('c', [[
		[
		  "break"
		  "else"
		  "for"
		  "if"
		  "return"
		  "while"
		] @keyword
	]])

	i = 1;
	for id, node, metadata in query:iter_captures(tstree:root(), 0, 0, 30)
	do
		type = node:type()
		if type == "if"
		then
			nextNode = node:range()
			vim.cmd("echo '" .. node:range() .. "'")
		end
	end
end

return M
