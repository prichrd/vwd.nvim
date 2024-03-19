local M = {}

M._state = {
	vwd = vim.fn.getcwd(),
}

--- set_vwd sets the VWD.
---@param dir string the directory to set as the VWD.
M.set_vwd = function(dir)
	M._state.vwd = vim.fn.resolve(vim.fn.getcwd() .. "/" .. dir)
end

--- get_vwd gets the currently set VWD.
---@return string
M.get_vwd = function()
	return M._state.vwd
end

--- reset_vwd resets the VWD to the CWD.
M.reset_vwd = function()
	M._state.vwd = vim.fn.getcwd()
end

return M
