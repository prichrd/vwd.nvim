local M = {}

--- @alias Command {[string]:Command}|function

--- autocomplete returns the possible subcommands given an input.
--- @param cmd Command The command definition.
--- @param input string[] The input string to complete.
--- @return string[]
M.autocomplete = function(cmd, input)
	if type(cmd) == "function" then
		return {}
	end
	if #input == 0 then
		return {}
	end
	local choices = {}
	for key, _ in pairs(cmd) do
		if key == input[1] and key ~= "" then
			table.remove(input, 1)
			return M.autocomplete(cmd[key], input)
		end
		if vim.startswith(key, input[1]) and key ~= "" then
			table.insert(choices, key)
			goto continue
		end
		::continue::
	end
	return choices
end

--- execute find and executes the command.
--- @param cmd Command The command definition.
--- @param input string[] The input string to execute.
--- @return string|nil
M.execute = function(cmd, input)
	if type(cmd) == "function" then
		return cmd(input)
	end
	if #input == 0 then
		return "command not found"
	end
	for key, _ in pairs(cmd) do
		if key == input[1] then
			table.remove(input, 1)
			return M.execute(cmd[key], input)
		end
	end
	if cmd[""] then
		table.remove(input, 1)
		return M.execute(cmd[""], input)
	end
	return string.format("command '%s' not found", input[1])
end

--- split splits the command into an array while removing the command part.
--- @param cmd string Command with its arguments.
--- @return string[]
M.split = function(cmd)
	local sp = vim.split(cmd, "%s+")
	table.remove(sp, 1)
	return sp
end

--- Converts a set of arguments into a single string.
--- @param args string[] Arguments passed to the command.
--- @return string
M.join = function(args)
	local s = ""
	for i, v in ipairs(args) do
		if i > 1 then
			s = s .. " "
		end
		s = s .. v
	end
	return s
end

return M
